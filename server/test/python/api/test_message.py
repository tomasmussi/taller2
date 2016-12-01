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

def get_token(id):
   body = "api_sec=7dd52e16c17ff193362961b387687bf8"
   fb_id = "fb_user_id="+id
   url = "http://localhost:8080/api/fb_login?"+body+"&"+fb_id
   response = urlopen(url)
   raw_data = response.read().decode('utf-8')
   responseJson = json.loads(raw_data)
   pprint("Token")
   print(responseJson["data"]["token"])
   return responseJson["data"]["token"]

def requestViewMessage(token,contact_fb_id):
   url = "http://localhost:8080/api/message?token="+token+"&contact_fb_id="+contact_fb_id
   response = urlopen(url)
   raw_data = response.read().decode('utf-8')
   return json.loads(raw_data)

def requestNotMessage(token,contact_fb_id):
    datos = "token="+token+"&contact_fb_id="+contact_fb_id
    url = "http://localhost:8080/api/message"
    request = Request(url)
    request.add_data(datos)
    request.get_data()
    response = urlopen(request)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)

def requestMessage(token,contact_fb_id,mensaje):
    datos = "token="+token+"&contact_fb_id="+contact_fb_id+"&message="+mensaje
    url = "http://localhost:8080/api/message"
    request = Request(url)
    request.add_data(datos)
    request.get_data()
    response = urlopen(request)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)

class TestMessageEmpty(unittest.TestCase):
    def test_requestEdit(self):
        """Test Message empty"""
        token = get_token("eze")
        get_token("alfred")
        response = requestNotMessage(token,"alfred")
        pprint(response["errors"])
        self.assertEqual(response["errors"][0]["status"], "ERROR")
        self.assertEqual(response["errors"][0]["message"], "Mensaje vacio")

class TestMessageUserNotExist(unittest.TestCase):
    def test_requestEdit(self):
        """Test test message user contact not exist"""
        token = get_token("eze")
        response = requestMessage(token,"inexistente","Hola")
        pprint(response["errors"])
        self.assertEqual(response["errors"][0]["status"], "ERROR")
        self.assertEqual(response["errors"][0]["message"], "Usuario [inexistente] no existe o no es valido")

class TestAddMessage(unittest.TestCase):
    def test_requestEdit(self):
        """Test add Message"""
        token = get_token("eze")
        get_token("alfred")
        response = requestMessage(token,"alfred","Hola")
        pprint(response)
        pprint(response["errors"])
        self.assertEqual(response["data"]["status"], "OK")
        self.assertEqual(response["data"]["message"], "Mensaje enviado exitosamente")

class TestViewMessage(unittest.TestCase):
    def test_requestEdit(self):
        """Test view Message"""
        get_token("eze")
        token = get_token("alfred")
        response = requestViewMessage(token,"eze")
        pprint (response)
        self.assertEqual(response["data"][0]["message"], "Hola")
        self.assertEqual(response["data"][0]["receiver_id"], "alfred")
        self.assertEqual(response["data"][0]["sender_id"], "eze")
