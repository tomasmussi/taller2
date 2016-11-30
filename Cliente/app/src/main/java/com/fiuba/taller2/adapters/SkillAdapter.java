package com.fiuba.taller2.adapters;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.domain.Skill;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ezequiel on 29/11/16.
 */

public class SkillAdapter extends RecyclerView.Adapter<SkillAdapter.SkillViewHolder> {
    private List<Skill> items;
    private List<Skill> itemsSelected;

    public static class SkillViewHolder extends RecyclerView.ViewHolder {
        // Campos respectivos de un item
        public TextView nombre;
        public TextView descripcion;
        public TextView categoria;
        public CheckBox checkBox;

        public SkillViewHolder(View v) {
            super(v);
            nombre = (TextView) v.findViewById(R.id.nombre);
            descripcion = (TextView) v.findViewById(R.id.descripcion);
            categoria = (TextView) v.findViewById(R.id.categoria);
            checkBox = (CheckBox) v.findViewById(R.id.chkSkill);
        }
    }


    public SkillAdapter(List<Skill> items) {
        this.itemsSelected = new ArrayList<Skill>();
        this.items = items;
    }

    public SkillAdapter(List<Skill> items, List<Skill> itemSelected) {
        this.items = items;
        this.itemsSelected = itemSelected;
    }
    @Override
    public int getItemCount() {
        return items.size();
    }

    @Override
    public SkillViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View v = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.skill_card_view, viewGroup, false);
        return new SkillViewHolder(v);
    }

    @Override
    public void onBindViewHolder(SkillViewHolder viewHolder, int i) {
        viewHolder.nombre.setText(items.get(i).getName());
        viewHolder.descripcion.setText(items.get(i).getDescription());
        viewHolder.categoria.setText(items.get(i).getCategory());
        if (itemsSelected.contains(items.get(i)))
            viewHolder.checkBox.setChecked(true);
    }
}
