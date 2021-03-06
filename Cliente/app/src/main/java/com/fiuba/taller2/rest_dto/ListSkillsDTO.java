package com.fiuba.taller2.rest_dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fiuba.taller2.domain.Skills;

import java.util.ArrayList;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)

public class ListSkillsDTO extends AbstractDTO {

     public Skills getData() {
        return (Skills) data;
    }

    public void setData(Skills data) {
        this.data = data;
    }

    public String[] getErrors() {
        return (String[]) errors;
    }

    public void setErrors(String[] errors) {
        this.errors = errors;
    }
}