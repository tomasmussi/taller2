package com.fiuba.taller2.services;

import android.support.annotation.NonNull;
import android.util.Log;

import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.rest_dto.ListContacts;

import java.util.ArrayList;

/**
 * Created by luis on 19/09/16.
 */
public class LookupServices extends AbstractServices{
    private static final String service_name="api/lookup";

    public ArrayList<Contact> get(String query_lookup) {
        String query = this.getQueryBy(query_lookup);
        Log.d(this.getClass().toString(), query);

        ListContacts listContacts = (ListContacts) geDataOftDTO(query, ListContacts.class);
        Log.d(this.getClass().getSimpleName()+ " Object", listContacts.toString());
        return listContacts.getData();
    }

    @NonNull
    protected String getQueryBy(String... params) {
        String user=params[0];

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("token=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&query=");
        urlStringBuffer.append(user);

        return urlStringBuffer.toString();
    }



}
