package com.fiuba.taller2.services;

import android.util.Log;

import com.fiuba.taller2.domain.Category;
import com.fiuba.taller2.domain.Skill;
import com.fiuba.taller2.rest_dto.ListCategoriesDTO;
import com.fiuba.taller2.rest_dto.ListSkillsDTO;

import java.util.ArrayList;


/**
 * Created by ezequiel on 27/11/16.
 */

public class GetCategoriesServices extends AbstractServices {
    private static final String service_name = "api/categories";


    public ArrayList<Category> get() {
        String query = this.getQueryBy();
        Log.d(this.getClass().toString(), query);

        ListCategoriesDTO listCategoriesDTO = (ListCategoriesDTO) geDataOftDTO(query, ListCategoriesDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", listCategoriesDTO.toString());
        return listCategoriesDTO.getData().getCategories();
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
