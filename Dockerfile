FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    libxcb1 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 7860

##CMD ["streamlit", "run", "app.py", "--server.port=7860", "--server.address=0.0.0.0"]

CMD ["streamlit","run","app.py","--server.port=7860","--server.address=0.0.0.0","--server.enableCORS=false","--server.enableXsrfProtection=false"]