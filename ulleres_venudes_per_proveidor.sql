USE cul_dampolla;

SELECT p.id_proveidor, p.nom , SUM(v.quantitat) as 'total_ulleres_venudes'
FROM vendes v 
JOIN ulleres u
	ON u.id_ulleres = v.id_ulleres
JOIN proveidors p
	ON u.id_proveidor = p.id_proveidor

GROUP BY p.id_proveidor
ORDER BY total_ulleres_venudes DESC;