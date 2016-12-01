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
    private List<Skill> itemNotSelected;

    public List<Skill> getItemsSelected() {
        return itemsSelected;
    }

    public void setItemsSelected(List<Skill> itemsSelected) {
        this.itemsSelected = itemsSelected;
    }

    public List<Skill> getItemNotSelected() {
        return itemNotSelected;
    }

    public void setItemNotSelected(List<Skill> itemNotSelected) {
        this.itemNotSelected = itemNotSelected;
    }

    public static class SkillViewHolder extends RecyclerView.ViewHolder {
        // Campos respectivos de un item
        public TextView nombre;
        public TextView descripcion;
        public TextView categoria;
        public CheckBox checkBox;

        public SkillViewHolder(View v) {
            super(v);
            nombre = (TextView) v.findViewById(R.id.labelNombre);
            descripcion = (TextView) v.findViewById(R.id.descripcion);
            categoria = (TextView) v.findViewById(R.id.categoria);
            checkBox = (CheckBox) v.findViewById(R.id.chkskill);
        }
    }


    public SkillAdapter(List<Skill> items) {
        this.itemsSelected = new ArrayList<Skill>();
        this.itemNotSelected = new ArrayList<Skill>();


        this.items = items;
    }

    public SkillAdapter(List<Skill> items, List<Skill> itemSelected) {
        this.items = new ArrayList<>();
        this.itemsSelected = new ArrayList<>();
        this.itemNotSelected = new ArrayList<Skill>();

        if(items!=null) this.items = items;
        if(items!=null) this.itemsSelected = itemSelected;
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
    public void onBindViewHolder(final SkillViewHolder viewHolder, final int position) {
        viewHolder.nombre.setText(items.get(position).getName());
        viewHolder.descripcion.setText(items.get(position).getDescription());
        viewHolder.categoria.setText(items.get(position).getCategory());
        if (itemsSelected.contains(items.get(position)))
            viewHolder.checkBox.setChecked(true);

        viewHolder.checkBox.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(!viewHolder.checkBox.isChecked()){
                    viewHolder.checkBox.setChecked(false);
                    itemNotSelected.add(items.get(position));
                    if(itemsSelected.contains(items.get(position))) itemsSelected.remove(items.get(position));
                }else{
                    viewHolder.checkBox.setChecked(true);
                    itemsSelected.add(items.get(position));
                    if(itemNotSelected.contains(items.get(position)))itemNotSelected.remove(items.get(position));

                }

            }
        });
    }
}
