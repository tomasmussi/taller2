package com.fiuba.taller2.services;

import android.support.annotation.NonNull;
import android.util.Log;

import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.rest_dto.EstadoDTO;

/**
 * Created by luis on 19/09/16.
 */
public class SetJobPositionServices extends AbstractServices{
    private static final String service_name="api/JobPosition";

    public Estado get(String nameJobPosition) {
        String query = this.getQueryBy(nameJobPosition);
        Log.d(this.getClass().toString(), nameJobPosition);

        EstadoDTO setEstadoDTO = (EstadoDTO) postDataOftDTO(query, EstadoDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", setEstadoDTO.toString());
        return setEstadoDTO.getData();
    }

    @NonNull
    protected String getQueryBy(String... params) {
        String nameJobPosition =params[0];

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&JobPosition=");
        urlStringBuffer.append(nameJobPosition);

        return urlStringBuffer.toString();
    }



}
