package com.fiuba.taller2.services;

import android.support.annotation.NonNull;
import android.util.Log;

import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.rest_dto.EstadoDTO;

/**
 * Created by luis on 19/09/16.
 */
public class SetSkillServices extends AbstractServices{
    private static final String service_name="api/skill";

    public Estado get(String nameSkill) {
        String query = this.getQueryBy(nameSkill);
        Log.d(this.getClass().toString(), nameSkill);

        EstadoDTO setEstadoDTO = (EstadoDTO) postDataOftDTO(nameSkill, EstadoDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", setEstadoDTO.toString());
        return setEstadoDTO.getData();
    }

    @NonNull
    protected String getQueryBy(String... params) {
        String nameSkill =params[0];

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&skill=");
        urlStringBuffer.append(nameSkill);

        return urlStringBuffer.toString();
    }



}
