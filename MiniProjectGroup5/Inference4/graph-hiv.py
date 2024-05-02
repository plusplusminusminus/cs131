import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

which = ["Benin", "Botswana", "Cambodia", "Cape Verde", "Central African Republic", "Chad", "Congo", "Cote d'Ivoire", "Democratic Republic of Congo", "Dominican Republic", "Eritrea", "Eswatini", "Ethiopia", "Gabon", "Ghana", "Guinea-Bissau", "Haiti", "Honduras", "India", "Kenya", "Lesotho", "Liberia", "Malawi", "Myanmar", "Niger", "Nigeria", "Rwanda", "Senegal", "Somalia", "South Africa", "South Sudan", "Sri Lanka", "Syria", "Tajikistan", "Tanzania", "Thailand", "Togo", "Trinidad and Tobago", "Uganda", "Zambia", "Zimbabwe"]
value_vars = ["HIV/AIDS"]

df_all = pd.DataFrame(data={})
for w in which:
  df = pd.read_csv(f'subset_{w}.csv')
  df_all = pd.concat([df_all, df], ignore_index=True)

df_sum = df_all.groupby('Year')[value_vars].sum().reset_index()

for disease in value_vars:
  df_melt = df_sum.melt(id_vars = ['Year'],
                            value_vars = [disease],
                            var_name = 'Cause of Death',
                            value_name = 'Death Count')
  plt.figure(figsize=(18, 6))
  sns.lineplot(data=df_melt, x='Year', y='Death Count', hue='Cause of Death', dashes=[2,2])

  for country in which:
      df_country = df_all[df_all['Country'] == country]
      df_country_melt = df_country.melt(id_vars=['Year'], value_vars=[disease], var_name='Cause of Death', value_name='Death Count')
      sns.lineplot(data=df_country_melt, x='Year', y='Death Count', legend=False)

  plt.title(f'Death Count Over Time By Disease: {disease}')
  plt.show()
