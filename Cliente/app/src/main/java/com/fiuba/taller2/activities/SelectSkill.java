package com.fiuba.taller2.activities;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.adapters.SkillAdapter;
import com.fiuba.taller2.domain.Skill;

import java.util.ArrayList;

public class SelectSkill extends AppCompatActivity {
    private ArrayList<Skill> listSkill;
    private ArrayList<Skill> listSkillSelected;
    private RecyclerView recycler;
    private RecyclerView.Adapter adapter;
    private RecyclerView.LayoutManager lManager;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select_skill);
        listSkill = new ArrayList<Skill>();
        listSkillSelected = new ArrayList<Skill>();

        Skill skillSelected = new Skill();
        skillSelected.setCategory("Categoria Zaraza");
        skillSelected.setDescription("Descripcion Zaraza");
        skillSelected.setName("Name Zaraza1");
        listSkillSelected.add(skillSelected);

        // Agrgo skills de prueba
        Skill skill1 = new Skill();
        skill1.setCategory("Categoria Zaraza");
        skill1.setDescription("Descripcion Zaraza");
        skill1.setName("Name Zaraza1");
        listSkill.add(skill1);
        Skill skill2 = new Skill();
        skill2.setCategory("Categoria Zaraza");
        skill2.setDescription("Descripcion Zaraza");
        skill2.setName("Name Zaraza2");
        listSkill.add(skill2);

        Skill skill3 = new Skill();
        skill3.setCategory("Categoria Zaraza");
        skill3.setDescription("Descripcion Zaraza");
        skill3.setName("Name Zaraza3");
        listSkill.add(skill3);
        String number="a";
        for(Integer i = 0; i<200; i++) {
            number = i.toString();
            skill3.setName(number);
            listSkill.add(skill3);
        }

        recycler = (RecyclerView) findViewById(R.id.reciclador);
        recycler.setHasFixedSize(true);

        // Usar un administrador para LinearLayout
        lManager = new LinearLayoutManager(this);
        recycler.setLayoutManager(lManager);

        // Crear un nuevo adaptador
        adapter = new SkillAdapter(listSkill,listSkillSelected);
        recycler.setAdapter(adapter);
    }
}
