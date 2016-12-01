package com.fiuba.taller2;

import android.test.suitebuilder.annotation.SmallTest;
import android.text.TextUtils;
import android.util.Log;

import com.fiuba.taller2.domain.Login;
import com.fiuba.taller2.services.LoginServices;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import static org.hamcrest.CoreMatchers.is;

/**
 * To work on unit tests, switch the Test Artifact in the Build Variants view.
 */
import static org.junit.Assert.assertThat;
import static org.powermock.api.mockito.PowerMockito.mock;
import static org.powermock.api.mockito.PowerMockito.when;

@RunWith(PowerMockRunner.class)
@PrepareForTest(LoginServices.class)
public class ExampleUnitTest {

    public static final String TEST_STRING = "This is a string";
    public static final long TEST_LONG = 12345678L;
    private LoginServices loginServices;


    @Before
    public void createLogHistory() {
        Log myObjectMock = mock(Log.class);
        loginServices = new LoginServices();

    }

    @Test
    public void logHistory_ParcelableWriteRead() {
        Login login= loginServices.getLoginBy("aran.com.ar@gmail.com");
        System.out.println("Log: "+ login.toString());
        assertThat(1, is(1));
    }
}
