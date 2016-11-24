package com.fiuba.taller2.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;

/**
 * Created by luis on 05/10/16.
 */


@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class MyProfileList implements Serializable {

    private MyProfile user;

    public MyProfile getUser() {
        return user;
    }

    public void setUser(MyProfile user) {
        this.user = user;
    }
}
