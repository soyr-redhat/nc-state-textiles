# AI Workshop: Practical Prompt Engineering for Marketing & Sales

Complete workshop package for teaching prompt engineering and AI skills to non-technical professionals.

---

## Overview

**Target Audience:** Marketing and sales professionals (textiles industry)
**Duration:** 3 hours (2:00–5:00 PM)
**Platform:** LibreChat on OpenShift
**Focus:** Hands-on prompt engineering with real use cases

### What's Included:
- OpenShift deployment files for LibreChat
- Workshop participant guide with hands-on labs
- Sample data files (CSV, sales reports) for exercises
- Presentation slide outline
- Prompt engineering reference card

---

## Quick Start

### 1. Deploy LibreChat

```bash
# Login to your OpenShift cluster
oc login --token=<your-token> --server=<your-server>

# Run deployment script
./deploy.sh
```

See `guides/QUICKSTART.md` for detailed deployment instructions.

### 2. Prepare Workshop Materials

**Before the workshop:**
- Review `guides/WORKSHOP-GUIDE.md` (participant instructions)
- Create presentation slides from `SLIDES-OUTLINE.md`
- Print `guides/PROMPT-CHEAT-SHEET.md` as handouts
- Share sample data files from `sample-data/` directory

**Update API Configuration:**
```bash
# Edit secrets with your actual model API endpoint and key
oc edit secret librechat-secrets -n <your-namespace>
```

### 3. Test the Platform

1. Access LibreChat via the route URL
2. Create a test account
3. Upload a sample CSV from `sample-data/`
4. Try a few prompts from the workshop guide

---

## Repository Structure

```
.
├── README.md                      # This file
├── SLIDES-OUTLINE.md              # Presentation structure (44 slides)
├── deploy.sh                      # Automated deployment script
├── cleanup.sh                     # Remove deployment
│
├── guides/
│   ├── WORKSHOP-GUIDE.md          # Main participant guide (labs & exercises)
│   ├── QUICKSTART.md              # Fast deployment instructions
│   └── PROMPT-CHEAT-SHEET.md      # 1-page reference card
│
├── openshift/
│   ├── 00-secrets.yaml.template   # API keys and configuration
│   ├── 01-configmap.yaml          # LibreChat settings
│   ├── 02-mongodb-pvc.yaml        # Database storage
│   ├── 03-uploads-pvc.yaml        # File upload storage
│   ├── 04-mongodb-deployment.yaml # MongoDB database
│   ├── 05-mongodb-service.yaml    # MongoDB service
│   ├── 06-librechat-deployment.yaml # LibreChat application
│   ├── 07-librechat-service.yaml  # LibreChat service
│   └── 08-route.yaml              # HTTPS route
│
└── sample-data/
    ├── customer-feedback.csv      # Customer reviews for sentiment analysis
    ├── sales-data.csv             # Sales performance data
    ├── quarterly-sales-report.md  # Sample report for RAG exercise
    └── README.md                  # Data file documentation
```

---

## Workshop Agenda

| Time | Activity |
|------|----------|
| 2:00–2:20 | Intro to AI & LLMs |
| 2:20–2:35 | What is Prompt Engineering? |
| 2:35–2:50 | LibreChat Demo |
| 2:50–3:40 | Lab 1: Prompt Engineering Basics |
| 3:40–4:20 | Lab 2: Industry Use Cases |
| 4:20–4:40 | Lab 3: RAG & Document Upload |
| 4:40–4:55 | Advanced Techniques |
| 4:55–5:00 | Wrap-up |

---

## Workshop Use Cases

The labs cover real-world marketing and sales scenarios:

- **Product Image Analysis** - Identify visual patterns in successful products
- **Competitor Analysis** - Analyze competitor product positioning
- **Sentiment Analysis** - Extract insights from customer feedback
- **Sales Data Analysis** - Identify top performers and trends
- **Trend Forecasting** - Predict emerging fashion trends from images
- **Document RAG** - Extract insights from sales reports and documents

---

## Prerequisites

### Infrastructure:
- OpenShift cluster (4.12+)
- 2 vCPU, 4GB RAM for LibreChat
- 30GB storage (10GB MongoDB, 20GB uploads)
- OpenAI-compatible model API endpoint

### For Participants:
- Web browser
- No coding experience required

---

## Deployment

### Automated Deployment

```bash
# 1. Create secrets
cp openshift/00-secrets.yaml.template openshift/00-secrets.yaml
# Edit with your API keys

# 2. Deploy everything
./deploy.sh

# 3. Get access URL
oc get route librechat -o jsonpath='{.spec.host}'
```

### Manual Deployment

See `guides/QUICKSTART.md` for step-by-step instructions.

---

## Configuration

### Update Model API

Edit the secrets to configure your model endpoint:

```bash
oc edit secret librechat-secrets
```

Update:
- `OPENAI_API_KEY` - Your API key
- `OPENAI_API_BASE` - Your endpoint URL (e.g., https://api.openai.com/v1)

### Storage Classes

The deployment uses:
- `ocs-storagecluster-ceph-rbd` for MongoDB (RWO)
- `ocs-storagecluster-cephfs` for uploads (RWX)

Adjust in PVC files if your cluster uses different storage classes.

---

## Troubleshooting

### Pods not starting

```bash
# Check pod status
oc get pods

# View logs
oc logs deployment/librechat
oc logs deployment/mongodb

# Check events
oc get events --sort-by='.lastTimestamp'
```

### File uploads failing

```bash
# Verify PVC is bound
oc get pvc

# Check uploads directory permissions
oc exec deployment/librechat -- ls -la /app/client/public/images
```

### Can't access route

```bash
# Check route
oc get route librechat

# Test from inside pod
oc exec deployment/librechat -- curl -I http://localhost:3080
```

---

## Cleanup

Remove the entire deployment:

```bash
./cleanup.sh
```

Or delete specific resources:

```bash
oc delete all -l app=librechat
oc delete pvc mongodb-pvc uploads-pvc
oc delete secret librechat-secrets
oc delete configmap librechat-config
```

---

## Customization

### For Other Industries

The workshop uses textiles/fashion examples, but techniques apply universally:
- Replace sample data with your industry data
- Update use case scenarios in `guides/WORKSHOP-GUIDE.md`
- Adjust product examples in slides

### Scaling for Larger Workshops

```bash
# Increase replicas
oc scale deployment/librechat --replicas=3

# Increase storage if needed
# Edit PVC files before deployment
```

---

## Support

**Issues?**
- Check `guides/QUICKSTART.md` for common problems
- Review OpenShift logs: `oc logs deployment/librechat`
- Verify API configuration in secrets

---

## License

[Add your license here]

---

## Ready to Get Started?

1. Deploy LibreChat: `./deploy.sh`
2. Review participant guide: `guides/WORKSHOP-GUIDE.md`
3. Create your presentation from: `SLIDES-OUTLINE.md`
4. Test with sample data from: `sample-data/`

Let's teach the world to use AI effectively!
