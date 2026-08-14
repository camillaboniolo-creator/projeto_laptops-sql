# Título: Análise de Dados para Política Corporativa de Compras de Notebooks

## FONTE DE DADOS E CRÉDITO:
Dataset: Laptop Specs and Latest Price
Origem: Kangle
Volume: ~896 registros com especificações técnicas e métricas de vendas/avaliações.
Link da Fonte: https://www.kaggle.com/datasets/kuchhbhi/latest-laptop-price-list/data

## OBJETIVO: 
Analisar o mercado de laptops utilizando PostgreSQL para estruturar uma Política Corporativa de Aquisição de Hardware, otimizando a alocação de recursos financeiros da empresa e garantindo a satisfação e produtividade dos colaboradores.

## FERRAMENTAS UTILIZADAS:
Linguagem: SQL
Gerenciador: PostgreSQL


## ESTRUTURA DO BANCO DE DADOS 
O banco de dados foi modelado no PostgreSQL a partir de uma tabela única denominada laptops, contendo dados brutos extraídos do Kaggle.

## CONCLUSÃO: 
Para que o trabalho fosse produzido foi pensado 6 perguntas, a fim de analisá-las pelo banco de dados e assim respondê-las:
1- QUAIS SÃO AS FAIXAS ORÇAMENTÁRIAS DO MERCADO PARA DEFINIÇÃO DE KITS DE TRABALHO POR NÍVEL DE CARGO?
Conclusão: A análise de preços da base de dados revela a estrutura ideal para a política corporativa de aquisição de notebooks, equilibrando custos e a satisfação do colaborador (RH):
​Nível Operacional / Básico (< 30k): Possui orçamento médio de 23.557,85, mas conta com apenas 40 modelos no mercado. Representa um risco para o RH, pois a baixa variedade de máquinas de entrada pode gerar lentidão, insatisfação e chamados de TI.
​Nível Tático / Analistas (30k a 60k): É o ponto de equilíbrio corporativo (sweet spot), reunindo 378 modelos e um preço médio de 47.018,76. É a faixa ideal para padronizar o enxoval das equipes operacionais e analíticas, garantindo alta produtividade e retenção de talentos sem estourar o orçamento.
​Nível Executivo / Alta Performance (> 60k): Concentra 478 modelos com preço médio de 103.887,51 e teto de até 441.990. Por conta da alta variação de valores, exige regras rígidas de aprovação, devendo ser restrito a diretoria ou funções de alto processamento.
​Conclusão para o RH: Fixar um teto de aproximadamente 47.000,00 para as contratações padrão estabelece um critério claro, transparente e eficiente para a concessão de equipamentos na empresa.

2- Quais são os equipamentos com maior valor absoluto de desconto para compras institucionais em lote?
Conclusão: A análise dos maiores descontos revela que é possível realizar compras estratégicas de modelos de alta performance — como a linha Thinkbook — com economias superiores a 50% em relação ao preço original. Do ponto de vista de Administração e RH, essa estratégia de procurement permite entregar equipamentos de nível superior aos colaboradores sem ultrapassar a faixa orçamentária intermediária da empresa, gerando máxima eficiência financeira e aumento da satisfação do funcionário.

3-Quais modelos apresentam baixo índice de satisfação dos usuários e devem ser bloqueados nas compras?
A análise identificou 44 modelos de notebooks com alto índice de rejeição no mercado (notas inferiores a 3.8). O resultado demonstra que valores mais altos não garantem qualidade, existindo modelos acima de 60 mil com avaliações críticas de 1.6 estrelas. Sob a ótica de RH e Gestão Administrativa, recomenda-se a criação de uma política de bloqueio (blacklist) para esses modelos, evitando gargalos de produtividade, chamados excessivos na TI e insatisfação das equipes.

4- Como se comportam a média de preço e a avaliação geral dos produtos em todo o catálogo?
A análise da média geral de preços e satisfação estabelece a baseline (linha de base) do mercado. Sob a perspectiva de Procurement e RH, esses indicadores globais fornecem um parâmetro neutro para negociar contratos corporativos em valores competitivos e garantir que a empresa forneça equipamentos com níveis de satisfação superiores à média de mercado.

5-Existe relação entre o preço do notebook e a satisfação do usuário (star_rating)?
A análise demonstra que não existe uma relação direta ou proporcional entre o preço do notebook e a satisfação do usuário. Modelos de custo intermediário apresentam níveis de avaliação iguais ou superiores a modelos de valor elevado. Para RH e Suprimentos, isso prova que é possível maximizar a satisfação das equipes e a eficiência operacional focando no desempenho real e na boa avaliação do produto, sem a necessidade de inflacionar os custos com equipamentos de alto preço.

6-Quais são os 3 modelos campeões de satisfação do usuário em cada faixa orçamentária?
A análise demonstra que não existe uma relação direta ou proporcional entre o preço do notebook e a satisfação do usuário. Modelos de custo intermediário apresentam níveis de avaliação iguais ou superiores a modelos de valor elevado. Para RH e Suprimentos, isso prova que é possível maximizar a satisfação das equipes e a eficiência operacional focando no desempenho real e na boa avaliação do produto, sem a necessidade de inflacionar os custos com equipamentos de alto preço.












