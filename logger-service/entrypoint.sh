#!/bin/bash
chown -R userlogger:userlogger /app
exec su userlogger -c "python3 app.py" 
