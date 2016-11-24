package com.fiuba.taller2.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * Created by aranc on 21/8/2016.
 */


@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Login {
    public String id;
    public String token;
    public String email;
    public String password;
    public String user_exists;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Login{" +
                "id='" + id + '\'' +
                ", token='" + token + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", user_exists='" + user_exists + '\'' +
                '}';
    }

    public String getUser_exists() {
        return user_exists;
    }

    public void setUser_exists(String user_exists) {
        this.user_exists = user_exists;
    }


}
