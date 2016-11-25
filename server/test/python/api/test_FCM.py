import json
from urllib2 import urlopen
from urllib2 import Request
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
   pprint(responseJson["data"]["token"])
   return responseJson["data"]["token"]

def requestFCM(token,fb_id,token_fcm):
    datos = "token="+token+"&"+"user_fb_id="+fb_id+"&token_FCM="+token_fcm
    url = "http://localhost:8080/api/token_FCM"
    request = Request(url)
    request.add_data(datos)
    request.get_data()
    response = urlopen(request)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)

    
class AddToken(unittest.TestCase):
    def test_request(self):
        """Test de add token FCM"""
        response = requestFCM(get_token("eze"),"eze","32452345")
        pprint(response["data"])
        self.assertEqual(response["data"]["status"], "OK")
        self.assertEqual(response["data"]["message"], "Token FCM dado de alta")

