
-- -------------------------------------------------------------------
-- ENTREGA 1
USE cul_dampolla;
-- -------------------------------------------------------------------

-- Llista el total de factures d'un client en un període determinat
SELECT c.nom, SUM(v.quantitat * u.preu) AS 'total factura'
FROM vendes v
JOIN clients c
	ON v.id_client = c.id_client
JOIN ulleres u
	ON u.id_ulleres = v.id_ulleres
WHERE v.data_venda BETWEEN '2021/10/01' AND '2021/10/07'
group by c.id_client;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
SELECT p.id_proveidor, p.nom , SUM(v.quantitat) as 'total_ulleres_venudes'
FROM vendes v 
JOIN ulleres u
	ON u.id_ulleres = v.id_ulleres
JOIN proveidors p
	ON u.id_proveidor = p.id_proveidor
GROUP BY p.id_proveidor
ORDER BY total_ulleres_venudes DESC;

-- Llista els diferents models d'ulleres que ha venut un empleat durant un any
SELECT u.id_ulleres, u.marca, cm.color_muntura, cv.color_vidres
FROM empleats e
JOIN vendes v
	ON v.id_empleat = e.id_empleat
JOIN ulleres u
	ON u.id_ulleres = v.id_ulleres
JOIN colors_muntura cm
	ON u.color_muntura = cm.id_color_muntura
JOIN colors_vidres cv
	ON u.color_vidres = cv.id_color_vidres
WHERE e.nom = 'lionel' 
AND v.data_venda BETWEEN '2021/01/01' AND '2021/12/31' ;