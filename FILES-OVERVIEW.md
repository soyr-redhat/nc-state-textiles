# OpenShift Deployment Files Overview

Complete list of files created for the AI Workshop LibreChat deployment.

## Workshop Planning

### CLAUDE.md
**Purpose:** Complete workshop curriculum and agenda
- 3-hour workshop plan (2:00-5:00 PM)
- Lab exercises and scenarios
- Prompt engineering techniques
- Use cases for marketing/sales in textiles

**Use:** Reference for conducting the workshop

---

## Deployment Files

### Core Configuration

#### 00-secrets.yaml.template
**Purpose:** Template for sensitive configuration
- API keys for model endpoints
- MongoDB connection string
- JWT secrets for authentication
- Encryption keys

**Action Required:** Copy to `00-secrets.yaml` and fill in actual values

#### 01-configmap.yaml
**Purpose:** Application configuration
- LibreChat settings
- File upload limits
- Rate limiting
- UI customization
- Model defaults

**Action Required:** Review and adjust settings as needed

### Storage

#### 02-mongodb-pvc.yaml
**Purpose:** Persistent storage for MongoDB
- 10Gi storage for user data, conversations
- ReadWriteOnce access mode

**Action Required:** Adjust storage size if needed

#### 03-uploads-pvc.yaml
**Purpose:** Persistent storage for file uploads
- 20Gi storage for images, PDFs, CSVs
- ReadWriteMany for multi-pod access

**Action Required:** Ensure RWX-capable storage class available

### Database

#### 04-mongodb-deployment.yaml
**Purpose:** MongoDB database deployment
- Single replica (sufficient for workshop)
- Health probes
- Resource limits

**Action Required:** Scale resources for production use

#### 05-mongodb-service.yaml
**Purpose:** Internal service for MongoDB
- ClusterIP service
- Port 27017

**Action Required:** None (works as-is)

### Application

#### 06-librechat-deployment.yaml
**Purpose:** Main LibreChat application
- 2 replicas for redundancy
- Environment variables from secrets/configmap
- Volume mounts for uploads
- Health checks

**Action Required:** Update DOMAIN_SERVER and DOMAIN_CLIENT with your route

#### 07-librechat-service.yaml
**Purpose:** Internal service for LibreChat
- ClusterIP with session affinity
- Port 3080

**Action Required:** None (works as-is)

#### 08-route.yaml
**Purpose:** External HTTPS access
- Edge TLS termination
- HTTP redirect to HTTPS
- 5-minute timeout for long requests

**Action Required:** None (route auto-assigned)

---

## Deployment Scripts

### deploy.sh
**Purpose:** Automated deployment script
- Creates OpenShift project
- Applies all manifests in correct order
- Waits for pods to be ready
- Displays access URL

**Usage:**
```bash
chmod +x deploy.sh
./deploy.sh
```

### cleanup.sh
**Purpose:** Complete environment removal
- Deletes entire project and resources
- Includes safety confirmation

**Usage:**
```bash
chmod +x cleanup.sh
./cleanup.sh
```

---

## Configuration Files

### librechat.yaml
**Purpose:** Advanced LibreChat configuration
- Rate limiting rules
- File upload settings
- Model specifications
- Workshop-specific presets:
  - Product Description Writer
  - Image Analyst
  - Sentiment Analyzer
  - Trend Forecaster
  - Creative Copywriter

**Use:** Optional advanced customization (mount as ConfigMap)

---

## Documentation

### README-OPENSHIFT.md
**Purpose:** Comprehensive deployment guide
- Architecture overview
- Detailed setup instructions
- Configuration explanations
- Troubleshooting guide
- Monitoring commands
- Security considerations

**Audience:** Technical team deploying the platform

### QUICKSTART.md
**Purpose:** Fast-track deployment guide
- 5-step deployment process
- Essential commands only
- Quick troubleshooting
- Common issues and solutions

**Audience:** Experienced OpenShift users needing quick setup

### WORKSHOP-CHECKLIST.md
**Purpose:** Pre-workshop preparation checklist
- Timeline (1 week, 3 days, 1 day before)
- Infrastructure verification
- Testing procedures
- Morning-of checklist
- Emergency contacts template
- Success criteria

**Audience:** Workshop organizer and facilitator

### FILES-OVERVIEW.md (this file)
**Purpose:** Documentation of all files
- What each file does
- What actions are required
- How files relate to each other

**Audience:** Anyone reviewing the deployment package

---

## Deployment Order

Files must be applied in this order:

1. **Secrets** (`00-secrets.yaml`) - Before anything else
2. **ConfigMap** (`01-configmap.yaml`) - Before deployments
3. **PVCs** (`02-mongodb-pvc.yaml`, `03-uploads-pvc.yaml`) - Before deployments
4. **MongoDB** (`04-mongodb-deployment.yaml`, `05-mongodb-service.yaml`) - Before LibreChat
5. **LibreChat** (`06-librechat-deployment.yaml`, `07-librechat-service.yaml`, `08-route.yaml`) - Last

The `deploy.sh` script handles this automatically.

---

## File Dependencies

```
00-secrets.yaml
    ↓
06-librechat-deployment.yaml
    ↓
07-librechat-service.yaml
    ↓
08-route.yaml

01-configmap.yaml
    ↓
06-librechat-deployment.yaml

02-mongodb-pvc.yaml
    ↓
04-mongodb-deployment.yaml
    ↓
05-mongodb-service.yaml

03-uploads-pvc.yaml
    ↓
06-librechat-deployment.yaml
```

---

## Customization Points

### Before Workshop

1. **API Configuration** (`00-secrets.yaml`)
   - Set your model API endpoint
   - Add API keys

2. **Domain Names** (`06-librechat-deployment.yaml`)
   - Update DOMAIN_SERVER
   - Update DOMAIN_CLIENT

3. **User Capacity** (`01-configmap.yaml`)
   - Adjust MESSAGE_RATE_LIMIT
   - Set registration limits

4. **Storage Sizes** (`02-mongodb-pvc.yaml`, `03-uploads-pvc.yaml`)
   - Increase if expecting heavy usage

### Optional Advanced

5. **Custom Presets** (`librechat.yaml`)
   - Add industry-specific prompt templates
   - Configure model parameters

6. **Scaling** (`06-librechat-deployment.yaml`)
   - Increase replicas for larger workshops
   - Adjust resource limits

---

## Quick Reference

| Task | Command |
|------|---------|
| Deploy everything | `./deploy.sh` |
| Get access URL | `oc get route librechat -o jsonpath='{.spec.host}'` |
| View logs | `oc logs -f deployment/librechat` |
| Scale up | `oc scale deployment/librechat --replicas=3` |
| Restart | `oc rollout restart deployment/librechat` |
| Clean up | `./cleanup.sh` |

---

## File Sizes (Approximate)

- YAML manifests: ~15 KB total
- Documentation: ~50 KB total
- Scripts: ~5 KB total
- **Total package: ~70 KB**

All files are text-based and version control friendly.

---

## Next Steps

1. ✅ Review `QUICKSTART.md` for immediate deployment
2. ✅ Check `WORKSHOP-CHECKLIST.md` for preparation timeline
3. ✅ Read `README-OPENSHIFT.md` for detailed understanding
4. ✅ Review `CLAUDE.md` for workshop content
5. ✅ Test deployment in dev environment first
6. ✅ Prepare workshop materials (images, CSVs, PDFs)

---

**Ready to deploy? Start with `QUICKSTART.md`!**
