package com.fiuba.taller2.rest_dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fiuba.taller2.domain.Mensaje;
import com.fiuba.taller2.domain.MyProfileList;

import java.lang.reflect.Array;
import java.util.ArrayList;

/**
 * Created by luis on 05/10/16.
 */

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class MensajesDTO extends AbstractDTO
{


    public ArrayList<Mensaje> getData() { return (ArrayList<Mensaje>) data; }

    public void setData(ArrayList<Mensaje> data) {
        this.data = data;
    }

    public String[] getErrors() {
        return (String[]) errors;
    }

    public void setErrors(String[] errors) {
        this.errors = errors;
    }
}
