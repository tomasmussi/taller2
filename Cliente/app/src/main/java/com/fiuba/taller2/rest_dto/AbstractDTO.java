package com.fiuba.taller2.rest_dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fiuba.taller2.domain.Login;

/**
 * Created by luis on 10/09/16.
 */

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public abstract class AbstractDTO {

    protected Object data;
    protected Object errors;




}
