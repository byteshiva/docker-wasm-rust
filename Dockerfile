FROM ubuntu:latest
MAINTAINER btassone <brandontassone@gmail.com>

# Update and upgrade before everything
RUN apt-get update && \
apt-get upgrade

# Install packages for cargo crate installations
RUN apt-get install gcc pkg-config libssl-dev -y

# Install curl and rust
RUN apt-get install curl -y && \
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add the node PPA
RUN curl -sL https://deb.nodesource.com/setup_12.x | sh

# Add the Yarn PPA
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Run Update and install Node and Yarn
RUN apt-get update && apt-get install nodejs yarn -y

# Export the cargo bin path
ENV PATH="/root/.cargo/bin:${PATH}"

# Install wasm-pack and cargo-generate
RUN cargo install wasm-pack && cargo install cargo-generate

# Add the root user to $USER so cargo can find it for cargo generate
ENV USER=root
ENV PROJECT_NAME='wasm-project'

# Copy the entrypoint file over
COPY docker-entrypoint.sh /usr/local/bin/

# Set the entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
