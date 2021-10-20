USE cul_dampolla;

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

