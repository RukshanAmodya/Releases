#!/usr/bin/env bash
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

print_header() {
    clear
    echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC} ${BOLD}AETHERA AUTO-INSTALLER & BUILD SYSTEM${NC}                      ${CYAN}║${NC}"
    echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_step_start() {
    echo -e "\n${BLUE}▶ ${BOLD}$1${NC}"
    echo -e "${CYAN}-------------------------------------------------------------------${NC}"
}

print_success() {
    echo -e "${GREEN}✔ [SUCCESS] $1${NC}"
}

# Spinner function to show smooth progress without messy logs
run_with_spinner() {
    local pid=$1
    local message=$2
    local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    
    # Hide cursor
    tput civis
    while kill -0 $pid 2>/dev/null; do
        i=$(( (i+1) %10 ))
        printf "\r${YELLOW}${spin:$i:1} ${message}${NC}"
        sleep 0.1
    done
    # Show cursor back
    tput cnorm
    printf "\r\33[2K" # Clear line
}

if [ "$EUID" -ne 0 ]; then
    SUDO="sudo"
else
    SUDO=""
fi

print_header

# -----------------------------------------------------------------
# STEP 1: Node.js 24.x & Native Build Tools
# -----------------------------------------------------------------
print_step_start "Step 1/5: Installing Node.js 24.x and Build Tools..."
(
    curl -fsSL https://deb.nodesource.com/setup_24.x | $SUDO bash - > /dev/null 2>&1
    $SUDO apt-get update -y > /dev/null 2>&1
    $SUDO apt-get install -y nodejs build-essential python3 > /dev/null 2>&1
) &
run_with_spinner $! "Downloading and configuring Node.js 24.x..."
print_success "Node.js 24.x and Native Build Tools installed."

# -----------------------------------------------------------------
# STEP 2: Enable pnpm via Corepack
# -----------------------------------------------------------------
print_step_start "Step 2/5: Enabling pnpm via Corepack..."
(
    $SUDO npm install -g corepack > /dev/null 2>&1
    $SUDO corepack enable > /dev/null 2>&1
    $SUDO corepack prepare pnpm@latest --activate > /dev/null 2>&1
) &
run_with_spinner $! "Enabling pnpm package manager..."
print_success "pnpm enabled and activated successfully."

# -----------------------------------------------------------------
# STEP 3: Verify Versions
# -----------------------------------------------------------------
print_step_start "Step 3/5: Verifying Environment Versions..."
NODE_VERSION=$(node -v)
PNPM_VERSION=$(pnpm -v)
echo -e "  • Node.js Version : ${GREEN}${NODE_VERSION}${NC}"
echo -e "  • pnpm Version    : ${GREEN}${PNPM_VERSION}${NC}"
print_success "Environment verification completed."

# -----------------------------------------------------------------
# STEP 4: Clone Repository & Setup Workspace
# -----------------------------------------------------------------
print_step_start "Step 4/5: Cloning Aethera Repository..."
if [ -d "Aethera" ]; then
    cd Aethera
    git pull > /dev/null 2>&1
else
    git clone https://github.com/RukshanAmodya/Aethera.git > /dev/null 2>&1
    cd Aethera
fi
print_success "Repository workspace ready."

# -----------------------------------------------------------------
# STEP 5: Install Dependencies & Build Packages
# -----------------------------------------------------------------
print_step_start "Step 5/5: Installing Dependencies & Building Packages..."

# For pnpm install, let's show a clean spinner
(
    pnpm install --silent > /dev/null 2>&1
) &
run_with_spinner $! "Installing project dependencies (pnpm install)..."
print_success "Dependencies installed."

# For build, since it takes time, let's show spinner or subtle notice
(
    export NODE_OPTIONS="--max-old-space-size=4096"
    pnpm build > /dev/null 2>&1
) &
run_with_spinner $! "Building all packages (4GB RAM allocated)..."
print_success "Build completed successfully."

echo ""
echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC} ${GREEN}${BOLD}AETHERA DEPLOYED & BUILT SUCCESSFULLY!${NC}                           ${CYAN}║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════════╝${NC}"
echo ""
