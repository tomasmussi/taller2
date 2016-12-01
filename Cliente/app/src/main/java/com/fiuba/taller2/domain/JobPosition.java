package com.fiuba.taller2.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;

/**
 * Created by luis on 04/10/16.
 */


@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class JobPosition implements Serializable {

    private String name;
    private String description;
    private String category;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    @Override
    public String toString() {
        return "JobPosition{" +
                "name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", category='" + category + '\'' +
                '}';
    }

    public void setCategory(String category) {
        this.category = category;
    }


}