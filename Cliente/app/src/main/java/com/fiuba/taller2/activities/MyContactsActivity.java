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
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.services.GetContactsServices;
import com.fiuba.taller2.services.LookupServices;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class MyContactsActivity extends AppCompatActivity {

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
        Log.d("___CLASE : ",getClass().getSimpleName());
        Log.d("___LAYOUT : ","R.layout.activity_courses");

        Intent intent = getIntent();
        api_token = intent.getStringExtra("API_TOKEN");
            String query = intent.getStringExtra(SearchManager.QUERY);
            coursesList=search(query);
        mRecyclerView = (RecyclerView) findViewById(R.id.recycler_view_courses);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(this);
        mRecyclerView.setLayoutManager(mLayoutManager);
        if (coursesList != null) {
            mAdapter = new MyContactsAdapter(coursesList,this);
        } else {
            mAdapter = new MyContactsAdapter(new ArrayList<Contact>(),this);
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



}
