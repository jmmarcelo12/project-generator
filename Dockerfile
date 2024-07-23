# Use the latest Ubuntu image as a base
FROM ubuntu:latest

# Update package list and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Install PyYAML using pip
RUN pip3 install PyYAML

# Copy the Python script to the appropriate location
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script to the appropriate location
COPY entrypoint.sh /entrypoint.sh

# Make sure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Define the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
