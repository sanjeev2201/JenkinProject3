# Use official Python base image
FROM python:3.12.10

# Set working directory inside container
WORKDIR /app

# Copy local files to container
COPY . .

# Create virtual environment
RUN python3 -m venv /app/env

# Activate and install packages inside venv
RUN /app/env/bin/pip install --upgrade pip && \
    /app/env/bin/pip install -r requirements.txt


# Expose port
EXPOSE 5000

# Run Flask app
CMD ["/app/env/bin/python", "app.py"]