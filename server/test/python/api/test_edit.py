# -*- coding: utf-8 -*-
import json
from urllib2 import urlopen
from urllib2 import Request
import urllib
import os.path
import unittest
from urlparse import urlparse
from mock import patch
from pprint import pprint

def get_token():
   body = "api_sec=7dd52e16c17ff193362961b387687bf8"
   fb_id = "fb_user_id=eze"
   url = "http://localhost:8080/api/fb_login?"+body+"&"+fb_id
   response = urlopen(url)
   raw_data = response.read().decode('utf-8')
   responseJson = json.loads(raw_data)
   pprint("Token")
   print(responseJson["data"]["token"])
   return responseJson["data"]["token"]

def requestEditProfile(token):
    name = "name=eze"
    email = "email=eze"
    password = "pass=fiuba1234"
    dob = "dob=14/12/90"
    city = "city=Lanus Oeste"
    summary = "summary=Estudiante de ingenieria"
    profile_photo = "profile_photo=asdf"

    datos = "token="+token+"&"+name+"&"+email+"&"+password+"&"+dob+"&"+city+"&"+summary+"&"+profile_photo
    #data = urllib.urlencode(datos)
    url = "http://localhost:8080/api/profile"
    request = Request(url)
    request.add_data(datos)
    request.get_data()
    response = urlopen(request)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)
    
def requestViewProfile(token):
    url = "http://localhost:8080/api/profile?token="+token
    response = urlopen(url)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)
    
class LoginExitoso(unittest.TestCase):
    def test_requestEdit(self):
        """Test de edit and view profile"""
        token = get_token()
        requestEditProfile(token)
        response = requestViewProfile(token)
        pprint(response["data"])
        self.assertEqual(response["data"]["user"]["name"], "eze")
        self.assertEqual(response["data"]["user"]["email"], "eze")
        self.assertEqual(response["data"]["user"]["dob"], "14/12/90")
        self.assertEqual(response["data"]["user"]["city"], "Lanus Oeste")
        self.assertEqual(response["data"]["user"]["summary"], "Estudiante de ingenieria")
        self.assertEqual(response["data"]["user"]["profile_photo"], "asdf")
