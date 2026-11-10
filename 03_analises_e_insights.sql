-- Insight 1: Analisando Gargalos Logísticos (OTIF por Estado)
SELECT 
    c.customer_state AS uf,
    COUNT(pv.order_id) AS total_pedidos,
    -- Contagem de falhas logísticas (entregas após o prazo estimado)
    SUM(CASE WHEN pv.order_delivered_customer_date > pv.order_estimated_delivery_date THEN 1 ELSE 0 END) AS pedidos_atrasados,
    -- Cálculo percentual do atraso
    ROUND(
        (SUM(CASE WHEN pv.order_delivered_customer_date > pv.order_estimated_delivery_date THEN 1 ELSE 0 END)::numeric / COUNT(pv.order_id)) * 100, 2
    ) AS percentual_atraso
FROM vw_pedidos_validos pv
JOIN customers c ON pv.customer_id = c.customer_id
GROUP BY c.customer_state
HAVING COUNT(pv.order_id) > 100 -- Filtro para estados com volume relevante
ORDER BY percentual_atraso DESC;

-- ----------------------------------------------------------------------

-- Insight 2: Impacto Financeiro e de Reputação (Atraso vs. Avaliações)
SELECT 
    CASE 
        WHEN pv.order_delivered_customer_date > pv.order_estimated_delivery_date THEN 'Entregue com Atraso'
        ELSE 'Entregue no Prazo'
    END AS status_entrega,
    ROUND(AVG(r.review_score), 2) AS nota_media_avaliacao,
    COUNT(r.review_id) AS total_avaliacoes
FROM vw_pedidos_validos pv
JOIN order_reviews r ON pv.order_id = r.order_id
GROUP BY 1
ORDER BY nota_media_avaliacao DESC;