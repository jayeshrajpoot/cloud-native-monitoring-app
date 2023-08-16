# Use the official python image as base image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Update and install required packages
RUN apt-get update && \
    apt-get install -y python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the required Python packages
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code to the working directory
COPY . .

# Set the environment variables for the flask app
ENV FLASK_RUN_HOST = 0.0.0.0

# Expose the port on which the flask app will run
EXPOSE 5000

# Start the flask app when the container is running
CMD ["flask", "run"]

