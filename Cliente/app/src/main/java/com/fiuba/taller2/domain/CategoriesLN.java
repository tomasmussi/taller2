package com.fiuba.taller2.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * Created by luis on 04/10/16.
 */


@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class CategoriesLN implements Serializable {

    private ArrayList<CatogoryLN> categories;

    public ArrayList<CatogoryLN> getCategories() {
        return categories;
    }

    public void setCategories(ArrayList<CatogoryLN> categories) {
        this.categories = categories;
    }
}
