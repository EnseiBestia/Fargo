package com.fargo.basis.utility.spring;

import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import java.io.IOException;
import java.util.*;

public class WildcardReloadableResourceBundleMessageSource extends
        ResourceBundleMessageSource {
    private ResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();
    @Override
    //file format ApplicationResources-pak_zh_CN.properties
    public void setBasenames(String... basenames) {
        Set<String> baseNameList = new HashSet<String>();
        for(String bname:basenames){
            Resource[] resolveResources;
            try {
                resolveResources = resourcePatternResolver.getResources(bname);
                for(Resource rResource : resolveResources){
                    String rFileName = rResource.getFilename();
                    if(rFileName.contains(".")) {
                        rFileName = rFileName.substring(0, rFileName.indexOf("."));
                    }
                    if(rFileName.contains("_")) {
                        rFileName = rFileName.substring(0, rFileName.indexOf("_"));
                    }
                    baseNameList.add(rFileName);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        String[] basenameArray = new String[baseNameList.size()];
        basenameArray = baseNameList.toArray(basenameArray);
        super.setBasenames(basenameArray);
    }
}