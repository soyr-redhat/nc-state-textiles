# AI Workshop Pre-Flight Checklist

Use this checklist to ensure everything is ready before April 2.

## 1 Week Before Workshop

### Infrastructure Setup
- [ ] OpenShift cluster access confirmed
- [ ] Project quota verified (CPU, memory, storage)
- [ ] GPU nodes available (if hosting models)
- [ ] Network policies reviewed
- [ ] Storage class identified for PVCs

### API Configuration
- [ ] Model API endpoint URL confirmed
- [ ] API keys generated and tested
- [ ] Rate limits configured
- [ ] Model list verified (GPT-4, Claude, etc.)
- [ ] API quota sufficient for 30+ users

### Deployment
- [ ] Clone/download deployment files
- [ ] Generate secrets (`00-secrets.yaml`)
- [ ] Update DOMAIN_SERVER and DOMAIN_CLIENT in deployment
- [ ] Run `./deploy.sh`
- [ ] Verify all pods running: `oc get pods`
- [ ] Check route accessibility

### Testing
- [ ] Access LibreChat via route URL
- [ ] Register test admin account
- [ ] Test file upload (image)
- [ ] Test file upload (PDF)
- [ ] Test file upload (CSV)
- [ ] Test model response time
- [ ] Test concurrent users (5-10 people)
- [ ] Verify conversation history saves
- [ ] Test logout/login flow

## 3 Days Before Workshop

### Content Preparation
- [ ] Collect 10-20 product images
- [ ] Prepare competitor images
- [ ] Create sample sales CSV
- [ ] Create sample feedback CSV
- [ ] Prepare 1 sample sales report PDF
- [ ] Upload materials to shared location

### Documentation
- [ ] Print participant guide (optional)
- [ ] Prepare prompt cheat sheet
- [ ] Create example prompt library
- [ ] Prepare slide deck
- [ ] Test screen sharing setup

### User Management
- [ ] Decide: self-registration or pre-created accounts?
- [ ] If pre-creating: generate user list
- [ ] If pre-creating: set passwords
- [ ] Create admin account
- [ ] Test multi-user concurrent access

## 1 Day Before Workshop

### Final Testing
- [ ] Full end-to-end test of all lab scenarios
- [ ] Verify Lab 1 prompts work
- [ ] Verify Lab 2 scenarios work
- [ ] Verify RAG/document upload works
- [ ] Test on mobile device (optional)
- [ ] Confirm route URL is stable

### Logistics
- [ ] Share LibreChat URL with participants
- [ ] Share login instructions
- [ ] Confirm room setup (projector, WiFi)
- [ ] Test screen mirroring
- [ ] Backup: have screenshots of expected outputs

### Monitoring
- [ ] Set up log monitoring: `oc logs -f deployment/librechat`
- [ ] Monitor pod resource usage
- [ ] Check MongoDB disk space
- [ ] Check uploads PVC space

### Backup Plan
- [ ] Have local LibreChat Docker backup ready
- [ ] Alternative model API if primary fails
- [ ] Offline slides if demo fails
- [ ] Pre-captured screenshots of successful outputs

## Morning of Workshop (April 2)

### Pre-Workshop Check (1 hour before)
- [ ] Access route URL
- [ ] Verify login works
- [ ] Upload one test image
- [ ] Send one test prompt
- [ ] Check pod status: `oc get pods`
- [ ] Review logs for errors
- [ ] Confirm WiFi in room
- [ ] Test projector connection

### Access Distribution
- [ ] Share URL with participants
- [ ] Share credentials (if needed)
- [ ] Test one participant login

### Materials Ready
- [ ] Product images accessible
- [ ] Sample files ready to share
- [ ] Slide deck open
- [ ] Terminal ready for troubleshooting

## During Workshop

### Active Monitoring
- [ ] Keep terminal open with: `oc get pods -w`
- [ ] Watch for pod crashes
- [ ] Monitor memory usage
- [ ] Check upload storage

### Support
- [ ] Help participants with login issues
- [ ] Assist with file upload problems
- [ ] Answer API/model questions
- [ ] Capture interesting prompts for sharing

## Post-Workshop

### Immediate (Same Day)
- [ ] Export interesting conversations (if permitted)
- [ ] Collect participant feedback
- [ ] Document any issues encountered
- [ ] Note successful prompts for library

### Cleanup (Within 1 Week)
- [ ] Review uploaded files
- [ ] Delete sensitive data
- [ ] Export analytics (if available)
- [ ] Run cleanup: `./cleanup.sh` (or keep for future workshops)
- [ ] Rotate API keys
- [ ] Review costs

### Follow-Up
- [ ] Send prompt library to participants
- [ ] Share recording (if made)
- [ ] Send slide deck
- [ ] Provide cheat sheet
- [ ] Collect testimonials

## Emergency Contacts

**OpenShift Support:**
- Name: ____________________
- Contact: __________________

**API Provider:**
- Support URL: ______________
- Account ID: _______________

**Workshop Organizer:**
- Name: ____________________
- Phone: ___________________

## Quick Commands Reference

```bash
# Check status
oc get pods
oc get route librechat

# View logs
oc logs -f deployment/librechat
oc logs -f deployment/mongodb

# Scale up
oc scale deployment/librechat --replicas=3

# Restart if needed
oc rollout restart deployment/librechat

# Check resources
oc top pods
oc get pvc

# Emergency: delete and redeploy
./cleanup.sh
./deploy.sh
```

## Success Criteria

Workshop is considered successful if:
- [ ] 90%+ participants can access LibreChat
- [ ] All lab scenarios execute successfully
- [ ] File uploads work consistently
- [ ] No major downtime (>5 minutes)
- [ ] Participants complete at least 2 labs
- [ ] Positive feedback on hands-on learning

---

**Good luck! You've got this! 🚀**
