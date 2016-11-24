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

def add_user(id):
   body = "api_sec=7dd52e16c17ff193362961b387687bf8"
   fb_id = "fb_user_id="+id
   url = "http://localhost:8080/api/fb_login?"+body+"&"+fb_id
   response = urlopen(url)
   raw_data = response.read().decode('utf-8')
   responseJson = json.loads(raw_data)
   pprint("Token")
   print(responseJson["data"]["token"])
   return responseJson["data"]["token"]

def requestVote(token,id):
    contact_fb_id = "contact_fb_id="+id
    datos = "token="+token+"&"+contact_fb_id
    url = "http://localhost:8080/api/vote"
    request = Request(url)
    request.add_data(datos)
    request.get_data()
    response = urlopen(request)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)
    
class VoteNotFriend(unittest.TestCase):
    def test_requestEdit(self):
        """Test de vote not friend"""
        token = get_token()
        add_user("Luis")
        response = requestVote(token,"Luis")
        pprint(response["data"])
        self.assertEqual(response["data"]["message"], "No puede votar por contactos que no son amigos o por ud mismo")
        self.assertEqual(response["data"]["status"], "ERROR")

class VoteFriend(unittest.TestCase):
    def test_requestEdit(self):
        """Test de vote a friend"""
        token = get_token()
        add_user("alfred")
        response = requestVote(token,"alfred")
        pprint(response["data"])
        self.assertEqual(response["data"]["message"], "Enviada votacion a contacto")
        self.assertEqual(response["data"]["status"], "OK")
    
class VoteUserNotExist(unittest.TestCase):
    def test_requestEdit(self):
        """Test de vote user not exist"""
        token = get_token()
        response = requestVote(token,"inexistente")
        pprint(response["errors"])
        self.assertEqual(response["errors"][0]["status"], "ERROR")
        self.assertEqual(response["errors"][0]["message"], "Usuario [inexistente] no existe o no es valido")

