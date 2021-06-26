# Python image to use.
FROM python:3.9

#upgrade pip
RUN python -m pip install --upgrade pip

RUN apt-get update && apt-get install -y libsndfile1
RUN apt-get install -y libsndfile1-dev


# copy the requirements file used for dependencies
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the working directory contents into the container at /app
COPY . ./app

# Set the working directory to /app
WORKDIR /app

# Run app.py when the container launches
ENTRYPOINT ["python", "app.py"]
