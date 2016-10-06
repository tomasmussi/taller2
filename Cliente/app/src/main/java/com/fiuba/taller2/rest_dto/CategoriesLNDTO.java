package com.fiuba.taller2.rest_dto;

import com.fiuba.taller2.domain.CategoriesLN;

/**
 * Created by luis on 04/10/16.
 */

public class CategoriesLNDTO {


    protected CategoriesLN datos;



    public CategoriesLN getData() { return (CategoriesLN) datos; }

    public void setData (CategoriesLN data) {
        this.datos = data;
    }
}
