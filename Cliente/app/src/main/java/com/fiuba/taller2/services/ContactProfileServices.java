package com.fiuba.taller2.services;

import android.util.Log;

import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.rest_dto.MyProfileDTO;

/**
 * Created by luis on 05/10/16.
 */

public class ContactProfileServices extends AbstractServices{

        private static final String service_name = "api/profile/others";


        public MyProfile get(String contact_fb_id) {
            String coursesQuery = this.getQueryBy(contact_fb_id);
            Log.d("ContactProfile: ", coursesQuery);
            MyProfileDTO coursesDTO = (MyProfileDTO) geDataOftDTO(coursesQuery, MyProfileDTO.class);
            Log.d("ContactProfile: ", coursesDTO.getData().toString());
            return coursesDTO.getData();
        }

        @Override
        protected String getQueryBy(String... params) {
            String contact_fb_id= params[0];

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
