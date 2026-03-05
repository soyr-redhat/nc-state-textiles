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

# Get current project
CURRENT_PROJECT=$(oc project -q 2>/dev/null || echo "")

if [ -z "$CURRENT_PROJECT" ]; then
    echo -e "${RED}Error: No project selected.${NC}"
    echo "Please switch to a project first: oc project <project-name>"
    exit 1
fi

echo -e "Current project: ${YELLOW}$CURRENT_PROJECT${NC}"
echo
echo -e "${YELLOW}This will delete the entire '$CURRENT_PROJECT' project and all data.${NC}"
echo -e "${RED}This action cannot be undone!${NC}"
echo
read -p "Are you sure you want to continue? (type 'yes' to confirm): " -r
echo

if [[ ! $REPLY == "yes" ]]; then
    echo "Cleanup cancelled."
    exit 0
fi

echo -e "${YELLOW}Deleting project: $CURRENT_PROJECT${NC}"
oc delete project $CURRENT_PROJECT

echo
echo -e "${GREEN}Cleanup complete!${NC}"
echo
echo "The project and all resources have been deleted."
echo "PersistentVolumes may take a few minutes to fully remove."
