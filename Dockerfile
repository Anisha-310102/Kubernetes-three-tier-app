# Use official Python image
FROM python:3.9

# Set working directory inside container
WORKDIR /app

# Copy the Flask app files
COPY . .

# Install Flask and other packages
RUN pip install -r requirements.txt

# Run the app
CMD ["python", "app.py"]

