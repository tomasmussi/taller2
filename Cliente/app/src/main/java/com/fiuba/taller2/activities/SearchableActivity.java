package com.fiuba.taller2.activities;

import android.app.ListActivity;
import android.app.SearchManager;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;

import com.example.margonari.tdp2_frontend.R;
import com.fiuba.taller2.domain.LDJobPosition;
import com.fiuba.taller2.services.LDJobPositionsServices;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;


public class SearchableActivity extends ListActivity {

    private String api_token;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_searchable);

        // Get the intent, verify the action and get the query
        Intent intent = getIntent();
        api_token = intent.getStringExtra("API_TOKEN");
        System.out.println("APITOKEN SEARCHABLE: " + api_token);
        if (Intent.ACTION_SEARCH.equals(intent.getAction())) {
            String query = intent.getStringExtra(SearchManager.QUERY);
            search(query);
        }
    }

    protected void search(String query) {

        HttpRequestTask httpRequestTask = new HttpRequestTask();
        httpRequestTask.execute(query, api_token);

        ArrayList<String>  values = null;
        try {
            List<LDJobPosition> jobList = httpRequestTask.get();
            values = getValuesFromListCourse(jobList);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        /*String[] values = new String[] { "Android", "iPhone", "WindowsMobile",
                "Blackberry", "WebOS", "Ubuntu", "Windows7", "Max OS X",
                "Linux", "OS/2" };*/
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, values);
        setListAdapter(adapter);
    }

    private ArrayList<String> getValuesFromListCourse(List<LDJobPosition> jobList) {
        ArrayList<String> coursesNames = new ArrayList<>();
        for (LDJobPosition job : jobList) {
            coursesNames.add(job.getName());

        }

        return coursesNames;
    }

    private class HttpRequestTask extends AsyncTask<String, Void, List<LDJobPosition>> {
        @Override
        protected ArrayList<LDJobPosition> doInBackground(String... params) {
            try {
                String user = params[0];
                LDJobPositionsServices listCourseServices= new LDJobPositionsServices();
                listCourseServices.setApi_security(api_token);
                return listCourseServices.getListCourses().getJobPositions();

            } catch (Exception e) {
                Log.e("SearcheableAcivity", e.getMessage(), e);
            }

            return null;
        }


    }


}
