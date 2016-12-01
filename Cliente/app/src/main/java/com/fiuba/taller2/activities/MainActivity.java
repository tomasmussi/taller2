package com.fiuba.taller2.activities;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.location.Location;
import android.location.LocationManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
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

import com.firebase.ui.auth.AuthUI;
import com.fiuba.taller2.R;
import com.fiuba.taller2.adapters.ImageAdapter;
import com.fiuba.taller2.domain.Categoria;
import com.fiuba.taller2.domain.Category;
import com.fiuba.taller2.domain.CatogoryLN;
import com.fiuba.taller2.domain.Contact;
import com.fiuba.taller2.domain.Estado;
import com.fiuba.taller2.domain.JobPosition;
import com.fiuba.taller2.domain.Login;
import com.fiuba.taller2.domain.Mensaje;
import com.fiuba.taller2.domain.MyProfile;
import com.fiuba.taller2.domain.Skill;
import com.fiuba.taller2.services.DeleteJobPositionServices;
import com.fiuba.taller2.services.DeleteSkillServices;
import com.fiuba.taller2.services.GetCategoriesServices;
import com.fiuba.taller2.services.GetContactsByDistanceServices;
import com.fiuba.taller2.services.GetContactsRequestServices;
import com.fiuba.taller2.services.GetContactsServices;
import com.fiuba.taller2.services.GetConversationServices;
import com.fiuba.taller2.services.GetJobPositionServices;
import com.fiuba.taller2.services.GetJobPositionsServices;
import com.fiuba.taller2.services.GetPopularServices;
import com.fiuba.taller2.services.GetSkillServices;
import com.fiuba.taller2.services.GetSkillsServices;
import com.fiuba.taller2.services.LDCategoriesServices;
import com.fiuba.taller2.services.LDMyProfileServices;
import com.fiuba.taller2.services.LoginServices;
import com.fiuba.taller2.services.LookupServices;
import com.fiuba.taller2.services.RegisterPushIdServices;
import com.fiuba.taller2.services.SaveProfileServices;
import com.fiuba.taller2.services.SendContactRequestServices;
import com.fiuba.taller2.services.SendContactResponseServices;
import com.fiuba.taller2.services.SendMesaggeServices;
import com.fiuba.taller2.services.SetJobPositionServices;
import com.fiuba.taller2.services.SetLocationServices;
import com.fiuba.taller2.services.SetSkillServices;
import com.fiuba.taller2.services.VoteServices;
import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.Target;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener,
        AdapterView.OnItemClickListener, GoogleApiClient.OnConnectionFailedListener
,GoogleApiClient.ConnectionCallbacks {

    private static final String TAG = "MainActivity";
    private static final int RC_SIGN_IN = 0;

    private String api_token;
    private String userEmail;

    private String firstName;
    private String lastName;
    private String firebase_imageUrl;
    private double longitude;
    private double latitude;

    private Uri photo_storage_url;
    private Context context;

    private TextView tv_userName;
    private TextView tv_email;
    private ImageView iv_image_profile;

    private FirebaseAuth firebaseAuth;

    private static final String LOGTAG = "android-localizacion";

    private static final int PETICION_PERMISO_LOCALIZACION = 101;

    private GoogleApiClient client;


    private ImageAdapter adapterCategorias;
    private GridView grillaOpciones;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.d("___CLASE : ",getClass().getSimpleName());
        Log.d("___LAYOUT : ","R.layout.activity_main");


        context= this;

        //Setteo de titulo de la activity
        this.setTitle("Bienvenido a Linkedun");
        if (getIntent().getExtras() != null) {
            for (String key : getIntent().getExtras().keySet()) {
                Object value = getIntent().getExtras().get(key);
                Log.d(TAG, "Key: " + key + " Value: " + value);
            }
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

        tv_userName = (TextView) headerView.findViewById(R.id.user_name);
        tv_email = (TextView) headerView.findViewById(R.id.user_email);
        iv_image_profile = (ImageView) headerView.findViewById(R.id.profile_picture);


        grillaOpciones = (GridView) findViewById(R.id.grilla_categorias);
        adapterCategorias = new ImageAdapter(this);
        grillaOpciones.setAdapter(adapterCategorias);
        grillaOpciones.setOnItemClickListener(this);

        firebaseAuth = FirebaseAuth.getInstance();
        if (firebaseAuth.getCurrentUser() != null) {
            Log.d("AUTH", "User LOGGED IN");
            userEmail = firebaseAuth.getCurrentUser().getEmail();
            firstName = firebaseAuth.getCurrentUser().getDisplayName();
            Log.d("hola", firebaseAuth.getCurrentUser().getProviders().toString());
            firebaseAuth.getCurrentUser().getProviderData();
            firebase_imageUrl = firebaseAuth.getCurrentUser().getPhotoUrl().toString();
            initMenu();

        } else {
            startActivityForResult(AuthUI.getInstance()
                    .createSignInIntentBuilder().
                            setProviders(
                                    AuthUI.FACEBOOK_PROVIDER,
                                    AuthUI.GOOGLE_PROVIDER
                            ).build(), RC_SIGN_IN);
        }
        client = new GoogleApiClient.Builder(this)
                .addApi(AppIndex.API)
                .enableAutoManage(this, this)
                .addConnectionCallbacks(this)
                .addApi(LocationServices.API)
                .build();
    }


    private void initMenu() {
        firebaseAuth = FirebaseAuth.getInstance();

        assert firebaseAuth != null;
        FirebaseUser firebaseUser = firebaseAuth.getCurrentUser();
        if (firebaseUser != null) {
            firstName = firebaseUser.getDisplayName();
            tv_userName.setText(firstName);
            userEmail=firebaseUser.getEmail();
            tv_email.setText(userEmail);
            if (firebaseUser.getPhotoUrl() != null) loadPhoto(firebaseUser);

        } else {
            Log.d("Error:", "No se pudo obtener usuario problema en inicio de sesion");
            startActivityForResult(AuthUI.getInstance()
                    .createSignInIntentBuilder().
                            setProviders(
                                    AuthUI.FACEBOOK_PROVIDER,
                                    AuthUI.GOOGLE_PROVIDER
                            ).build(), RC_SIGN_IN);        }



    }

    private void loadPhoto(FirebaseUser firebaseUser) {
        firebase_imageUrl = firebaseUser.getPhotoUrl().toString();
        try {
            Picasso.Builder builder = new Picasso.Builder(this);
            builder.listener(new Picasso.Listener() {
                @Override
                public void onImageLoadFailed(Picasso picasso, Uri uri, Exception exception) {
                    exception.printStackTrace();
                }
            });

            builder.build().load(firebase_imageUrl).into(
                    new Target() {
                        @Override
                        public void onBitmapLoaded(final Bitmap bitmap, Picasso.LoadedFrom from) {

                            //Cargo bitmap descargado en el ImageView
                            iv_image_profile.setImageBitmap(bitmap);

                            //Cargo el bitmap en Firebase y obtengo el link
                            uploadBitmapToFirebase(bitmap);
                        }

                        @Override
                        public void onPrepareLoad(Drawable placeHolderDrawable) {
                        }

                        @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
                        @Override
                        public void onBitmapFailed(Drawable errorDrawable) {
                            iv_image_profile.setImageDrawable(context.getDrawable(R.drawable.com_facebook_profile_picture_blank_portrait));

                            //InitApiTokenFromServer(userEmail, String.valueOf(photo_storage_url));
                        }
                    }
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void uploadBitmapToFirebase(Bitmap bitmap) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, baos);
        byte[] dataBAOS = baos.toByteArray();

        StorageReference storageRef = FirebaseStorage.getInstance().getReferenceFromUrl("gs://linkedun-9ab67.appspot.com");
        StorageReference imagesRef = storageRef.child(userEmail);

        UploadTask uploadTask = imagesRef.putBytes(dataBAOS);
        uploadTask.addOnFailureListener(new OnFailureListener() {
            @Override
            public void onFailure(@NonNull Exception exception) {
                // Handle unsuccessful uploads
            }
        }).addOnSuccessListener(new OnSuccessListener<UploadTask.TaskSnapshot>() {
            @Override
            public void onSuccess(UploadTask.TaskSnapshot taskSnapshot) {
                // taskSnapshot.getMetadata() contains file metadata such as size, content-type, and download URL.
                photo_storage_url = taskSnapshot.getDownloadUrl();
                Log.d("PhotoUrl", String.valueOf(photo_storage_url));
                InitApiTokenFromServer(userEmail, String.valueOf(photo_storage_url));
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == RC_SIGN_IN) {
            if (resultCode == RESULT_OK) {
                Log.d("AUTH", firebaseAuth.getCurrentUser().getEmail());
                Log.d("hola", firebaseAuth.getCurrentUser().getProviders().toString());
                initMenu();
            }else {
                Log.d("AUTHS", "Problema con smart lock");
            }
        } else {
            Log.d("AUTH", "User not autenticated");
        }
    }

    private void InitApiTokenFromServer(String userEmail,String photo_url) {
        HttpRequestTaskLogin httpRequestTask = new HttpRequestTaskLogin();

        httpRequestTask.execute(userEmail);
        Login login = null;
        try {
            login = httpRequestTask.get();
            api_token = login.getToken();
            Linkedun.setApi_token(api_token);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        //Registro el push_id
        AsyncRegister asyncRegister = new AsyncRegister();
        if (login != null)
            asyncRegister.execute(this.userEmail, FirebaseInstanceId.getInstance().getToken());
        Estado estado;
        try {
            estado = asyncRegister.get();
            if (estado != null) Log.d("PUSH_ID", estado.toString());

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }


        AsyncSetLocation asyncSetLocation = new AsyncSetLocation();

        asyncSetLocation.execute(String.valueOf(latitude), String.valueOf(longitude));
        try {
            Estado estado_location = asyncSetLocation.get();
            Log.d("Estado", estado_location.toString());

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }


        if ( login.getUser_exists().equals("false")){
            HttpRequestTaskSave httpRequestTaskSave= new HttpRequestTaskSave();
            httpRequestTaskSave.execute(firebaseAuth.getCurrentUser().getDisplayName()
                    , firebaseAuth.getCurrentUser().getEmail()
                    ,"","","",String.valueOf(photo_storage_url));
        } else{
            HttpRequestTaskSaveImage httpRequestTaskSave= new HttpRequestTaskSaveImage();
            httpRequestTaskSave.execute(String.valueOf(photo_storage_url));
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
            Intent intent = new Intent(this, MyContactsActivity.class);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);
        } else if (id == R.id.contactosdestacados) {


        } else if (id == R.id.miPerfil) {
            HttpRequestTaskMyProfile httpRequestTaskMyProfile = new HttpRequestTaskMyProfile();
            httpRequestTaskMyProfile.execute();
            MyProfile myProfile = new MyProfile();
            try {
                myProfile = httpRequestTaskMyProfile.get();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
            Intent intent = new Intent(this, MyProfileActivity.class);
            intent.putExtra("PROFILE", myProfile);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);
        } else if (id == R.id.notificaciones) {
            Intent intent = new Intent(this,MyProfileActivity.class);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);
        } else if (id == R.id.solicitudes) {

            AsyncGetContactsRequest asyncGetContactsRequest = new AsyncGetContactsRequest();
            asyncGetContactsRequest.execute();
            ArrayList<Contact> contacRequesttArrayList=new ArrayList<Contact>();
            try {
                contacRequesttArrayList = (ArrayList<Contact>) asyncGetContactsRequest.get();
                Log.d("Contacts", contacRequesttArrayList.toString());
                Log.d("Contacts", contacRequesttArrayList.get(0).toString());
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            } catch (NullPointerException e) {
                e.printStackTrace();
                contacRequesttArrayList = new ArrayList<Contact>();
            }

            Intent intent = new Intent(this, MyContactsRequestActivity.class);
            intent.putExtra("API_TOKEN", api_token);
            intent.putExtra("CONTACT_LIST", contacRequesttArrayList);

            startActivity(intent);

        } else if (id == R.id.contactosdestacados) {

            Intent intent = new Intent(this, MyProfileActivity.class);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);

        } else if (id == R.id.miPerfil) {
            HttpRequestTaskMyProfile httpRequestTaskMyProfile = new HttpRequestTaskMyProfile();
            httpRequestTaskMyProfile.execute();
            MyProfile myProfile = new MyProfile();
            try {
                myProfile = httpRequestTaskMyProfile.get();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
            Intent intent = new Intent(this, MyProfileActivity.class);
            intent.putExtra("PROFILE", myProfile);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);
        } else if (id == R.id.notificaciones) {

        } else if (id == R.id.popular) {

            AsyncGetPopularRequest asyncGetPopularRequest = new AsyncGetPopularRequest();
            asyncGetPopularRequest.execute();
            ArrayList<Contact> contacPupularRequesttArrayList= new ArrayList<>();
            try {
                contacPupularRequesttArrayList = (ArrayList<Contact>) asyncGetPopularRequest.get();
                if (contacPupularRequesttArrayList != null)
                    Log.d("Estado", contacPupularRequesttArrayList.toString());

            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }

            Intent intent = new Intent(this, PopularContactsActivity.class);
            intent.putExtra("API_TOKEN", api_token);
            intent.putExtra("CONTACT_LIST", contacPupularRequesttArrayList);
            startActivity(intent);


        } else if (id == R.id.solicitudes) {

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
                                    ).build(), RC_SIGN_IN);
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
        if (item_id == 1) {
            HttpRequestTaskMyProfile httpRequestTaskMyProfile = new HttpRequestTaskMyProfile();
            httpRequestTaskMyProfile.execute();
            MyProfile myProfile = new MyProfile();
            try {
                myProfile = httpRequestTaskMyProfile.get();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
            Intent intent = new Intent(this, MyProfileActivity.class);
            intent.putExtra("PROFILE", myProfile);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);
        }
        if (item_id == 2) {
            Intent intent = new Intent(this, MyContactsActivity.class);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);

        }
        if (item_id == 3) {
            AsyncContactsByDistance asyncContactsByDistance = new AsyncContactsByDistance();
            asyncContactsByDistance.execute();
            ArrayList<Contact> contacts = new ArrayList<>();
            try {
                contacts = asyncContactsByDistance.get();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
            Intent intent = new Intent(this, ContactsCloseActivity.class);
            intent.putExtra("CONTACT_LIST", contacts);
            intent.putExtra("API_TOKEN", api_token);
            startActivity(intent);
        }
        if (item_id == 4) {
            AuthUI.getInstance().signOut(this).addOnCompleteListener(new OnCompleteListener<Void>() {
                @Override
                public void onComplete(@NonNull Task<Void> task) {
                    Log.d("AUTH", "User LOGGED OUT");
                    startActivityForResult(AuthUI.getInstance()

                            .createSignInIntentBuilder().setIsSmartLockEnabled(false).
                                    setProviders(
                                            AuthUI.FACEBOOK_PROVIDER,
                                            AuthUI.GOOGLE_PROVIDER
                                    ).build(), RC_SIGN_IN);
                }
            });
        }


    }

    @Override
    public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
        Log.e(LOGTAG, "Error grave al conectar con Google Play Services");
    }

    class HttpRequestTask extends AsyncTask<String, Void, ArrayList<CatogoryLN>> {
        @Override
        protected ArrayList<CatogoryLN> doInBackground(String... params) {
            try {
                LDCategoriesServices listCoursesByCategoriesServices = new LDCategoriesServices();
                listCoursesByCategoriesServices.setApi_security(api_token);
                ArrayList<CatogoryLN> listCourses = listCoursesByCategoriesServices.getListCourses().getCategories();

                return listCourses;
            } catch (Exception e) {
                Log.e("ListCoursesByCategories", e.getMessage(), e);
            }

            return null;
        }

    }

    class HttpRequestTaskMyProfile extends AsyncTask<String, Void, MyProfile> {
        MyProfile myProfile;
        @Override
        protected MyProfile doInBackground(String... params) {
            try {
                LDMyProfileServices ldMyProfileServices = new LDMyProfileServices();
                ldMyProfileServices.setApi_security(api_token);
                myProfile = ldMyProfileServices.getProfile();
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
                Login login = new LoginServices().getLoginBy(user);
                Log.d("Login Token:", login.getToken());
                return login;
            } catch (Exception e) {
                Log.e("LoginActivity", e.getMessage(), e);
            }

            return null;
        }

    }


    @Override
    public void onConnected(@Nullable Bundle bundle) {
        //Conectado correctamente a Google Play Services

        if (ActivityCompat.checkSelfPermission(this,
                Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {

            ActivityCompat.requestPermissions(this,
                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                    PETICION_PERMISO_LOCALIZACION);
        } else {

            Location lastLocation =
                    LocationServices.FusedLocationApi.getLastLocation(client);

            updateUI(lastLocation);
        }
    }

    @Override
    public void onConnectionSuspended(int i) {
        //Se ha interrumpido la conexión con Google Play Services

        Log.e(LOGTAG, "Se ha interrumpido la conexión con Google Play Services");
    }

    private void updateUI(Location loc) {
        if (loc != null) {
           latitude=loc.getLatitude();
           longitude=loc.getLongitude();
        } else {
            Log.d("ERROR"," AL UPDETEAR POSICION");
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == PETICION_PERMISO_LOCALIZACION) {
            if (grantResults.length == 1
                    && grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                //Permiso concedido

                @SuppressWarnings("MissingPermission")
                Location lastLocation =
                        LocationServices.FusedLocationApi.getLastLocation(client);

                updateUI(lastLocation);

            } else {
                //Permiso denegado:
                //Deberíamos deshabilitar toda la funcionalidad relativa a la localización.

                Log.e(LOGTAG, "Permiso denegado");
            }
        }
    }

    private class HttpRequestTaskJobs extends AsyncTask<String, Void, ArrayList<JobPosition>> {
        @Override
        protected ArrayList<JobPosition> doInBackground(String... params) {
            try {
                GetJobPositionsServices getJobPositions = new GetJobPositionsServices();
                getJobPositions.setApi_security(api_token);
                ArrayList<JobPosition> estado = getJobPositions.get();
                return estado;
            } catch (Exception e) {
                Log.e("JobPositions", e.getMessage(), e);
            }
            return null;
        }

    }

    private class AsyncSetLocation extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String latitude = params[0];
                String longitude = params[1];

                SetLocationServices setLocationServices = new SetLocationServices();
                setLocationServices.setApi_security(api_token);
                Estado estado_response = setLocationServices.get(latitude, longitude);
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

                GetContactsServices getContactsServices = new GetContactsServices();
                getContactsServices.setApi_security(api_token);
                ArrayList<Contact> listContacts = getContactsServices.get();
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

                GetContactsRequestServices getContactsServices = new GetContactsRequestServices();
                getContactsServices.setApi_security(api_token);
                ArrayList<Contact> listContacts = getContactsServices.get();
                return listContacts;
            } catch (Exception e) {
                Log.e("GetContactsRequestServ", e.getMessage(), e);
            }

            return null;
        }

    }

    private class AsyncContactsByDistance extends AsyncTask<String, Void, ArrayList<Contact>> {
        @Override
        protected ArrayList<Contact> doInBackground(String... params) {
            try {

                GetContactsByDistanceServices lookupServices = new GetContactsByDistanceServices();
                lookupServices.setApi_security(api_token);
                ArrayList<Contact> listContacts = lookupServices.get();
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

                SendContactRequestServices SendContactRequestServices = new SendContactRequestServices();
                SendContactRequestServices.setApi_security(api_token);
                Estado estado = SendContactRequestServices.get(contact_fb_id);
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


                SendContactResponseServices SendContactRequestServices = new SendContactResponseServices();
                SendContactRequestServices.setApi_security(api_token);
                Estado estado = SendContactRequestServices.get(contact_fb_id, answer);
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

                VoteServices voteServices = new VoteServices();
                voteServices.setApi_security(api_token);
                Estado estado = voteServices.get(contact_fb_id);
                return estado;
            } catch (Exception e) {
                Log.e("Vote", e.getMessage(), e);
            }

            return null;
        }

    }

    private class AsyncGetPopularRequest extends AsyncTask<String, Void, ArrayList<Contact>> {
        @Override
        protected ArrayList<Contact> doInBackground(String... params) {
            try {

                GetPopularServices getPopularServices = new GetPopularServices();
                getPopularServices.setApi_security(api_token);
                ArrayList<Contact> listContacts = getPopularServices.get();
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

                GetConversationServices getConversationServices = new GetConversationServices();
                getConversationServices.setApi_security(api_token);
                ArrayList<Mensaje> mensajeArrayList = getConversationServices.get(contact_fb_id);
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
                String mesagge = params[1];

                SendMesaggeServices sendMesaggeServices = new SendMesaggeServices();
                sendMesaggeServices.setApi_security(api_token);
                Estado estado = sendMesaggeServices.get(contact_fb_id, mesagge);
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
                String user_fb_id = params[0];
                String token_FCM = params[1];

                RegisterPushIdServices registerPushIdServices = new RegisterPushIdServices();
                registerPushIdServices.setApi_security(api_token);
                Estado estado = registerPushIdServices.get(user_fb_id, token_FCM);
                return estado;
            } catch (Exception e) {
                Log.e("SendMesagge", e.getMessage(), e);
            }

            return null;
        }

    }

    private class AsyncgetSkills extends AsyncTask<String, Void, ArrayList<Skill>> {
        @Override
        protected ArrayList<Skill> doInBackground(String... params) {
            try {
                GetSkillsServices getSkills = new GetSkillsServices();
                getSkills.setApi_security(api_token);
                ArrayList<Skill> estado = getSkills.get();
                return estado;
            } catch (Exception e) {
                Log.e("SendMesagge", e.getMessage(), e);
            }
            return null;
        }

    }

    private class AsyncSetSkill extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String nameSkill = params[0];

                SetSkillServices setSkillServices = new SetSkillServices();
                setSkillServices.setApi_security(api_token);
                Estado estado_response = setSkillServices.get(nameSkill);
                return estado_response;
            } catch (Exception e) {
                Log.e("AsyncSetLocation", e.getMessage(), e);
            }

            return null;
        }

    }

    private class AsyncDeleteSkill extends AsyncTask<String, Void, Void> {
        @Override
        protected Void doInBackground(String... params) {
            try {
                String nameSkill = params[0];

                DeleteSkillServices deleteSkillServices = new DeleteSkillServices();
                deleteSkillServices.setApi_security(api_token);
                deleteSkillServices.get(nameSkill);
            } catch (Exception e) {
                Log.e("AsyncSetDeleteSkill", e.getMessage(), e);
            }
            return null;
        }
    }

    private class AsyncGetSkill extends AsyncTask<String, Void, Skill> {
        @Override
        protected Skill doInBackground(String... params) {
            try {
                String nameSkill = params[0];
                GetSkillServices getSkillServices = new GetSkillServices();
                getSkillServices.setApi_security(api_token);
                Skill estado = getSkillServices.getSkill(nameSkill);
                return estado;
            } catch (Exception e) {
                Log.e("SendMesagge", e.getMessage(), e);
            }
            return null;
        }

    }
    private class SaveProfile extends AsyncTask<String, Void, Boolean> {
        Boolean result;
        @Override
        protected Boolean doInBackground(String... params) {
            try {
                String sessionId = params[0];


                SaveProfileServices saveProfileServices =new SaveProfileServices();
                saveProfileServices.setApi_security(api_token);
                boolean ifExistsErrors=  saveProfileServices.ifExistsErrors(sessionId);
                result= new Boolean( ifExistsErrors );

            } catch (Exception e) {
                Log.e("MyProfileActivity", e.getMessage(), e);
            }

            return result;
        }

    }


    private class AsyncGetJobPositions extends AsyncTask<String, Void, ArrayList<JobPosition>> {
        @Override
        protected ArrayList<JobPosition> doInBackground(String... params) {
            try {
                GetJobPositionsServices getJobPositions = new GetJobPositionsServices();
                getJobPositions.setApi_security(api_token);
                ArrayList<JobPosition> estado = getJobPositions.get();
                return estado;
            } catch (Exception e) {
                Log.e("JobPositions", e.getMessage(), e);
            }
            return null;
        }

    }

    private class AsyncSetJobPosition extends AsyncTask<String, Void, Estado> {
        @Override
        protected Estado doInBackground(String... params) {
            try {
                String nameJobPosition = params[0];

                SetJobPositionServices setJobPositionServices = new SetJobPositionServices();
                setJobPositionServices.setApi_security(api_token);
                Estado estado_response = setJobPositionServices.get(nameJobPosition);
                return estado_response;
            } catch (Exception e) {
                Log.e("SetJobposition", e.getMessage(), e);
            }

            return null;
        }

    }

    private class AsyncDeleteJobPosition extends AsyncTask<String, Void, Void> {
        @Override
        protected Void doInBackground(String... params) {
            try {
                String nameSkill = params[0];

                DeleteJobPositionServices deleteJobPositionServices = new DeleteJobPositionServices();
                deleteJobPositionServices.setApi_security(api_token);
                deleteJobPositionServices.get(nameSkill);
            } catch (Exception e) {
                Log.e("SetDeleteJobPosition", e.getMessage(), e);
            }
            return null;
        }
    }

    private class AsyncGetJobPosition extends AsyncTask<String, Void, JobPosition> {
        @Override
        protected JobPosition doInBackground(String... params) {
            try {
                String nameJobPosition = params[0];
                GetJobPositionServices getJobPositionServices = new GetJobPositionServices();
                getJobPositionServices.setApi_security(api_token);
                JobPosition estado = getJobPositionServices.get(nameJobPosition);
                return estado;
            } catch (Exception e) {
                Log.e("JobPosition", e.getMessage(), e);
            }
            return null;
        }

    }

    private class AsyncGetCategories extends AsyncTask<String, Void, ArrayList<Category>> {
        @Override
        protected ArrayList<Category> doInBackground(String... params) {
            try {
                GetCategoriesServices getCategoriesServices = new GetCategoriesServices();
                getCategoriesServices.setApi_security(api_token);
                ArrayList<Category> estado = getCategoriesServices.get();
                return estado;
            } catch (Exception e) {
                Log.e("Categories", e.getMessage(), e);
            }
            return null;
        }

    }



    private class HttpRequestTaskSave extends AsyncTask<String, Void, Boolean> {
        Boolean result;

        @Override
        protected Boolean doInBackground(String... params) {
            try {

                SaveProfileServices saveProfileServices = new SaveProfileServices();
                saveProfileServices.setApi_security(api_token);
                boolean ifExistsErrors = saveProfileServices.ifExistsErrors(params);
                result = new Boolean(ifExistsErrors);

            } catch (Exception e) {
                Log.e("MyProfileActivity", e.getMessage(), e);
            }

            return result;
        }

    }
    private class HttpRequestTaskSaveImage extends AsyncTask<String, Void, Boolean> {
        Boolean result;

        @Override
        protected Boolean doInBackground(String... params) {
            try {

                SaveProfileServices saveProfileServices = new SaveProfileServices();
                saveProfileServices.setApi_security(api_token);
                boolean ifExistsErrors = saveProfileServices.saveImage(params[0]);
                result = new Boolean(ifExistsErrors);

            } catch (Exception e) {
                Log.e("MyProfileActivity", e.getMessage(), e);
            }

            return result;
        }

    }


}
