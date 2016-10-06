package com.fiuba.taller2.rest_dto;

import com.fiuba.taller2.domain.JobPositions;

/**
 * Created by luis on 25/09/16.
 */





public class JobsDTO {

    protected JobPositions datos;



    public JobPositions getData() { return (JobPositions) datos; }

    public void setData (JobPositions data) {
        this.datos = data;
    }
}
