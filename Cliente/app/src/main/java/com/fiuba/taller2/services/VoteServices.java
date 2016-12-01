package com.fiuba.taller2.services;

import android.support.annotation.NonNull;
import android.util.Log;

import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.rest_dto.EstadoDTO;
import com.fiuba.taller2.rest_dto.ListContacts;

import java.util.ArrayList;

/**
 * Created by luis on 19/09/16.
 */
public class VoteServices extends AbstractServices{
    private static final String service_name="api/vote";

    public Estado get(String contact_fb_id) {
        String query = this.getQueryBy(contact_fb_id);
        Log.d(this.getClass().toString(), query);

        EstadoDTO estadoDTO = (EstadoDTO) postDataOftDTO(query, EstadoDTO.class);
        Log.d(this.getClass().getSimpleName()+ " Object", estadoDTO.toString());
        return estadoDTO.getData();
    }
    @NonNull
    protected String getQueryBy(String... params) {
        String contact_fb_id =params[0];

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&contact_fb_id=");
        urlStringBuffer.append(contact_fb_id);
        return urlStringBuffer.toString();
    }



}
