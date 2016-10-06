package com.fiuba.taller2.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.ArrayList;

/**
 * Created by luis on 04/10/16.
 */


@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class JobPositions {
    ArrayList<LDJobPosition> job_positions;

    public ArrayList<LDJobPosition> getJobPositions() {
        return job_positions;
    }

    public void setJobPositions(ArrayList<LDJobPosition> jobPositions) {
        this.job_positions = jobPositions;
    }
}
