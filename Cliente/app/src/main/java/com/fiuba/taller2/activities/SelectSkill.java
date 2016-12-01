package com.fiuba.taller2.activities;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;

import com.fiuba.taller2.R;
import com.fiuba.taller2.adapters.SkillAdapter;
import com.fiuba.taller2.adapters.SkillsAdapter;
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.domain.Skill;
import com.fiuba.taller2.services.DeleteSkillServices;
import com.fiuba.taller2.services.GetSkillsServices;
import com.fiuba.taller2.services.SetJobPositionServices;
import com.fiuba.taller2.services.SetSkillServices;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class SelectSkill extends AppCompatActivity {
    private ArrayList<Skill> listSkill;
    private ArrayList<Skill> listSkillSelected;
    private RecyclerView recycler;
    private RecyclerView.Adapter adapter;
    private RecyclerView.LayoutManager lManager;
    private String api_token;
    private MyProfile myProfile;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select_skill);

        listSkill = new ArrayList<Skill>();
        listSkillSelected = new ArrayList<Skill>();

        this.setTitle("Seleccionar Skills");
        if (getIntent().getExtras() != null) {
            for (String key : getIntent().getExtras().keySet()) {
                Object value = getIntent().getExtras().get(key);
            }
        }

        Intent intent = getIntent();
        api_token = intent.getStringExtra("API_TOKEN");
        myProfile=(MyProfile) intent.getSerializableExtra("PROFILE");
        listSkillSelected=(ArrayList<Skill>) intent.getSerializableExtra("SKILL_LIST");
        if(listSkillSelected==null){
            listSkillSelected= new ArrayList<Skill>();
        }
        listSkill= getSkillArrayList(listSkill);

        recycler = (RecyclerView) findViewById(R.id.reciclador);
        recycler.setHasFixedSize(true);

        // Usar un administrador para LinearLayout
        lManager = new LinearLayoutManager(this);
        recycler.setLayoutManager(lManager);

        // Crear un nuevo adaptador
        adapter = new SkillAdapter(listSkill,listSkillSelected);
        recycler.setAdapter(adapter);
    }



    public void guardar(View v) {
        ArrayList<Skill> skillArrayList= (ArrayList<Skill>) ((SkillAdapter)adapter).getItemsSelected();
        for (Skill skill: skillArrayList){
            AsyncSetSkill asyncSetSkill = new AsyncSetSkill();

            asyncSetSkill.execute(skill.getName());
            try {
                Estado estado = (Estado) asyncSetSkill.get();
                Log.d("Estado", estado.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
        }

        ArrayList<Skill> skillArrayListNotSelected= (ArrayList<Skill>) ((SkillAdapter)adapter).getItemNotSelected();

        for (Skill skill: skillArrayListNotSelected){
            //Elimino el skill de tomas
            AsyncDeleteSkill asyncDeleteSkill = new AsyncDeleteSkill();
            asyncDeleteSkill.execute(skill.getName());
            Log.d("Estado", "Se elimino un skill");
            try {
                asyncDeleteSkill.get();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }

        }


        finish();

    }

    private class AsyncSetSkill extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String nameSkill = params[0];

                SetSkillServices setSkillServices = new SetSkillServices();
                setSkillServices.setApi_security(api_token);
                Estado estado_response = (Estado) setSkillServices.get(nameSkill);
                return estado_response;
            } catch (Exception e) {
                Log.e("AsyncSetLocation", e.getMessage(), e);
            }

            return null;
        }

    }


    private class AsyncgetSkills extends AsyncTask<String, Void, ArrayList<Skill>> {
        @Override
        protected ArrayList<Skill> doInBackground(String... params) {
            try {
                GetSkillsServices getSkills = new GetSkillsServices();
                getSkills.setApi_security(api_token);
                ArrayList<Skill> estado = getSkills.get();
                return estado;
            } catch (Exception e) {
                Log.e("SendMesagge", e.getMessage(), e);
            }
            return null;
        }

    }

    @Nullable
    private ArrayList<Skill> getSkillArrayList(ArrayList<Skill> skills) {
        AsyncgetSkills asyncgetSkills = new AsyncgetSkills();
        asyncgetSkills.execute();
        try {
            skills= (ArrayList<Skill>) asyncgetSkills.get();
            if (skills != null) Log.d("skills", skills.toString());

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        return skills;
    }


    private class AsyncDeleteSkill extends AsyncTask<String, Void, Void> {
        @Override
        protected Void doInBackground(String... params) {
            try {
                String nameSkill = params[0];

                DeleteSkillServices deleteSkillServices = new DeleteSkillServices();
                deleteSkillServices.setApi_security(api_token);
                deleteSkillServices.get(nameSkill);
            } catch (Exception e) {
                Log.e("AsyncSetDeleteSkill", e.getMessage(), e);
            }
            return null;
        }
    }
}
