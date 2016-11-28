package com.fiuba.taller2.activities;

import android.app.ListActivity;
import android.app.SearchManager;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.widget.ArrayAdapter;

import com.fiuba.taller2.R;
import com.fiuba.taller2.adapters.CoursesAdapter;
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.LDJobPosition;
import com.fiuba.taller2.services.LDJobPositionsServices;
import com.fiuba.taller2.services.LookupServices;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

public class SearchableActivity extends AppCompatActivity {

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

        Intent intent = getIntent();
        api_token = intent.getStringExtra("API_TOKEN");
        if (Intent.ACTION_SEARCH.equals(intent.getAction())) {
            String query = intent.getStringExtra(SearchManager.QUERY);
            coursesList=search(query);
        }
        mRecyclerView = (RecyclerView) findViewById(R.id.recycler_view_courses);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(this);
        mRecyclerView.setLayoutManager(mLayoutManager);
        if (coursesList != null) {
            mAdapter = new CoursesAdapter(coursesList);
        } else {
            mAdapter = new CoursesAdapter(new ArrayList<Contact>());
        }
        mRecyclerView.setAdapter(mAdapter);
    }

    protected  ArrayList<Contact> search(String query) {
        ArrayList<Contact> contactArrayList=null;
        HttpRequestTaskLookup httpRequestTaskLookup = new HttpRequestTaskLookup();
        httpRequestTaskLookup.execute(query);
        try {
            contactArrayList = ( ArrayList<Contact>) httpRequestTaskLookup.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        return contactArrayList;
   }


    private class HttpRequestTaskLookup extends AsyncTask<String, Void, ArrayList<Contact>> {
        @Override
        protected ArrayList<Contact> doInBackground(String... params) {
            try {
                String user = params[0];

                LookupServices lookupServices=new LookupServices();
                lookupServices.setApi_security(api_token);
                ArrayList<Contact> listContacts= (ArrayList<Contact>) lookupServices.get(user);
                return listContacts;
            } catch (Exception e) {
                Log.e("Buscarcontacto", e.getMessage(), e);
            }

            return null;
        }

    }

}
