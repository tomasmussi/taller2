package com.fiuba.taller2.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.example.margonari.taller2_frontend.R;
import com.fiuba.taller2.domain.Categoria;

/**
 * Created by Margonari on 05/09/2016.
 */
public class ImageAdapter extends BaseAdapter {
    private Context context;

    public ImageAdapter(Context context) {
        this.context = context;
    }

    @Override
    public int getCount() {
        return Categoria.ITEMS.length;
    }

    @Override
    public Categoria getItem(int position) {
        return Categoria.ITEMS[position];
    }

    @Override
    public long getItemId(int position) {
        return getItem(position).getIdHash();
    }

    @Override
    public View getView(int position, View view, ViewGroup viewGroup) {

        if (view == null) {
            LayoutInflater inflater = (LayoutInflater) context
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate(R.layout.grid_item, viewGroup, false);
        }

        ImageView imagenCategoria = (ImageView) view.findViewById(R.id.imagen_categoria);
        TextView nombreCategoria = (TextView) view.findViewById(R.id.nombre_categoria);

        final Categoria item = getItem(position);
        Glide.with(imagenCategoria.getContext())
                .load(item.getId())
                .into(imagenCategoria);
        nombreCategoria.setText(item.getName());

        return view;
    }
}
