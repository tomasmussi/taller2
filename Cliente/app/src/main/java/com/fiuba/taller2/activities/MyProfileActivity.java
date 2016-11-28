package com.fiuba.taller2.activities;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ExpandableListView;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.adapters.MensajeAdapter;
import com.fiuba.taller2.adapters.SkillsAdapter;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.domain.Skill;
import com.fiuba.taller2.domain.Skills;
import com.fiuba.taller2.services.LDMyProfileServices;
import com.squareup.picasso.Picasso;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class MyProfileActivity extends AppCompatActivity {

    private RecyclerView unitsRecyclerView;
    private RecyclerView.Adapter unitsAdapter;
    private RecyclerView.LayoutManager unitsLayoutManager;

    private RecyclerView professorsRecyclerView;
    private RecyclerView.Adapter professorsAdapter;
    private RecyclerView.LayoutManager professorsLayoutManager;

    private static String LOG_TAG = "MyProfileActivity";
    private String api_token;
    private MyProfile myProfile;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
         super.onCreate(savedInstanceState);

        setContentView(R.layout.material_my_profile);

        Log.d("___CLASE : ",getClass().getSimpleName());
        Log.d("___LAYOUT : ","R.layout.material_my_profile");

        Intent intent = getIntent();
        api_token = getIntent().getStringExtra("API_TOKEN");
        HttpRequestTaskMyProfile httpRequestTaskMyProfile = new HttpRequestTaskMyProfile();
        httpRequestTaskMyProfile.execute();

        try {
            myProfile= httpRequestTaskMyProfile.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }





        ImageView profilePhoto= (ImageView) findViewById(R.id.user_profile_photo);
        Picasso.with(this).load( myProfile.getProfile_photo()).into(profilePhoto);
        Log.d("ProfilePhoto", myProfile.getProfile_photo());



        TextView nameUser = (TextView) findViewById(R.id.user_profile_name);
        nameUser.setText(myProfile.getName());

        TextView email = (TextView) findViewById(R.id.user_profile_email);
        email.setText(email.getText()+myProfile.getEmail());

        TextView fechaNac = (TextView) findViewById(R.id.user_profile_birhdate);
        fechaNac.setText( fechaNac.getText()+myProfile.getDob());


        TextView ciudad = (TextView) findViewById(R.id.user_profile_city);
        ciudad.setText( ciudad.getText()+myProfile.getCity());


        TextView summary = (TextView) findViewById(R.id.user_profile_summary);
        summary.setText( summary.getText()+myProfile.getSummary());


        Skill skill1= new Skill();
        Skill skill2= new Skill();

        skill1.setName("tuvieja");
        skill2.setName("tuviejo");

        skill1.setCategory("una categoria");
        skill2.setCategory("otra categoria");

        skill1.setDescription("Descripvion1");
        skill2.setDescription("Descripvion2");
        //Creamos el adaptador
        ArrayList<Skill> arrayList=new ArrayList<>();
        arrayList.add(skill1);
        arrayList.add(skill2);

        ExpandableListView spinnerCoursesType = (ExpandableListView) findViewById(R.id.user_profile_skills);

        spinnerCoursesType.setAdapter(new SkillsAdapter(this,arrayList));
      //  ArrayAdapter adapter = ArrayAdapter.createFromResource(this,R.array.,android.R.layout.simple_spinner_item);


    }


    public void editar(View v){
        Log.d("MyProfile: " , "PidioEditarPerfil");
        Intent intent = new Intent(this, MyProfileEdit.class);
        intent.putExtra("PROFILE", myProfile);
        intent.putExtra("API_TOKEN", api_token);
        startActivity(intent);

    }

    class HttpRequestTaskMyProfile extends AsyncTask<String, Void,MyProfile> {

        MyProfile myProfile;
        @Override
        protected MyProfile doInBackground(String... params) {
            try {

                LDMyProfileServices ldMyProfileServices= new LDMyProfileServices();
                ldMyProfileServices.setApi_security(api_token);
                myProfile =  ldMyProfileServices.getProfile();


            } catch (Exception e) {
                Log.e("MyProfileRquest", e.getMessage(), e);
            }

            return myProfile;
        }

    }
}
