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
    
def requestNotNull(token):
    latitude = "latitude=2.243"
    longitude = "longitude=234.3"
    datos = "token="+token+"&"+latitude+"&"+longitude
    url = "http://localhost:8080/api/location"
    request = Request(url)
    request.add_data(datos)
    request.get_data()
    response = urlopen(request)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)
    
def requestNull(token):
    latitude = "latitude=2.243"
    longitude = "longitude=234.3"
    datos = "token="+token+"&"+latitude
    url = "http://localhost:8080/api/location"
    request = Request(url)
    request.add_data(datos)
    request.get_data()
    response = urlopen(request)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)

class LoginExitoso(unittest.TestCase):
    def test_requestEdit(self):
        """Test de location"""
        token = get_token()
        response = requestNotNull(token)
        self.assertEqual(response["data"]["status"], "OK")
        self.assertEqual(response["data"]["message"], "Ubicacion de usuario actualizada")

class LocationEmpty(unittest.TestCase):
    def test_requestEdit(self):
        """Test de location empty"""
        token = get_token()
        response = requestNull(token)
        pprint(response)
        self.assertEqual(response["errors"][0]["status"], "ERROR")
        self.assertEqual(response["errors"][0]["message"], "Latitud o longitud vacios")
