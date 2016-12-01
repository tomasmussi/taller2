package com.fiuba.taller2.domain;

import com.fiuba.taller2.R;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * Created by Margonari on 05/09/2016.
 */


@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class Categoria {
    public static Categoria[] ITEMS = {
            new Categoria("Mi Perfil", R.drawable.new_miperfil),
            new Categoria("Contactos", R.drawable.new_contactos),
            new Categoria("Contactos Cercanos", R.drawable.newencontrartrabajo),
            new Categoria("Cerrar Sesion", R.drawable.newmensajes)
    };
    private String name;
    private int id;

    public Categoria() {
    }

    public Categoria(String name, int id) {
        this.name = name;
        this.id = id;
    }

    /**
     * Obtiene item basado en su identificador
     *
     * @param id identificador
     * @return com.fiuba.taller2.domain.Categoria
     */
    public static Categoria getItem(int id) {
        for (Categoria item : ITEMS) {
            if (item.getIdHash() == id) {
                return item;
            }
        }
        return null;
    }

    public static int getCategoryByIdView(int id_view) {

        switch (id_view) {
            case R.drawable.new_miperfil:
                return 1;
            case R.drawable.new_contactos:
                return 2;
            case R.drawable.newencontrartrabajo:
                return 3;

            case R.drawable.newmensajes:
                return 4;
            default:
                System.out.println("error");
                break;
        }
        return 0;

    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public int getIdHash() {
        return name.hashCode();
    }
}