package com.fiuba.taller2.rest_dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.domain.MyProfileList;

/**
 * Created by luis on 05/10/16.
 */

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class MyProfileDTO extends AbstractDTO
{


    public MyProfile getData() { return (MyProfile) data; }

    public void setData(MyProfile data) {
        this.data = data;
    }

    public String[] getErrors() {
        return (String[]) errors;
    }

    public void setErrors(String[] errors) {
        this.errors = errors;
    }
}
