import json
from urllib2 import urlopen
import os.path
import unittest
from urlparse import urlparse
from mock import patch
from pprint import pprint


    
def request():
    url = "http://localhost:8080/api/logout"
    response = urlopen(url)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)

class ClientTestCase(unittest.TestCase):
    def test_request(self):
        """Test de request en log_out_error"""
        response = request()
        self.assertIn('errors', response)
        pprint(response)
        pprint(response["errors"][0]["status"])
        self.assertEqual(response["errors"][0]["status"], 'ERROR')
