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
import com.fiuba.taller2.services.SaveProfileServices;
import com.google.firebase.auth.FirebaseAuth;
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

        setContentView(R.layout.material_design_profile_screen_xml_ui_design);

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

        /*TextView ciudad = (TextView) findViewById(R.id.ciudad);
        ciudad.setText(myProfile.getCity());*/

/*        byte[] decodedString = Base64.decode(myProfile.getProfile_photo(), Base64.URL_SAFE);
        Bitmap decodedByte = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
        Log.d("IMAGE64: ", myProfile.getProfile_photo().toString());
        System.out.print(myProfile.getProfile_photo());
        ImageView mImg;
        mImg = (ImageView) findViewById(R.id.imageView);
        mImg.setImageBitmap();
*/
        /*ImageView mImg;
        mImg = (ImageView) findViewById(R.id.imageView);
        FirebaseAuth auth = FirebaseAuth.getInstance();
        Picasso.with(this).load( auth.getCurrentUser().getPhotoUrl()).into(mImg);*/


    }

    private class HttpRequestTask extends AsyncTask<String, Void, Boolean> {
        Boolean result;
        @Override
        protected Boolean doInBackground(String... params) {
            try {
                String sessionId = params[0];


                SaveProfileServices saveProfileServices =new SaveProfileServices();
                saveProfileServices.setApi_security(api_token);
                 boolean ifExistsErrors=  saveProfileServices.ifExistsErrors(sessionId);
                 result= new Boolean( ifExistsErrors );

            } catch (Exception e) {
                Log.e("MyProfileActivity", e.getMessage(), e);
            }

            return result;
        }

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
