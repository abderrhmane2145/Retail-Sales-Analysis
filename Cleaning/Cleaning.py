# Import Necessary Libraries
import pandas as pd 


# Import Dataset
df = pd.read_csv('retail_sales_dataset.csv')


# Explore Dataset
df.head()
df.info()
df.shape
df.info()


# 1 - Handling Missing Vlaues
df.isnull().sum()
df.dropna(inplace=True)


# 2 - Handling Duplicates
df.duplicated().value_counts()
df.drop_duplicates(inplace=True)


# 3 - Handle Data Types
df['Price per Unit'] = df['Price per Unit'].astype(float)
df['Date'] = pd.to_datetime(df['Date'])


# 4 - Handle Columns Names
for x, y in zip(df.columns, df.columns) :
    if x == 'Price per Unit' :
        x = 'unit price'
        x = x.replace(' ', '_').lower()
        df.rename(columns={y:x}, inplace=True)
    elif x == 'Total Amount' :
        x = 'revenue'
        x = x.replace(' ', '_').lower()
        df.rename(columns={y:x}, inplace=True)
    else :
        x = x.replace(' ', '_').lower()
        df.rename(columns={y:x}, inplace=True)

# 5 - Data Standardization
# In gender Column we will replcae 'Male/Female' by 'M/F'
df['gender'] = df['gender'].str.strip().str.lower().map(lambda p: 'M' if  p=='male' else 'F')
# In product_category Column we will use lower_case
df['product_category'] = df['product_category'].str.lower()


# 6 - Validating Consistency
# Excepectation : 0
list_of_mistakes = []
for x,y, z in zip(df['quantity'], df['unit_price'], df['revenue']):
    if (x * y) != z :
        list_of_mistakes.append(1)
sum(list_of_mistakes)
# 6 - Validate Consistency --- Another Way ---
# Excepectation : 0
mistakes = (df['quantity'] * df['unit_price'] != df['revenue']).sum()
print("Number of inconsistencies:", mistakes)


# Export to Excel File
df.to_excel('retial_sales.xlsx', index_label=False)
# Export to Csv File
df.to_csv('retial_sales.csv', index_label=False)