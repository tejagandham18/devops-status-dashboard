
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/

ENV APP_VERSION=1.0.0
ENV ENVIRONMENT=production

EXPOSE 5000

CMD ["python", "app/main.py"]
