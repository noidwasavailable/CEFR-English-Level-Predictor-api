# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Install gcc and other dependencies
RUN apt-get update && apt-get install -y \
  gcc \
  libc-dev \
  libffi-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 8000

# Run the command to start uvicorn
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]
