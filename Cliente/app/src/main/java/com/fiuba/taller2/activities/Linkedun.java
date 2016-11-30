package com.fiuba.taller2.activities;

import android.app.Application;

import com.facebook.FacebookSdk;
import com.facebook.appevents.AppEventsLogger;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

/**
 * Created by luis on 11/09/16.
 */
public class Linkedun extends Application {
    private static String api_token;

    @Override
    public void onCreate() {
        super.onCreate();
        FacebookSdk.sdkInitialize(getApplicationContext());
        try {
            FirebaseApp.getInstance();
        } catch (IllegalStateException ex) {
            FirebaseApp.initializeApp(this, FirebaseOptions.fromResource(this));
        }
        AppEventsLogger.activateApp(this);
    }

    public static String getApi_token() {
        return api_token;
    }

    public static void setApi_token(String api_token) {
        Linkedun.api_token = api_token;
    }
}
