FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y poppler-utils

COPY . /app

RUN pip install --upgrade pip
RUN pip install --default-timeout=100 --no-cache-dir -r requirements.txt

CMD ["streamlit", "run", "app.py", "--server.port=8502", "--server.address=0.0.0.0"]
