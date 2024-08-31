# Step 1: Use an official Python runtime as a base image
FROM python:3.9-slim

# Step 2: Set the working directory in the container
WORKDIR /usr/src/app

# Step 3: Copy the dependencies file to the working directory
COPY ./book_catalog/requirements.txt ./

# Step 4: Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the application source code to the working directory
COPY ./book_catalog ./book_catalog

# Step 6: Expose the port the app runs on
EXPOSE 5000

# Step 7: Define the command to run the application
CMD ["uvicorn", "book_catalog.main:app", "--host", "0.0.0.0", "--port", "5000"]
