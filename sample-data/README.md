# Sample Data Files for AI Workshop

This directory contains sample datasets for use in workshop exercises.

---

## Files Overview

### 1. customer-feedback.csv
**Purpose:** Sentiment analysis and customer insights extraction

**Contents:**
- 40 customer reviews/feedback entries
- Ratings (1-5 stars)
- Customer segments (Budget, Mid-tier, Premium, Luxury)
- Products across all categories
- Date range: January - June 2024

**Workshop Use:**
- Lab 2, Scenario C: Sentiment Analysis
- Extract positive themes and complaints
- Identify product improvement opportunities
- Practice analyzing qualitative feedback data

**Sample Columns:**
- `feedback_id`: Unique identifier
- `date`: Feedback date
- `product_name`: Product reviewed
- `rating`: Star rating (1-5)
- `comment`: Customer feedback text
- `customer_segment`: Customer tier

---

### 2. sales-data.csv
**Purpose:** Sales performance analysis and trend identification

**Contents:**
- 51 sales records across products and regions
- Revenue and units sold data
- Geographic distribution (Northeast, Southeast, Midwest, West)
- Product categories and subcategories
- Date range: January - June 2024

**Workshop Use:**
- Lab 2, Scenario F: Sales Data Analysis
- Lab 3: Multi-document analysis (combine with feedback)
- Identify top performers and underperformers
- Analyze regional trends
- Practice structured data analysis

**Sample Columns:**
- `product_id`: Product identifier
- `product_name`: Product name
- `category`: Top-level category
- `subcategory`: Product subcategory
- `price`: Unit price
- `units_sold`: Units sold
- `revenue`: Total revenue
- `region`: Geographic region
- `month`: Sales month
- `year`: Sales year
- `color`: Product color
- `size_range`: Available sizes

---

### 3. quarterly-sales-report.md
**Purpose:** Document upload and RAG (Retrieval Augmented Generation) exercises

**Contents:**
- Q2 2024 comprehensive sales report
- Executive summary and key insights
- Category performance analysis
- Regional breakdown
- Customer segment analysis
- Product quality feedback synthesis
- Strategic recommendations

**Workshop Use:**
- Lab 3: RAG and Document Upload
- Practice asking questions grounded in document content
- Extract strategic insights
- Compare document-based analysis vs. raw data analysis

**Key Sections:**
- Executive Summary
- Top Performing Products
- Category Performance
- Regional Performance
- Customer Segment Analysis
- Quality & Feedback Trends
- Inventory & Operations
- Q3 Recommendations

---

## How to Use These Files

### During the Workshop

1. **Download files to your local machine**
2. **Upload to LibreChat** using the attachment (📎) button
3. **Follow prompts** from the workshop guide
4. **Experiment** with different analysis approaches

### Tips for Success

- **CSV files:** LibreChat will read them as structured data
- **Markdown/Text files:** Treated as documents for RAG
- **Multiple files:** You can upload multiple files in one conversation
- **Reference explicitly:** Use phrases like "Based on the uploaded file..." to ground responses

---

## Sample Prompts to Try

### For customer-feedback.csv:

```
Analyze the customer feedback dataset.

Return:
- Top 5 positive themes
- Top 5 complaints
- Sentiment breakdown by customer segment
- Products with the biggest quality concerns
```

### For sales-data.csv:

```
Based on the sales data:
- Which products generated the most revenue?
- Which regions are over/underperforming?
- What seasonal trends are visible?
- Suggest 3 inventory or distribution changes.
```

### For quarterly-sales-report.md:

```
Based only on this quarterly report:
- What were the top 3 strategic recommendations for Q3?
- Which product categories declined and why?
- What regional distribution changes were suggested?
```

### Multi-File Analysis:

```
I've uploaded both sales-data.csv and customer-feedback.csv.

Cross-reference them:
- Do high-revenue products have positive or negative feedback?
- Are there low-selling products with strong customer satisfaction?
- What strategic misalignments exist between sales and satisfaction?
```

---

## Extending This Data

### For Your Own Use:

After the workshop, you can:
- Replace with your actual company data (check internal policies first!)
- Expand with more rows/products
- Add additional columns (margin, inventory levels, etc.)
- Create similar reports for your industry

### Creating Custom Datasets:

If you want to build similar sample data:

1. **Customer Feedback:**
   - Include varied ratings (1-5 stars)
   - Mix positive and negative comments
   - Add product/service identifiers
   - Include dates and customer segments

2. **Sales Data:**
   - Use realistic price points
   - Add geographic or channel dimensions
   - Include time series data (monthly, quarterly)
   - Add product attributes (color, size, category)

3. **Reports:**
   - Use clear section headers
   - Include quantitative data (tables, metrics)
   - Add strategic recommendations
   - Provide context and analysis

---

## Privacy & Data Security

**Important Notes:**

- These are **fictional sample datasets** for training purposes only
- **Do not upload sensitive company data** without checking your organization's AI usage policy
- **Remove PII** (names, emails, addresses) before uploading real data
- **Check with IT/Legal** before using proprietary information

---

## Questions?

If you have questions about these datasets or need help during the workshop, ask the instructor!

---

**Ready to analyze? Upload these files in LibreChat and start experimenting!**
