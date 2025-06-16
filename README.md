Decompositional Analysis of Adolescent Pregnancy in Kenya
By Dr. Elsie Akwara, PhD, MPH
Expert in Public Health, Epidemiology, and Advanced Statistical Methods
 
📚 Project Overview
This repository presents a full analytical pipeline for studying adolescent pregnancy trends in Kenya using Kenya Demographic and Health Survey (KDHS) data from 2008, 2014, and 2022. The goal is to perform a decompositional analysis to understand changes in adolescent childbearing rates and identify key socio-demographic contributors.
 
🎯 Objectives
•	Analyze adolescent pregnancy (<19 years) as the outcome variable
•	Use socio-demographic factors such as education, wealth, residence, region, media exposure, marital status, and employment status as predictors
•	Conduct multivariate decomposition to explain temporal changes in adolescent pregnancy rates between 2008, 2014, and 2022
 
📁 Repository Structure
Folder	Description
/data	Raw DHS datasets (note: DHS data requires user access request)
/cleaned_data	Cleaned and preprocessed datasets in CSV format
/code	Python scripts for data cleaning and exploration
/code_stata	STATA .do scripts for decomposition and modeling
/results	Output tables, graphs, and logs
README.md	Project overview and documentation
 
🔧 Tools & Technologies
•	Python: Used for data cleaning, labeling, and exploratory data analysis
Key libraries: Pandas, NumPy, Seaborn, Matplotlib
•	STATA: Used for logistic regression and multivariate decomposition (using mvdcmp package)
•	Jupyter Notebook: For running and documenting Python code interactively
•	Version Control: Git and GitHub for project versioning and portfolio showcasing
 
📊 Analysis Workflow 
1. Data Cleaning & Preparation (Python)
•	Load raw KDHS datasets from 2008, 2014, and 2022
•	Recode and harmonize variables of interest (education, wealth index, residence, etc.)
•	Create binary outcome variable for adolescent pregnancy (<19 years)
•	Export cleaned datasets for STATA analysis
2. Descriptive Statistics & Visualization (Python)
•	Generate summary statistics tables
•	Visualize key socio-demographic factors and adolescent pregnancy trends
•	Save plots and tables to results folder
3. Statistical Modeling & Decomposition (STATA)
•	Load cleaned data files for each year
•	Run logistic regression models predicting adolescent pregnancy using socio-demographic variables
•	Perform multivariate decomposition to quantify how changes in characteristics and coefficients explain differences in adolescent pregnancy rates across years
•	Save output logs and decomposition tables
 
📂 How to Run
If using DHS data, make sure the data has been survey set and prior data management, cleaning and coding/re-coding of relevant variables have been conducted prior to running the files below.
1.	Python
o	Open Jupyter Notebook code/data_cleaning_analysis.ipynb
o	Run cells sequentially to clean data, generate summaries, and save cleaned CSVs
o	There is also a separatte file for analysis
3.	STATA
o	Open code_stata/decomposition_analysis.do
o	Update file paths if needed
o	Run the .do script to perform logistic regressions and decomposition analysis
 
📈 Key Variables
Variable	Description
adolescent_preg	Binary indicator: 1 if woman <19 years has begun childbearing
education_level	Highest level of education attained
wealth_index	Wealth quintile classification
residence	Urban or rural residence
region	Geographic region/province
media_exposure	Access to media (TV, radio, newspapers)
marital_status	Current marital status
employment_status	Current employment status
 
🔐 Data Access
The datasets used are from the DHS Program. Access requires registration and permission from DHS.
 
👩🏽‍⚕️ About the Author
Dr. Elsie Akwara, PhD, MPH
A public health professional with 10+ years of experience in epidemiology, data science, and health program evaluation. Experienced with UN agencies and government health data systems. Passionate about applying advanced analytics to improve adolescent health outcomes in Africa.
 
📧 Contact
•	LinkedIn: https://www.linkedin.com/in/dr-elsie-akwara-23326746/ 
•	Email: akwarae@gmail.com 

