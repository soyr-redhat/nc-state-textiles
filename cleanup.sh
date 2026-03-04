#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${RED}========================================${NC}"
echo -e "${RED}LibreChat Cleanup Script${NC}"
echo -e "${RED}========================================${NC}"
echo

# Project name
PROJECT_NAME="ai-workshop"

# Check if oc is installed
if ! command -v oc &> /dev/null; then
    echo -e "${RED}Error: 'oc' CLI not found.${NC}"
    exit 1
fi

# Check if logged in
if ! oc whoami &> /dev/null; then
    echo -e "${RED}Error: Not logged into OpenShift.${NC}"
    exit 1
fi

echo -e "${YELLOW}This will delete the entire '$PROJECT_NAME' project and all data.${NC}"
echo -e "${RED}This action cannot be undone!${NC}"
echo
read -p "Are you sure you want to continue? (yes/no): " -r
echo

if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
    echo "Cleanup cancelled."
    exit 0
fi

echo -e "${YELLOW}Deleting project: $PROJECT_NAME${NC}"
oc delete project $PROJECT_NAME

echo
echo -e "${GREEN}Cleanup complete!${NC}"
echo
echo "The project and all resources have been deleted."
echo "PersistentVolumes may take a few minutes to fully remove."
