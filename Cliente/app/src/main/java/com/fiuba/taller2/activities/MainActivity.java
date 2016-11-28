package com.fiuba.taller2.activities;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.v4.app.ActivityCompat;
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
import com.fiuba.taller2.R;
import com.firebase.ui.auth.AuthUI;
import com.fiuba.taller2.adapters.ImageAdapter;
import com.fiuba.taller2.domain.Categoria;
import com.fiuba.taller2.domain.CatogoryLN;
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.domain.LDJobPosition;
import com.fiuba.taller2.domain.Login;
import com.fiuba.taller2.domain.Mensaje;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.services.GetContactsRequestServices;
import com.fiuba.taller2.services.GetContactsServices;
import com.fiuba.taller2.services.GetConversationServices;
import com.fiuba.taller2.services.GetPopularServices;
import com.fiuba.taller2.services.LDCategoriesServices;
import com.fiuba.taller2.services.LDJobPositionsServices;
import com.fiuba.taller2.services.LDMyProfileServices;
import com.fiuba.taller2.services.LoginServices;
import com.fiuba.taller2.services.LookupServices;
import com.fiuba.taller2.services.RegisterPushIdServices;
import com.fiuba.taller2.services.SendContactRequestServices;
import com.fiuba.taller2.services.SendContactResponseServices;
import com.fiuba.taller2.services.SendMesaggeServices;
import com.fiuba.taller2.services.SetLocationServices;
import com.fiuba.taller2.services.VoteServices;
import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.iid.FirebaseInstanceId;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener, AdapterView.OnItemClickListener {

    private static final String TAG = "MainActivity";
    private static final int RC_SIGN_IN = 0;

    private GridView grillaOpciones;
    private ImageAdapter adapterCategorias;
    private String api_token;
    private String userEmail;
    private String firstName;
    private String lastName;
    private String profilePicture;
    private FirebaseAuth auth;
    private GoogleApiClient client;
    private double longitude;
    private double latitude;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        auth = FirebaseAuth.getInstance();
        if (auth.getCurrentUser() != null) {
            Log.d("AUTH", "User LOGGED IN");
            userEmail = auth.getCurrentUser().getEmail();
            firstName = auth.getCurrentUser().getDisplayName();
            Log.d("hola", auth.getCurrentUser().getProviders().toString());
            auth.getCurrentUser().getProviderData();
            profilePicture = auth.getCurrentUser().getPhotoUrl().toString();
            InitApiTokenFromServer(userEmail);
        } else {
            startActivityForResult(AuthUI.getInstance()
                    .createSignInIntentBuilder().setIsSmartLockEnabled(false).
                            setProviders(
                                    AuthUI.FACEBOOK_PROVIDER,
                                    AuthUI.GOOGLE_PROVIDER
                            ).build(), RC_SIGN_IN);
        }

        LocationManager lm = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return;
        }else {
            /*Location location = lm.getLastKnownLocation(LocationManager.GPS_PROVIDER);
            if(location!=null)
            Log.d("Location: ", location.toString());

            longitude = location.getLongitude();
            latitude = location.getLatitude();*/
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
                    Log.d("NOMBRE DEL WACHIN", firstName);
                    profilePicture= auth.getCurrentUser().getPhotoUrl().toString();
                }
        }else{Log.d("AUTH","User not autenticated");}
    }

    private void InitApiTokenFromServer(String userEmail) {
        HttpRequestTaskLogin httpRequestTask = new HttpRequestTaskLogin();

        httpRequestTask.execute(userEmail);
        Login login=null;
        try {
             login = (Login) httpRequestTask.get();

            api_token=login.getToken();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

            //Registro el push_id
        AsyncRegister asyncRegister = new AsyncRegister();
       if(login!=null) asyncRegister.execute(this.userEmail, FirebaseInstanceId.getInstance().getToken());
        Estado estado;
        try {
            estado = ( Estado) asyncRegister.get();
            if(estado!=null)  Log.d("PUSH_ID", estado.toString());

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }


        AsyncSetLocation asyncSetLocation = new AsyncSetLocation();

        asyncSetLocation.execute(String.valueOf(latitude),String.valueOf(longitude));
        try {
            Estado estado_location = (Estado) asyncSetLocation.get();
            Log.d("Estado", estado_location.toString());

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

            Login loginTest;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


            //Envio mensaje a tomas
            AsyncSendMesagge asyncSendMesagge = new AsyncSendMesagge();
            asyncSendMesagge.execute("tomas","Hola Tomas, como estas?");
            try {
                Estado estado = ( Estado) asyncSendMesagge.get();
                if(estado!=null)  Log.d("ConversartionList", estado.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }

            //Me logueo como tomas
            HttpRequestTaskLogin httpRequestTask = new HttpRequestTaskLogin();

            httpRequestTask.execute("tomas");
            try {
                loginTest = (Login) httpRequestTask.get();
                Log.d("Login", loginTest.toString());
                api_token=loginTest.getToken();

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }



            //Envio mensaje a tomas
            AsyncSendMesagge asyncSendMesagge2 = new AsyncSendMesagge();
            asyncSendMesagge2.execute("aran.com.ar@gmail.com","Hola Luis, como estas?");
            try {
                Estado estado2 = ( Estado) asyncSendMesagge2.get();
                if(estado2!=null)  Log.d("ConversartionList", estado2.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }

            //Busco a tomas siendo tomas
            HttpRequestTaskLookup httpRequestTaskLookup = new HttpRequestTaskLookup();

            httpRequestTaskLookup.execute("tomas");
            try {
                ArrayList<Contact> contactArrayList = ( ArrayList<Contact>) httpRequestTaskLookup.get();
                Log.d("Contacts", contactArrayList.toString());
                Log.d("Contacts", contactArrayList.get(0).toString());
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }



            //Seteo localizacion para tomas
            AsyncSetLocation asyncSetLocation = new AsyncSetLocation();

            asyncSetLocation.execute("-34.595241","-58.402460");
            try {
                Estado estado = (Estado) asyncSetLocation.get();
                Log.d("Estado", estado.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }



            //Obtengo lista de contactos de tomas
            AsyncGetContacts asyncGetContacts = new AsyncGetContacts();

            asyncGetContacts.execute();
            ArrayList<Contact> contactArrayList;

            try {
                contactArrayList = ( ArrayList<Contact>) asyncGetContacts.get();
                Log.d("Contacts", contactArrayList.toString());
                Log.d("Contacts", contactArrayList.get(0).toString());
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
             catch (NullPointerException e) {
                e.printStackTrace();
                 contactArrayList= new ArrayList<Contact>();
        }


            //Envio solicitud de contacto a Luis
        AsyncSendContactRequest asyncSendContactRequest = new AsyncSendContactRequest();

            asyncSendContactRequest.execute("aran.com.ar@gmail.com");

            try {
                Estado estado = (Estado) asyncSendContactRequest.get();
              if(estado!=null)  Log.d("Estado", estado.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }


            //Me logueo como Luis
            HttpRequestTaskLogin httpRequestTask2 = new HttpRequestTaskLogin();

            httpRequestTask2.execute("aran.com.ar@gmail.com");
            try {
                loginTest = (Login) httpRequestTask2.get();
                Log.d("Login", loginTest.toString());
                api_token=loginTest.getToken();

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }

            //Obtengo lista de solicitudes de contactos de Luis
            AsyncGetContactsRequest asyncGetContactsRequest = new AsyncGetContactsRequest();
            asyncGetContactsRequest.execute();
            ArrayList<Contact> contacRequesttArrayList;
            try {
                contacRequesttArrayList = ( ArrayList<Contact>) asyncGetContactsRequest.get();
                Log.d("Contacts", contacRequesttArrayList.toString());
                Log.d("Contacts", contacRequesttArrayList.get(0).toString());
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
            catch (NullPointerException e) {
                e.printStackTrace();
                contacRequesttArrayList= new ArrayList<Contact>();
            }

            //Contesto a la solicitud de tomas con un si, ahora somos contactos el uno del ortro
            AsyncSendContactResponse asyncSendContactResponse = new AsyncSendContactResponse();
            asyncSendContactResponse.execute("tomas","true");
            try {
                Estado estado = (Estado) asyncSendContactResponse.get();
                if(estado!=null)  Log.d("Estado", estado.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }


            //Como Luis, voto por tomas
            AsyncVoteRequest asyncVoteRequest = new AsyncVoteRequest();
            asyncVoteRequest.execute("tomas");
            try {
                Estado estado = (Estado) asyncVoteRequest.get();
                if(estado!=null)  Log.d("Estado", estado.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }



            //Consulto los mas populares
            AsyncGetPopularRequest asyncGetPopularRequest = new AsyncGetPopularRequest();
            asyncGetPopularRequest.execute();
            ArrayList<Contact> contacPupularRequesttArrayList;
            try {
                contacPupularRequesttArrayList = ( ArrayList<Contact>) asyncGetPopularRequest.get();
                if(contacPupularRequesttArrayList!=null)  Log.d("Estado", contacPupularRequesttArrayList.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }



            //Como Luis me fijo que estado tiene la conversacion con tomas
            AsyncGetConversation asyncGetConversation = new AsyncGetConversation();
            asyncGetConversation.execute("tomas");
            ArrayList<Mensaje> casyncGetConversationArrayList;
            try {
                casyncGetConversationArrayList = ( ArrayList<Mensaje>) asyncGetConversation.get();
                if(casyncGetConversationArrayList!=null)  Log.d("ConversartionList", casyncGetConversationArrayList.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }






            Intent intent = new Intent(this,ConversationActivity.class);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        } else if (id == R.id.contactosdestacados) {

            Intent intent = new Intent(this,MyProfileActivity.class);
            intent.putExtra("API_TOKEN", api_token);

            startActivity(intent);


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
            Intent intent = new Intent(this, MainActivity.class);
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
    private class AsyncSetLocation extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String latitude =params[0];
                String longitude=params[1];

                SetLocationServices setLocationServices=new SetLocationServices();
                setLocationServices.setApi_security(api_token);
                Estado estado_response = (Estado) setLocationServices.get(latitude,longitude);
                return estado_response;
            } catch (Exception e) {
                Log.e("AsyncSetLocation", e.getMessage(), e);
            }

            return null;
        }

    }



    private class AsyncGetContacts extends AsyncTask<String, Void, ArrayList<Contact>> {
        @Override
        protected ArrayList<Contact> doInBackground(String... params) {
            try {

                GetContactsServices getContactsServices=new GetContactsServices();
                getContactsServices.setApi_security(api_token);
                ArrayList<Contact> listContacts= (ArrayList<Contact>) getContactsServices.get();
                return listContacts;
            } catch (Exception e) {
                Log.e("LookUp", e.getMessage(), e);
            }

            return null;
        }

    }

    private class AsyncGetContactsRequest extends AsyncTask<String, Void, ArrayList<Contact>> {
        @Override
        protected ArrayList<Contact> doInBackground(String... params) {
            try {

                GetContactsRequestServices getContactsServices=new GetContactsRequestServices();
                getContactsServices.setApi_security(api_token);
                ArrayList<Contact> listContacts= (ArrayList<Contact>) getContactsServices.get();
                return listContacts;
            } catch (Exception e) {
                Log.e("GetContactsRequestServ", e.getMessage(), e);
            }

            return null;
        }

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

    private class AsyncSendContactRequest extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String contact_fb_id = params[0];

                SendContactRequestServices SendContactRequestServices=new SendContactRequestServices();
                SendContactRequestServices.setApi_security(api_token);
                Estado estado= (Estado) SendContactRequestServices.get(contact_fb_id);
                return estado;
            } catch (Exception e) {
                Log.e("SendSolicitudContact", e.getMessage(), e);
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


                SendContactResponseServices SendContactRequestServices=new SendContactResponseServices();
                SendContactRequestServices.setApi_security(api_token);
                Estado estado= (Estado) SendContactRequestServices.get(contact_fb_id, answer);
                return estado;
            } catch (Exception e) {
                Log.e("RTASolicitudContacto", e.getMessage(), e);
            }

            return null;
        }

    }



    private class AsyncVoteRequest extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String contact_fb_id = params[0];

                VoteServices voteServices=new VoteServices();
                voteServices.setApi_security(api_token);
                Estado estado= (Estado) voteServices.get(contact_fb_id);
                return estado;
            } catch (Exception e) {
                Log.e("Vote", e.getMessage(), e);
            }

            return null;
        }

    }

    private class AsyncGetPopularRequest extends AsyncTask<String, Void, ArrayList<Contact> > {
        @Override
        protected ArrayList<Contact> doInBackground(String... params) {
                try {

                    GetPopularServices getPopularServices=new GetPopularServices();
                    getPopularServices.setApi_security(api_token);
                    ArrayList<Contact> listContacts= (ArrayList<Contact>) getPopularServices.get();
                    return listContacts;
                } catch (Exception e) {
                    Log.e("GetPopular", e.getMessage(), e);
                }

                return null;
            }


    }



    private class AsyncGetConversation extends AsyncTask<String, Void, ArrayList<Mensaje>> {
        @Override
        protected ArrayList<Mensaje> doInBackground(String... params) {
            try {
                String contact_fb_id = params[0];

                GetConversationServices getConversationServices=new GetConversationServices();
                getConversationServices.setApi_security(api_token);
                ArrayList<Mensaje> mensajeArrayList= (ArrayList<Mensaje>) getConversationServices.get(contact_fb_id);
                return mensajeArrayList;
            } catch (Exception e) {
                Log.e("GetConversacion", e.getMessage(), e);
            }

            return null;
        }

    }


    private class AsyncSendMesagge extends AsyncTask<String, Void, Estado> {
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
    private class AsyncRegister extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String user_fb_id =params[0];
                String token_FCM=params[1];

                RegisterPushIdServices registerPushIdServices=new RegisterPushIdServices();
                registerPushIdServices.setApi_security(api_token);
                Estado estado= (Estado) registerPushIdServices.get(user_fb_id,token_FCM);
                return estado;
            } catch (Exception e) {
                Log.e("SendMesagge", e.getMessage(), e);
            }

            return null;
        }

    }



    private class HttpPosotionJob extends AsyncTask<String, Void, List<LDJobPosition>> {
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


