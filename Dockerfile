FROM nikolaik/python-nodejs:python3.10-nodejs19-slim  # Use slim variant

# Install FFmpeg and cleanup in one layer
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip3 install --no-cache-dir -U -r requirements.txt

# Copy application files
COPY . .

CMD ["bash", "start"]
