package com.fiuba.taller2.services;

import android.support.annotation.NonNull;
import android.util.Log;

import com.fiuba.taller2.domain.Login;
import com.fiuba.taller2.rest_dto.LoginDTO;

/**
 * Created by luis on 19/09/16.
 */
public class LoginServices extends AbstractServices{
    private static final String service_name="api/fb_login";
    public static final String api_security="7dd52e16c17ff193362961b387687bf8";

    public Login getLoginBy(String user) {
        String loginQuery = this.getQueryBy(user);
        Log.d("API LOGIN QUERY", loginQuery);
        LoginDTO loginDTO = (LoginDTO) geDataOftDTO(loginQuery, LoginDTO.class);
        return loginDTO.getData().get(0);
    }

    @NonNull
    protected String getQueryBy(String... params) {
        String user=params[0];

        String url = urlBase;
        StringBuffer urlStringBuffer = new StringBuffer(url);
        urlStringBuffer.append(service_name);
        urlStringBuffer.append("?");
        urlStringBuffer.append("api_sec=");
        urlStringBuffer.append(api_security);
        urlStringBuffer.append("&fb_user_id=");
        urlStringBuffer.append(user);

        return urlStringBuffer.toString();
    }



}
