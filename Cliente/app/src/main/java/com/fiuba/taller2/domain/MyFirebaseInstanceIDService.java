package com.fiuba.taller2.domain;

import android.util.Log;

import com.google.firebase.iid.FirebaseInstanceId;
import com.google.firebase.iid.FirebaseInstanceIdService;


public class MyFirebaseInstanceIDService extends FirebaseInstanceIdService {

    public static final String TAG = "NOTICIAS";

    @Override
    public void onTokenRefresh() {
        super.onTokenRefresh();

        String token = FirebaseInstanceId.getInstance().getToken();

        Log.d(TAG, "Tokens: " + token);

        enviarTokenAlServidor(token);
    }

    private void enviarTokenAlServidor(String token) {
        // Enviar token al servidor
    }
}