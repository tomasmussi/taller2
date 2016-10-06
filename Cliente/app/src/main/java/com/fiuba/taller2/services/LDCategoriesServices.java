package com.fiuba.taller2.services;

import android.util.Log;

import com.fiuba.taller2.domain.CategoriesLN;
import com.fiuba.taller2.rest_dto.CategoriesLNDTO;

/**
 * Created by luis on 04/10/16.
 */

public class LDCategoriesServices extends AbstractServices{



    private static final String service_name = "api/categories";


    public CategoriesLN getListCourses() {
        String coursesQuery = this.getQueryBy();
        Log.d("ListCategoriessQuery: ", coursesQuery);
        CategoriesLNDTO jobPositionDTO = (CategoriesLNDTO) geDataOftDTO(coursesQuery, CategoriesLNDTO.class);
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
