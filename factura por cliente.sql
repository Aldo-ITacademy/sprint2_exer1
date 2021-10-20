USE cul_dampolla;

SELECT c.nom, SUM(v.quantitat * u.preu) AS 'total factura'
FROM vendes v
JOIN clients c
	ON v.id_client = c.id_client
JOIN ulleres u
	ON u.id_ulleres = v.id_ulleres
WHERE v.data_venda BETWEEN '2021/10/01' AND '2021/10/07'
group by c.id_client
