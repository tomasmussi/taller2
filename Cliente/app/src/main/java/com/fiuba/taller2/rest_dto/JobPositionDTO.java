package com.fiuba.taller2.rest_dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fiuba.taller2.domain.JobPosition;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)

public class JobPositionDTO extends AbstractDTO {
    public JobPosition getData() {
        return (JobPosition) data;
    }

    public void setData(JobPosition data) {
        this.data = data;
    }

    public String[] getErrors() {
        return (String[]) errors;
    }

    public void setErrors(String[] errors) {
        this.errors = errors;
    }
}