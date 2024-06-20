package com.example.getinstanceload.config;

import com.influxdb.client.InfluxDBClient;
import com.influxdb.client.InfluxDBClientFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource(value = {"classpath:info.properties"})
public class InfluxDBConfig {
    @Value("${spring.influx.url}")
    private String url;

    @Value("${spring.influx.token}")
    private String token;

    @Value("${spring.influx.org}")
    private String org;

    @Value("${spring.influx.bucket}")
    private String bucket;

    public String getUrl() {
        return url;
    }

    public String getToken() {
        return token;
    }

    public String getOrg() {
        return org;
    }

    public String getBucket() {
        return bucket;
    }

    @Bean("influxdbClient")
    InfluxDBClient createInfluxDBClient() {
        return InfluxDBClientFactory.create(url, token.toCharArray());
    }
}
