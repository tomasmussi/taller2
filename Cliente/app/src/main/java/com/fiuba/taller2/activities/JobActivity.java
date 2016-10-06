package com.fiuba.taller2.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import com.example.margonari.tdp2_frontend.R;
import com.fiuba.taller2.domain.Job;

public class JobActivity extends AppCompatActivity {

    private RecyclerView unitsRecyclerView;
    private RecyclerView.LayoutManager unitsLayoutManager;
    private RecyclerView.Adapter unitsAdapter;
    private String api_token;
    private Job jobFullData;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_course);
        Intent intent = getIntent();

        api_token = getIntent().getStringExtra("API_TOKEN");
        jobFullData = (Job)intent.getSerializableExtra("COURSE_FULL_DATA");

        unitsRecyclerView = (RecyclerView) findViewById(R.id.recycler_view_my_course_units);
        unitsRecyclerView.setHasFixedSize(true);
        unitsLayoutManager = new LinearLayoutManager(this);
        unitsRecyclerView.setLayoutManager(unitsLayoutManager);
        unitsRecyclerView.setFocusable(false);
        //unitsAdapter = new MyCourseUnitAdapter(getDataSetUnits());
        //unitsRecyclerView.setAdapter(unitsAdapter);

    }

}
