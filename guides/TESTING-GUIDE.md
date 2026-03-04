# Testing Guide – Workshop Materials Validation

This guide will walk you through testing all components of the workshop to ensure everything works before April 2.

---

## Testing Checklist

### Phase 1: Documentation Review (30 minutes)

**Goal:** Verify all materials are complete and make sense.

- [ ] Read through WORKSHOP-GUIDE.md as a participant would
  - Do the lab instructions make sense?
  - Are the prompts clear and copy-paste ready?
  - Is the flow logical?

- [ ] Review INSTRUCTOR-GUIDE.md
  - Are the teaching tips helpful?
  - Do the timing estimates seem realistic?
  - Are troubleshooting sections comprehensive?

- [ ] Skim PROMPT-LIBRARY.md
  - Are the templates relevant to marketing/sales?
  - Can you think of use cases for each one?

- [ ] Check PROMPT-CHEAT-SHEET.md
  - Is it concise enough for quick reference?
  - Would you print and distribute this?

- [ ] Review SLIDES-OUTLINE.md
  - Does the presentation flow make sense?
  - Are there enough slides for 50 minutes of content?
  - Do you have ideas for visuals?

---

## Phase 2: Sample Data Validation (15 minutes)

**Goal:** Ensure data files are usable and realistic.

### Test customer-feedback.csv

```bash
cd sample-data
head -20 customer-feedback.csv
wc -l customer-feedback.csv  # Should show 41 (40 + header)
```

**Check for:**
- [ ] Header row is present
- [ ] Data looks realistic
- [ ] Mix of positive and negative ratings
- [ ] Various customer segments represented

### Test sales-data.csv

```bash
head -20 sales-data.csv
wc -l sales-data.csv  # Should show 52 (51 + header)
```

**Check for:**
- [ ] Header row is present
- [ ] Revenue numbers look reasonable
- [ ] Multiple regions represented
- [ ] Date ranges cover Jan-Jun 2024

### Test quarterly-sales-report.md

```bash
less quarterly-sales-report.md
```

**Check for:**
- [ ] Well-structured markdown
- [ ] Contains tables and data
- [ ] Has executive summary section
- [ ] Includes recommendations

---

## Phase 3: Prompt Testing (Without LibreChat - 30 minutes)

**Goal:** Test prompts using any available AI chat interface (ChatGPT, Claude.ai, etc.)

### Test Lab 1 Prompts

**Exercise 1.1: Basic Prompt**
Copy this into your AI chat:
```
Analyze this product description and suggest improvements.

Product: "Our jacket is made from high-quality materials. It's stylish and comfortable."
```

**Expected:** Generic suggestions

---

**Exercise 1.2: Improved Prompt**
Copy this:
```
You are a senior fashion marketing strategist with 10 years of experience in premium urban brands.

Improve the following product description for a women's jacket targeting urban professionals aged 25–35. Focus on emotional appeal and lifestyle fit.

Product: "Our jacket is made from high-quality materials. It's stylish and comfortable."
```

**Expected:** More specific, targeted suggestions

**Did it work?** Note the difference in quality.

---

**Exercise 1.3: With Constraints**
Copy this:
```
You are a senior fashion marketing strategist with 10 years of experience in premium urban brands.

Improve the following product description for a women's jacket targeting urban professionals aged 25–35.

Product: "Our jacket is made from high-quality materials. It's stylish and comfortable."

Return:
- 3 headline options (max 10 words each)
- 1 optimized product description (max 100 words)
- 5 SEO keywords
- 1 Instagram caption suggestion
```

**Expected:** Structured output with all requested elements

**Did it work?** Check if format is followed.

---

### Test Lab 2 Scenarios

**Scenario C: Sentiment Analysis (without file upload)**

Create a simple test:
```
You are a customer insights analyst.

Analyze the following customer feedback:

1. "Absolutely love this coat! The fit is perfect and the quality is outstanding." - 5 stars
2. "The fit was really off. Too tight in the thighs and too loose at the waist. Had to return." - 2 stars
3. "These pilled after ONE wear. Very disappointed. The fabric quality is terrible." - 1 star
4. "Perfect weight for layering. The craftsmanship is excellent. Will buy in other colors." - 5 stars
5. "The waistband elastic broke after 3 washes. Not durable at all for the price." - 2 stars

Return:
- Top 2 positive themes
- Top 2 complaints
- Sentiment breakdown (%)
- Suggested product improvements
```

**Expected:** Clear analysis with structured output

---

### Test Advanced Techniques

**Chain-of-Thought:**
```
Think step by step:
1. First, identify common themes in these product names: "Urban Trench Coat", "Minimalist Tote Bag", "Classic Wool Sweater"
2. Then, determine what aesthetic or brand positioning they suggest
3. Finally, recommend 3 additional product names that would fit this collection

Explain your reasoning at each step.
```

**Expected:** Step-by-step breakdown with reasoning

---

**JSON Output:**
```
Analyze this product and return valid JSON:

Product: Black leather handbag, structured design, gold hardware, $285

{
  "price_tier": "budget | mid | premium | luxury",
  "target_age_range": "18-25 | 25-35 | 35-50 | 50+",
  "style_category": "minimalist | classic | trendy | bohemian",
  "dominant_colors": ["color1", "color2"],
  "confidence": 0.0-1.0
}
```

**Expected:** Valid JSON structure

---

## Phase 4: LibreChat Platform Testing (45 minutes)

**Prerequisites:**
- LibreChat deployed and accessible
- Test account created
- Sample data files ready to upload

### Test 4.1: Basic Access

- [ ] Navigate to LibreChat URL
- [ ] Create account or log in
- [ ] Verify chat interface loads
- [ ] Check model selector (if available)
- [ ] Start a new conversation

### Test 4.2: Text-Only Prompts

Run through these prompts from WORKSHOP-GUIDE.md:

- [ ] Lab 1, Exercise 1.1 (basic prompt)
- [ ] Lab 1, Exercise 1.2 (improved with role)
- [ ] Lab 1, Exercise 1.3 (with constraints)

**Note:** Response quality, speed, any errors

### Test 4.3: File Upload - CSV

**Upload customer-feedback.csv:**

1. Click attachment button
2. Select `sample-data/customer-feedback.csv`
3. Verify upload succeeds
4. Use this prompt:

```
You are a customer insights analyst.

Analyze this customer feedback dataset.

Return:
- Top 5 positive themes
- Top 5 complaints
- Sentiment breakdown (%)
- Suggested product improvements (prioritized by frequency)

Format as a clear, actionable report.
```

**Check:**
- [ ] File uploads successfully
- [ ] Model reads the CSV data
- [ ] Output includes actual data from the file
- [ ] Results are accurate to the data

### Test 4.4: File Upload - Sales Data

**Upload sales-data.csv:**

```
You are a sales operations analyst.

Based on the uploaded sales data, identify:

1. Top 5 performing products by revenue
2. Bottom 3 underperforming products
3. Regional trends (which regions over/underperform?)
4. Recommended actions for distribution or inventory

Return as a structured report with tables where appropriate.
```

**Check:**
- [ ] File uploads successfully
- [ ] Data is analyzed correctly
- [ ] Specific products are named from the file
- [ ] Regional data (Northeast, West, etc.) is referenced

### Test 4.5: File Upload - Document (RAG)

**Upload quarterly-sales-report.md:**

```
Based only on the uploaded document, answer the following:

1. What were the top-performing product categories last quarter?
2. What geographic trends stand out?
3. Which product categories declined and why?

Cite specific sections or data points from the report.
```

**Check:**
- [ ] File uploads successfully
- [ ] Model references specific sections of the document
- [ ] Answers are grounded in the actual report content
- [ ] Citations or quotes are accurate

### Test 4.6: Multi-File Analysis

**Upload both customer-feedback.csv AND sales-data.csv:**

```
I've uploaded both sales data and customer feedback.

Cross-reference them:
- Do high-revenue products have positive or negative feedback?
- Are there low-selling products with strong customer satisfaction? (opportunity?)
- What misalignments exist between what sells and what customers want?

Provide 3 strategic recommendations.
```

**Check:**
- [ ] Both files are recognized
- [ ] Model cross-references data between files
- [ ] Insights are meaningful
- [ ] Recommendations are actionable

### Test 4.7: Image Upload (Optional)

**If you have a product image:**

1. Upload a product image (jacket, bag, etc.)
2. Use this prompt:

```
You are a retail data analyst.

Analyze this product image:
- Dominant colors
- Style category
- Design details
- Target demographic
- Estimated price tier

Return as a table.
```

**Check:**
- [ ] Image uploads successfully
- [ ] Model can "see" and describe the image
- [ ] Analysis is accurate to visual content

### Test 4.8: Conversation History

- [ ] Start a conversation
- [ ] Send 3-4 messages
- [ ] Refresh the page
- [ ] Verify conversation is saved
- [ ] Check sidebar for conversation history
- [ ] Open an old conversation - does it load?

### Test 4.9: Multiple Users (If Possible)

- [ ] Create 2-3 test accounts
- [ ] Log in from different browsers/devices
- [ ] Send prompts simultaneously
- [ ] Verify no cross-contamination of conversations
- [ ] Check performance under concurrent load

---

## Phase 5: End-to-End Workshop Simulation (60 minutes)

**Goal:** Run through the entire workshop as a participant would.

### Preparation

- Open WORKSHOP-GUIDE.md
- Open LibreChat in browser
- Have sample data files ready

### Simulation Timeline

**Time 0:00 - Lab 1 Start (Exercise 1.1 - 1.5)**

- [ ] Complete Exercise 1.1 (basic prompt)
- [ ] Complete Exercise 1.2 (add role + context)
- [ ] Complete Exercise 1.3 (add constraints)
- [ ] Complete Exercise 1.4 (few-shot prompting)
- [ ] Complete Exercise 1.5 (temperature test - if available)

**Time Taken:** _____ minutes (target: 30-40 min)

**Notes:**
- Any confusing instructions?
- Prompts that didn't work well?
- Timing realistic?

---

**Time 0:40 - Lab 2 Start (Pick 2 scenarios)**

Choose 2 scenarios from A-F and complete them:

Scenario chosen: _______

- [ ] Upload required files
- [ ] Run the prompt
- [ ] Analyze results
- [ ] Try follow-up questions

Scenario chosen: _______

- [ ] Upload required files
- [ ] Run the prompt
- [ ] Analyze results
- [ ] Try follow-up questions

**Time Taken:** _____ minutes (target: 30-40 min)

**Notes:**
- Which scenarios were most interesting?
- Any technical issues?
- Timing realistic?

---

**Time 1:20 - Lab 3 Start (RAG)**

- [ ] Upload quarterly-sales-report.md
- [ ] Exercise 3.1: Ask factual questions
- [ ] Exercise 3.2: Strategic analysis
- [ ] Exercise 3.3: Multi-document (if time)

**Time Taken:** _____ minutes (target: 15-20 min)

**Notes:**
- Was RAG concept clear?
- Did grounding work as expected?

---

**Total Time:** _____ minutes (target: 90-100 min of lab time)

---

## Phase 6: Instructor Prep Testing (30 minutes)

**Goal:** Ensure you can present and demo effectively.

### Presentation Dry Run

- [ ] Open SLIDES-OUTLINE.md
- [ ] Practice explaining LLM basics (5 min)
- [ ] Practice explaining prompt engineering (5 min)
- [ ] Practice LibreChat demo (10 min)

**Demo Script Practice:**

1. Open LibreChat
2. Show interface tour (2 min)
3. Run basic prompt (2 min)
4. Run improved prompt (3 min)
5. Upload image and analyze (3 min)

**Did you:**
- [ ] Stay within time limits?
- [ ] Explain clearly without jargon?
- [ ] Have backup screenshots ready?

### Troubleshooting Preparation

**Test these failure scenarios:**

- [ ] What if LibreChat is slow? (Have screenshots ready)
- [ ] What if file upload fails? (Show data in chat instead)
- [ ] What if a participant can't log in? (Have shared demo account)
- [ ] What if model gives bad output? (Show iteration/refinement)

---

## Issues Log

**Track any problems you encounter:**

| Issue | Severity | Fix/Workaround | Status |
|-------|----------|----------------|--------|
| Example: CSV won't upload | Medium | Reduce file size | Fixed |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

---

## Testing Completion Checklist

**Before declaring "ready for workshop":**

- [ ] All documentation reviewed and makes sense
- [ ] Sample data files validated
- [ ] Prompts tested in AI chat (baseline quality check)
- [ ] LibreChat accessible and stable
- [ ] File uploads work (CSV, MD, images)
- [ ] RAG functionality confirmed
- [ ] Multi-file uploads work
- [ ] Conversation history saves correctly
- [ ] End-to-end simulation completed
- [ ] Demo practice run successful
- [ ] Backup plan prepared for common failures
- [ ] Issues log reviewed and critical items resolved

---

## What to Test 1 Week Before Workshop

- [ ] LibreChat still accessible
- [ ] File uploads still working
- [ ] Model API quota sufficient
- [ ] No breaking changes to platform

## What to Test Day Of Workshop

- [ ] LibreChat loads (1 hour before)
- [ ] Login works
- [ ] One test prompt succeeds
- [ ] File upload test
- [ ] Pod status healthy (oc get pods)

---

## Success Criteria

**Workshop materials are ready when:**

1. Documentation is clear and actionable
2. All prompts produce expected results
3. File uploads work reliably
4. Platform can handle concurrent users
5. You can demo confidently without fumbling
6. Backup plans exist for common failures

---

**Once testing is complete, you're ready to deliver an excellent workshop!**
