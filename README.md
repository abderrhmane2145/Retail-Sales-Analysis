# Retail Sales Data Analysis Project

## Project Overview
This project performs Exploratory Data Analysis (EDA) on a retail transaction dataset to uncover customer behavior patterns and provide actionable business recommendations.

**Dataset**:  
[Retail Sales Dataset](https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset)  

**Dataset Columns**:
- transaction_id
- Date
- Customer_ID
- Gender
- Age
- Product_Category
- Quantity
- Price_per_Unit
- Total_Amount (Revenue)

## Tools & Libraries Used
- **Python** 
- **Pandas** : Data manipulation and analysis
- **Matplotlib** : Basic visualizations
- **Seaborn** : Statistical plots (heatmap, boxplots, etc.)
- **SQL Server** : For running the analysis
- **Excel** : Pivot tables, Dashboard
- **Jupyter Notebook** : For running the analysis


## Actionable Recommendations
- **Retention Program** for big spenders (critical to protect revenue).
- **Upselling**:
  - Focus on Electronics category
  - Target Age 18–25 (highest upselling efficiency)
  - Run during peak months
- **Cross-selling**:
  - Focus on Clothing category
  - Target Age 26–50
  - Run during low-revenue months
- **Slightly raise prices** on premium items.
- **Marketing**:
  - Keep gender-neutral strategy.
  - Extra focus on Age 18–25.
- Maintain a **balanced strategy**, prioritizing upselling for higher impact.

## Project Structure
```
Retail-Sales-Analysis/
│
├── Cleaning/
│   ├── Cleaning.py
│   └── Cleaning_Notebook.ipynb
│
├── EDA/
│   ├── EDA.ipynb
│   ├── SQL_files/
│   │   ├── create_table.sql
│   │   ├── load_data.sql
│   │   └── EDA(group by, segmentation).sql
│   ├── EDA_Customer_Queries.sql
│   └── EDA_Revenue_Queries.sql
│
├── visualization/
│   └── Retail Sales Dashboard.xlsx
│
├── data/
│   └── retail_sales_dataset.csv
│
├── docs/
│   ├── define_problem.md
│   ├── data_catalog.md
│   └── actionable_insights.md
│
├── README.md
└── LICENSE
```



## Conclusion
By prioritizing upselling on high-value items (especially Electronics for younger customers) and protecting big spenders, while using cross-selling strategically on Clothing during slower periods, the business can achieve higher and more stable revenue growth.

---
*Project completed on December 27, 2025*
