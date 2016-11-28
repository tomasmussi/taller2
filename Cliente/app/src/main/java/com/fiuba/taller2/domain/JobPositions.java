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

    private ArrayList<JobPosition> JobPositions;

    public ArrayList<JobPosition> getJobPositions() {
        return JobPositions;
    }

    public void setJobPositions(ArrayList<JobPosition> JobPositions) {
        this.JobPositions = JobPositions;
    }

    @Override
    public String toString() {
        return "JobPositions{" +
                "JobPositions=" + JobPositions +
                '}';
    }
}

