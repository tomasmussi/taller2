package com.fiuba.taller2.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import com.example.margonari.taller2_frontend.R;
import com.facebook.login.LoginManager;
import com.fiuba.taller2.adapters.JobsAdapter;
import com.fiuba.taller2.domain.LDJobPosition;

import java.util.ArrayList;

public class JobsListActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener, Spinner.OnItemSelectedListener {

    private Spinner spinnerCoursesType;
    private Intent intent;
    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;
    private static String LOG_TAG = "JobsListActivity";
    private ArrayList<LDJobPosition> ldJobPositionArrayList;
    private String api_token;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_menu);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view_my_courses);
        navigationView.setNavigationItemSelectedListener(this);

        spinnerCoursesType = (Spinner) findViewById(R.id.spinner_type_of_courses);

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.type_of_courses_array, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerCoursesType.setAdapter(adapter);
        spinnerCoursesType.setOnItemSelectedListener(this);


        intent = getIntent();
        ldJobPositionArrayList = (ArrayList<LDJobPosition>)intent.getSerializableExtra("LIST_CATEGORIES");




        api_token = getIntent().getStringExtra("API_TOKEN");
        System.out.println("APITOKEN EN MY COURSES: "+ api_token);

        mRecyclerView = (RecyclerView) findViewById(R.id.recycler_view_my_courses);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(this);
        mRecyclerView.setLayoutManager(mLayoutManager);
        mAdapter = new JobsAdapter(ldJobPositionArrayList);
        mRecyclerView.setAdapter(mAdapter);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.general_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        if (id == R.id.action_search) {
            //TODO
            //onSearchRequested();
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.misContactos) {
            DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
            drawer.closeDrawer(GravityCompat.START);
        } else if (id == R.id.contactosdestacados) {

        } else if (id == R.id.miPerfil) {
            Intent intent = new Intent(this,MainActivity.class);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);
        } else if (id == R.id.notificaciones) {

        } else if (id == R.id.ajustes) {

        } else if (id == R.id.cerrar_sesion) {
            LoginManager.getInstance().logOut();
            goToLoginScreen();
        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int position, long id) {
        switch (position) {
            case 0:
                // CURSOS ACTUALES

                //TODO Pedir la info según lo que corresponda, por el momento en esta solapa poner
                // unicamente lo que devuelva la request de mis cursos, luego agregaremos mas logica
                mAdapter = new JobsAdapter(ldJobPositionArrayList);
                mRecyclerView.setAdapter(mAdapter);
                break;
            case 1:
                // CURSOS FUTUROS
                break;
            case 2:
                // CURSOS PASADOS
        }

    }

    @Override
    public void onNothingSelected(AdapterView<?> adapterView) {

    }

    private void goToLoginScreen() {
        //TODO LOGOUT
    }

    @Override
    protected void onResume() {
        super.onResume();
    }


}
