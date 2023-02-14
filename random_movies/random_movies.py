#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Importação da biblioteca pandas para analise de dados
import pandas as pd

# Carregamento do dataset
data = pd.read_csv('netflix_titles.csv')

# Exibição das 5 primeiras linhas do dataset
head = data.head()
head


# In[2]:


# Exclusão das colunas que contém dados que neste caso, não serão utilizados neste projeto
data = data.drop(['show_id', 'director', 'cast', 'country', 'date_added', 'rating', 'description'], axis=1)


# In[3]:


# Filtro para exibir apenas filmes
data = data[data.type == 'Movie']
data.head()


# In[4]:


# Importando a biblioteca Numpy
import numpy as np

# Armazenamento dos dados em uma lista
movies = list(data.index)

# Sorteio do filme e armazenamento em uma variavel
index = np.random.choice(movies, 1)

# Exibição do filme sorteado com suas informações: Nome do filme, tempo de duração, ano de lançamento e o gênero
movie = data.iloc[index]
movie

