package com.fiuba.taller2.services;

import android.util.Log;

import com.fiuba.taller2.domain.Skill;
import com.fiuba.taller2.rest_dto.ListSkillsDTO;
import com.fiuba.taller2.rest_dto.SkillDTO;

import java.util.ArrayList;


/**
 * Created by ezequiel on 27/11/16.
 */

public class GetSkillServices extends AbstractServices {
    private static final String service_name = "api/skill";


    public Skill getSkill(String nameSkill) {
        String query = this.getQueryBy(nameSkill);
        Log.d(this.getClass().toString(), query);

        SkillDTO skillDTO = (SkillDTO) geDataOftDTO(query, SkillDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", skillDTO.getData().toString());
        return skillDTO.getData();
    }

    @Override
    protected String getQueryBy(String... params) {
        String nameSkill = params [0];

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&name=");
        urlStringBuffer.append(nameSkill);
        System.out.println(urlStringBuffer.toString());
        return urlStringBuffer.toString();
    }
}
