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
import com.fiuba.taller2.services.ContactProfileServices;
import com.squareup.picasso.Picasso;

import java.util.concurrent.ExecutionException;

public class ContactProfileActivity extends AppCompatActivity {

    private RecyclerView unitsRecyclerView;
    private RecyclerView.Adapter unitsAdapter;
    private RecyclerView.LayoutManager unitsLayoutManager;

    private RecyclerView professorsRecyclerView;
    private RecyclerView.Adapter professorsAdapter;
    private RecyclerView.LayoutManager professorsLayoutManager;

    private static String LOG_TAG = "ContactProfileActivity";
    private String api_token;
    private MyProfile myProfile;
    private String contact_fb_id;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
         super.onCreate(savedInstanceState);

        setContentView(R.layout.material_my_profile);
        Log.d("___CLASE : ",getClass().getSimpleName());
        Log.d("___LAYOUT : ","R.layout.material_my_profile");





        Intent intent = getIntent();
        api_token = getIntent().getStringExtra("API_TOKEN");
        contact_fb_id   = getIntent().getStringExtra("CONTACT_FB_ID");
        HttpRequestTaskMyProfile httpRequestTaskMyProfile = new HttpRequestTaskMyProfile();
        httpRequestTaskMyProfile.execute(contact_fb_id);

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

        ImageView agregarContacto= (ImageView) findViewById(R.id.drop_down_option_menu);
        agregarContacto.setVisibility(View.GONE);


        TextView nameUser = (TextView) findViewById(R.id.user_profile_name);
        nameUser.setText(myProfile.getName());

        TextView email = (TextView) findViewById(R.id.user_profile_email);
        email.setText(email.getText()+myProfile.getEmail());

        TextView fechaNac = (TextView) findViewById(R.id.user_profile_birhdate);
        fechaNac.setText( fechaNac.getText()+myProfile.getDob());

        TextView summary = (TextView) findViewById(R.id.user_profile_summary);
        summary.setText(myProfile.getSummary());


        TextView ciudad = (TextView) findViewById(R.id.user_profile_city);
        ciudad.setText(ciudad.getText()+myProfile.getCity());
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
                    String contact_fb_id= params[0];
                ContactProfileServices ldMyProfileServices= new ContactProfileServices();
                ldMyProfileServices.setApi_security(api_token);
                myProfile =  ldMyProfileServices.get(contact_fb_id);


            } catch (Exception e) {
                Log.e("MyProfileRquest", e.getMessage(), e);
            }

            return myProfile;
        }

    }
}
