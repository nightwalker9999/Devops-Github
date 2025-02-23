# Use an official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir flask requests

# Expose the Flask port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
