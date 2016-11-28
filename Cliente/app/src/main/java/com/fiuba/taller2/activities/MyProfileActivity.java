package com.fiuba.taller2.activities;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.services.LDMyProfileServices;
import com.squareup.picasso.Picasso;

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
