# AI Workshop: Practical Prompt Engineering for Marketing & Sales

**Complete workshop package for teaching prompt engineering and AI skills to non-technical professionals.**

---

## 📋 Overview

This repository contains everything needed to deliver a 3-hour hands-on AI workshop:
- ✅ Complete workshop curriculum
- ✅ OpenShift deployment files for LibreChat
- ✅ Sample data files (CSV, reports)
- ✅ Prompt engineering cheat sheet
- ✅ 20+ ready-to-use prompt templates
- ✅ Presentation slide outline
- ✅ Instructor facilitation guide

**Target Audience:** Marketing and sales professionals with no coding experience
**Duration:** 3 hours (2:00–5:00 PM)
**Platform:** LibreChat on OpenShift
**Focus:** Practical, hands-on learning

---

## 🚀 Quick Start

### For Instructors:

1. **Review workshop content:**
   ```bash
   cat WORKSHOP-GUIDE.md          # Participant guide
   cat INSTRUCTOR-GUIDE.md        # Facilitator notes
   cat SLIDES-OUTLINE.md          # Presentation structure
   ```

2. **Deploy LibreChat:**
   ```bash
   cat QUICKSTART.md              # Fast deployment guide
   ./deploy.sh                    # Automated deployment
   ```

3. **Prepare materials:**
   - Create slides from `SLIDES-OUTLINE.md`
   - Print `PROMPT-CHEAT-SHEET.md` for participants
   - Share `sample-data/` files with attendees
   - Test platform with `WORKSHOP-CHECKLIST.md`

### For Technical Setup:

1. **Read deployment docs:**
   ```bash
   cat README-OPENSHIFT.md        # Detailed technical guide
   cat QUICKSTART.md              # 5-step quick deploy
   ```

2. **Configure and deploy:**
   ```bash
   cp 00-secrets.yaml.template 00-secrets.yaml
   # Edit secrets with your API keys
   ./deploy.sh
   ```

3. **Verify deployment:**
   ```bash
   oc get pods                    # Check pods running
   oc get route librechat         # Get access URL
   ```

---

## 📁 File Structure

```
.
├── Workshop Content
│   ├── WORKSHOP-GUIDE.md              # Participant guide (hands-on labs)
│   ├── INSTRUCTOR-GUIDE.md            # Facilitator notes and tips
│   ├── PROMPT-CHEAT-SHEET.md          # Quick reference card
│   ├── PROMPT-LIBRARY.md              # 20+ ready-to-use templates
│   ├── SLIDES-OUTLINE.md              # Presentation structure (44 slides)
│   └── WORKSHOP-CHECKLIST.md          # Pre-workshop preparation
│
├── Sample Data
│   ├── sample-data/
│   │   ├── customer-feedback.csv      # Sentiment analysis data
│   │   ├── sales-data.csv             # Sales performance data
│   │   ├── quarterly-sales-report.md  # RAG exercise document
│   │   └── README.md                  # Data file documentation
│
├── OpenShift Deployment
│   ├── 00-secrets.yaml.template       # API keys and secrets
│   ├── 01-configmap.yaml              # LibreChat configuration
│   ├── 02-mongodb-pvc.yaml            # MongoDB storage
│   ├── 03-uploads-pvc.yaml            # File upload storage
│   ├── 04-mongodb-deployment.yaml     # Database deployment
│   ├── 05-mongodb-service.yaml        # Database service
│   ├── 06-librechat-deployment.yaml   # LibreChat application
│   ├── 07-librechat-service.yaml      # Application service
│   ├── 08-route.yaml                  # External access route
│   ├── deploy.sh                      # Automated deployment script
│   ├── cleanup.sh                     # Cleanup script
│   └── librechat.yaml                 # Advanced LibreChat config
│
└── Documentation
    ├── README.md                      # This file
    ├── README-OPENSHIFT.md            # Technical deployment guide
    ├── QUICKSTART.md                  # Fast-track deployment
    └── FILES-OVERVIEW.md              # Complete file reference

```

---

## 🎯 Workshop Overview

### What Participants Will Learn:

1. **AI Fundamentals (20 min)**
   - How Large Language Models work
   - Red Hat AI and enterprise deployment
   - LLM capabilities and limitations

2. **Prompt Engineering (20 min)**
   - Core techniques (role prompting, constraints, few-shot)
   - Bad vs. good prompt examples
   - Temperature and creativity control

3. **Lab 1: Fundamentals (40 min)**
   - Basic → improved prompt progression
   - Output formatting and structure
   - Iterative refinement

4. **Lab 2: Industry Use Cases (40 min)**
   - Product image analysis
   - Competitor analysis
   - Sentiment analysis from feedback
   - Sales data insights
   - Trend forecasting
   - Virtual prototyping

5. **Lab 3: RAG & Documents (20 min)**
   - Upload PDFs and CSVs
   - Ground responses in your data
   - Multi-document analysis

6. **Advanced Techniques (10 min)**
   - Chain-of-thought prompting
   - JSON structured outputs
   - Multi-turn refinement

---

## 🛠️ Technical Requirements

### Infrastructure:
- OpenShift cluster (4.12+)
- 2 vCPU, 4GB RAM minimum for LibreChat
- 30GB storage (10GB MongoDB, 20GB uploads)
- Internet access for model API

### Model API:
- OpenAI-compatible endpoint (GPT, Claude, Granite, etc.)
- API key with sufficient quota
- Recommended: GPT-4 or Claude Sonnet for best results

### Participant Requirements:
- Modern web browser
- Internet connection
- No coding or technical skills required

---

## 📝 Workshop Agenda

| Time | Activity | Duration |
|------|----------|----------|
| 2:00–2:20 | Intro to AI & LLMs | 20 min |
| 2:20–2:35 | What is Prompt Engineering? | 15 min |
| 2:35–2:50 | LibreChat Demo | 15 min |
| 2:50–3:40 | **Lab 1:** Prompt Engineering Basics | 50 min |
| 3:40–4:20 | **Lab 2:** Industry Use Cases | 40 min |
| 4:20–4:40 | **Lab 3:** RAG & Document Upload | 20 min |
| 4:40–4:55 | Advanced Techniques | 15 min |
| 4:55–5:00 | Wrap-up & Reflection | 5 min |

**Total:** 3 hours (with built-in buffer time)

---

## 🎓 Learning Outcomes

By the end of this workshop, participants will be able to:
- ✅ Understand how LLMs work and their limitations
- ✅ Write effective prompts using role, context, and constraints
- ✅ Upload and analyze images, documents, and data
- ✅ Extract insights from customer feedback and sales data
- ✅ Use RAG to ground responses in their own documents
- ✅ Apply prompt engineering to real-world marketing and sales tasks
- ✅ Build a personal prompt library for their team

---

## 📚 Key Resources

### For Participants:
- **WORKSHOP-GUIDE.md** – Complete lab instructions
- **PROMPT-CHEAT-SHEET.md** – Quick reference guide
- **PROMPT-LIBRARY.md** – 20+ copy-paste templates
- **sample-data/** – Practice datasets

### For Instructors:
- **INSTRUCTOR-GUIDE.md** – Facilitation tips and troubleshooting
- **SLIDES-OUTLINE.md** – Presentation structure (44 slides)
- **WORKSHOP-CHECKLIST.md** – Pre-workshop preparation timeline

### For Technical Teams:
- **README-OPENSHIFT.md** – Detailed deployment guide
- **QUICKSTART.md** – Fast-track deployment (5 steps)
- **FILES-OVERVIEW.md** – Complete file reference

---

## 🔧 Deployment

### Quick Deploy (5 minutes):

```bash
# 1. Generate secrets
cp 00-secrets.yaml.template 00-secrets.yaml
# Edit with your API keys

# 2. Deploy everything
./deploy.sh

# 3. Get access URL
oc get route librechat -o jsonpath='{.spec.host}'
```

### Detailed Deploy:

See [QUICKSTART.md](QUICKSTART.md) or [README-OPENSHIFT.md](README-OPENSHIFT.md)

---

## 🎨 Customization

### Adapt for Your Industry:

This workshop uses textiles/fashion examples, but the techniques apply universally:
- **CPG/Retail:** Product analysis, competitor research
- **SaaS:** Customer feedback, feature prioritization
- **Finance:** Market analysis, report summarization
- **Healthcare:** Patient feedback, trend analysis
- **Real Estate:** Property descriptions, market insights

**To customize:**
1. Replace sample data files with your industry data
2. Update use case scenarios in WORKSHOP-GUIDE.md
3. Modify prompt templates in PROMPT-LIBRARY.md
4. Adjust slide examples in SLIDES-OUTLINE.md

---

## 🤝 Support & Contribution

### Getting Help:
- Review troubleshooting sections in README-OPENSHIFT.md
- Check INSTRUCTOR-GUIDE.md for common issues
- Open an issue for bugs or questions

### Improvement Ideas:
- Additional use case scenarios
- Industry-specific prompt templates
- Translation to other languages
- Integration with other AI platforms

---

## 📋 Pre-Workshop Checklist

**1 Week Before:**
- [ ] Deploy LibreChat to OpenShift
- [ ] Test file uploads (image, PDF, CSV)
- [ ] Verify model API connectivity
- [ ] Create presentation from SLIDES-OUTLINE.md
- [ ] Prepare sample data files

**3 Days Before:**
- [ ] Print PROMPT-CHEAT-SHEET.md for participants
- [ ] Test all lab scenarios end-to-end
- [ ] Share LibreChat URL with participants
- [ ] Prepare backup screenshots

**Day Of:**
- [ ] Verify platform is accessible
- [ ] Test file upload functionality
- [ ] Have demo prompts ready
- [ ] Bring printed materials

See [WORKSHOP-CHECKLIST.md](WORKSHOP-CHECKLIST.md) for complete checklist.

---

## 🌟 Success Metrics

### Quantitative:
- 90%+ participants complete at least 2 labs
- Average feedback score 4+/5
- Post-workshop adoption rate

### Qualitative:
- Participants see value for their specific roles
- "Aha moments" during hands-on labs
- Requests for follow-up sessions
- Participants sharing prompts with colleagues

---

## 📄 License

[Add your license here]

---

## ✨ Acknowledgments

Built for practical AI education.
Powered by LibreChat, OpenShift, and Red Hat AI.

---

## 🚀 Ready to Get Started?

1. **Instructors:** Start with [INSTRUCTOR-GUIDE.md](INSTRUCTOR-GUIDE.md)
2. **Technical Teams:** See [QUICKSTART.md](QUICKSTART.md)
3. **Participants:** Review [WORKSHOP-GUIDE.md](WORKSHOP-GUIDE.md)

**Questions?** Check [FILES-OVERVIEW.md](FILES-OVERVIEW.md) for complete documentation.

---

**Let's teach the world to use AI effectively!** 🎓
