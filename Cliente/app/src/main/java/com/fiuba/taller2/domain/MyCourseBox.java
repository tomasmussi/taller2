package com.fiuba.taller2.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.io.Serializable;

/**
 * Created by luis on 26/09/16.
 * Esta clase se crea con la unica finalidad de responder a la consulta de cursos del lado del server
 * Actualmente vienen muchos datos adicionales que se esconden dentro de una estructura mas grande
 * A esta estructura la llamamos MyCourseBox y lo unico que tomamos de esos datos
 * es el curso
 */


@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class MyCourseBox implements Serializable {

    private Job job;

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }
}
