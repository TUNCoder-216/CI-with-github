# Start from an official Python base image
FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Copy dependency list first (caching optimization)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code
COPY . .

# Tell Docker which port the app listens on
EXPOSE 5000

# Command that runs when the container starts
CMD ["python", "app.py"]