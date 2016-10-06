package com.fiuba.taller2.activities;

import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.example.margonari.tdp2_frontend.R;
import com.firebase.ui.auth.AuthUI;
import com.fiuba.taller2.adapters.ImageAdapter;
import com.fiuba.taller2.domain.Categoria;
import com.fiuba.taller2.domain.CatogoryLN;
import com.fiuba.taller2.domain.LDJobPosition;
import com.fiuba.taller2.domain.Login;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.services.LDCategoriesServices;
import com.fiuba.taller2.services.LDJobPositionsServices;
import com.fiuba.taller2.services.LDMyProfileServices;
import com.fiuba.taller2.services.LoginServices;
import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener, AdapterView.OnItemClickListener {

    private static final String TAG = "MainActivity";
    private static final int RC_SIGN_IN = 0;

    private GridView grillaOpciones;
    private ImageAdapter adapterCategorias;
    private String  api_token;
    private String userEmail;
    private String firstName;
    private String lastName;
    private String profilePicture;
    private FirebaseAuth auth;
    private GoogleApiClient client;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        auth = FirebaseAuth.getInstance();
        if ( auth.getCurrentUser()!=null){
            Log.d("AUTH", "User LOGGED IN");
            userEmail=auth.getCurrentUser().getEmail();
            firstName=auth.getCurrentUser().getDisplayName();
            Log.d("hola",auth.getCurrentUser().getProviders().toString());
            auth.getCurrentUser().getProviderData();
            profilePicture= auth.getCurrentUser().getPhotoUrl().toString();
            InitApiTokenFromServer(userEmail);
        }else{
            startActivityForResult(AuthUI.getInstance().createSignInIntentBuilder().setProviders(
                    AuthUI.FACEBOOK_PROVIDER,
                    AuthUI.GOOGLE_PROVIDER
            ).build(),RC_SIGN_IN);
        }

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view_main);
        navigationView.setNavigationItemSelectedListener(this);
        View headerView = navigationView.getHeaderView(0);

        TextView userNameText = (TextView) headerView.findViewById(R.id.user_name);
        TextView emailText = (TextView) headerView.findViewById(R.id.user_email);
        ImageView imageProfile = (ImageView) headerView.findViewById(R.id.profile_picture);
        userNameText.setText(firstName + " " + lastName);
        emailText.setText(userEmail);
        Glide.with(this).load(profilePicture).diskCacheStrategy(DiskCacheStrategy.SOURCE).into(imageProfile);

        grillaOpciones = (GridView) findViewById(R.id.grilla_categorias);
        adapterCategorias = new ImageAdapter(this);
        grillaOpciones.setAdapter(adapterCategorias);
        grillaOpciones.setOnItemClickListener(this);

        client = new GoogleApiClient.Builder(this).addApi(AppIndex.API).build();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data){
        super.onActivityResult(requestCode,resultCode,data);
        if( requestCode == RC_SIGN_IN){
                if ( resultCode== RESULT_OK){
                    Log.d("AUTH",auth.getCurrentUser().getEmail());
                    Log.d("hola",auth.getCurrentUser().getProviders().toString());

                    InitApiTokenFromServer(auth.getCurrentUser().getEmail());
                    userEmail=auth.getCurrentUser().getEmail();
                    firstName=auth.getCurrentUser().getDisplayName();
                    profilePicture= auth.getCurrentUser().getPhotoUrl().toString();
                }
        }else{Log.d("AUTH","User not autenticated");}
    }

    private void InitApiTokenFromServer(String userEmail) {
        HttpRequestTaskLogin httpRequestTask = new HttpRequestTaskLogin();

        httpRequestTask.execute(userEmail);
        try {
            Login login = (Login) httpRequestTask.get();
            api_token=login.getToken();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
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
        getMenuInflater().inflate(R.menu.general_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_search) {
            onSearchRequested();
        }
        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.misContactos) {

        } else if (id == R.id.contactosdestacados) {

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
                    startActivityForResult(AuthUI.getInstance().createSignInIntentBuilder().setProviders(
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
    public void onStart() {
        super.onStart();
        client.connect();
        Action viewAction = Action.newAction(
                Action.TYPE_VIEW,
                "Main Page",
                 Uri.parse("http://host/path"),
                Uri.parse("android-app://com.fiuba.taller2/http/host/path")
        );
        AppIndex.AppIndexApi.start(client, viewAction);
    }

    @Override
    public void onStop() {
        super.onStop();
        Action viewAction = Action.newAction(
                Action.TYPE_VIEW,
                "Main Page",
                Uri.parse("http://host/path"),
                Uri.parse("android-app://com.fiuba.taller2/http/host/path")
        );
        AppIndex.AppIndexApi.end(client, viewAction);
        client.disconnect();
    }

    private void goToLoginScreen() {
        //TODO LOGOUT
    }

    public void startActivity(Intent intent) {
        // check if search intent
        if (Intent.ACTION_SEARCH.equals(intent.getAction())) {
            intent.putExtra("API_TOKEN", api_token);
        }

        super.startActivity(intent);
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        Categoria item = (Categoria) parent.getItemAtPosition(position);
        int item_id = Categoria.getCategoryByIdView(item.getId());
        String category_name = item.getName();

        if (item_id == 5) {
            HttpRequestTask httpRequestTaskJobs = new HttpRequestTask();
            httpRequestTaskJobs.execute();
            ArrayList<CatogoryLN> listJobs = new ArrayList<>();
            try {
                listJobs = httpRequestTaskJobs.get();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
            Intent intent = new Intent(this, CategoriesActivity.class);
            intent.putExtra("LIST_CATEGORIES", listJobs);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);
        }
        if(item_id==4){
            HttpRequestTaskJobs httpRequestTaskJobs = new HttpRequestTaskJobs();
            httpRequestTaskJobs.execute();
            ArrayList<LDJobPosition> listJobs = new ArrayList<>();
            try {
                listJobs = httpRequestTaskJobs.get();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
            Intent intent = new Intent(this, JobsListActivity.class);
            intent.putExtra("LIST_CATEGORIES", listJobs);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);
        }


    }

    class HttpRequestTask extends AsyncTask<String, Void, ArrayList<CatogoryLN>> {
        @Override
        protected ArrayList<CatogoryLN> doInBackground(String... params) {
            try {
                LDCategoriesServices listCoursesByCategoriesServices= new LDCategoriesServices();
                listCoursesByCategoriesServices.setApi_security(api_token);
                ArrayList<CatogoryLN>  listCourses= (ArrayList<CatogoryLN>) listCoursesByCategoriesServices.getListCourses().getCategories();

                return listCourses;
            } catch (Exception e) {
                Log.e("ListCoursesByCategories", e.getMessage(), e);
            }

            return null;
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


    private class HttpRequestTaskLogin extends AsyncTask<String, Void, Login> {
        @Override
        protected Login doInBackground(String... params) {
            try {
                String user = params[0];
                Login login=  new LoginServices().getLoginBy(user);
                Log.d("Login Token:", login.getToken());
                return login;
            } catch (Exception e) {
                Log.e("LoginActivity", e.getMessage(), e);
            }

            return null;
        }

    }



    private class HttpRequestTaskJobs extends AsyncTask<String, Void, ArrayList<LDJobPosition>> {
        @Override
        protected ArrayList<LDJobPosition> doInBackground(String... params) {
            try {
                //String user = params[0];

                LDJobPositionsServices ldJobPositionsServices=new LDJobPositionsServices();
                ldJobPositionsServices.setApi_security(api_token);
                ArrayList<LDJobPosition> listJobs= (ArrayList<LDJobPosition>) ldJobPositionsServices.getListCourses().getJobPositions();
                Log.d("Primer Trabajo:", listJobs.get(0).getName());
                return listJobs;
            } catch (Exception e) {
                Log.e("LoginActivity", e.getMessage(), e);
            }

            return null;
        }

    }
}
