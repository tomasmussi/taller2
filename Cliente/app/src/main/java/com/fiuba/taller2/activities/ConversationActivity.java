package com.fiuba.taller2.activities;

import android.app.DownloadManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;

import com.fiuba.taller2.R;
import com.fiuba.taller2.adapters.MensajeAdapter;
import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.domain.Mensaje;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.services.ContactProfileServices;
import com.fiuba.taller2.services.GetConversationServices;
import com.fiuba.taller2.services.LDMyProfileServices;
import com.fiuba.taller2.services.SendMesaggeServices;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

/**
 * Created by luis on 24/11/16.
 */

public class ConversationActivity  extends AppCompatActivity {

    public static final String API_TOKEN = "API_TOKEN";
    public static final String CONTACT_FB_ID = "CONTACT_FB_ID";

    private String api_token;
    private String contactFbId;

    private RecyclerView mensajesRecyclerView;
    private RecyclerView.LayoutManager mensajesLayoutManager;
    private RecyclerView.Adapter mensajesAdapter;
    private ArrayList<Mensaje> mensajeArrayList;
    private ImageButton buttonNewPost;
    private ArrayList<Mensaje> forum_list_attached_files;
    private EditText textPost;
    private DownloadManager downloadManager;
    public String filenameManager;
    private long q;
    private MyProfile user_profile;
    private MyProfile contact_profile;
    private LinearLayoutManager mLinearLayoutManager;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_course_forum_thread_posts);
        Log.d("___CLASE : ",getClass().getSimpleName());
        Log.d("___LAYOUT : ","R.layout.activity_my_course_forum_thread_posts");



        api_token = getIntent().getStringExtra(API_TOKEN);
        contactFbId = getIntent().getStringExtra(CONTACT_FB_ID);



        HttpRequestTaskMyProfile httpRequestTaskMyProfile = new HttpRequestTaskMyProfile();
        httpRequestTaskMyProfile.execute();

        try {
            user_profile= httpRequestTaskMyProfile.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        HttpRequestContactProfile httpRequestContactProfile = new HttpRequestContactProfile();
        httpRequestContactProfile.execute(contactFbId);

        try {
            contact_profile= httpRequestContactProfile.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
       // this.setTitle(thread_name);

        textPost = (EditText) findViewById(R.id.text_forum_post);
        mensajesRecyclerView = (RecyclerView) findViewById(R.id.recycler_view_my_course_forum_posts);
        mensajesRecyclerView.setHasFixedSize(true);
        mensajesLayoutManager = new LinearLayoutManager(this);
        mensajesRecyclerView.setLayoutManager(mensajesLayoutManager);
        mensajesRecyclerView.setFocusable(false);
        mensajeArrayList = getDataSetMensajes();
        mensajesAdapter = new MensajeAdapter(mensajeArrayList,ConversationActivity.this);

        mensajesRecyclerView.setAdapter(mensajesAdapter);
        mensajesRecyclerView.scrollToPosition(mensajesAdapter.getItemCount()-1);
        buttonNewPost = (ImageButton) findViewById(R.id.button_new_post);
        buttonNewPost.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //TODO Communication to make POST
                String content = textPost.getText().toString();
                HttpRequestTaskForumMakePost httpRequestTaskForumMakePost= new HttpRequestTaskForumMakePost();
                httpRequestTaskForumMakePost.execute(contactFbId,content);
                finish();
                startActivity(getIntent());
            }
        });



    }





    private ArrayList<Mensaje> getDataSetMensajes() {

        AsyncGetConversation asyncGetConversation = new AsyncGetConversation();
        asyncGetConversation.execute(contactFbId,contact_profile.getName(),contact_profile.getProfile_photo(),user_profile.getName(),user_profile.getProfile_photo());
        ArrayList<Mensaje> casyncGetConversationArrayList=new ArrayList<>();
        try {
            casyncGetConversationArrayList = ( ArrayList<Mensaje>) asyncGetConversation.get();
            if(casyncGetConversationArrayList!=null)  Log.d("ConversartionList", casyncGetConversationArrayList.toString());

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        return casyncGetConversationArrayList;
    }


    private class AsyncGetConversation extends AsyncTask<String, Void, ArrayList<Mensaje>> {
        ArrayList<Mensaje> mensajeArrayList;
        @Override
        protected ArrayList<Mensaje> doInBackground(String... params) {
            try {
                String contact_fb_id = params[0];
                String sender_name = params[1];
                String sender_photo = params[2];
                String reciver_name=params[3];
                String reciver_photo=params[4];



                GetConversationServices getConversationServices=new GetConversationServices();
                getConversationServices.setApi_security(api_token);
                mensajeArrayList= (ArrayList<Mensaje>) getConversationServices.get(contact_fb_id);

                for(Mensaje mensaje:mensajeArrayList){
                    if(mensaje.getSender_id().equals(contact_fb_id))mensaje.setSender_photo(sender_photo);
                    else{mensaje.setSender_photo(reciver_photo);}
                    if(mensaje.getSender_id().equals(contact_fb_id))mensaje.setSender_name(sender_name);
                    else{mensaje.setSender_name(reciver_name);}

                }
                return mensajeArrayList;
            } catch (Exception e) {
                Log.e("GetConversacion", e.getMessage(), e);
            }

            return null;
        }

    }


    private class HttpRequestTaskForumMakePost extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String contact_fb_id = params[0];
                String mesagge =params[1];

                SendMesaggeServices sendMesaggeServices=new SendMesaggeServices();
                sendMesaggeServices.setApi_security(api_token);
                Estado estado= (Estado) sendMesaggeServices.get(contact_fb_id,mesagge);
                return estado;
            } catch (Exception e) {
                Log.e("SendMesagge", e.getMessage(), e);
            }

            return null;
        }

    }

    class HttpRequestContactProfile extends AsyncTask<String, Void,MyProfile> {

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
