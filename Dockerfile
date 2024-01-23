FROM debian:bullseye-slim

# Install basic dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    curl \
    git

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
    libxdamage1 \
    libxi6 \
    libxt6 \
    libxrandr2

RUN apt-get install -y --no-install-recommends \
    libxss1 \
    libxtst6 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libfreetype6 \
    libxcb-randr0 \
    libx11-xcb-dev \
    libxcb-util1 \
    libxcb1

RUN apt-get install -y --no-install-recommends \
    libxkbcommon-x11-0 \
    libxkbcommon0 \
    libx11-6 \
    libx11-dev \
    libxcb-randr0-dev \
    libxcb-util0-dev \
    libxcb1-dev

RUN apt-get install -y --no-install-recommends \
    libxkbcommon-x11-0 \
    libxkbcommon-dev \
    libasound2-dev \
    libxtst-dev \
    libxss-dev \
    libnss3-dev

RUN apt-get install -y --no-install-recommends \
    libatk1.0-dev \
    libatk-bridge2.0-dev \
    libpangocairo-1.0-dev \
    libxcomposite-dev \
    libxcursor-dev \
    libxdamage-dev

RUN apt-get install -y --no-install-recommends \
    libxi-dev \
    libxt-dev \
    libxrandr-dev \
    libxss-dev \
    libxtst-dev \
    libdbus-1-dev \
    libexpat1-dev \
    libfontconfig1-dev

RUN apt-get install -y --no-install-recommends \
    libfreetype6-dev \
    libxcb-randr0-dev \
    libx11-xcb-dev \
    libxcb-util0-dev \
    libxcb1-dev \
    libxkbcommon-x11-0 \
    libxkbcommon-dev

# Install Visual Studio Code
RUN wget -O vscode.deb https://update.code.visualstudio.com/1.63.2/linux-deb-x64/stable \
    && dpkg -i vscode.deb \
    && rm vscode.deb

# Start Visual Studio Code as root
CMD ["code", "--no-sandbox", "--user-data-dir=/root"]
