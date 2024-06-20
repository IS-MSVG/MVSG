package com.example.getinstanceload.task;

import com.example.getinstanceload.config.InfluxDBConfig;
import com.influxdb.client.InfluxDBClient;
import com.influxdb.client.WriteApi;
import com.influxdb.client.domain.WritePrecision;
import com.influxdb.client.write.Point;
import jakarta.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.time.Instant;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author pivot
 * @Date 2023/12/12 16:22
 */
@Component
public class GetInstanceLoad {
    private static final Logger LOGGER = LoggerFactory.getLogger(GetInstanceLoad.class);

    @Resource
    InfluxDBClient influxDBClient;
    @Resource
    InfluxDBConfig config;

    Map<String, double[]> loadMap = new HashMap<>();
    Map<String, double[]> limitMap = new HashMap<>();

    /**
     * get cpu load and memory load of instance from k8s
     * @throws IOException IO exception
     */
    public void getInstanceLoad() throws IOException {
        var process = Runtime.getRuntime().exec("kubectl top pod -A");
        var input = new BufferedReader(new InputStreamReader(process.getInputStream()));
        var line = input.readLine();
        while ((line = input.readLine()) != null) {
            LOGGER.info("get info is: " + line);
            var strs = line.split("\\s+");
            double v1 = Double.parseDouble(strs[2].replaceAll("[^0-9]", ""));
            double v2 = strs[3].contains("M") ? Double.parseDouble(strs[3].replaceAll("[^0-9]", "")) : 1000 * Double.parseDouble(strs[3].replaceAll("[^0-9]", ""));
            loadMap.put(strs[1], new double[]{v1, v2});
        }
    }
    public void getAllInstanceLimit() throws IOException {
        getInstanceLimit("master");
        getInstanceLimit("node");
    }

    /**
     * get cpu limit and memory limit of instance from k8s
     * @param hostname node name
     * @throws IOException IO exception
     */
    public void getInstanceLimit(String hostname) throws IOException {
        var process = Runtime.getRuntime().exec("kubectl describe node " + hostname);
        var input = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line;
        while(!input.readLine().startsWith("Non-terminated Pods:")) {
            continue;
        }
        input.readLine();
        input.readLine();
        while(!(line = input.readLine()).startsWith("Allocated resources:")) {
            LOGGER.info("pod limit resource is: " + line);
            var strs = line.split("\\s+");
            double v1 = Double.parseDouble(getNumber(strs[3]));
            double v2 = strs[7].contains("M") ? Double.parseDouble(getNumber(strs[7])) : 1000 * Double.parseDouble(getNumber(strs[7]));
            double v3 = strs[9].contains("M") ? Double.parseDouble(getNumber(strs[9])) : 1000 * Double.parseDouble(getNumber(strs[9]));
            limitMap.put(strs[2], new double[]{v1, v2, v3});
        }
    }

    private String getNumber(String str) {
        return str.replaceAll("[^0-9]", "");
    }

    /**
     * set load data to influxdb
     * @throws IOException IO exception
     */
    @Scheduled(cron = "0/10 * * * * ?")
    public void setDataToDB() throws IOException {
        LOGGER.info("start at" + new Date());
        getInstanceLoad();
        getAllInstanceLimit();
        try (WriteApi writeApi = influxDBClient.makeWriteApi()) {
            for (String pod : loadMap.keySet()) {
                var loads = loadMap.get(pod);
                var limits = limitMap.get(pod);
                var pointList = new ArrayList<Point>();
                Point pointCPURequest = Point.measurement("instances")
                        .addField("cpu_request", String.valueOf(loads[0] / limits[0]))
                        .addTag("used", pod)
                        .time(Instant.now(), WritePrecision.S);

                Point pointMemRequest = Point.measurement("instances")
                        .addField("mem_request", String.valueOf(loads[1] / limits[1]))
                        .addTag("used", pod)
                        .time(Instant.now(), WritePrecision.S);
                Point pointMemLimit = Point.measurement("instances")
                        .addField("mem_limit", String.valueOf(loads[1] / limits[2]))
                        .addTag("used", pod)
                        .time(Instant.now(), WritePrecision.S);
                pointList.add(pointMemRequest);
                pointList.add(pointMemLimit);
                pointList.add(pointCPURequest);
                writeApi.writePoints(config.getBucket(), config.getOrg(), pointList);
            }
        }
    }
}
