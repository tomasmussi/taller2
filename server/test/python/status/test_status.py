from nose.tools import assert_true
import requests

def test_request_response_login():
    """Test de response de login"""
    response = requests.get('http://localhost:8080/api/login')
    assert_true(response.ok)

def test_request_response_logout():
    """Test de response de logout"""
    response = requests.get('http://localhost:8080/api/logout')
    assert_true(response.ok)

def test_request_response_job_positions():
    """Test de response de job_positions"""
    response = requests.get('http://localhost:8080/api/job_positions')
    assert_true(response.ok)

def test_request_response_categories():
    """Test de response de categories"""
    response = requests.get('http://localhost:8080/api/categories')
    assert_true(response.ok)

def test_request_response_skills():
    """Test de response de skills"""
    response = requests.get('http://localhost:8080/api/skills')
    assert_true(response.ok)

def test_request_response_my_profile():
    """Test de response de my_profile"""
    response = requests.get('http://localhost:8080/api/my_profile')
    assert_true(response.ok)

def test_request_response_profile():
    """Test de response de profile"""
    response = requests.get('http://localhost:8080/api/profile')
    assert_true(response.ok)

def test_request_response_fb_login():
    """Test de response de fb_login"""
    response = requests.get('http://localhost:8080/api/my_profile')
    assert_true(response.ok)

def test_request_response_edit():
    """Test de response de edit"""
    response = requests.get('http://localhost:8080/api/edit')
    assert_true(response.ok)

def test_request_response_add_contact():
    """Test de response de add_contact"""
    response = requests.post('http://localhost:8080/api/add_contact')
    assert_true(response.ok)

def test_request_response_add_contact():
    """Test de response de add_contact"""
    response = requests.post('http://localhost:8080/api/add_contact')
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
    response = requests.get('http://localhost:8080/api/vote')
    assert_true(response.ok)

def test_request_response_popular():
    """Test de response de popular"""
    response = requests.get('http://localhost:8080/api/popular')
    assert_true(response.ok)

def test_request_response_add_skill():
    """Test de response de add_skill"""
    response = requests.get('http://localhost:8080/api/add_skill')
    assert_true(response.ok)

def test_request_response_delete_skill():
    """Test de response de delete_skill"""
    response = requests.delete('http://localhost:8080/api/delete_skill')
    assert_true(response.ok)

def test_request_response_get_skill():
    """Test de response de get skill"""
    response = requests.get('http://localhost:8080/api/get_skill')
    assert_true(response.ok)

def test_request_response_add_job_position():
    """Test de response de add_job_position"""
    response = requests.get('http://localhost:8080/api/add_job_position')
    assert_true(response.ok)

def test_request_response_delete_job_position():
    """Test de response delete job_position"""
    response = requests.delete('http://localhost:8080/api/delete_job_position')
    assert_true(response.ok)

def test_request_response_send_message():
    """Test de response de send_message"""
    response = requests.post('http://localhost:8080/api/send_message')
    assert_true(response.ok)

def test_request_response_view_messages():
    """Test de response view_messages"""
    response = requests.get('http://localhost:8080/api/view_messages')
    assert_true(response.ok)

def test_request_response_token_FCM():
    """Test de response de tokenFCM"""
    response = requests.post('http://localhost:8080/api/token_FCM')
    assert_true(response.ok)


