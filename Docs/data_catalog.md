# Data Dictionary

This data dictionary describes the columns in the retail sales dataset.

| Column Name       | Data Type          | Description                                                                 |
|-------------------|--------------------|-----------------------------------------------------------------------------|
| transaction_id    | Integer            | Unique identifier for each transaction                                      |
| Date              | Datetime           | Date (and possibly time) when the transaction occurred                      |
| Customer_ID       | String             | Unique identifier for the customer who made the purchase                    |
| Gender            | String             | Gender of the customer                                                      |
| Age               | Integer            | Age of the customer at the time of the transaction                          |
| Product_Category  | String             | Category of the product purchased                                           |
| Quantity          | Integer            | Number of units of the product purchased in this transaction                |
| Price_per_Unit    | Float              | Price of one unit of the product (in currency)                              |
| Total_Amount      | Float              | Total cost of the transaction (Quantity × Price_per_Unit)                   |

### Additional Notes
- **Total_Amount** is usually calculated as `Quantity × Price_per_Unit`. You can use this to check data consistency.
