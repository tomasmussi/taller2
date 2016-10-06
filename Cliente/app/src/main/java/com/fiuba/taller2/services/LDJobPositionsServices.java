package com.fiuba.taller2.services;

import android.util.Log;

import com.fiuba.taller2.domain.JobPositions;
import com.fiuba.taller2.rest_dto.JobsDTO;

/**
 * Created by luis on 04/10/16.
 */

public class LDJobPositionsServices  extends AbstractServices{



    private static final String service_name = "api/job_positions";


    public JobPositions getListCourses() {
        String coursesQuery = this.getQueryBy();
        Log.d("ListJobsQuery: ", coursesQuery);
        JobsDTO jobPositionDTO = (JobsDTO) geDataOftDTO(coursesQuery, JobsDTO.class);
        return jobPositionDTO.getData();
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
