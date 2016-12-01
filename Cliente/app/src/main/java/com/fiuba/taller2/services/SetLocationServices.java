package com.fiuba.taller2.services;

import android.support.annotation.NonNull;
import android.util.Log;

import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.rest_dto.EstadoDTO;

/**
 * Created by luis on 19/09/16.
 */
public class SetLocationServices extends AbstractServices{
    private static final String service_name="api/location";

    public Estado get(String latitude, String longitude) {
        String query = this.getQueryBy(latitude,longitude);
        Log.d(this.getClass().toString(), query);

        EstadoDTO setEstadoDTO = (EstadoDTO) postDataOftDTO(query, EstadoDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", setEstadoDTO.toString());
        return setEstadoDTO.getData();
    }

    @NonNull
    protected String getQueryBy(String... params) {
        String latitude =params[0];
        String longitude=params[1];

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&latitude=");
        urlStringBuffer.append(latitude);
        urlStringBuffer.append("&longitude=");
        urlStringBuffer.append(longitude);

        return urlStringBuffer.toString();
    }



}
