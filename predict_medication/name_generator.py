#!/usr/bin/env python
# coding: utf-8

# In[1]:


# 1. Instalação da biblioteca que gera nomes brasileiros completos automaticamente
get_ipython().system('pip install br-nome-gen')


# In[3]:


# 2. Importação do módulo pessoa_random da biblioteca br_nome_gen
from br_nome_gen import pessoa_random

# 3. Lista onde será armazenado os nomes gerados
list_name = []

# 4. Laço de repetição para gerar neste caso, 2 nomes diferentes
for x in range(1,3):

    # 4.1 Variável que recebe os nomes gerados
    name = pessoa_random()
    n = name.nome

    # 4.2 Armazenamento do nome gerado na lista
    list_name.append(n)

# 5. Organiza os nomes gerados um embaixo do outro e não exibi mais os [] da lista e nem as vírgulas
for names in list_name:
    print(names)

