from nose.tools import assert_true
import requests


def test_request_response_index():
    # Send a request to the API server and store the response.
    response = requests.get('http://localhost:5000/')
	
    # Confirm that the request-response cycle completed successfully.
    assert_true(response.ok)

def test_request_response_job_positions():
    # Send a request to the API server and store the response.
    response = requests.get('http://localhost:5000/job_positions')

    # Confirm that the request-response cycle completed successfully.
    assert_true(response.ok)

