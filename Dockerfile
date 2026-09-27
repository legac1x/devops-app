FROM python:3.12-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt 

FROM python:3.12-slim
WORKDIR /app
RUN useradd --create-home appuser
COPY --from=builder /root/.local /home/appuser/.local
COPY . .
RUN chown -R appuser:appuser /app /home/appuser/.local
USER appuser 
ENV PATH=/home/appuser/.local/bin:$PATH

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
