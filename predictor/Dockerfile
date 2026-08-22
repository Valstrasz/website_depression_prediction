# Stage 1: Base build stage
FROM python:3.14.6-slim AS app_predictor_stage_build

# Set environment variables to optimize Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
 
# Create the app directory
RUN mkdir /app_predictor
# Set the working directory
WORKDIR /app_predictor 
 
# Copy the requirements file
COPY requirements.txt .
# Upgrade pip
RUN pip install --upgrade pip
# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the image
COPY --exclude="./_MODEL" . .

# Create a folder to store the model to be used in the image
RUN mkdir -p ./_MODEL ./_MODEL/selected ./_MODEL/version
# Copy the model into the image
COPY ./_MODEL/selected ./_MODEL/selected


# Expose the application port
EXPOSE 5000

# Start the application using Gunicorn (ASGI via Uvicorn)
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000", "--workers", "3", "--timeout", "120", "-k", "uvicorn.workers.UvicornWorker"]