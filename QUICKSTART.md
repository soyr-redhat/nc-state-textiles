# Quick Start Guide - LibreChat on OpenShift

Get LibreChat running in under 10 minutes.

## Prerequisites

```bash
# Verify you have oc CLI
oc version

# Login to OpenShift
oc login https://api.your-cluster.com:6443
```

## Deploy in 5 Steps

### 1. Generate Secrets

```bash
# Create secrets file from template
cp 00-secrets.yaml.template 00-secrets.yaml

# Generate random keys
export JWT_SECRET=$(openssl rand -base64 32)
export JWT_REFRESH_SECRET=$(openssl rand -base64 32)
export CREDS_KEY=$(openssl rand -base64 32)
export CREDS_IV=$(openssl rand -base64 16)

# Edit secrets file
vi 00-secrets.yaml
```

Update these values in `00-secrets.yaml`:
- `OPENAI_API_KEY`: Your actual API key
- `OPENAI_API_BASE`: Your model endpoint (e.g., `https://api.openai.com/v1`)
- `JWT_SECRET`: Paste generated value
- `JWT_REFRESH_SECRET`: Paste generated value
- `CREDS_KEY`: Paste generated value
- `CREDS_IV`: Paste generated value

### 2. Update Domain

Edit `06-librechat-deployment.yaml`:

Find and replace:
```yaml
DOMAIN_SERVER: "https://librechat-ai-workshop.apps.your-cluster.com"
DOMAIN_CLIENT: "https://librechat-ai-workshop.apps.your-cluster.com"
```

With your actual OpenShift route domain.

### 3. Run Deployment Script

```bash
chmod +x deploy.sh
./deploy.sh
```

### 4. Wait for Pods

```bash
# Watch pods start
oc get pods -w

# Should see:
# mongodb-xxxxx          1/1   Running
# librechat-xxxxx        1/1   Running
# librechat-xxxxx        1/1   Running
```

### 5. Access LibreChat

```bash
# Get URL
oc get route librechat -o jsonpath='{.spec.host}'

# Open in browser
echo "https://$(oc get route librechat -o jsonpath='{.spec.host}')"
```

## First Login

1. Navigate to the URL
2. Click "Sign Up"
3. Create admin account
4. Test a simple prompt: "Hello, how are you?"

## Verify Everything Works

### Test File Upload
1. Click the paperclip icon
2. Upload a test image
3. Ask: "What's in this image?"

### Test Document Upload
1. Upload a PDF
2. Ask: "Summarize this document"

### Test Model Selection
1. Click model dropdown
2. Verify your models appear
3. Switch between models

## Troubleshooting

### Pods not starting?

```bash
# Check events
oc get events --sort-by='.lastTimestamp'

# Check logs
oc logs deployment/librechat
oc logs deployment/mongodb

# Describe pod
oc describe pod -l app=librechat
```

### Can't access route?

```bash
# Verify route exists
oc get route

# Check route details
oc describe route librechat

# Test from pod
oc exec deployment/librechat -- curl localhost:3080/api/health
```

### File uploads failing?

```bash
# Check PVC
oc get pvc

# Verify mount
oc exec deployment/librechat -- ls -la /app/api/uploads
```

### Model API not connecting?

```bash
# Check secrets
oc get secret librechat-secrets -o yaml

# Test from pod
oc exec deployment/librechat -- env | grep OPENAI
```

## Scale for Workshop

```bash
# More participants? Scale up
oc scale deployment/librechat --replicas=3

# Check status
oc get pods -l app=librechat
```

## Useful Commands

```bash
# View all resources
oc get all

# Follow logs
oc logs -f deployment/librechat

# Restart deployment
oc rollout restart deployment/librechat

# Check resource usage
oc adm top pods

# Shell into pod
oc exec -it deployment/librechat -- /bin/bash
```

## Clean Up

```bash
# Delete everything
chmod +x cleanup.sh
./cleanup.sh
```

## Next Steps

- Review [WORKSHOP-CHECKLIST.md](WORKSHOP-CHECKLIST.md) for workshop prep
- Read [README-OPENSHIFT.md](README-OPENSHIFT.md) for detailed documentation
- Test all lab scenarios from [CLAUDE.md](CLAUDE.md)

## Support

### Common Issues

| Issue | Solution |
|-------|----------|
| 403 Forbidden | Check API key in secrets |
| 500 Internal Error | Check MongoDB connection |
| Can't upload files | Verify PVC status and mounts |
| Slow responses | Check model API latency |
| Pods crashing | Check memory limits |

### Health Checks

```bash
# Application health
curl https://$(oc get route librechat -o jsonpath='{.spec.host}')/api/health

# MongoDB health
oc exec deployment/mongodb -- mongosh --eval "db.adminCommand('ping')"
```

### Logs Location

```bash
# Application logs
oc logs deployment/librechat

# Previous crash logs
oc logs deployment/librechat --previous

# All logs
oc logs deployment/librechat --all-containers=true
```

## Default Credentials

**First user registered becomes admin.**

Consider creating admin account before workshop:
- Username: `workshop-admin`
- Email: `admin@workshop.local`
- Password: `[Choose secure password]`

Then share participant registration link.

---

**Ready for the workshop? Check [WORKSHOP-CHECKLIST.md](WORKSHOP-CHECKLIST.md)!**
