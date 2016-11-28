package com.fiuba.taller2.activities;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import com.fiuba.taller2.R;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.services.SaveProfileServices;
import com.google.firebase.auth.FirebaseAuth;
import com.squareup.picasso.Picasso;

import java.util.concurrent.ExecutionException;

/**
 * Created by luis on 06/10/16.
 */

public class MyProfileEdit extends AppCompatActivity {

    private static String LOG_TAG = "MyProfileActivity";
    private String api_token;
    private MyProfile myProfile;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.material_edit_my_profile);
        Log.d("___CLASE : ",getClass().getSimpleName());
        Log.d("___LAYOUT : ","R.layout.material_edit_my_profile");

        Intent intent = getIntent();
        api_token = getIntent().getStringExtra("API_TOKEN");
        myProfile = (MyProfile) intent.getSerializableExtra("PROFILE");

        EditText nameUser = (EditText) findViewById(R.id.user_profile_name);
        nameUser.setText(myProfile.getName());

        EditText email = (EditText) findViewById(R.id.user_profile_email);
        email.setText(myProfile.getEmail());

        EditText fechaNac = (EditText) findViewById(R.id.user_profile_birhdate);
        fechaNac.setText("Fecha de nac: " + myProfile.getDob());

        EditText ciudad = (EditText) findViewById(R.id.user_profile_city);
        ciudad.setText(myProfile.getCity());

        ImageView profilePhoto= (ImageView) findViewById(R.id.user_profile_photo);
        Picasso.with(this).load( myProfile.getProfile_photo()).into(profilePhoto);
        Log.d("ProfilePhoto", myProfile.getProfile_photo());


    }

    private class HttpRequestTaskSave extends AsyncTask<String, Void, Boolean> {
        Boolean result;

        @Override
        protected Boolean doInBackground(String... params) {
            try {

                SaveProfileServices saveProfileServices = new SaveProfileServices();
                saveProfileServices.setApi_security(api_token);
                boolean ifExistsErrors = saveProfileServices.ifExistsErrors(params);
                result = new Boolean(ifExistsErrors);

            } catch (Exception e) {
                Log.e("MyProfileActivity", e.getMessage(), e);
            }

            return result;
        }

    }


    public void guardar(android.view.View v) {
        Log.d("MyProfile: ", "pidioGuardar");

        EditText nameUser = (EditText) findViewById(R.id.user_profile_name);
        myProfile.setName(nameUser.getText().toString());

        EditText email = (EditText) findViewById(R.id.user_profile_email);
        myProfile.setEmail(email.getText().toString());

        EditText fechaNac = (EditText) findViewById(R.id.user_profile_birhdate);
        myProfile.setDob(fechaNac.getText().toString());

        EditText ciudad = (EditText) findViewById(R.id.user_profile_city);
        myProfile.setCity(ciudad.getText().toString());


        EditText summary = (EditText) findViewById(R.id.user_profile_summary);
        summary.setText( summary.getText().toString());

        HttpRequestTaskSave httpRequestTaskSave= new HttpRequestTaskSave();
        httpRequestTaskSave.execute(myProfile.getName(),myProfile.getEmail(),
                myProfile.getCity(),myProfile.getDob(),myProfile.getSummary());
        try {
            Boolean ifErrors= (Boolean)httpRequestTaskSave.get();
            if(!ifErrors) Log.d("MyProfile: ", "GuardoCorrectamente");


        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }


        Intent intent = new Intent(this, MyProfileActivity.class);

        intent.putExtra("PROFILE", myProfile);

        intent.putExtra("API_TOKEN", api_token);
        startActivity(intent);

    }
}