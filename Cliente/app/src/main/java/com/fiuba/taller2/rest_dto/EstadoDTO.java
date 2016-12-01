package com.fiuba.taller2.rest_dto;

import com.fiuba.taller2.domain.Estado;

/**
 * Created by luis on 20/11/16.
 */
public class EstadoDTO extends AbstractDTO{

    public Estado getData() { return (Estado) data; }

    public void setData(Estado data) {
        this.data = data;
    }

    @Override
    public String toString() {
        if (getData() != null) {
                return getData().toString();
        } else {
            return "EstadoDTO vacio";

        }

    }
}
