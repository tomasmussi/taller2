package com.fiuba.taller2.rest_dto;

import com.fiuba.taller2.domain.Login;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

/**
 * Created by luis on 10/09/16.
 */
public class LoginDTO extends AbstractDTO {

    public Login getData() { return (Login) data; }

    public void setData(Login data) {
        this.data = data;
    }

}
