import json
from urllib2 import urlopen
from urllib2 import Request
import os.path
import unittest
from urlparse import urlparse
from mock import patch
from pprint import pprint


    
def request():
    body = "api_sec=7dd52e16c17ff193362961b387687bf8"
    url = "http://localhost:8080/api/fb_login?"+body
    response = urlopen(url)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)
    
class ClientTestCase(unittest.TestCase):
    def test_request(self):
        """Test de request en fb_login sin user"""
        response = request()
        self.assertIn('errors', response)
        pprint(response)
        pprint(response["errors"][0]["status"])
        self.assertEqual(response["errors"][0]["message"], "Facebook user ID invalido")
        self.assertEqual(response["errors"][0]["status"], 'ERROR')

