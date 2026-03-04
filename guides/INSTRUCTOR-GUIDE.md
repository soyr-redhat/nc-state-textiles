# Instructor Guide – AI Workshop
**Internal Reference for Workshop Facilitation**

---

## Overview

This guide provides instructor-specific notes, teaching tips, common pitfalls, and facilitation strategies for delivering the AI Workshop: Practical Prompt Engineering for Marketing & Sales.

**Workshop Duration:** 3 hours (2:00–5:00 PM)
**Format:** Presentation + Hands-on Labs
**Platform:** LibreChat on OpenShift

---

## Pre-Workshop Checklist (Day Before)

### Technical Verification
- [ ] LibreChat accessible via route URL
- [ ] Test login and account creation
- [ ] Upload sample data files (verify they process correctly)
- [ ] Test file upload functionality (image, PDF, CSV)
- [ ] Verify model API responses (test 3-5 prompts)
- [ ] Check pod status and logs for errors
- [ ] Confirm storage capacity (PVCs not full)
- [ ] Test from multiple devices/browsers

### Content Preparation
- [ ] Slide deck finalized and tested
- [ ] Demo prompts prepared in a text file (copy-paste ready)
- [ ] Sample images ready for live demo
- [ ] Backup screenshots in case live demo fails
- [ ] Workshop guide accessible (shared link or printed)
- [ ] Prompt cheat sheet ready to distribute
- [ ] Feedback form/survey ready

### Logistics
- [ ] Room setup confirmed (projector, screen, seating)
- [ ] WiFi credentials available
- [ ] Power outlets accessible for participants
- [ ] Whiteboard/markers available (optional)
- [ ] Water, snacks (if applicable)
- [ ] Name tags (if needed for networking)

---

## Morning of Workshop (1 Hour Before)

### Final Tech Check
```bash
# Verify pods running
oc get pods

# Check route accessibility
oc get route librechat -o jsonpath='{.spec.host}'

# Test upload storage
oc exec deployment/librechat -- df -h /app/api/uploads

# Monitor logs
oc logs -f deployment/librechat --tail=50
```

### Instructor Setup
- [ ] Open LibreChat in browser (test account)
- [ ] Have sample files ready to upload
- [ ] Projector connected and tested
- [ ] Slide deck open and ready
- [ ] Text file with demo prompts open
- [ ] Terminal window ready (for troubleshooting)
- [ ] Participant materials accessible

---

## Workshop Facilitation Guide

### Section 1: Welcome & Introduction (15 min)
**Time:** 2:00–2:15 PM

**Teaching Tips:**
- Start on time (builds credibility)
- Quick icebreaker: "Who has used ChatGPT or similar tools? Raise your hand."
- Set expectations: "This is hands-on. You'll be doing, not just listening."
- Share your own AI "aha moment" story (personal connection)

**Common Questions:**
- *Q: "Do we need coding skills?"*
  - A: Nope! Just the ability to type and think critically about outputs.
- *Q: "Can we use this for [specific task]?"*
  - A: Probably! We'll explore many use cases, and you can experiment during labs.

**Troubleshooting:**
- If projector fails: Have participants follow along on their own devices
- If time is tight: Skip detailed agenda slide, jump to objectives

---

### Section 2: AI Foundations (15 min)
**Time:** 2:15–2:30 PM

**Key Teaching Points:**
- **Avoid jargon overload:** Keep it simple. Most attendees are not technical.
- **Use analogies:**
  - LLMs = "Autocomplete on steroids"
  - Temperature = "Creativity dial"
  - Tokens = "Words and word pieces"
- **Emphasize limitations:** Set realistic expectations (no magic, just pattern recognition)

**Engagement Strategy:**
- Ask: "What have you heard about AI? Any misconceptions we should address?"
- Show a hallucination example (intentionally bad prompt → made-up facts)
- Explain: "This is why we use RAG and grounded prompts."

**Red Hat AI Section:**
- **Keep it business-focused, not technical:**
  - "Your data stays in your control."
  - "No vendor lock-in."
  - "Meets compliance requirements."
- **Tie to their concerns:** "Worried about data security? Red Hat AI solves that."

**Common Questions:**
- *Q: "Is AI going to replace us?"*
  - A: AI is a tool that amplifies your expertise. You bring domain knowledge, creativity, and judgment. AI accelerates execution.
- *Q: "Which model is best?"*
  - A: Depends on the task. We'll experiment today and you'll see the differences.

---

### Section 3: What is Prompt Engineering? (20 min)
**Time:** 2:30–2:50 PM

**Teaching Strategy:**
- **Show, don't just tell:** Use live examples
- **Deliberately show bad prompts first:** Let them see the problem before the solution
- **Side-by-side comparison:** Bad prompt vs. good prompt → dramatic improvement

**Live Example Sequence:**

**Bad Prompt:**
```
"Analyze this product."
```
→ Run it live, show generic output

**Good Prompt:**
```
You are a retail data analyst.
Analyze this jacket image for:
- Target demographic
- Price tier signals
- Design trends
Return as a table.
```
→ Run it live, show improved output

**Emphasize:** "Same model, same product. Only difference? The prompt."

**Interactive Element:**
- Ask: "What made the second prompt better?" (Let them answer)
- Capture responses on whiteboard:
  - Role
  - Specificity
  - Structure
  - Clear output format

**Temperature Demo (Optional but Recommended):**
- Run same prompt at temp 0.2 → show safe, consistent output
- Run same prompt at temp 0.9 → show creative, varied output
- Ask: "Which would you use for compliance docs? For marketing campaigns?"

---

### Section 4: LibreChat Demo (15 min)
**Time:** 2:50–3:05 PM

**Demo Script:**

**Step 1: Interface Tour (2 min)**
- Point out key features on screen
- "This is where you'll spend the next 2 hours."

**Step 2: Basic Prompt Demo (3 min)**
```
Write a product description for a men's leather jacket.
```
- Show output
- "Not bad, but pretty generic. Let's improve it."

**Step 3: Improved Prompt Demo (5 min)**
```
You are a fashion copywriter for a premium menswear brand.

Write a product description for a men's leather jacket:
- Target: Urban professionals, 30-45
- Tone: Sophisticated but approachable
- Style: Minimalist, timeless

Return:
- 1 headline (max 8 words)
- 1 description (100 words)
- 5 keywords
```
- Show improved output
- "See the difference? That's what you'll learn to do."

**Step 4: Image Upload Demo (5 min)**
- Upload a product image
- Use this prompt:
```
You are a retail analyst.
Analyze this product image:
- Colors
- Style
- Target demo
- Price tier
Return as a table.
```
- Show multimodal capability

**Teaching Tip:**
- Intentionally make a small mistake (typo, forget to upload file) and fix it
- Shows it's okay to iterate
- Normalizes experimentation

**Transition to Labs:**
- "Now it's your turn. Open your workshop guide."
- Display URL prominently on screen
- "Start with Lab 1. Work at your own pace."

---

## Lab Facilitation (1 hour 50 min total)

### Lab 1: Prompt Engineering Fundamentals (40 min)
**Time:** 3:05–3:45 PM

**Instructor Role:**
- Circulate the room
- Answer questions
- Troubleshoot login/access issues
- Identify common struggles

**Teaching Opportunities:**
- If someone gets great results, ask if they'll share with the group
- If someone is stuck, offer a hint (don't give the answer)
- Collect interesting prompts for later discussion

**Common Issues:**

| Problem | Solution |
|---------|----------|
| Can't log in | Check credentials, try incognito mode, verify route URL |
| File won't upload | Check file size (<10MB), verify PVC not full, try different file |
| Generic outputs | Guide them to add role, context, constraints |
| Too slow/impatient | Remind: "First answer is rarely the best. Iterate!" |

**Pacing:**
- 15 min mark: "How's everyone doing? Anyone stuck?"
- 30 min mark: "If you're done with Exercise 1.3, jump ahead. If still on 1.1, that's fine too."

---

### Lab 2: Industry Use Cases (40 min)
**Time:** 3:45–4:25 PM

**Instructor Role:**
- Continue circulating
- Encourage participants to try multiple scenarios
- Ask: "Which scenario is most relevant to your job?"

**Suggested Scenarios by Role:**

| Participant Role | Recommended Scenario |
|------------------|---------------------|
| Marketing | Scenario A (Product Image Analysis) |
| Sales | Scenario F (Sales Data Analysis) |
| Product/Design | Scenario E (Virtual Prototyping) |
| Customer Success | Scenario C (Sentiment Analysis) |
| Competitive Intel | Scenario B (Competitor Analysis) |

**Teaching Moments:**
- Compare outputs across participants (with permission)
- Highlight creative prompt variations
- Discuss how to adapt these to their specific industries

**Mid-Lab Check (20 min in):**
- "Who found something surprising? Want to share?"
- Display interesting results on screen (if participant willing)

---

### Lab 3: RAG & Document Upload (20 min)
**Time:** 4:25–4:45 PM

**Instructor Role:**
- Explain RAG concept clearly: "Grounding responses in your documents"
- Demo uploading PDF if needed
- Emphasize: "Always say 'Based on the uploaded document'"

**Key Teaching Point:**
- Without "based on the document": AI might use general knowledge (hallucination risk)
- With "based on the document": AI references your specific data

**Advanced Technique:**
- Show multi-document upload (combine sales CSV + feedback CSV)
- "Now cross-reference: Do high sellers have good reviews?"

---

### Advanced Techniques (10 min)
**Time:** 4:45–4:55 PM

**Optional Section (if time allows):**
- Chain-of-thought demo
- JSON output demo
- Multi-turn refinement demo

**If running short on time:**
- Skip this section
- Include in slide deck as "self-study"
- Share resources for learning more

---

### Wrap-Up & Reflection (5 min)
**Time:** 4:55–5:00 PM

**Discussion Prompts:**
- "What surprised you most today?"
- "Which use case will save you the most time?"
- "What would you need to make this work at your company?"
- "Where does AI governance matter for your organization?"

**Closing:**
- Recap key takeaways
- Share resources (prompt library, cheat sheet, slides)
- Collect feedback (form or survey)
- Provide contact info for follow-up questions
- Thank participants!

**Final Message:**
"You now have a superpower. Use it wisely. Start small, iterate, and share what you learn with your teams. Thank you!"

---

## Teaching Tips & Best Practices

### Engagement Strategies

1. **Start with a hook:** Share a compelling AI use case in the first 5 minutes
2. **Ask questions frequently:** Keep it interactive, not a monologue
3. **Use real examples:** Show actual outputs, not theoretical concepts
4. **Encourage experimentation:** "There are no wrong answers in labs."
5. **Celebrate failures:** When demos fail, use it as a teaching moment

### Pacing

- **Don't rush labs:** Participants learn by doing, not listening
- **Be flexible:** If a topic resonates, spend more time on it
- **Skip slides if needed:** Prioritize hands-on time over presentation
- **Buffer time:** Plan for 40 min of content in a 50 min slot

### Troubleshooting

**If LibreChat goes down:**
- Have backup screenshots of expected outputs
- Switch to discussion/Q&A format
- Use ChatGPT web interface as backup (if available)
- Reschedule lab time (if partial outage)

**If participants are overwhelmed:**
- Slow down, simplify examples
- Pair struggling participants with advanced ones
- Offer to do a second pass after workshop (office hours)

**If participants are bored (too easy):**
- Point to advanced scenarios
- Encourage them to try JSON outputs or chain-of-thought
- Ask them to help others

---

## Handling Difficult Questions

### "Isn't this just hype?"

**Response:**
- "Healthy skepticism is good! Let's see if it actually saves you time today. Try it hands-on and decide for yourself."

### "This will never work with our data/industry."

**Response:**
- "You might be right. But let's test it. Upload a sample (non-sensitive) file and see. What's the worst that happens?"

### "How do I know the AI isn't making things up?"

**Response:**
- "Great question! That's called hallucination. Here's how we prevent it:"
  - Use RAG (upload documents)
  - Ask for citations
  - Lower temperature
  - Always validate outputs (you're still the expert)

### "What about copyright/IP issues?"

**Response:**
- "Valid concern. For enterprise use, Red Hat AI and similar platforms offer governance controls. Check with your legal/IT team before using proprietary data."

### "Is my job safe?"

**Response:**
- "AI doesn't replace expertise—it amplifies it. Think of it like Excel. Did Excel replace accountants? No. It made them more productive. Same with AI for your role."

---

## Post-Workshop Actions

### Immediate (Same Day)
- [ ] Export conversation logs (if participants consent)
- [ ] Review feedback forms
- [ ] Note any technical issues for next time
- [ ] Send thank-you email with resources

### Within 1 Week
- [ ] Share recording (if made)
- [ ] Send slide deck and materials
- [ ] Compile "best prompts" from participants
- [ ] Schedule follow-up office hours (optional)

### Within 1 Month
- [ ] Check in with participants on usage
- [ ] Collect success stories
- [ ] Iterate workshop based on feedback
- [ ] Plan advanced workshop (if interest)

---

## Measuring Success

### Quantitative Metrics
- Attendance rate
- Completion rate (% who finished all labs)
- Feedback scores (NPS, satisfaction)
- Follow-up questions/engagement

### Qualitative Indicators
- "Aha moments" during workshop
- Questions asked (engaged participants ask more)
- Post-workshop adoption (are they using it?)
- Testimonials and stories

### Success Looks Like:
- 90%+ participants complete at least 2 labs
- Positive feedback on hands-on format
- Participants see value for their specific roles
- Requests for follow-up sessions or office hours

---

## Continuous Improvement

### After Each Workshop, Ask:

1. **What went well?**
   - Which examples resonated?
   - Which labs were most engaging?
   - What timing worked?

2. **What could improve?**
   - Where did participants struggle?
   - Which explanations were unclear?
   - What technical issues arose?

3. **What to change next time?**
   - Add/remove content
   - Adjust timing
   - Update examples
   - Fix technical issues

---

## Resources for Instructors

### Recommended Reading
- [Prompt Engineering Guide](https://www.promptingguide.ai/)
- Red Hat AI documentation
- LibreChat GitHub repo and docs
- OpenAI and Anthropic model guides

### Practice Recommendations
- Spend 30 min/week experimenting with new prompts
- Follow AI news (new models, techniques)
- Test new use cases relevant to your audience
- Build your own prompt library

---

## Appendix: Sample Demo Prompts

### Keep these ready to copy-paste during demos:

**Basic Product Description:**
```
Write a product description for a women's cotton t-shirt.
```

**Improved Product Description:**
```
You are a copywriter for a sustainable fashion brand.

Write a product description for an organic cotton t-shirt:
- Target: Eco-conscious women, 25-40
- Tone: Warm, authentic, values-driven

Return:
- Headline (max 8 words)
- Description (80 words)
- 3 sustainability talking points
```

**Image Analysis:**
```
You are a retail analyst.
Analyze this product image:
- Colors
- Style category
- Target demographic
- Price tier estimate
Return as a table.
```

**Sentiment Analysis:**
```
Analyze the uploaded customer feedback.
Return:
- Top 3 positive themes
- Top 3 complaints
- Overall sentiment %
```

---

**You're ready to deliver an impactful workshop! Good luck and have fun!**
