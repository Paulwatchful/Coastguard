# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app
RUN pip install --upgrade pip
# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Use uvicorn to run your FastAPI app
ENTRYPOINT ["uvicorn"]
CMD ["main:fastapi_app", "--host", "0.0.0.0", "--port", "80", "--workers", "1"]
