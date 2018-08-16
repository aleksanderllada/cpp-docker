# Base image is a gcc-ready image
FROM gcc:8.2

# Install any C++ libraries required for running your program
RUN apt-get update && apt-get install -y libboost-all-dev

# Copy the code into the container
COPY cpp-program /opt/cpp-program

# Build the C++ code
RUN cd /opt/cpp-program && make

# Set the container's workdir
WORKDIR /opt/cpp-program/bin

ENTRYPOINT ["./program"]
