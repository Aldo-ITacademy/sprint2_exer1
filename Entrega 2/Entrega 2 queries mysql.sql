-- ---------------------------------------------------------------------------------
-- ** CONSULTAS BASE DE DADES TIENDA **
-- --------------------------------------------------------------------------------
-- 1. Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre FROM tienda.producto;
-- 2. Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM tienda.producto;
-- 3. Llista totes les columnes de la taula producto.
SELECT * FROM tienda.producto;
-- 4. Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio AS 'precio(eur)', precio*1.16  AS 'precio(usd)' FROM tienda.producto;
-- 5. Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
SELECT nombre AS 'nom de producte' , precio AS 'euros', precio*1.16  AS 'dolars' FROM tienda.producto;
-- 6. Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre) AS 'nom de producte' , precio AS 'euros' FROM tienda.producto;
-- .7 Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre) AS 'nom de producte' , precio AS 'euros' FROM tienda.producto;
-- .8 Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, LEFT(UPPER(nombre),2) AS 'siglas' FROM tienda.fabricante;
-- 9 Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio) FROM tienda.producto;
-- 10. Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.alter
SELECT nombre, precio FROM tienda.producto;
-- 11. Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT tf.codigo FROM tienda.producto tp JOIN tienda.fabricante tf ON tp.codigo_fabricante= tf.codigo;
-- 12 Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
SELECT tf.codigo FROM tienda.producto tp JOIN tienda.fabricante tf ON tp.codigo_fabricante= tf.codigo GROUP BY tf.nombre;
-- 13 Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM tienda.fabricante ORDER BY nombre ASC;
-- 14 Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
-- 15 Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT nombre FROM tienda.producto ORDER BY nombre ASC, precio DESC;
-- 16 Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM tienda.fabricante LIMIT 5;
-- 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM tienda.fabricante WHERE codigo >= 4 LIMIT 2;
-- 18. Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
SELECT nombre, precio FROM tienda.producto ORDER BY precio ASC LIMIT 1;
-- 19. Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC LIMIT 1;
-- 20. Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT tp.nombre FROM tienda.fabricante tf JOIN tienda.producto tp ON tp.codigo_fabricante= tf.codigo WHERE tf.codigo= 2;
-- 21 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT tp.nombre, tp.precio, tf.nombre AS 'fabricante' FROM tienda.fabricante tf JOIN tienda.producto tp ON tp.codigo_fabricante= tf.codigo;
-- 22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
SELECT tp.nombre, tp.precio, tf.nombre AS 'fabricante' FROM tienda.fabricante tf JOIN tienda.producto tp ON tp.codigo_fabricante= tf.codigo ORDER BY tf.nombre ASC;
-- 23 Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT tp.codigo, tp.nombre, tf.codigo AS 'codigo fabricante', tf.nombre AS 'fabricante' FROM tienda.fabricante tf JOIN tienda.producto tp ON tp.codigo_fabricante= tf.codigo;
-- 24. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT tp.nombre, tp.precio, tf.nombre AS 'fabricante' FROM tienda.fabricante tf JOIN tienda.producto tp ON tp.codigo_fabricante= tf.codigo ORDER BY tp.precio ASC LIMIT 1;
-- 25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT tp.nombre, tp.precio, tf.nombre AS 'fabricante' FROM tienda.fabricante tf JOIN tienda.producto tp ON tp.codigo_fabricante= tf.codigo ORDER BY tp.precio DESC LIMIT 1;
-- 26. Retorna una llista de tots els productes del fabricador Lenovo.
SELECT tp.*, tf.nombre AS 'fabricante' FROM tienda.fabricante tf JOIN tienda.producto tp ON tp.codigo_fabricante= tf.codigo WHERE tf.nombre = 'Lenovo';
-- 27 Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT tp.*, tf.nombre AS 'fabricante' FROM tienda.fabricante tf JOIN tienda.producto tp ON tp.codigo_fabricante= tf.codigo WHERE tf.nombre = 'Crucial' AND tp.precio > 200;
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT tp.*, tf.nombre AS 'fabricante' FROM tienda.fabricante tf JOIN tienda.producto tp ON tp.codigo_fabricante= tf.codigo WHERE tf.nombre REGEXP 'Asus|Hewlett-Packard|Seagate';
-- 28 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Utilitzant l'operador IN.
-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Llista el nom del producte més car del fabricador Lenovo.
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
-- Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.


-- ---------------------------------------------------------------------------------
-- ** CONSULTAS BASE DE DADES UNIVERSIDAD **
-- --------------------------------------------------------------------------------
-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo = "alumno" ORDER BY apellido1, apellido2, nombre ASC;
-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo = 'alumno' AND telefono IS NULL  ORDER BY apellido1, apellido2, nombre ASC;
-- Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM universidad.persona WHERE tipo='alumno' and fecha_nacimiento >= '1999-01-01' and fecha_nacimiento<= '1999-12-31' ;
-- Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
SELECT * FROM universidad.persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * FROM universidad.asignatura ua WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7 ; 
-- Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT uper.nombre, uper.apellido1, uper.apellido2, udep.nombre FROM universidad.persona uper JOIN universidad.profesor uprof ON uper.id = uprof.id_profesor JOIN universidad.departamento udep ON uprof.id_departamento = udep.id ; 
-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
SELECT ua.nombre, uce.anyo_inicio, uce.anyo_fin FROM universidad.persona uper JOIN universidad.alumno_se_matricula_asignatura uasma ON uper.id = uasma.id_alumno JOIN universidad.asignatura ua ON uasma.id_asignatura = ua.id JOIN universidad.curso_escolar uce ON uasma.id_curso_escolar = uce.id WHERE uper.nif = '26902806M';
-- Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT ud.nombre FROM universidad.departamento ud JOIN universidad.profesor up ON ud.id = up.id_departamento JOIN universidad.asignatura ua ON up.id_profesor = ua.id_profesor JOIN universidad.grado ug ON ua.id_grado = ug.id WHERE ug.nombre = 'Grado en Ingeniería Informática (Plan 2015)' GROUP BY ug.nombre;
-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT uper.nif, uper.nombre, uper.apellido1, uper.apellido2 FROM universidad.persona uper JOIN universidad.alumno_se_matricula_asignatura uasma ON uper.id = uasma.id_alumno JOIN universidad.asignatura ua ON uasma.id_asignatura = ua.id JOIN universidad.curso_escolar uce ON uasma.id_curso_escolar = uce.id WHERE uce.id = 5 GROUP BY uper.id;


-- -----------------------------------------------------------------------------------
-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.-
-- -----------------------------------------------------------------------------------

-- Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT udep.nombre AS 'departamento', uper.apellido1, uper.apellido2, uper.nombre FROM universidad.persona uper LEFT JOIN universidad.profesor uprof on uper.id = uprof.id_profesor LEFT JOIN universidad.departamento udep ON udep.id = uprof.id_departamento ORDER BY udep.nombre, uper.apellido1, uper.apellido2, uper.nombre; 
-- Retorna un llistat amb els professors que no estan associats a un departament.
 SELECT udep.nombre AS 'departamento', uper.apellido1, uper.apellido2, uper.nombre FROM universidad.persona uper LEFT JOIN universidad.profesor uprof on uper.id = uprof.id_profesor LEFT JOIN universidad.departamento udep ON udep.id = uprof.id_departamento WHERE udep.nombre IS NULL ORDER BY udep.nombre, uper.apellido1, uper.apellido2, uper.nombre; 
-- Retorna un llistat amb els departaments que no tenen professors associats.
SELECT udep.nombre AS 'departamento', uper.apellido1, uper.apellido2, uper.nombre FROM universidad.persona uper RIGHT JOIN universidad.profesor uprof on uper.id = uprof.id_profesor RIGHT JOIN universidad.departamento udep ON udep.id = uprof.id_departamento WHERE uper.nombre IS NULL ORDER BY udep.nombre, uper.apellido1, uper.apellido2, uper.nombre; 
-- Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT ua.nombre AS 'asignatura', uper.apellido1, uper.apellido2, uper.nombre FROM universidad.persona uper JOIN universidad.profesor uprof on uper.id = uprof.id_profesor LEFT JOIN universidad.asignatura ua ON uprof.id_profesor = ua.id_profesor WHERE ua.nombre IS NULL ORDER BY ua.nombre, uper.apellido1, uper.apellido2, uper.nombre; 
-- Retorna un llistat amb les assignatures que no tenen un professor assignat.
SELECT ua.nombre AS 'asignatura', uper.apellido1, uper.apellido2, uper.nombre FROM universidad.persona uper JOIN universidad.profesor uprof on uper.id = uprof.id_profesor RIGHT JOIN universidad.asignatura ua ON uprof.id_profesor = ua.id_profesor WHERE uper.nombre IS NULL ORDER BY ua.nombre, uper.apellido1, uper.apellido2, uper.nombre; 
-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT ua.nombre AS 'asignatura', udep.nombre AS 'departamento' FROM universidad.departamento udep LEFT JOIN universidad.profesor uprof ON udep.id = uprof.id_profesor RIGHT JOIN universidad.asignatura ua ON uprof.id_profesor = ua.id_profesor ORDER BY ua.nombre ASC; 
SELECT dep.id, dep.nombre, ua.curso FROM departamento dep RIGHT JOIN profesor prof ON prof.id_departamento = dep.id LEFT JOIN asignatura ua ON ua.id_profesor = prof.id_profesor WHERE ua.curso IS NULL GROUP BY dep.id ORDER BY dep.id; 
-- -----------------------------------------------------------------------------------
-- Consultes resum:
-- -----------------------------------------------------------------------------------
 
-- Retorna el nombre total d'alumnes que hi ha.
SELECT count(up.id) FROM universidad.persona up WHERE up.tipo = 'alumno'; 
-- Calcula quants alumnes van néixer en 1999.
SELECT count(up.id) FROM universidad.persona up WHERE up.tipo = 'alumno' AND YEAR(up.fecha_nacimiento)= 1999; 
-- Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
SELECT dep.nombre , count(prof.id_profesor) AS '# profesores'FROM departamento dep JOIN profesor prof ON dep.id = prof.id_departamento GROUP BY dep.id ORDER BY count(prof.id_profesor) DESC;
-- Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT dep.nombre , count(prof.id_profesor) AS '# profesores'FROM departamento dep LEFT JOIN profesor prof ON dep.id = prof.id_departamento GROUP BY dep.id ORDER BY count(prof.id_profesor) DESC;
-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT ug.nombre, COUNT(ua.id) FROM grado ug LEFT JOIN asignatura ua ON ug.id = ua.id_grado GROUP BY ug.nombre ORDER BY COUNT(ua.id) DESC ;
-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT ug.nombre, COUNT(ua.id) AS cuenta, IF(COUNT(ua.id)>40,"si","no") AS mayor40  FROM grado ug LEFT JOIN asignatura ua ON ug.id = ua.id_grado  GROUP BY ug.nombre ORDER BY cuenta DESC ;
-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
-- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
-- Retorna totes les dades de l'alumne més jove.
-- Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.