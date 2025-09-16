--En excluant les commandes annulées, quelles sont les commandes
--récentes de moins de 3 mois que les clients ont reçues avec au moins 3
--jours de retard ?

SELECT order_id
FROM main.orders

WHERE order_status != 'canceled'
    AND order_purchase_timestamp >= DATE('2018-10-17', '-3 months')
    AND julianday(order_delivered_customer_date) - julianday(order_estimated_delivery_date) >= 3;

--Qui sont les vendeurs ayant généré un chiffre d'affaires de plus de 100
--000 Real sur des commandes livrées via Olist ?

SELECT
    s.seller_id,
    s.seller_city,
    s.seller_state,
    SUM(oi.price) AS total_sales
FROM
    main.order_items oi
JOIN
    main.orders o ON oi.order_id = o.order_id
JOIN
    main.sellers s ON oi.seller_id = s.seller_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    s.seller_id, s.seller_city, s.seller_state
HAVING
    SUM(oi.price) > 100000;

--Qui sont les nouveaux vendeurs (moins de 3 mois d'ancienneté) qui
--sont déjà très engagés avec la plateforme (ayant déjà vendu plus de 30
--produits) ?

SELECT
    s.seller_id,
    s.seller_city,
    s.seller_state,
    MIN(o.order_purchase_timestamp) AS first_sale_date,
    COUNT(*) AS nb_produits_vendus
FROM
    main.order_items oi
    JOIN main.orders o ON oi.order_id = o.order_id
    JOIN main.sellers s ON oi.seller_id = s.seller_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    s.seller_id, s.seller_city, s.seller_state
HAVING
    first_sale_date >= DATE('2018-10-17', '-3 months')
    AND nb_produits_vendus > 30
ORDER BY
    nb_produits_vendus DESC;

--Question : Quels sont les 5 codes postaux, enregistrant plus de 30
--reviews, avec le pire review score moyen sur les 12 derniers mois ?

SELECT
    c.customer_zip_code_prefix,
    COUNT(*) AS nb_reviews,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM
    main.order_reviews r
    JOIN main.orders o ON r.order_id = o.order_id
    JOIN main.customers c ON o.customer_id = c.customer_id
WHERE
    r.review_creation_date >= '2017-10-17'
GROUP BY
    c.customer_zip_code_prefix
HAVING
    nb_reviews > 30
ORDER BY
    avg_review_score ASC -- du pire au meilleur score
LIMIT 5;

--
-- 1) Schéma
PRAGMA table_info('orders');

-- 2) Total commandes vs clients distincts
SELECT
  COUNT(*)               AS total_orders,
  COUNT(DISTINCT customer_id) AS distinct_clients
FROM orders;

-- 3) Aperçu
SELECT * FROM orders LIMIT 10;

-- 4) Unicité des order_id
SELECT
  COUNT(*)               AS total_orders,
  COUNT(DISTINCT order_id)   AS distinct_orders
FROM orders;

SELECT
  c.customer_unique_id,
  COUNT(*) AS nb_commandes
FROM main.orders   AS o
JOIN main.customers AS c USING(customer_id)
GROUP BY c.customer_unique_id
HAVING COUNT(*) > 1
ORDER BY nb_commandes DESC;
