from nose.tools import assert_true
import requests

def test_request_response_login():
    """Test de response de login"""
    response = requests.get('http://localhost:8080/api/fb_login')
    assert_true(response.ok)

def test_request_response_logout():
    """Test de response de logout"""
    response = requests.get('http://localhost:8080/api/logout')
    assert_true(response.ok)

def test_request_response_job_get_positions():
    """Test de response de job_positions"""
    response = requests.get('http://localhost:8080/api/job_positions')
    assert_true(response.ok)

def test_request_response_post_job_positions():
    """Test de response de job_positions"""
    response = requests.post('http://localhost:8080/api/job_positions')
    assert_true(response.ok)

def test_request_response_delete_job_positions():
    """Test de response de job_positions"""
    response = requests.delete('http://localhost:8080/api/job_positions')
    assert_true(response.ok)

def test_request_response_categories():
    """Test de response de categories"""
    response = requests.get('http://localhost:8080/api/categories')
    assert_true(response.ok)

def test_request_response_skills():
    """Test de response de skills"""
    response = requests.get('http://localhost:8080/api/skills')
    assert_true(response.ok)

def test_request_response_post_skill():
    """Test de response de skill"""
    response = requests.post('http://localhost:8080/api/skill')
    assert_true(response.ok)

def test_request_response_delete_skill():
    """Test de response de skill"""
    response = requests.delete('http://localhost:8080/api/skill')
    assert_true(response.ok)

def test_request_response_get_skill():
    """Test de response de skill"""
    response = requests.get('http://localhost:8080/api/skill')
    assert_true(response.ok)

def test_request_response_my_profile():
    """Test de response de my_profile"""
    response = requests.get('http://localhost:8080/api/profile')
    assert_true(response.ok)

def test_request_response_put_my_profile():
    """Test de response de my_profile"""
    response = requests.post('http://localhost:8080/api/profile')
    assert_true(response.ok)

def test_request_response_my_profile():
    """Test de response de my_profile"""
    response = requests.get('http://localhost:8080/api/profile/others')
    assert_true(response.ok)

def test_request_response_post_contact():
    """Test de response contact post"""
    response = requests.post('http://localhost:8080/api/contact')
    assert_true(response.ok)

#def test_request_reponse_contact():
#    """Test de response de contact/response"""
#    response = requests.post('http://localhost:8080/api/contact/response')
#    assert_true(response.ok)

def test_request_get_contact():
    """Test de response de contact get"""
    response = requests.get('http://localhost:8080/api/contact')
    assert_true(response.ok)

def test_request_response_lookup():
    """Test de response de lookup"""
    response = requests.get('http://localhost:8080/api/lookup')
    assert_true(response.ok)

def test_request_response_get_contacts():
    """Test de response de categories"""
    response = requests.get('http://localhost:8080/api/get_contacts')
    assert_true(response.ok)

def test_request_response_vote():
    """Test de response de vote"""
    response = requests.post('http://localhost:8080/api/vote')
    assert_true(response.ok)

def test_request_response_popular():
    """Test de response de popular"""
    response = requests.get('http://localhost:8080/api/vote/popular')
    assert_true(response.ok)

def test_request_response_send_message():
    """Test de response de send_message"""
    response = requests.post('http://localhost:8080/api/message')
    assert_true(response.ok)

def test_request_response_view_message():
    """Test de response view_messages"""
    response = requests.get('http://localhost:8080/api/message')
    assert_true(response.ok)

def test_request_response_location():
    """Test de response de tokenFCM"""
    response = requests.post('http://localhost:8080/api/location')
    assert_true(response.ok)

def test_request_response_token_FCM():
    """Test de response de tokenFCM"""
    response = requests.post('http://localhost:8080/api/token_FCM')
    assert_true(response.ok)


