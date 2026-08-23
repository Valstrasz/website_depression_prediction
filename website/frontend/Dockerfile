# Stage 1: Base build stage
FROM node:24-slim AS stage_build_app_website_frontend

# Set environment variables to optimize Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create the app directory
RUN mkdir /app_website
# Set the working directory
WORKDIR /app_website

# Copy the requirements file
COPY package*.json /app_website/
# Install Node dependencies
RUN npm ci

# Copy the project files into the image
COPY . .



# Expose the application port
EXPOSE 5173
 
# Start the application
CMD ["npm", "run", "dev", "--", "--host"]







# ### OLD - OLD - OLD
# ### OLD - OLD - OLD
# ### OLD - OLD - OLD
# # Stage 1: Base build stage
# FROM python:3.14.6-slim AS app_website_stage_build
 
# # Create the app directory
# RUN mkdir /app_website
 
# # Set the working directory
# WORKDIR /app_website
 
# # Set environment variables to optimize Python
# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1
 
# # Upgrade pip and install dependencies
# RUN pip install --upgrade pip
 
# # Copy the requirements file first (better caching)
# COPY requirements.txt /app_website/
 
# # Install Python dependencies
# RUN pip install --no-cache-dir -r requirements.txt
 


# # Stage 2: Production stage
# FROM python:3.14.6-slim AS app_website_stage_production

# RUN useradd -m -r app_website_user && \
#    mkdir /app_website && \
#    chown -R app_website_user /app_website
 
# # Copy the Python dependencies from the "Stage_Build" stage
# COPY --from=app_website_stage_build /usr/local/lib/python3.14/site-packages/ /usr/local/lib/python3.14/site-packages/
# COPY --from=app_website_stage_build /usr/local/bin/ /usr/local/bin/
 
# # Set the working directory
# WORKDIR /app_website
 
# # Copy application code
# COPY --chown=app_website_user:app_website_user . .
 
# # Set environment variables to optimize Python
# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1
 
# # Switch to non-root user
# USER app_website_user


 
# # Expose the application port
# EXPOSE 8000
 
# # Start the application using Gunicorn
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "3", "website.wsgi:application"]