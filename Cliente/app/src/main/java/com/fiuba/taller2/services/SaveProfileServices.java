package com.fiuba.taller2.services;

import com.fiuba.taller2.rest_dto.SaveProfileDto;

/**
 * Created by luis on 26/09/16.
 */

public class SaveProfileServices extends AbstractServices {
    private static final String service_name = "api/edit";

    public boolean ifExistsErrors(String...params) {
        String coursesQuery = this.getQueryBy(params);
        System.out.println("Job query" +coursesQuery);
        SaveProfileDto coursesDTO = (SaveProfileDto) postDataOftDTO(coursesQuery, SaveProfileDto.class);
        return  !((String)coursesDTO.getData()[0].getStatus()).equals("OK") ;

    }


    @Override
    protected String getQueryBy(String... params) {
         String name    =   params[0];
         String email   =   params[1];
         String city    =   params[2];
         String dob     =   params[3];

         String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&name=");
        urlStringBuffer.append(name);
        urlStringBuffer.append("&email=");
        urlStringBuffer.append(email);
        urlStringBuffer.append("&city=");
        urlStringBuffer.append(city);
        urlStringBuffer.append("&dob=");
        urlStringBuffer.append(dob);



        return urlStringBuffer.toString();
    }
}
