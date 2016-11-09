package com.fiuba.taller2.activities;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.EditText;
import android.widget.ImageView;

import com.example.margonari.taller2_frontend.R;
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
        setContentView(R.layout.activity_my_profile_edit);


        Intent intent = getIntent();
        api_token = getIntent().getStringExtra("API_TOKEN");
        myProfile = (MyProfile) intent.getSerializableExtra("PROFILE");

        EditText nameUser = (EditText) findViewById(R.id.nameOfUser);
        nameUser.setText(myProfile.getName());

        EditText email = (EditText) findViewById(R.id.email);
        email.setText(myProfile.getEmail());

        EditText fechaNac = (EditText) findViewById(R.id.fechanac);
        fechaNac.setText("Fecha de nac: " + myProfile.getDob());

        EditText ciudad = (EditText) findViewById(R.id.ciudad);
        ciudad.setText(myProfile.getCity());

/*        byte[] decodedString = Base64.decode(myProfile.getProfile_photo(), Base64.URL_SAFE);
        Bitmap decodedByte = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
        Log.d("IMAGE64: ", myProfile.getProfile_photo().toString());
        System.out.print(myProfile.getProfile_photo());
        ImageView mImg;
        mImg = (ImageView) findViewById(R.id.imageView);
        mImg.setImageBitmap();
*/
        ImageView mImg;
        mImg = (ImageView) findViewById(R.id.imageView);
        FirebaseAuth auth = FirebaseAuth.getInstance();
        Picasso.with(this).load(auth.getCurrentUser().getPhotoUrl()).into(mImg);

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

        EditText nameUser = (EditText) findViewById(R.id.nameOfUser);
        myProfile.setName(nameUser.getText().toString());

        EditText email = (EditText) findViewById(R.id.email);
        myProfile.setEmail(email.getText().toString());

        EditText fechaNac = (EditText) findViewById(R.id.fechanac);
        myProfile.setDob(fechaNac.getText().toString());

        EditText ciudad = (EditText) findViewById(R.id.ciudad);
        myProfile.setCity(ciudad.getText().toString());

        HttpRequestTaskSave httpRequestTaskSave= new HttpRequestTaskSave();
        httpRequestTaskSave.execute(myProfile.getName(),myProfile.getEmail(),myProfile.getCity(),myProfile.getDob());
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