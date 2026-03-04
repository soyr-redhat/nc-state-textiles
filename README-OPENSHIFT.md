# OpenShift Deployment Guide for AI Workshop

This guide provides step-by-step instructions to deploy LibreChat on OpenShift for the AI Workshop.

## Architecture Overview

```
Users (browser)
      ↓
Route (HTTPS)
      ↓
LibreChat Service
      ↓
LibreChat Pod(s)
      ↓
MongoDB (session storage)
      ↓
Model API Endpoint (OpenAI-compatible)
```

## Prerequisites

- OpenShift cluster access (4.12+)
- `oc` CLI installed and logged in
- Cluster admin or project admin permissions
- GPU node pool (optional, for model hosting)
- Model API endpoint URL and API key

## Quick Start

```bash
# 1. Create project
oc new-project ai-workshop

# 2. Configure secrets
cp 00-secrets.yaml.template 00-secrets.yaml
# Edit 00-secrets.yaml with your API keys

# 3. Deploy in order
oc apply -f 00-secrets.yaml
oc apply -f 01-configmap.yaml
oc apply -f 02-mongodb-pvc.yaml
oc apply -f 03-uploads-pvc.yaml
oc apply -f 04-mongodb-deployment.yaml
oc apply -f 05-mongodb-service.yaml
oc apply -f 06-librechat-deployment.yaml
oc apply -f 07-librechat-service.yaml
oc apply -f 08-route.yaml

# 4. Wait for pods to be ready
oc get pods -w

# 5. Get the route URL
oc get route librechat -o jsonpath='{.spec.host}'
```

## Deployment Files

| File | Purpose |
|------|---------|
| `00-secrets.yaml` | API keys and credentials |
| `01-configmap.yaml` | LibreChat configuration |
| `02-mongodb-pvc.yaml` | MongoDB persistent storage |
| `03-uploads-pvc.yaml` | File upload storage |
| `04-mongodb-deployment.yaml` | MongoDB database |
| `05-mongodb-service.yaml` | MongoDB service |
| `06-librechat-deployment.yaml` | LibreChat application |
| `07-librechat-service.yaml` | LibreChat service |
| `08-route.yaml` | External access route |

## Configuration Steps

### 1. Set up API Endpoint

Edit `00-secrets.yaml`:
- `OPENAI_API_KEY`: Your model API key
- `OPENAI_API_BASE`: Your model endpoint URL (e.g., https://api.your-company.com/v1)

### 2. Configure Multi-User Access

In `01-configmap.yaml`:
- Set `ALLOW_REGISTRATION=true` for workshop
- Configure rate limits
- Enable file uploads

### 3. Storage Configuration

Default storage:
- MongoDB: 10Gi
- Uploads: 20Gi

Adjust in PVC files if needed.

## Workshop-Specific Features

### Enabled Capabilities
- Image uploads (PNG, JPG, JPEG)
- Document uploads (PDF, CSV, TXT, DOCX)
- Multi-user support
- Conversation history
- Model selection
- RAG (via file uploads)

### Rate Limits
- 100 requests per 15 minutes per user
- Configurable in deployment

## Access & Users

### Workshop Day Setup

1. Share the route URL with participants
2. First user to register becomes admin (optional: pre-create admin)
3. Participants self-register or use shared credentials
4. Test with sample prompts before workshop

### User Management

For production workshops, consider:
- Pre-create user accounts
- Use LDAP/OIDC integration
- Set consistent passwords
- Provide user list to participants

## Monitoring

```bash
# Check pod status
oc get pods

# View logs
oc logs -f deployment/librechat

# Check MongoDB
oc exec -it deployment/mongodb -- mongosh

# Check storage usage
oc get pvc
```

## Troubleshooting

### LibreChat pod not starting
```bash
oc logs deployment/librechat
oc describe pod -l app=librechat
```

### Cannot upload files
- Check PVC status: `oc get pvc uploads-pvc`
- Verify mount: `oc describe deployment librechat`

### Model API connection issues
- Verify secrets: `oc get secret librechat-secrets`
- Test endpoint connectivity from pod:
  ```bash
  oc exec deployment/librechat -- curl -I $OPENAI_API_BASE
  ```

### MongoDB connection errors
- Check MongoDB pod: `oc get pods -l app=mongodb`
- View MongoDB logs: `oc logs deployment/mongodb`

## Scaling

For larger workshops (30+ users):

```bash
# Scale LibreChat pods
oc scale deployment/librechat --replicas=3

# Increase MongoDB resources
oc set resources deployment/mongodb --limits=cpu=2,memory=4Gi
```

## Cleanup

After workshop:

```bash
# Delete all resources
oc delete project ai-workshop

# Or keep project, delete deployments
oc delete all --all
oc delete pvc --all
```

## Security Considerations

- Use HTTPS routes (automatic with OpenShift)
- Rotate API keys after workshop
- Review uploaded files
- Clear user data per privacy policy
- Enable network policies for production

## Post-Workshop

- Export conversation data (if permitted)
- Collect feedback via LibreChat
- Archive successful prompts
- Clean up user accounts
- Backup interesting sessions

## Support

For issues during workshop setup:
- Check OpenShift events: `oc get events --sort-by='.lastTimestamp'`
- Review pod logs
- Verify network connectivity
- Confirm API quotas

## Advanced: Hosting Your Own Model

See `model-serving/` directory for deploying vLLM or TGI on OpenShift with GPU support.
