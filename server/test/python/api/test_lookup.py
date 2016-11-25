import json
from urllib2 import urlopen
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
   pprint(responseJson["data"]["token"])
   return responseJson["data"]["token"]

def request(token):
    query = "query=eze"
    url = "http://localhost:8080/api/lookup?token="+token+"&"+query
    response = urlopen(url)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)
    
class LoginExitoso(unittest.TestCase):
    def test_request(self):
        """Test de lookup"""
        response = request(get_token())
        pprint(response["errors"])
        self.assertEqual(response["errors"], [])
