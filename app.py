#!/usr/bin/python3 
from fastapi import FastAPI 

app = FastAPI()

@app.get('/')
async def root():
    return {"message": "hello, devops"}

@app.get('/health')
async def get_health():
    return {"status": "ok"}

@app.get('/version')
async def test_stash():
    return {"something": "ok"}

