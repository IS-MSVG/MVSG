package com.example.getinstanceload.service;

import com.example.getinstanceload.config.InfluxDBConfig;
import com.influxdb.client.InfluxDBClient;
import com.influxdb.query.FluxRecord;
import com.influxdb.query.FluxTable;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class InfluxDBService {
    @Resource
    private InfluxDBConfig influxDBConfig;

    @Resource
    private InfluxDBClient influxDBClient;

    /**
     * get data of influxDB，query data from measurement query detail and preTime ，获得数据
     * @param preTime in preTime
     * @param measurement queried measurement
     *
     * @return only data we need not all data
     */
    public List<FluxRecord> getInfluxDBData(int preTime, String measurement, String queryInfo) {
        String query = "from(bucket: \"" + influxDBConfig.getBucket() + "\" ) \n |> range(start: -" + preTime + "s) \n |> filter(fn: (r) => r._measurement == \"" + measurement + "\" ) \n " + queryInfo;
        List<FluxTable> tables = influxDBClient.getQueryApi().query(query, influxDBConfig.getOrg());
        List<FluxRecord> fluxRecords = new ArrayList<>(256);
        tables.forEach(fluxTable -> {
            List<FluxRecord> records = fluxTable.getRecords();
            fluxRecords.addAll(records);
        });

        return fluxRecords;
    }

}
