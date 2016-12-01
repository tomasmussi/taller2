package com.fiuba.taller2.services;

import android.util.Log;

import com.fiuba.taller2.domain.JobPosition;
import com.fiuba.taller2.rest_dto.ListJobPositionsDTO;

import java.util.ArrayList;


/**
 * Created by ezequiel on 27/11/16.
 */

public class GetJobPositionsServices extends AbstractServices {
    private static final String service_name = "api/job_positions";


    public ArrayList<JobPosition> get() {
        String query = this.getQueryBy();
        Log.d(this.getClass().toString(), query);

        ListJobPositionsDTO listJobPositionsDTO = (ListJobPositionsDTO) geDataOftDTO(query, ListJobPositionsDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", listJobPositionsDTO.getData().getJob_positions().toString());
        return listJobPositionsDTO.getData().getJob_positions();
    }

    @Override
    protected String getQueryBy(String... params) {

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        System.out.println(urlStringBuffer.toString());
        return urlStringBuffer.toString();
    }
}
