# Matthew Gouyer

import pandas as pd
import matplotlib.pyplot as plt

# load csv
file_path = 'MiniProjectGroup5/cause_of_deaths_new.csv'
df = pd.read_csv(file_path)

df_sorted = df.sort_values(by='Year')

country_deaths = df_sorted.groupby('Country/Territory')['Drug Use Disorders'].sum()

sorted_countries = country_deaths.sort_values(ascending=False)

top_10_countries = sorted_countries.head(10)

# Create a line plot for each of the top 10 countries
plt.figure(figsize=(10, 6))
for country in top_10_countries.index:
    country_data = df_sorted[df_sorted['Country/Territory'] == country]
    plt.plot(country_data['Year'], country_data['Drug Use Disorders'], label=country, linestyle='-.')

plt.xlabel('Year')
plt.ylabel('Total Drug-Related Deaths')
plt.title('Trend of Drug-Related Deaths Over Time (With the 10 highest populated countries)')
plt.legend()
plt.grid(True)
plt.tight_layout()    
plt.show()

