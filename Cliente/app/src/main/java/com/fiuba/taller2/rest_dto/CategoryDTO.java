package com.fiuba.taller2.rest_dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fiuba.taller2.domain.Category;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)

public class CategoryDTO extends AbstractDTO {
    public Category getData() {
        return (Category) data;
    }

    public void setData(Category data) {
        this.data = data;
    }

    public String[] getErrors() {
        return (String[]) errors;
    }

    public void setErrors(String[] errors) {
        this.errors = errors;
    }
}