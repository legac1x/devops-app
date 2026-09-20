#!/usr/bin/python3 
from fastapi import FastAPI 

app = FastAPI()

@app.get('/')
async def root():
    return {"message": "Hellooo world"}

@app.get('/health')
async def get_health():
    return {"status": "ok"}
