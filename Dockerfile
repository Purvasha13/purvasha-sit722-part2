# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the dependencies file to the working directory
COPY book_catalog/requirements.txt ./

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application source code to the working directory
COPY book_catalog/ ./book_catalog/

# Expose the port the app runs on
EXPOSE 8000

# Define the command to run the application
CMD ["uvicorn", "book_catalog.main:app", "--host", "0.0.0.0", "--port", "8000"]
