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

def add_user():
   body = "api_sec=7dd52e16c17ff193362961b387687bf8"
   fb_id = "fb_user_id=alfred"
   url = "http://localhost:8080/api/fb_login?"+body+"&"+fb_id
   response = urlopen(url)
   raw_data = response.read().decode('utf-8')
   responseJson = json.loads(raw_data)
   pprint("Token")
   print(responseJson["data"]["token"])
   return responseJson["data"]["token"]

def requestVoteNotFriend(token):
    contact_fb_id = "contact_fb_id=alfred"
    datos = "token="+token+"&"+contact_fb_id
    url = "http://localhost:8080/api/vote"
    request = Request(url)
    request.add_data(datos)
    request.get_data()
    response = urlopen(request)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)
    
class LoginExitoso(unittest.TestCase):
    def test_requestEdit(self):
        """Test de vote not friend"""
        token = get_token()
        add_user()
        response = requestVoteNotFriend(token)
        pprint(response["data"])
        self.assertEqual(response["data"]["message"], "No puede votar por contactos que no son amigos o por ud mismo")
        self.assertEqual(response["data"]["status"], "ERROR")
