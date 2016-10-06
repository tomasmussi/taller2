package com.fiuba.taller2.rest_dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fiuba.taller2.domain.SaveData;

/**
 * Created by luis on 06/10/16.
 */



@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class SaveProfileDto extends AbstractDTO{

    public SaveData[] getData() { return (SaveData[]) data; }

    public void setData(SaveData[] data) {
        this.data = data;
    }


}
