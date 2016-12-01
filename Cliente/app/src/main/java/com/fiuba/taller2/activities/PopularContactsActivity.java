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
import com.fiuba.taller2.adapters.PopularContactsAdapter;
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.services.GetContactsServices;
import com.fiuba.taller2.services.VoteServices;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class PopularContactsActivity extends AppCompatActivity {

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
        coursesList=(ArrayList<Contact>) intent.getSerializableExtra("CONTACT_LIST");

        mRecyclerView = (RecyclerView) findViewById(R.id.recycler_view_courses);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(this);
        mRecyclerView.setLayoutManager(mLayoutManager);
        if (coursesList != null) {
            mAdapter = new PopularContactsAdapter(coursesList,this);
        } else {
            mAdapter = new PopularContactsAdapter(new ArrayList<Contact>(),this);
        }
        mRecyclerView.setAdapter(mAdapter);
    }


    public void voteContact(String fb_id, String aTrue) {

        AsyncVoteRequest asyncVoteRequest = new AsyncVoteRequest();
        asyncVoteRequest.execute(fb_id);
        try {
            Estado estado = (Estado) asyncVoteRequest.get();
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

    private class AsyncVoteRequest extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String contact_fb_id = params[0];

                VoteServices voteServices = new VoteServices();
                voteServices.setApi_security(api_token);
                Estado estado = (Estado) voteServices.get(contact_fb_id);
                return estado;
            } catch (Exception e) {
                Log.e("Vote", e.getMessage(), e);
            }

            return null;
        }

    }
}
