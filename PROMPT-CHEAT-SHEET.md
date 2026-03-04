# Prompt Engineering Cheat Sheet
**Quick Reference Guide for Writing Effective AI Prompts**

---

## The Prompt Formula

```
[ROLE] + [CONTEXT] + [TASK] + [CONSTRAINTS] + [OUTPUT FORMAT]
```

### Example:

```
You are a senior marketing strategist                          ← ROLE
with expertise in fashion retail.                              ← CONTEXT

Analyze this product description and improve it                ← TASK
for a premium audience aged 25–35.                             ← CONSTRAINTS

Return:                                                         ← OUTPUT FORMAT
- 3 headline options
- 1 revised description (max 100 words)
- 5 SEO keywords
```

---

## Core Techniques

### 1. Role Prompting
Give the AI a specific persona with expertise.

**Template:**
```
You are a [job title] with [years] of experience in [domain].
```

**Examples:**
- "You are a retail data analyst specializing in visual merchandising."
- "You are a VP of Sales with 15 years in B2B fashion distribution."
- "You are a creative director at a luxury fashion house."

---

### 2. Clear Task Definition
State exactly what you want the AI to do.

**Action verbs that work well:**
- Analyze, summarize, compare, identify, classify
- Generate, create, write, draft, design
- Recommend, suggest, propose, advise
- Extract, list, categorize, organize

---

### 3. Context & Constraints
Provide background and boundaries.

**What to include:**
- Target audience
- Industry/domain
- Tone (professional, casual, creative)
- Brand voice examples
- Specific requirements

**Example:**
```
Target audience: Urban professionals, 25–35, eco-conscious
Tone: Sophisticated but approachable
Brand voice: "Sustainable luxury. Timeless design."
```

---

### 4. Output Formatting
Tell the AI exactly how to structure the response.

**Useful formats:**
- Bullet points
- Numbered lists
- Tables
- JSON
- Step-by-step instructions
- Executive summary + details

**Example:**
```
Return results in a table with these columns:
| Product | Color | Price Tier | Target Demo |
```

---

### 5. Few-Shot Prompting
Show 1–3 examples of what you want.

**Template:**
```
Here are examples of our brand voice:
- Example 1: "Bold. Minimal. Made for movement."
- Example 2: "Designed for the way you live."
- Example 3: "Every detail matters."

Now write a product description for [product] in the same style.
```

---

### 6. Chain-of-Thought
Ask the AI to think step-by-step.

**Template:**
```
Think step by step:
1. First, [step 1]
2. Then, [step 2]
3. Finally, [step 3]

Explain your reasoning at each step.
```

**Example:**
```
Think step by step:
1. First, identify the dominant colors in these product images
2. Then, correlate those colors with sales performance
3. Finally, recommend which colors to feature in next season's line
```

---

### 7. Temperature Control

| Temperature | Use Case | Output Style |
|-------------|----------|--------------|
| 0.0 – 0.3 | Data analysis, factual tasks | Consistent, conservative |
| 0.4 – 0.7 | Balanced creativity | Moderate variation |
| 0.8 – 1.0 | Creative writing, brainstorming | Bold, unexpected |

**When to use low temperature:**
- Product specifications
- Data summaries
- Compliance content

**When to use high temperature:**
- Marketing campaigns
- Tagline generation
- Creative concepts

---

## Ready-to-Use Prompt Templates

### Marketing & Copy

#### Product Description Writer
```
You are a professional copywriter for [brand type].

Write a product description for [product name]:
- Target audience: [demographic]
- Tone: [professional/casual/luxury/etc.]
- Key features: [list features]
- Brand voice: [examples]

Return:
- 1 headline (max 10 words)
- 1 description (max 120 words)
- 5 SEO keywords
```

#### Social Media Caption Generator
```
You are a social media manager for a [industry] brand.

Create an Instagram caption for this image:
- Audience: [demographic]
- Tone: [describe]
- Call-to-action: [yes/no, what type]
- Hashtag strategy: [niche/broad/branded]

Include:
- Caption (max 150 characters)
- 5–10 relevant hashtags
```

---

### Data Analysis

#### Image Analysis
```
You are a retail data analyst.

Analyze the uploaded product images and identify:
- Dominant colors (specific names or hex codes)
- Silhouette types (fitted, oversized, structured, etc.)
- Design details (textures, patterns, hardware)
- Target demographic signals

Return results in a table format.
```

#### Sentiment Analysis
```
You are a customer insights analyst.

Analyze this customer feedback and return:
1. Top 5 positive themes
2. Top 5 complaints
3. Sentiment breakdown (% positive, neutral, negative)
4. Suggested product improvements (prioritized)

Use data from the uploaded file only.
```

---

### Sales & Strategy

#### Competitor Analysis
```
You are a competitive intelligence analyst in [industry].

Analyze these competitor product images:
- Pricing signals (luxury vs. mass market)
- Trend alignment
- Target audience
- Differentiation opportunities

Provide 3 actionable recommendations.
```

#### Sales Report Analysis
```
You are a sales operations analyst.

Based on the uploaded sales data, identify:
- Top 5 performing products (by revenue and units)
- Geographic trends
- Seasonal patterns
- Products with declining sales

Suggest 3 proactive distribution or inventory actions.
```

---

### Creative & Forecasting

#### Trend Forecasting
```
You are a fashion trend forecaster.

Analyze these images and identify emerging trends:
- Color trends
- Fabric/texture trends
- Silhouette trends
- Accessory trends

For each, predict:
- Time to mass market (3, 6, or 12 months)
- Target customer segments
- Price point suitability
```

#### Virtual Prototyping
```
You are a product designer specializing in [category].

Generate 3 design variations for [product]:
1. Minimalist version
2. Streetwear version
3. Luxury version

For each, describe:
- Fabric choices
- Key design details
- Color palette
- Target price point
```

---

## Advanced Techniques

### Multi-Turn Refinement
**Don't accept the first answer—iterate!**

```
Turn 1: "Write a product description for a leather handbag."
Turn 2: "Make it more aspirational and emotional."
Turn 3: "Shorten to 50 words and add urgency."
```

---

### JSON Output (for Automation)
```
Analyze this product image and return valid JSON:

{
  "dominant_colors": ["color1", "color2"],
  "silhouette": "fitted | oversized | structured",
  "price_tier": "budget | mid | premium | luxury",
  "target_age_range": "18-25 | 25-35 | 35-50 | 50+",
  "confidence": 0.85
}
```

---

### Document Grounding (RAG)
```
Based only on the uploaded document, answer:
[your question]

Cite specific data points or quotes from the document.
```

**Why it matters:** Reduces hallucination, grounds responses in your data.

---

## Common Mistakes to Avoid

| Don't Do This | Do This Instead |
|------------------|-------------------|
| "Analyze this product." | "You are a retail analyst. Analyze this product's color, silhouette, and target demographic. Return as a table." |
| "Write something creative." | "Write 3 Instagram captions in our brand voice: 'Bold. Minimal. Designed for movement.' Max 150 characters each." |
| "What do you think?" | "Based on the uploaded sales data, identify the top 3 underperforming products and suggest corrective actions." |
| Accepting first output | Iterate: "Make it shorter." "Add more emotion." "Focus on sustainability." |

---

## Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| Output too generic | Add role, context, and specific constraints |
| Wrong tone | Provide 2–3 examples of your brand voice |
| Made-up facts (hallucination) | Upload documents and use "Based only on..." |
| Inconsistent results | Lower temperature (0.2–0.4) |
| Output too long | Add word/character limits |
| Boring/safe responses | Raise temperature (0.7–0.9) |

---

## File Upload Tips

### What You Can Upload:
- **Images:** PNG, JPG, JPEG (product photos, competitor images, mood boards)
- **Documents:** PDF, DOCX, TXT (reports, briefs, research)
- **Data:** CSV, Excel (sales data, customer feedback)

### Best Practices:
1. Name files descriptively: `Q4-sales-report.pdf` not `document.pdf`
2. Keep files under 10MB for best performance
3. For CSVs, include clear column headers
4. For images, use high resolution when possible
5. Always specify: "Based on the uploaded file..."

---

## Recommended Workflow

```
1. Define your goal
   ↓
2. Choose a role for the AI
   ↓
3. Provide context & constraints
   ↓
4. Specify output format
   ↓
5. Run the prompt
   ↓
6. Review & iterate
   ↓
7. Save successful prompts for reuse
```

---

## Prompt Library Starter Pack

**Save these for quick reuse:**

1. **Quick Product Analysis**
   ```
   Analyze this product image. Identify: colors, style, target demo, price tier. Table format.
   ```

2. **Competitor Quick Scan**
   ```
   Review these competitor images. What trends are they following? What gaps exist?
   ```

3. **Feedback Summary**
   ```
   Summarize this customer feedback. Top 3 positives, top 3 complaints, 3 action items.
   ```

4. **Sales Insight**
   ```
   Based on uploaded sales data: top performers, declining products, 3 recommendations.
   ```

5. **Creative Brief**
   ```
   Create a creative brief for [campaign]. Include: objective, audience, key message, tone, deliverables.
   ```

---

## Next Steps

1. **Build your own prompt library** — Save what works
2. **Experiment weekly** — Try one new technique each week
3. **Share with your team** — Teach others
4. **Track results** — Measure time saved and quality improvements
5. **Stay curious** — AI is evolving fast

---

**Bookmark this sheet. Copy what works. Customize for your needs.**

**Questions?** Experiment. Iterate. Learn by doing.

---

**Good luck!**
