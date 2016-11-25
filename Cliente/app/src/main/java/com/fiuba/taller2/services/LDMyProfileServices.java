package com.fiuba.taller2.services;

import android.util.Log;

import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.domain.MyProfileList;
import com.fiuba.taller2.rest_dto.MyProfileDTO;

/**
 * Created by luis on 05/10/16.
 */

public class LDMyProfileServices extends AbstractServices{

        private static final String service_name = "api/profile";


        public MyProfile getProfile() {
            String coursesQuery = this.getQueryBy();
            Log.d("MyProfile: ", coursesQuery);

            MyProfileDTO coursesDTO = (MyProfileDTO) geDataOftDTO(coursesQuery, MyProfileDTO.class);
            MyProfileList[] a= (MyProfileList[]) coursesDTO.getData();
            return ((MyProfileList[])(coursesDTO.getData()))[0].getUser();
        }

        @Override
        protected String getQueryBy(String... params) {

            String url = urlBase;
            StringBuffer urlStringBuffer = new StringBuffer(url);
            urlStringBuffer.append(service_name);
            urlStringBuffer.append("?");
            urlStringBuffer.append("token=");
            urlStringBuffer.append(api_security);


            return urlStringBuffer.toString();
        }

}
