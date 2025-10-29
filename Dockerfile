FROM python:3.14-slim

# Set workdir
WORKDIR /app

# Copy project files
COPY . .


# Install system dependencies
RUN apt-get update && apt-get install -y gcc libpq-dev && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y postgresql-client

# Make entrypoint executable
RUN chmod +x ./entrypoint.sh

# Use entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
