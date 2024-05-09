FROM ubuntu:latest

ARG INSTALL_PYTHON_TK=true
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update -y && apt-get install -y \
    git \
    python3 \
    python3-pip \
    python3-tk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/chuyangliu/snake.git /snake
WORKDIR /snake

# Install Python dependencies
RUN pip install numpy matplotlib pytest
