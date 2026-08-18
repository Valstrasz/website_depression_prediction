# Stage 1: Base build stage
FROM python:3.14.6-slim AS app_estimator_stage_build
 
# Create the app directory
RUN mkdir /app_estimator
 
# Set the working directory
WORKDIR /app_estimator
 
# Set environment variables to optimize Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
 
# Upgrade pip and install dependencies
RUN pip install --upgrade pip
 
# Copy the requirements file first (better caching)
COPY requirements.txt /app_estimator/
 
# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt