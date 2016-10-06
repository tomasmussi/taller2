package com.fiuba.taller2.rest_dto;

import com.fiuba.taller2.domain.Login;

import java.util.ArrayList;

/**
 * Created by luis on 10/09/16.
 */
public class LoginDTO extends AbstractDTO {

    public ArrayList<Login> getData() { return (ArrayList<Login>) data; }

    public void setData(ArrayList<Login> data) {
        this.data = data;
    }


}
