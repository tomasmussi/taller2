package com.fiuba.taller2.rest_dto;

import android.content.Context;

import com.fiuba.taller2.domain.Categoria;
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.Login;
import com.fiuba.taller2.services.AbstractServices;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by luis on 20/11/16.
 */
public class ListContacts extends AbstractDTO{

    public ArrayList<Contact> getData() { return (ArrayList<Contact>) data; }

    public void setData(List<Contact> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        if (getData() != null) {
            StringBuilder sb = new StringBuilder();
            for (Contact str : getData()) {
                sb.append(str.toString()).append(";");
            }

            return sb.toString();
        } else {
            return "ListContacts vacio";

        }
    }
}
