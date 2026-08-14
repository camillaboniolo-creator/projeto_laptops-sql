SELECT * FROM laptops LIMIT 10;

1- QUAIS SÃO AS FAIXAS ORÇAMENTÁRIAS DO MERCADO PARA DEFINIÇÃO DE KITS DE TRABALHO POR NÍVEL DE CARGO?

SELECT 
    CASE 
        WHEN latest_price < 30000 THEN '1. Nível Operacional / Básico'
        WHEN latest_price BETWEEN 30000 AND 60000 THEN '2. Nível Tático / Analistas'
        ELSE '3. Nível Executivo / Alta Performance'
    END AS perfil_colaborador,
    COUNT(*) AS total_modelos_disponiveis,
    ROUND(AVG(latest_price), 2) AS preco_medio,
    MIN(latest_price) AS menor_preco,
    MAX(latest_price) AS maior_preco
FROM public.laptops
GROUP BY 1
ORDER BY 1;


2-
 Quais são os equipamentos com maior valor absoluto de desconto para compras institucionais em lote?

SELECT 
    model,
    latest_price AS preco_com_desconto,
    old_price AS preco_original,
    discount AS economia_por_unidade,
    ROUND(((old_price - latest_price)::numeric / old_price) * 100, 2) AS percentual_economia
FROM public.laptops
WHERE old_price > latest_price
ORDER BY discount DESC
LIMIT 10;



3-Quais modelos apresentam baixo índice de satisfação dos usuários e devem ser bloqueados nas compras?

SELECT 
    model,
    latest_price,
    star_rating AS nota_satisfacao,
    ratings AS total_avaliacoes,
    reviews AS total_comentarios
FROM public.laptops
WHERE star_rating < 3.8 AND ratings >= 10
ORDER BY star_rating ASC;

4- Como se comportam a média de preço e a avaliação geral dos produtos em todo o catálogo?

SELECT 
    COUNT(*) AS total_laptops_analisados,
    ROUND(AVG(latest_price), 2) AS preco_medio_mercado,
    ROUND(AVG(star_rating), 2) AS nota_media_satisfacao,
    SUM(ratings) AS total_avaliacoes_acumuladas,
    ROUND(AVG(discount), 2) AS desconto_medio_mercado
FROM public.laptops;



5-Existe relação entre o preço do notebook e a satisfação do usuário (star_rating)?

SELECT 
    CASE 
        WHEN latest_price < 30000 THEN 'Até 30k'
        WHEN latest_price BETWEEN 30000 AND 60000 THEN '30k a 60k'
        WHEN latest_price BETWEEN 60001 AND 100000 THEN '60k a 100k'
        ELSE 'Acima de 100k'
    END AS faixa_de_preco,
    COUNT(*) AS quantidade_modelos,
    ROUND(AVG(star_rating), 2) AS satisfacao_media,
    ROUND(AVG(ratings), 0) AS media_avaliacoes_por_modelo
FROM public.laptops
GROUP BY 1
ORDER BY MIN(latest_price);

6-
Quais são os 3 modelos campeões de satisfação do usuário em cada faixa orçamentária?
WITH ranking_equipamentos AS (
    SELECT 
        model,
        latest_price,
        star_rating,
        ratings,
        CASE 
            WHEN latest_price < 35000 THEN 'Faixa Econômica'
            WHEN latest_price BETWEEN 35000 AND 70000 THEN 'Faixa Intermediária'
            ELSE 'Faixa Premium'
        END AS categoria_orcamento,
        DENSE_RANK() OVER(
            PARTITION BY (
                CASE 
                    WHEN latest_price < 35000 THEN 'Faixa Econômica'
                    WHEN latest_price BETWEEN 35000 AND 70000 THEN 'Faixa Intermediária'
                    ELSE 'Faixa Premium'
                END
            ) 
            ORDER BY star_rating DESC, ratings DESC
        ) AS posicao_rank
    FROM public.laptops
    WHERE ratings >= 15
)
SELECT 
    categoria_orcamento,
    posicao_rank,
    model,
    latest_price,
    star_rating,
    ratings
FROM ranking_equipamentos
WHERE posicao_rank <= 3
ORDER BY categoria_orcamento, posicao_rank;