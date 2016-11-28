package com.fiuba.taller2.services;

import android.util.Log;

import com.fiuba.taller2.domain.JobPosition;
import com.fiuba.taller2.rest_dto.JobPositionDTO;


/**
 * Created by ezequiel on 27/11/16.
 */

public class GetJobPositionServices extends AbstractServices {
    private static final String service_name = "api/job_position";


    public JobPosition get(String namejobPosition) {
        String query = this.getQueryBy(namejobPosition);
        Log.d(this.getClass().toString(), query);

        JobPositionDTO jobPositionDTO = (JobPositionDTO) geDataOftDTO(query, JobPositionDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", jobPositionDTO.getData().toString());
        return jobPositionDTO.getData();
    }

    @Override
    protected String getQueryBy(String... params) {
        String namejobPosition = params [0];

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&name=");
        urlStringBuffer.append(namejobPosition);
        System.out.println(urlStringBuffer.toString());
        return urlStringBuffer.toString();
    }
}
