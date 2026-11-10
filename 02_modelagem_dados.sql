-- Criação de uma View para filtrar pedidos válidos e calcular o tempo de entrega
CREATE OR REPLACE VIEW vw_pedidos_validos AS
SELECT 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    -- Calculando o lead time real (tempo de entrega em dias)
    EXTRACT(EPOCH FROM (o.order_delivered_customer_date - o.order_purchase_timestamp))/86400 AS dias_para_entrega
FROM orders o
WHERE o.order_status = 'delivered' 
  AND o.order_delivered_customer_date IS NOT NULL;