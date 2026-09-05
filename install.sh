#!/usr/bin/env bash
set -e

# Colors for terminal styling
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Terminal Window UI Header
print_header() {
    clear
    echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC} ${BOLD}AETHERA AUTO-INSTALLER & BUILD SYSTEM${NC}                      ${CYAN}║${NC}"
    echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_step() {
    echo -e "\n${BLUE}▶ ${BOLD}$1${NC}"
    echo -e "${CYAN}-------------------------------------------------------------------${NC}"
}

print_success() {
    echo -e "${GREEN}✔ [SUCCESS] $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ [INFO] $1${NC}"
}

# Ensure script runs with proper permissions
if [ "$EUID" -ne 0 ]; then
    SUDO="sudo"
else
    SUDO=""
fi

print_header

# -----------------------------------------------------------------
# STEP 1: Node.js 24.x & Native Build Tools Installation
# -----------------------------------------------------------------
print_step "Step 1/5: Installing Node.js 24.x and Native Build Tools..."
curl -fsSL https://deb.nodesource.com/setup_24.x | $SUDO bash -
$SUDO apt-get update -y
$SUDO apt-get install -y nodejs build-essential python3
print_success "Node.js and build tools installed successfully."

# -----------------------------------------------------------------
# STEP 2: Enable pnpm via Corepack
# -----------------------------------------------------------------
print_step "Step 2/5: Enabling pnpm via Corepack..."
$SUDO npm install -g corepack
$SUDO corepack enable
$SUDO corepack prepare pnpm@latest --activate
print_success "pnpm enabled and activated successfully."

# -----------------------------------------------------------------
# STEP 3: Verify Versions
# -----------------------------------------------------------------
print_step "Step 3/5: Verifying Environment Versions..."
NODE_VERSION=$(node -v)
PNPM_VERSION=$(pnpm -v)
echo -e "  • Node.js Version : ${GREEN}${NODE_VERSION}${NC}"
echo -e "  • pnpm Version    : ${GREEN}${PNPM_VERSION}${NC}"
print_success "Environment verification completed."

# -----------------------------------------------------------------
# STEP 4: Clone Repository & Setup Workspace
# -----------------------------------------------------------------
print_step "Step 4/5: Cloning Aethera Repository..."
if [ -d "Aethera" ]; then
    print_info "Directory 'Aethera' already exists. Pulling latest changes..."
    cd Aethera
    git pull
else
    git clone https://github.com/RukshanAmodya/Aethera.git
    cd Aethera
fi
print_success "Repository workspace ready."

# -----------------------------------------------------------------
# STEP 5: Install Dependencies & Build Packages
# -----------------------------------------------------------------
print_step "Step 5/5: Installing Dependencies & Building Packages..."
pnpm install
export NODE_OPTIONS="--max-old-space-size=4096"
pnpm build

echo ""
echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC} ${GREEN}${BOLD}BUILD COMPLETED SUCCESSFULLY!${NC}                                    ${CYAN}║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════════╝${NC}"
echo ""
