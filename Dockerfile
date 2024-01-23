FROM debian:bullseye-slim

# Install basic dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    curl \
    git \
    ca-certificates

# Install additional dependencies for Visual Studio Code in smaller batches
RUN apt-get install -y --no-install-recommends \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libdrm2 \
    libgbm1 \
    libxshmfence1 \
    libgtk-3-0 \
    libnss3 \
    libgconf-2-4 \
    libasound2

RUN apt-get install -y --no-install-recommends \
    libxtst6 \
    libxss1 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libpangocairo-1.0-0 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1

# Install CA certificates
RUN update-ca-certificates

# Continue installing additional dependencies
RUN apt-get install -y --no-install-recommends \
    libxi6 \
    libxt6 \
    libxrandr2

# (Omitting the remaining dependency groups for brevity)

# Install Visual Studio Code
RUN wget -O vscode.deb https://update.code.visualstudio.com/1.63.2/linux-deb-x64/stable \
    && dpkg -i vscode.deb \
    && apt-get install -f -y \
    && rm vscode.deb

# Start Visual Studio Code as root
CMD ["code", "--no-sandbox", "--user-data-dir=/root"]
