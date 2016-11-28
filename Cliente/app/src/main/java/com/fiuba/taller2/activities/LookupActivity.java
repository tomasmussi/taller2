package com.fiuba.taller2.activities;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import com.firebase.ui.auth.AuthUI;
import com.fiuba.taller2.R;
import com.fiuba.taller2.adapters.LookupAdapter;
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.Login;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.services.LDMyProfileServices;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

import static com.firebase.ui.auth.ui.AcquireEmailHelper.RC_SIGN_IN;

/**
 * Created by luis on 25/11/16.
 */
public class LookupActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener ,  Spinner.OnItemSelectedListener {

        private Spinner spinnerCoursesType;
        private Intent intent;
        private RecyclerView mRecyclerView;
        private RecyclerView.Adapter mAdapter;
        private RecyclerView.LayoutManager mLayoutManager;
        private static String LOG_TAG = "MyCoursesActivity";
        private ArrayList<Contact> coursesList;
        private String api_token;

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_my_courses);
            Log.d("___CLASE : ",getClass().getSimpleName());
            Log.d("___LAYOUT : ","R.layout.activity_my_courses");



            Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
            setSupportActionBar(toolbar);
            DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
            ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                    this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
            drawer.setDrawerListener(toggle);
            toggle.syncState();

            NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view_my_courses);
            navigationView.setNavigationItemSelectedListener(this);

           // spinnerCoursesType = (Spinner) findViewById(R.id.spinner_type_of_courses);

            ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                    R.array.type_of_courses_array, android.R.layout.simple_spinner_item);
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
            spinnerCoursesType.setAdapter(adapter);
            spinnerCoursesType.setOnItemSelectedListener(this);


            intent = getIntent();
            coursesList= (ArrayList<Contact>)intent.getSerializableExtra("LIST_CONTACTS");




            api_token = getIntent().getStringExtra("API_TOKEN");
            System.out.println("APITOKEN EN MY COURSES: "+ api_token);

           // mRecyclerView = (RecyclerView) findViewById(R.id.recycler_view_my_courses);
            mRecyclerView.setHasFixedSize(true);
            mLayoutManager = new LinearLayoutManager(this);
            mRecyclerView.setLayoutManager(mLayoutManager);
            mAdapter = new LookupAdapter(coursesList);
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

                Login loginTest;
            }  else if (id == R.id.contactosdestacados) {



            } else if (id == R.id.miPerfil) {
                HttpRequestTaskMyProfile httpRequestTaskMyProfile = new HttpRequestTaskMyProfile();
                httpRequestTaskMyProfile.execute();
                MyProfile myProfile= new MyProfile();
                try {
                    myProfile= httpRequestTaskMyProfile.get();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (ExecutionException e) {
                    e.printStackTrace();
                }
                Intent intent = new Intent(this,MyProfileActivity.class);
                intent.putExtra("PROFILE", myProfile);
                intent.putExtra("API_TOKEN", api_token);
                startActivity(intent);
            } else if (id == R.id.notificaciones) {

            } else if (id == R.id.ajustes) {

            } else if (id == R.id.cerrar_sesion) {
                AuthUI.getInstance().signOut(this).addOnCompleteListener(new OnCompleteListener<Void>() {
                    @Override
                    public void onComplete(@NonNull Task<Void> task) {
                        Log.d("AUTH", "User LOGGED OUT");
                        startActivityForResult(AuthUI.getInstance()

                                .createSignInIntentBuilder().setIsSmartLockEnabled(false).
                                        setProviders(
                                                AuthUI.FACEBOOK_PROVIDER,
                                                AuthUI.GOOGLE_PROVIDER
                                        ).build(),RC_SIGN_IN);
                    }
                });

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
                    mAdapter = new LookupAdapter(coursesList);
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



        @Override
        protected void onResume() {
            super.onResume();
            ((LookupAdapter) mAdapter).setOnItemClickListener(new LookupAdapter
                    .MyClickListener() {
                @Override
                public void onItemClick(int position, View v) {/*
                    Course course = coursesList.get(position);

                    HttpRequestTask httpRequestTask= new HttpRequestTask();
                    httpRequestTask.execute(course.getId());
                    try {
                        Course coursefulldata= (Course)httpRequestTask.get();
                        coursefulldata.setSession_id(course.getSession_id());
                        Intent intent = new Intent(MyCoursesActivity.this, MyCourseParentActivity.class);
                        intent.putExtra("API_TOKEN", api_token);
                        intent.putExtra("COURSE_FULL_DATA", coursefulldata);
                        startActivity( intent);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    } catch (ExecutionException e) {
                        e.printStackTrace();
                    }
                    Log.i(LOG_TAG, " Clicked on Item " + position);*/
                }
            });
        }

        private class HttpRequestTask extends AsyncTask<String, Void, Contact> {
            @Override
            protected Contact doInBackground(String... params) {
               /* try {
                    String course_id = params[0];
                    CourseFullDataServices courseFullDataServices= new CourseFullDataServices();
                    courseFullDataServices.setApi_security(api_token);
                    return courseFullDataServices.getCourseBy(course_id);

                } catch (Exception e) {
                    Log.e("CourseAcivity", e.getMessage(), e);
                }*/

                return null;
            }


        }

    private class HttpRequestTaskMyProfile extends AsyncTask<String, Void,MyProfile> {

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



