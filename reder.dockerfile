FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    libreadline-dev libncurses5 wget unzip screen && \
    rm -rf /var/lib/apt/lists/*

# Copy server files into container
WORKDIR /mta
COPY . /mta

# Expose ports (MTA uses these)
EXPOSE 22003/udp
EXPOSE 22005/tcp
EXPOSE 22126/udp

# Run MTA server
CMD ["./mta-server64", "-t"]
