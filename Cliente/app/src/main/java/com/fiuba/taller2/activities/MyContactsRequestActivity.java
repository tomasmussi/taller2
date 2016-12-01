package com.fiuba.taller2.activities;

import android.app.SearchManager;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;

import com.fiuba.taller2.R;
import com.fiuba.taller2.adapters.MyContactsAdapter;
import com.fiuba.taller2.adapters.MyContactsRequestAdapter;
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.services.GetContactsServices;
import com.fiuba.taller2.services.SendContactResponseServices;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class MyContactsRequestActivity extends AppCompatActivity {

    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;
    private static String LOG_TAG = "CoursesActivity";
    private  ArrayList<Contact> coursesList;
    private String api_token;
    private String category_name;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_courses);

        //Setteo de titulo de la activity
        this.setTitle("Solicitudes de contacto");
        if (getIntent().getExtras() != null) {
            for (String key : getIntent().getExtras().keySet()) {
                Object value = getIntent().getExtras().get(key);
            }
        }
        Log.d("___CLASE : ",getClass().getSimpleName());
        Log.d("___LAYOUT : ","R.layout.activity_courses");

        Intent intent = getIntent();
        api_token = intent.getStringExtra("API_TOKEN");
        coursesList=(ArrayList<Contact>) intent.getSerializableExtra("CONTACT_LIST");

        mRecyclerView = (RecyclerView) findViewById(R.id.recycler_view_courses);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(this);
        mRecyclerView.setLayoutManager(mLayoutManager);
        if (coursesList != null) {
            mAdapter = new MyContactsRequestAdapter(coursesList,this);
        } else {
            mAdapter = new MyContactsRequestAdapter(new ArrayList<Contact>(),this);
        }
        mRecyclerView.setAdapter(mAdapter);
    }

    public void initContactProfile(String contact_fb_id){

        Intent intent = new Intent(this,ContactProfileActivity.class);
        intent.putExtra("API_TOKEN", api_token);
        intent.putExtra("CONTACT_FB_ID", contact_fb_id);

        startActivity(intent);
    }

    public void initConversation(String contact_fb_id){

        Intent intent = new Intent(this,ConversationActivity.class);
        intent.putExtra("API_TOKEN", api_token);
        intent.putExtra("CONTACT_FB_ID", contact_fb_id);

        startActivity(intent);
    }

    protected  ArrayList<Contact> search(String query) {
        ArrayList<Contact> contactArrayList=null;
        AsyncGetContacts asyncGetContacts = new AsyncGetContacts();

        asyncGetContacts.execute();


        try {
            contactArrayList = (ArrayList<Contact>) asyncGetContacts.get();
            Log.d("Contacts", contactArrayList.toString());
            Log.d("Contacts", contactArrayList.get(0).toString());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        } catch (NullPointerException e) {
            e.printStackTrace();
            contactArrayList = new ArrayList<Contact>();
        }

        return contactArrayList;
   }

    public void acceptContact(String fb_id, String aTrue) {
        //Contesto a la solicitud de tomas con un si, ahora somos contactos el uno del ortro
        AsyncSendContactResponse asyncSendContactResponse = new AsyncSendContactResponse();
        asyncSendContactResponse.execute(fb_id, aTrue);
        try {
            Estado estado = (Estado) asyncSendContactResponse.get();
            if (estado != null) Log.d("Estado", estado.toString());

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
    }

    public void rejectContact(String fb_id, String aTrue) {
        //Contesto a la solicitud de tomas con un si, ahora somos contactos el uno del ortro
        AsyncSendContactResponse asyncSendContactResponse = new AsyncSendContactResponse();
        asyncSendContactResponse.execute(fb_id, aTrue);
        try {
            Estado estado = (Estado) asyncSendContactResponse.get();
            if (estado != null) Log.d("Estado", estado.toString());

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
    }

    public void restart() {
        finish();
        startActivity(getIntent());
    }


    private class AsyncGetContacts extends AsyncTask<String, Void, ArrayList<Contact>> {
        @Override
        protected ArrayList<Contact> doInBackground(String... params) {
            try {

                GetContactsServices getContactsServices = new GetContactsServices();
                getContactsServices.setApi_security(api_token);
                ArrayList<Contact> listContacts = (ArrayList<Contact>) getContactsServices.get();
                return listContacts;
            } catch (Exception e) {
                Log.e("MyContacts", e.getMessage(), e);
            }

            return null;
        }

    }


    private class AsyncSendContactResponse extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String contact_fb_id = params[0];
                String answer = params[1];


                SendContactResponseServices SendContactRequestServices = new SendContactResponseServices();
                SendContactRequestServices.setApi_security(api_token);
                Estado estado = (Estado) SendContactRequestServices.get(contact_fb_id, answer);
                return estado;
            } catch (Exception e) {
                Log.e("RTASolicitudContacto", e.getMessage(), e);
            }

            return null;
        }

    }



}
