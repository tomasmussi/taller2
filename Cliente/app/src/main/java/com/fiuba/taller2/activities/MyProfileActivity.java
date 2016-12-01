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
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.AbsListView;
import android.widget.ExpandableListView;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.adapters.JobssAdapter;
import com.fiuba.taller2.adapters.SkillsAdapter;
import com.fiuba.taller2.domain.JobPosition;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.domain.Skill;
import com.fiuba.taller2.services.GetJobPositionsServices;
import com.fiuba.taller2.services.GetSkillServices;
import com.fiuba.taller2.services.GetSkillsServices;
import com.fiuba.taller2.services.LDMyProfileServices;
import com.squareup.picasso.Picasso;

import java.lang.reflect.Constructor;
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
    private ExpandableListView expandableListViewJobs;
    private ExpandableListView expandableListViewSkills;
    private   ArrayList<Skill> skills;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
         super.onCreate(savedInstanceState);

        setContentView(R.layout.material_my_profile);
        //Setteo de titulo de la activity
        this.setTitle("Mi Perfil");
        if (getIntent().getExtras() != null) {
            for (String key : getIntent().getExtras().keySet()) {
                Object value = getIntent().getExtras().get(key);
            }
        }
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
        String urlImage ="http://www.thomasandfriends.com/es-es/Images/hero-6-sample-train_tcm1140-190382.png";
        if( myProfile.getProfile_photo()!=null & ! myProfile.getProfile_photo().isEmpty())Picasso.with(this).load( myProfile.getProfile_photo()).into(profilePhoto);
        else{Picasso.with(this).load(urlImage).into(profilePhoto);}
        Log.d("ProfilePhoto", myProfile.getProfile_photo());



        TextView nameUser = (TextView) findViewById(R.id.user_profile_name);
        nameUser.setText(myProfile.getName());

        TextView email = (TextView) findViewById(R.id.user_profile_email);
        email.setText(myProfile.getEmail());

        TextView fechaNac = (TextView) findViewById(R.id.user_profile_birhdate);
        fechaNac.setText( myProfile.getDob());


        TextView ciudad = (TextView) findViewById(R.id.user_profile_city);
        ciudad.setText( myProfile.getCity());


        TextView summary = (TextView) findViewById(R.id.user_profile_summary);
        summary.setText( myProfile.getSummary());


      skills=new ArrayList<>();
        if(myProfile.getSkills()!=null){
            skills= getSkillsFromArrayOfString(myProfile.getSkills());
        }
        expandableListViewSkills = (ExpandableListView) findViewById(R.id.user_profile_skills);
        expandableListViewSkills.setAdapter(new SkillsAdapter(this,skills));
        expandableListViewSkills.collapseGroup(0);
        final ArrayList<Skill> finalSkills = skills;


        expandableListViewSkills.setOnGroupClickListener(new ExpandableListView.OnGroupClickListener(){

            @Override
            public boolean onGroupClick(ExpandableListView expandableListView, View view, int i, long l) {

                if(!expandableListViewSkills.isGroupExpanded(0)) {
                    LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) expandableListViewSkills.getLayoutParams();
                    params.height = params.height + (finalSkills.size()*400);
                    expandableListViewSkills.setLayoutParams(params);
                    expandableListViewSkills.requestLayout();
                }else{
                    LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) expandableListViewSkills.getLayoutParams();
                    params.height = params.height - finalSkills.size()*400;
                    expandableListViewSkills.setLayoutParams(params);
                    expandableListViewSkills.requestLayout();
                }
                return false;
            }
        });


        ArrayList<JobPosition> jobPositions= new ArrayList<>();
        jobPositions= getJobPositions();


        expandableListViewJobs= (ExpandableListView) findViewById(R.id.user_profile_jobs);
        expandableListViewJobs.setAdapter(new JobssAdapter(this,jobPositions));
        expandableListViewJobs.collapseGroup(0);
        final ArrayList<JobPosition> finalJobPositions = jobPositions;
        expandableListViewJobs.setOnGroupClickListener(new ExpandableListView.OnGroupClickListener(){

            @Override
            public boolean onGroupClick(ExpandableListView expandableListView, View view, int i, long l) {

                if(!expandableListViewJobs.isGroupExpanded(0)) {
                    LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) expandableListViewJobs.getLayoutParams();
                    params.height = params.height + (finalJobPositions.size()*400);
                    expandableListViewJobs.setLayoutParams(params);
                    expandableListViewJobs.requestLayout();
                }else{
                    LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) expandableListViewJobs.getLayoutParams();
                    params.height = params.height - finalJobPositions.size()*400;
                    expandableListViewJobs.setLayoutParams(params);
                    expandableListViewJobs.requestLayout();
                }
                return false;
            }
        });



    }

    private ArrayList<Skill> getSkillsFromArrayOfString(ArrayList<String> skills) {
        ArrayList<Skill> skillArrayList= new ArrayList<>();

        for(String s:skills) {
            AsyncGetSkill asyncGetSkill = new AsyncGetSkill();
            asyncGetSkill.execute(s);
            try {
                Skill skill = (Skill) asyncGetSkill.get();

                if (skill != null) {
                    Log.d("skill", skill.toString());
                    skillArrayList.add(skill);
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
        }

        return skillArrayList;

    }

    private void resizeView(View view, int newWidth, int newHeight) {
        try {
            Constructor<? extends RelativeLayout.LayoutParams> ctor = (Constructor<? extends RelativeLayout.LayoutParams>) view.getLayoutParams().getClass().getDeclaredConstructor(int.class, int.class);
            view.setLayoutParams(ctor.newInstance(newWidth, newHeight));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private ArrayList<JobPosition>  getJobPositions() {
        ArrayList<JobPosition> jobPositions=null;
        AsyncGetJobPositions asyncGetJobPositions = new AsyncGetJobPositions();
        asyncGetJobPositions.execute();
        try {
            jobPositions= (ArrayList<JobPosition>) asyncGetJobPositions.get();
            if (jobPositions != null) Log.d("JobPositions", jobPositions.toString());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        return jobPositions;
    }


    public void editar(View v){
        Log.d("MyProfile: " , "PidioEditarPerfil");
        Intent intent = new Intent(this, MyProfileEdit.class);
        intent.putExtra("PROFILE", myProfile);
        intent.putExtra("API_TOKEN", api_token);
        startActivity(intent);

    }

    public void editar_skills(View v){
        Log.d("MyProfile: " , "PidioEditarSkills");
        Intent intent = new Intent(this, SelectSkill.class);
        intent.putExtra("API_TOKEN", api_token);
        intent.putExtra("PROFILE", myProfile);
        intent.putExtra("SKILL_LIST",  skills);
        startActivityForResult(intent,1);

    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        finish();
        startActivity(getIntent());
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



    private class AsyncGetJobPositions extends AsyncTask<String, Void, ArrayList<JobPosition>> {
        @Override
        protected ArrayList<JobPosition> doInBackground(String... params) {
            try {
                GetJobPositionsServices getJobPositions = new GetJobPositionsServices();
                getJobPositions.setApi_security(api_token);
                ArrayList<JobPosition> estado = getJobPositions.get();
                return estado;
            } catch (Exception e) {
                Log.e("JobPositions", e.getMessage(), e);
            }
            return null;
        }

    }


    private class AsyncGetSkill extends AsyncTask<String, Void, Skill> {
        @Override
        protected Skill doInBackground(String... params) {
            try {
                String nameSkill = params[0];
                GetSkillServices getSkillServices = new GetSkillServices();
                getSkillServices.setApi_security(api_token);
                Skill estado = getSkillServices.getSkill(nameSkill);
                return estado;
            } catch (Exception e) {
                Log.e("SendMesagge", e.getMessage(), e);
            }
            return null;
        }

    }
}
