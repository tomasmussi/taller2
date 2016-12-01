package com.fiuba.taller2.services;

import android.support.annotation.NonNull;
import android.util.Log;

import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.rest_dto.EstadoDTO;

/**
 * Created by luis on 19/09/16.
 */
public class RegisterPushIdServices extends AbstractServices{
    private static final String service_name="api/token_FCM";

    public Estado get(String user_fb_id, String push_id) {
        String query = this.getQueryBy(user_fb_id, push_id);
        Log.d(this.getClass().toString(), query);

        EstadoDTO estadoDTO = (EstadoDTO) postDataOftDTO(query, EstadoDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", estadoDTO.toString());
        return estadoDTO.getData();
    }
    @NonNull
    protected String getQueryBy(String... params) {
        String user_fb_id =params[0];
        String token_FCM=params[1];


        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&user_fb_id=");
        urlStringBuffer.append(user_fb_id);
        urlStringBuffer.append("&token_FCM=");
        urlStringBuffer.append(token_FCM);
        return urlStringBuffer.toString();
    }



}
