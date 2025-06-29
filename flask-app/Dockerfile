# Use an official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install dependencies only when requirements.txt changes
COPY app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Then copy the rest of your code
COPY app/ ./

# Expose the Flask port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
