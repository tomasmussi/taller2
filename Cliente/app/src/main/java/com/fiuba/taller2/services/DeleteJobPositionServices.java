package com.fiuba.taller2.services;

import android.support.annotation.NonNull;
import android.util.Log;

import com.fiuba.taller2.rest_dto.EstadoDTO;

/**
 * Created by luis on 19/09/16.
 */
public class DeleteJobPositionServices extends AbstractServices{
    private static final String service_name="api/job_positions";

    public void get(String namejobPosition) {
        String query = this.getQueryBy(namejobPosition);
        Log.d(this.getClass().toString(), namejobPosition);

        deleteDataOftDTO(query, EstadoDTO.class);
        Log.d(this.getClass().getSimpleName()+ "Eliminado ", "");
    }

    @NonNull
    protected String getQueryBy(String... params) {
        String namejobPosition =params[0];

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&job_positions=");
        urlStringBuffer.append(namejobPosition);

        return urlStringBuffer.toString();
    }



}
