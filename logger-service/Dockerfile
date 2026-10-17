FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --user 


FROM python:3.12-slim
WORKDIR /app
RUN useradd --create-home userlogger
COPY . .
COPY --from=builder /root/.local /home/userlogger/.local
COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
#COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
