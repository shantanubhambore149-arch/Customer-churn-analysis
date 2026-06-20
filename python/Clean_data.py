import pandas as pd
df = pd.read_csv('/Users/shantanubhambore/Downloads/code/Customer churn analysis/Data/raw/WA_Fn-UseC_-Telco-Customer-Churn.csv')

df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')
df = df.dropna(axis=0)
df['SeniorCitizen'] = df['SeniorCitizen'].map({0: 'No', 1: 'Yes'})  # you fill this

df.to_csv('/Users/shantanubhambore/Downloads/code/Customer churn analysis/Data/cleaned/telco_cleaned.csv', index=False)

print(df.shape)
print(df.dtypes)
print(df.isnull().sum())

