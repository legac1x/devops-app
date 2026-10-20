from fastapi.testclient import TestClient
from app import app

client = TestClient(app=app)

def test_health():
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json() == {"status": "update health endpoint"}

def test_test_stash():
    response = client.get('/version')
    assert response.status_code == 200
    assert response.json() == {"something": "from main and feature"}
    