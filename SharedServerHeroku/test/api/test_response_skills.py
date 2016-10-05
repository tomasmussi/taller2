import json
from urllib2 import urlopen
import os.path
import unittest
from urlparse import urlparse
from mock import patch
from pprint import pprint


    
def request():
    url = "http://localhost:5000/skills"
    response = urlopen(url)
    raw_data = response.read().decode('utf-8')
    return json.loads(raw_data)

class ClientTestCase(unittest.TestCase):
    def test_request(self):
        """Test de request en skills"""
        response = request()
        self.assertIn('skills', response)
        pprint(response)
        self.assertEqual(response["metadata"]["version"], 0.1)
