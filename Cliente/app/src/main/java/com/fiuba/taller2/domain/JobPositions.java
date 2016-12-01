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
public class JobPositions implements Serializable {

    private ArrayList<JobPosition> job_positions;

    public ArrayList<JobPosition> getJob_positions() {
        return job_positions;
    }

    public void setJob_positions(ArrayList<JobPosition> job_positions) {
        this.job_positions = job_positions;
    }

    @Override
    public String toString() {
        return "job_positions{" +
                "job_positions=" + job_positions +
                '}';
    }
}

