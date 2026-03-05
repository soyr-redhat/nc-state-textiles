#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}LibreChat OpenShift Deployment Script${NC}"
echo -e "${GREEN}AI Workshop${NC}"
echo -e "${GREEN}========================================${NC}"
echo

# Check if oc is installed
if ! command -v oc &> /dev/null; then
    echo -e "${RED}Error: 'oc' CLI not found. Please install OpenShift CLI.${NC}"
    exit 1
fi

# Check if logged in
if ! oc whoami &> /dev/null; then
    echo -e "${RED}Error: Not logged into OpenShift. Run 'oc login' first.${NC}"
    exit 1
fi

# Get current project
CURRENT_PROJECT=$(oc project -q 2>/dev/null || echo "")

if [ -z "$CURRENT_PROJECT" ]; then
    echo -e "${YELLOW}No project selected.${NC}"
    read -p "Enter project name to create: " PROJECT_NAME
    echo "Creating new project $PROJECT_NAME..."
    oc new-project $PROJECT_NAME
    CURRENT_PROJECT=$PROJECT_NAME
else
    echo -e "Current project: ${GREEN}$CURRENT_PROJECT${NC}"
    echo
    read -p "Deploy to this project? (y/n): " CONFIRM
    if [[ ! $CONFIRM =~ ^[Yy]$ ]]; then
        read -p "Enter new project name: " PROJECT_NAME
        echo "Creating new project $PROJECT_NAME..."
        oc new-project $PROJECT_NAME
        CURRENT_PROJECT=$PROJECT_NAME
    fi
fi

echo
echo -e "Deploying to project: ${GREEN}$CURRENT_PROJECT${NC}"
echo

# Change to openshift directory
cd openshift

# Check if secrets file exists
if [ ! -f "00-secrets.yaml" ]; then
    echo -e "${YELLOW}Warning: 00-secrets.yaml not found.${NC}"
    echo "Creating from template..."
    cp 00-secrets.yaml.template 00-secrets.yaml
    echo -e "${RED}Please edit 00-secrets.yaml with your actual values before continuing.${NC}"
    echo
    echo "Generate random secrets with:"
    echo "  JWT_SECRET: openssl rand -base64 32"
    echo "  JWT_REFRESH_SECRET: openssl rand -base64 32"
    echo "  CREDS_KEY: openssl rand -base64 32"
    echo "  CREDS_IV: openssl rand -base64 16"
    echo
    read -p "Press Enter after editing 00-secrets.yaml to continue..."
fi

# Deploy resources in order
echo -e "${YELLOW}Deploying secrets...${NC}"
oc apply -f 00-secrets.yaml
echo

echo -e "${YELLOW}Deploying configmap...${NC}"
oc apply -f 01-configmap.yaml
echo

echo -e "${YELLOW}Creating persistent volume claims...${NC}"
oc apply -f 02-mongodb-pvc.yaml
oc apply -f 03-uploads-pvc.yaml
echo

echo -e "${YELLOW}Deploying MongoDB...${NC}"
oc apply -f 04-mongodb-deployment.yaml
oc apply -f 05-mongodb-service.yaml
echo

echo -e "${YELLOW}Waiting for MongoDB to be ready...${NC}"
oc rollout status deployment/mongodb --timeout=5m
echo

echo -e "${YELLOW}Deploying LibreChat...${NC}"
oc apply -f 06-librechat-deployment.yaml
oc apply -f 07-librechat-service.yaml
oc apply -f 08-route.yaml
echo

echo -e "${YELLOW}Waiting for LibreChat to be ready...${NC}"
oc rollout status deployment/librechat --timeout=5m
echo

# Get route URL
ROUTE_URL=$(oc get route librechat -o jsonpath='{.spec.host}')

echo
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Deployment Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo
echo -e "Project:          ${GREEN}$CURRENT_PROJECT${NC}"
echo -e "LibreChat URL:    ${GREEN}https://$ROUTE_URL${NC}"
echo
echo "Next steps:"
echo "1. Visit the URL above"
echo "2. Register the first admin user"
echo "3. Test file uploads"
echo "4. Test model connectivity"
echo
echo "Useful commands:"
echo "  View pods:        oc get pods"
echo "  View logs:        oc logs -f deployment/librechat"
echo "  Scale up:         oc scale deployment/librechat --replicas=3"
echo "  Get route:        oc get route librechat"
echo
echo -e "${GREEN}Ready for workshop!${NC}"
