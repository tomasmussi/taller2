package com.fiuba.taller2.services;

import android.util.Log;

import com.fiuba.taller2.domain.Skill;
import com.fiuba.taller2.domain.Skills;
import com.fiuba.taller2.rest_dto.ListContacts;
import com.fiuba.taller2.rest_dto.ListSkillsDTO;

import java.util.ArrayList;


/**
 * Created by ezequiel on 27/11/16.
 */

public class GetSkillsServices extends AbstractServices {
    private static final String service_name = "api/skills";


    public ArrayList<Skill> getListCourses() {
        String query = this.getQueryBy();
        Log.d(this.getClass().toString(), query);

        ListSkillsDTO listSkillsDTO = (ListSkillsDTO) geDataOftDTO(query, ListSkillsDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", listSkillsDTO.toString());
        return listSkillsDTO.getData();
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
