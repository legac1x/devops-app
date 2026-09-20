#!/usr/bin/python3 
from fastapi import FastAPI 

app = FastAPI()

@app.get('/')
async def root():
    """Test dockstring root function """
    return {"message": "hello, devops"}

@app.get('/health')
async def get_health():
    """Test dockstring get_health func"""
    return {"status": "update health endpoint"}

@app.get('/version')
async def test_stash():
    return {"something": "ok"}

