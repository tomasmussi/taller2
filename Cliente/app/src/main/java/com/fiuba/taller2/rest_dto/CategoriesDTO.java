package com.fiuba.taller2.rest_dto;

import com.fiuba.taller2.domain.Categoria;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by luis on 10/09/16.
 */
public class CategoriesDTO extends AbstractDTO{

    public ArrayList<Categoria> getData() { return (ArrayList<Categoria>) data; }

    public void setData(List<Categoria> data) {
        this.data = data;
    }
}
