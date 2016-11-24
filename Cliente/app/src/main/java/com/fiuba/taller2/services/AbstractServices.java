package com.fiuba.taller2.services;

import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

/**
 * Created by luis on 19/09/16.
 */
public abstract class AbstractServices {
    public static final String urlBase="http://192.168.1.105:8080/";
    protected String api_security;

    protected Object geDataOftDTO(String url, Class object) {
        RestTemplate restTemplate = new RestTemplate();

        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        return restTemplate.getForObject(url, object);
    }
    protected Object postDataOftDTO(String url, Class object) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        return restTemplate.postForObject(url, null,object);
    }
    protected void putDataOftDTO(String url, Class object) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        restTemplate.put(url, object);
    }

    protected void deleteDataOftDTO(String url, Class object) {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        restTemplate.delete(url, object);
    }
    protected  abstract String getQueryBy(String... params);

    public String getApi_security() {
        return api_security;
    }

    public void setApi_security(String api_security) {
        this.api_security = api_security;
    }
}
