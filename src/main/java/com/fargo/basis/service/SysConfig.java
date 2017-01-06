package com.fargo.basis.service;

import com.fargo.basis.common.SpringContext;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

/**
 * Created by cre on 2016/7/27.
 */
@Configuration("sysConfig")
public class SysConfig {

    @Value("${baseModelPackage}")
    private String basePackage;

    public String getBasePackage() {
        return basePackage;
    }

    public void setBasePackage(String basePackage) {
        this.basePackage = basePackage;
    }
    @Value("${projectModelPackage}")
    private String projectModelPackage;

    public String getProjectModelPackage() {
        return projectModelPackage;
    }

    public void setProjectModelPackage(String projectModelPackage) {
        this.projectModelPackage = projectModelPackage;
    }

    @Bean
        public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
            return new PropertySourcesPlaceholderConfigurer();
        }
        public static void main(String[] args) {
            SysConfig testConfig = (SysConfig) SpringContext.getApplicationContext().getBean("sysConfig");
            System.out.println(testConfig.getBasePackage());
    }
}
