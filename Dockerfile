FROM nikolaik/python-nodejs:python3.10-nodejs19-slim  

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -U -r requirements.txt


COPY . .

CMD ["bash", "start"]
