
CREATE TABLE Persona(
    id_persona INT PRIMARY KEY AUTO_INCREMENT,
    dni INT UNIQUE DEFAULT NULL,
    nombre VARCHAR(100) DEFAULT NULL,
    apellido VARCHAR(100) NOT NULL ,
    email VARCHAR(200) NOT NULL ,
    es_docente BOOLEAN,
    fk_grupo INT DEFAULT NULL,
    FOREIGN KEY (fk_grupo) REFERENCES Grupo (id_grupo),
    fk_rol INT DEFAULT NULL,
    FOREIGN KEY (fk_rol) REFERENCES Rol (id_rol),
    fk_localidad INT DEFAULT 16,
    FOREIGN KEY (fk_localidad) REFERENCES Localidad (id_localidad),
    exp_sql BOOLEAN,
    exp_nosql BOOLEAN,
    trabajo BOOLEAN
);

CREATE TABLE Materia(
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    nombre_materia VARCHAR(100) NOT NULL
);

CREATE TABLE Hobbie(
    id_hobbie INT PRIMARY KEY AUTO_INCREMENT,
    nombre_hobbie VARCHAR(50) NOT NULL
);

CREATE TABLE Mascota(
    id_mascota INT PRIMARY KEY AUTO_INCREMENT,
    fk_tipo INT NOT NULL ,
    nombre_mascota VARCHAR(100) DEFAULT 'Sin Nombre',
    FOREIGN KEY (fk_tipo) REFERENCES TipoMascota(id_tipo) ,
    id_persona INT NOT NULL ,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE TipoMascota(
    id_tipo INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    especie VARCHAR(50) NOT NULL
);

CREATE TABLE PersonaRecomendacion (
    id_persona INT NOT NULL ,
    id_reco INT NOT NULL,
    PRIMARY KEY (id_persona, id_reco),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
    FOREIGN KEY (id_reco) REFERENCES Recomendacion(id_reco)
);

CREATE TABLE PersonaMateria (
    id_persona INT NOT NULL ,
    id_materia INT NOT NULL ,
    PRIMARY KEY (id_persona, id_materia),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
    FOREIGN KEY (id_materia) REFERENCES Materia(id_materia)
);

CREATE TABLE PersonaHobbie(
    id_persona INT NOT NULL ,
    id_hobbie INT NOT NULL ,
    PRIMARY KEY (id_persona, id_hobbie),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
    FOREIGN KEY (id_hobbie) REFERENCES Hobbie(id_hobbie)
);

CREATE TABLE Recomendacion(
    id_reco INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('Serie', 'Musica') NOT NULL,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Localidad(
    id_localidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre_localidad VARCHAR(100) DEFAULT 'Bs As'
);

CREATE TABLE Grupo(
    id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_grupo VARCHAR(100) NOT NULL
);

CREATE TABLE Rol(
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(100) NOT NULL
);

INSERT INTO TipoMascota (especie)
VALUES ('Perro'),('Gato'),('Gorrion');

INSERT INTO Rol (nombre_rol)
VALUES ('Team Lider'),('Organizador'),('Representante'),
       ('Supervisor') ,('Lider Tecnico');

INSERT INTO Grupo (nombre_grupo)
VALUES  ('DataMasters'),('nullpointer'),('Enrutados'),
        ('Mandarina'),('MCTeam'),('okupas'),
        ('undefined'),('DropTable'),('DreamTeam');

INSERT INTO Localidad (nombre_localidad)
VALUES ('San Martin'),('CABA'),('Villa Ballester'),
       ('J. L. Suarez'),('Gral. Pacheco'),('Escobar'),
       ('Santos Lugares'), ('San Andres'), ('Villa Bosch'),
       ('El Palomar'), ('Ciudad Jardin'), ('Laferrere'),
       ('Loma Hermosa'), ('Chilavert'), ('Florida'),
       (DEFAULT);

INSERT INTO Materia (nombre_materia)
VALUES ('Algoritmos 3'), ('CASO'),
       ('Seminario de Prog. Concurrente'), ('Bases de Datos');

INSERT INTO Hobbie (nombre_hobbie)
VALUES ('Tocar Guitarra'), ('Viajar'), ('Videojuegos'),
       ('Manga/Anime'), ('Jardineria'), ('Reparar PC'),
       ('Deportes'), ('Leer'), ('Cantar'),
       ('Correr'), ('Gimnasio'), ('Dibujar'),
       ('Peliculas'), ('Musica'), ('Ajedrez'),
       ('Series'), ('Twitter'), ('Juntadas'),
       ('Bicicleta'), ('Fotografia'), ('Skate'),
       ('Carpinteria');

INSERT INTO Recomendacion (tipo, descripcion)
VALUES ('Serie','Supernatural'), ('Serie','The Boys'),
       ('Serie','The Bear'),('Serie','Betty la Fea'),
       ('Serie','Dragon Ball'), ('Serie','Jojo´s'),
       ('Serie','The Office'), ('Serie','House of the Dragons'),
       ('Serie','Arcane'),('Serie','Dark'),
       ('Serie','Black Mirror'), ('Serie','Better Call Saul'),
       ('Musica','Rock'), ('Musica','Bandas Sonoras'),
       ('Musica','Tropical'),('Musica','Variado'),
       ('Musica','Cuarteto'), ('Musica','Metal'),
       ('Musica','Electronica'),('Musica','Trap'),
       ('Musica','Heavy Metal'),('Musica','Pop'),
       ('Musica','Rap'),('Musica','Kpop'),
       ('Musica','Pelea de Gallos'), ('Musica','Reggae'),
       ('Musica','Soul'),('Musica','Alternativa');

INSERT INTO Persona (dni, nombre, apellido, email, es_docente, fk_grupo,
                     fk_rol, exp_sql, exp_nosql, trabajo, fk_localidad)
VALUES  (37688075, DEFAULT, 'Jotallan Calvetti', 'gaabicarp@gmail.com', false,
        1, 2, true, true, true,1),
        (41472398, 'Mariel Nadine', 'Kovinchich', 'marielkov1998@gmail.com', false,
        1, 3, true, false, true,4),
        (38532025, 'Gaston Ezequiel', 'Abelardo', 'gabelardo@estudiantes.unsam.edu.ar', false,
         1, 1, false, false, true,1),
        (40663606, 'Rodrigo Nicolas', 'Pavon Gomez', 'rodrigopavongomez@gmail.com', false,
         1, 5, false, false, true, DEFAULT),
        (38601662, DEFAULT, 'Dragonetti', 'mdragonetti@estudiantes.unsam.edu.ar', false,
         1, 4, false, false, true,1),
        (44547586, 'Juan Ignacio', 'Caceffo', 'jicaceffo@estudiantes.unsam.edu.ar', false,
         2, 5, true, true, true,5),
        (37984582, DEFAULT, 'Gibelli', 'juligibelli@gmail.com', false,
         2, 2, true, true, true,2),
        (35972409, 'Emiliano Javier','Nuñez',  'ejnunez@estudiantes.unsam.edu.ar', false,
         2, 3, true, false, true, DEFAULT),
        (43036494, 'Alejo', 'Menini', 'amenini@estudiantes.unsam.edu.ar', false,
        2, 4, true, false, true,8),
        (35726203, 'Facundo', 'Barneche', 'fh.barneche@gmail.com', false,
         2, 1, true, true, true,7),
        (43245286, 'Valentino', 'Bortolussi', 'valentino.bortolussi.lembo@gmail.com', false,
         3, 4, false, false, false,6),
        (42647332, 'Santiago', 'Bouza', 'sbouza@estudiantes.unsam.edu.ar', false,
         3, 5, false, false, false,6),
        (38703368, 'Cristian', 'Lomas', 'cristian.lomas.a@gmail.com', false,
         3, 3, true, false, true,DEFAULT),
        (42472348, 'Tomás', 'Neiro', 'tomasneiro@hotmail.com', false,
         3, 2, false, false, true,2),
        (37626822, DEFAULT, 'Villafañez Sobrecasa', 'ccvillafanezsobrecasa@estudiantes.unsam.edu.ar', false,
         3, 1, true, false, true,2),
        (41067566, 'Maximiliano', 'Borrelli', 'maxifborrelli@gmail.com', false,
         4, 5, true, true, true,3),
        (44792981, 'Theo', 'Narmontas Bocci', 'narmontastheo@gmail.com', false,
         4, 2, false, false, false,DEFAULT),
        (95822280, 'Paola', 'Toledo Contreras', 'ptoledocontreras@estudiantes.unsam.edu.ar', false,
         4, 3, true, false, true,2),
        (35993466, 'Matias Hernan', 'Diaz', 'diaz.matiash@gmail.com', false,
         4, 4, true, false, true,7),
        (42321002, 'Annabella', 'Pagano', 'apagano@estudiantes.unsam.edu.ar', false,
         4, 1, true, false, true,1),
        (40007189, 'Gabriel', 'Tarquini', 'gabi.tarquini@gmail.com', false,
         5, 5, false, false, true,9),
        (39800551, 'Valentin Pedro', 'Fucceneco', 'vfuccenecco@estudiantes.unsam.edu.ar', false,
         5, 2, false, false, true,1),
        (41106994, 'Agustina', 'Rey Brienza', 'a.reybrienza@gmail.com', false,
         5, 3, false, false, true,10),
        (43781315, 'Emiliano', 'Decuzzi', 'eadecuzzi@estudiantes.unsam.edu.ar', false,
         5, 4, true, false, true,11),
        (44160355, 'Tatiana', 'Sabbatini', 'tsabbatini@estudiantes.unsam.edu.ar', false,
         5, 1, false, false, true,2),
        (40395042, DEFAULT, 'Ruina', 'mjruina@estudiantes.unsam.edu.ar', false,
         6, 5, true, true, false, DEFAULT),
        (41684308, 'Lautaro', 'Cuellar', 'lautacuellar69@hotmail.com', false,
         6, 2, true, true, false,13),
        (43017353, 'Federico', 'Virgilio', 'fedevirgili00@gmail.com', false,
         6, 3, true, false, true,1),
        (42291365, 'Alan', 'Exarchos', 'alanexarchos@gmail.com', false,
         6, 4, true, false, false,9),
        (45105469, DEFAULT, 'Rossi', 'flrossi@estudiantes.unsam.edu.ar', false,
         6, 1, true, false, true,2),
        (DEFAULT, 'Ernesto','Davogustto', 'ernesto.davogustto@gmail.com', false,
         7, 5, false, false, true,2),
        (45174406, 'Lucas Gonzalo', 'Rodriguez', 'lgrodriguez@estudiantes.unsam.edu.ar', false,
         7, 3, false, false, false,3),
        (39916775, 'Alan', 'Guarino', 'aguarino@estudiantes.unsam.edu.ar', false,
         7, 4, false, false, true,3),
        (35766192, 'Tamara Eleonor', 'Mecozzi', 'mecozzite@gmail.com', false,
         7, 1, false, false, true,1),
        (DEFAULT, 'Agustin', 'Hoj', 'ahoj@estudiantes.unsam.edu.ar', false,
         7, 2, false, false, true,3),
        (35093145, 'Matias', 'Caballero', 'msebacaballero@gmail.com', false,
         8, 5, false, false, true,12),
        (36594617, 'David', 'Pazos', 'davidgpazos@gmail.com', false,
         8, 2, false, false, true,2),
        (43441575, 'Fabrizio', 'Signorello', 'fsignorello@estudiantes.undam.edu.ar', false,
         8, 3, true,false, false,3),
        (42997600, 'Andres Elias', 'Simonini', 'aesimonini@estudiantes.unsam.edu.ar', false,
         8, 4, false,false, false,13),
        (35205248, 'Emiliano', 'Ferretti', 'emieferretti@gmail.com', false,
         8, 1, false,false, true,7),
        (41555134, DEFAULT, 'Perez', 'amperez@estudiantes.unsam.edu.ar', false,
         9, 5, false,false, true,3),
        (41548103, 'Delfina', 'Borrelli', 'dborrelli@estudiantes.unsam.edu.ar', false,
         9, 2, false,false, true,DEFAULT),
        (42101048, 'Pedro', 'Geraghty', 'pedrogeraghty82@gmail.com', false,
         9, 3, false,false, true,2),
        (36791436, 'Diego', 'Lentz', 'digoolentz@gmail.com', false,
         9, 4, false,false, true,14),
        (44553142, DEFAULT, 'Pugliese', 'valentinpugliesew@outlook.com', false,
         9, 1, true,false, true,DEFAULT),
        (DEFAULT, 'Pablo', 'Nuñez Monzon', 'pnunezmonzon@unsam.edu.ar', true,
         DEFAULT, DEFAULT, true,true, true,2),
        (32438510, 'Denise', 'Martin', 'dmmartin@unsam.edu.ar', true,
         DEFAULT, DEFAULT, true,true, true,2),
        (44514481, 'Diego', 'Mirarchi', 'dhmirarchi@estudiantes.unsam.edu.ar', true,
         DEFAULT, DEFAULT, true,true, true,15);

INSERT INTO Mascota (fk_tipo, nombre_mascota, id_persona)
VALUES (1,'Lila',2), (1,'Leia',3),
       (2,'Artyom',4), (2,'Sol',4),
       (2,'Tigre',4), (1,'Ringo',4),
       (1,'Terry',4), (1,'Milo',5),
       (1,'Bobi',6), (1,'Luis',6),
       (1,'Mailo',6), (2,'Reyna', 10),
       (1,'Rita', 11), (2,'Apolo',12),
       (2,'Coco',12), (2,'Zoe',12),
       (2, DEFAULT,13), (2, DEFAULT,13),
       (2, DEFAULT,13), (1, DEFAULT,14),
       (1, DEFAULT,14), (1, DEFAULT,16),
       (1, DEFAULT,19), (2, DEFAULT,20),
       (2, DEFAULT,20), (1, DEFAULT,20),
       (2, DEFAULT,21), (1, DEFAULT,21),
       (1, DEFAULT,21), (2, DEFAULT,22),
       (2, DEFAULT,22), (1, 'Uma',23),
       (1, 'Jack',23), (1, DEFAULT,24),
       (2, 'Lety',27), (1, 'Tyson',29),
       (1, 'Arakur',30), (1, DEFAULT,31),
       (1, 'Morena',32),(1, DEFAULT,33),
       (1, DEFAULT,33), (1, DEFAULT,33),
       (2, DEFAULT,34),(2, DEFAULT,34),
       (2, DEFAULT,34),(1, DEFAULT,34),
       (1, DEFAULT,34), (1, DEFAULT,35),
       (1, DEFAULT,36), (1, DEFAULT,36),
       (1, DEFAULT,41),(1, DEFAULT,41),
       (1, DEFAULT,41),(2, DEFAULT,41),
       (2, DEFAULT,41),(2, DEFAULT,41),
       (2, DEFAULT,42),(2, DEFAULT,42),
       (2, DEFAULT,43),(2, DEFAULT,43),
       (1, DEFAULT,43),(1, DEFAULT,44),
       (1, 'Lennon',46),(3, DEFAULT,47),
       (3, DEFAULT,47),(1, 'Eevee',48),
       (2,'Rhysand',5);

INSERT INTO PersonaRecomendacion (id_reco,id_persona)
VALUES  (13, 1), (13, 2), (13, 3),
        (13,7),(13,8),(13,11),
        (13,15),(13,18),(13,19),
        (13,22),(13,23),(13,24),
        (13,27),(13,32),(13,33),
        (13, 35),(13,37),(13,38),
        (13,43),(13,44),(14,2),
        (15,4),(16,5),(16,14),
        (16,21),(16,23),(16,24),
        (16,34),(16,44),(16,45),
        (17,10),(17,44),(18,29),
        (21,43),(19,29),(19, 35),
        (19,38),(19,44),(19,48),
        (20,29),(22,15),(22,18),
        (22,30),(22,37),(23,6),
        (23,21),(23,35),(24,15),
        (24,18),(25,36),(26,20),
        (27,39),(28,6),(28,39),
        (1,7),(2,9),(2,22),
        (3,14),(3,23),(4,15),
        (4,18),(5,17),(6,17),
        (7,21),(7,30),(7,43),
        (8,35),(8,44),(9,39),
        (10,41),(11,41),(12,43);

INSERT INTO PersonaMateria (id_materia,id_persona)
VALUES (1,2),(1,3),(1,11),
       (1,12),(1,13),(1,14),
       (1,16),(1,17),(1,19),
       (1,21),(1,22),(1,23),
       (1,24),(1,25),(1,26),
       (1,27),(1,28),(1,30),
       (1,31),(1,32),(1,33),
       (1,34),(1,35),(1,36),
       (1,38),(1,39),(1,40),
       (1,41),(1,42),(1,43),
       (1,44),(1,45),(3,7),
       (2,37),(3,4),(3,5),
       (3,8),(3,10),(3,11),
       (3,12),(3,13),(3,14),
       (3,17),(3,19),(3,24),
       (3,25),(3,26),(3,27),
       (3,28),(3,29),(3,30),
       (3,31),(3,32),(3,33),
       (3,34),(3,41),(3,42),
       (3,45),(4,1),(4,2),
       (4,3),(4,4),(4,5),
       (4,6),(4,7),(4,8),
       (4,9),(4,10),(4,11),
       (4,12),(4,13),(4,14),
       (4,15),(4,16),(4,17),
       (4,18),(4,19),(4,20),
       (4,21),(4,22),(4,23),
       (4,24),(4,25),(4,26),
       (4,27),(4,28),(4,29),
       (4,30),(4,31),(4,32),
       (4,33),(4,34),(4,35),
       (4,36),(4,37),(4,38),
       (4,39),(4,40),(4,41),
       (4,42),(4,43),(4,44),
       (4,45);

INSERT INTO PersonaHobbie (id_hobbie,id_persona)
VALUES (1,1),(1,23),(1,36),
       (2,1), (2,34),(3,1),
       (3,17),(3,24),(3,29),
       (3,33),(3,46),(3,39),
       (3,44),(3,45),(3,47),
       (3,48),(4,2),(4,17),
       (5,2),(5,13),(5,20),
       (5,47),(6,3),(6,14),
       (7,4),(7,9),(7,10),
       (7,13),(7,16),(7,21),
       (7,23),(7,25),(7,27),
       (7,37),(7,38),(21,43),
       (7,44),(8,5),(8,7),
       (8,12),(8,13),(8,14),
       (8,25),(8,41),(8,47),
       (9,6),(9,23),(10,6),
       (10,7),(10,40),(11,6),
       (11,11),(11,17),(11,24),
       (11,31),(11,34),(11,46),
       (11,45),(12,7),(12,39),
       (13,9),(13,15),(13,18),
       (13,29),(13,35),(13, 48),
       (14,10),(14,25),(14,31),
       (14,40),(14,35),(15,13),
       (15,37),(15,48),(16,15),
       (16,18),(16,29),(16,32),
       (17,20),(18,21),(19,24),
       (19,38),(19,35),(20, 31),
       (20,35),(22,47);




-- A) Consulta Basica:
SELECT
    l.nombre_localidad,
    h.nombre_hobbie,
    COUNT(ph.id_persona) AS num_personas
FROM
    Persona p
        INNER JOIN Localidad l ON p.fk_localidad = l.id_localidad
        INNER JOIN PersonaHobbie ph ON p.id_persona = ph.id_persona
        INNER JOIN Hobbie h ON ph.id_hobbie = h.id_hobbie
GROUP BY
    l.nombre_localidad, h.nombre_hobbie
ORDER BY num_personas DESC
LIMIT 5;
-- A) Consulta con Vista y repeticion de localidades:
CREATE VIEW vw_hobbies_por_localidad AS
SELECT
    l.nombre_localidad,
    h.nombre_hobbie,
    COUNT(ph.id_persona) AS num_personas
FROM
    Persona p
        INNER JOIN Localidad l ON p.fk_localidad = l.id_localidad
        INNER JOIN PersonaHobbie ph ON p.id_persona = ph.id_persona
        INNER JOIN Hobbie h ON ph.id_hobbie = h.id_hobbie
GROUP BY
    l.nombre_localidad, h.nombre_hobbie;

SELECT * FROM vw_hobbies_por_localidad ORDER BY num_personas DESC
LIMIT 5;

-- A) Consulta con Vista y sin repeticion de localidades:
CREATE VIEW HobbieMasComunXLocalidad AS
SELECT
    l.id_localidad,
    h.id_hobbie AS hobbie_mas_comun,
    COUNT(ph.id_persona) AS total_alumnos,
    ROW_NUMBER() OVER (
        PARTITION BY l.id_localidad
        ORDER BY COUNT(ph.id_persona) DESC, h.nombre_hobbie
        ) AS fila
FROM Persona p
         JOIN Localidad l ON p.fk_localidad = l.id_localidad
         JOIN PersonaHobbie ph ON p.id_persona = ph.id_persona
         JOIN Hobbie h ON ph.id_hobbie = h.id_hobbie
GROUP BY l.id_localidad, h.id_hobbie;

SELECT
    l.nombre_localidad AS Localidad,
    h.nombre_hobbie AS Hobbie_Mas_Comun,
    hv.total_alumnos AS Total_Alumnos
FROM HobbieMasComunXLocalidad hv
         JOIN Localidad l ON hv.id_localidad = l.id_localidad
         JOIN Hobbie h ON hv.hobbie_mas_comun = h.id_hobbie
WHERE hv.fila = 1
ORDER BY hv.total_alumnos DESC;

-- B)
SELECT
    p.nombre,
    p.apellido,
    COUNT(pm.id_materia) AS materias_en_curso,
    p.exp_sql,
    p.exp_nosql
FROM
    Persona p
        INNER JOIN PersonaMateria pm ON p.id_persona = pm.id_persona
GROUP BY
    p.id_persona, p.nombre, p.apellido, p.exp_sql, p.exp_nosql
ORDER BY
    materias_en_curso DESC
LIMIT 5;

-- C) Sin repetir grupos (osea, solo sale una de las materias):
SELECT nombre_grupo, nombre_materia, cantidad_alumnos_inscriptos, porcentaje_inscriptos
FROM (
         SELECT
             g.nombre_grupo,
             m.nombre_materia,
             COUNT(*) AS cantidad_alumnos_inscriptos,
             (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Persona p WHERE p.fk_grupo = g.id_grupo)) AS porcentaje_inscriptos,
             ROW_NUMBER() OVER (PARTITION BY g.nombre_grupo ORDER BY (COUNT(*) * 100.0 / (SELECT COUNT(*)
                                                                                          FROM Persona p
                                                                                          WHERE p.fk_grupo = g.id_grupo)
                 ) DESC) as rn
         FROM Persona p
                  INNER JOIN Grupo g ON p.fk_grupo = g.id_grupo
                  INNER JOIN PersonaMateria pm ON p.id_persona = pm.id_persona
                  INNER JOIN Materia m ON pm.id_materia = m.id_materia
         GROUP BY g.nombre_grupo, m.nombre_materia, g.id_grupo
     ) ranked
WHERE rn = 1
ORDER BY nombre_grupo;

-- C) Repitiendo grupos (cada grupo tiene mas de una materia popular):
SELECT
    g.nombre_grupo AS Grupo,
    m.nombre_materia AS Materia,
    COUNT(pm.id_persona) AS Alumnos_Inscritos,
    CONCAT(ROUND((COUNT(pm.id_persona) * 100.0 / (SELECT COUNT(*)
                                                  FROM Persona p
                                                  WHERE p.fk_grupo = g.id_grupo)), 2), '%') AS Porcentaje_Grupo
FROM
    Grupo g
        JOIN
    Persona p ON g.id_grupo = p.fk_grupo
        JOIN
    PersonaMateria pm ON p.id_persona = pm.id_persona
        JOIN
    Materia m ON pm.id_materia = m.id_materia
GROUP BY
    g.id_grupo, m.id_materia
HAVING
    COUNT(pm.id_persona) = (
        SELECT MAX(total)
        FROM (
                 SELECT COUNT(pm2.id_persona) AS total
                 FROM Persona p2
                          JOIN PersonaMateria pm2 ON p2.id_persona = pm2.id_persona
                 WHERE p2.fk_grupo = g.id_grupo
                 GROUP BY pm2.id_materia
             ) subquery
    )
ORDER BY
    g.id_grupo;

-- C) Aplicando una Vista:
CREATE VIEW MateriaMasPopularPorGrupo AS
SELECT
    g.id_grupo,
    g.nombre_grupo AS Grupo,
    m.id_materia,
    m.nombre_materia AS Materia,
    COUNT(pm.id_persona) AS Cantidad_Inscritos,
    ROUND((COUNT(pm.id_persona) /
           (SELECT COUNT(*)
            FROM Persona
            WHERE fk_grupo = g.id_grupo AND es_docente = FALSE)) * 100, 2) AS Porcentaje_Inscritos,
    ROW_NUMBER() OVER (
        PARTITION BY g.id_grupo
        ORDER BY COUNT(pm.id_persona) DESC, m.nombre_materia ASC
        ) AS Fila
FROM Grupo g
         INNER JOIN Persona p ON g.id_grupo = p.fk_grupo
         INNER JOIN PersonaMateria pm ON p.id_persona = pm.id_persona
         INNER JOIN Materia m ON pm.id_materia = m.id_materia
WHERE p.es_docente = FALSE
GROUP BY g.id_grupo, m.id_materia, g.nombre_grupo, m.nombre_materia;

SELECT
    Grupo,
    Materia,
    Cantidad_Inscritos,
    Porcentaje_Inscritos
FROM MateriaMasPopularPorGrupo
WHERE Fila = 1
ORDER BY Grupo;

-- D) Repitiendo alumnos:
SELECT
    p.nombre,
    p.apellido,
    p.email,
    p.exp_sql,
    p.exp_nosql,
    m.nombre_materia
FROM
    Persona p
        JOIN
    PersonaMateria pm ON p.id_persona = pm.id_persona
        JOIN
    Materia m ON pm.id_materia = m.id_materia
WHERE
    (p.exp_sql = TRUE OR p.exp_nosql = TRUE AND m.nombre_materia = 'Bases de Datos')
  AND p.es_docente = FALSE
ORDER BY
    (p.exp_sql + p.exp_nosql) DESC
LIMIT 5;

-- D) Sin repetir alumnos:
SELECT DISTINCT
    p.nombre,
    p.apellido,
    p.email,
    p.exp_sql,
    p.exp_nosql,
    m.nombre_materia
FROM
    Persona p
        JOIN
    PersonaMateria pm ON p.id_persona = pm.id_persona
        JOIN
    Materia m ON pm.id_materia = m.id_materia
WHERE
    m.nombre_materia = 'Bases de Datos'
  AND p.es_docente = FALSE
ORDER BY
    (p.exp_sql + p.exp_nosql) DESC
LIMIT 5;

-- 3. A) Consulta con Subquery
SELECT
    l.nombre_localidad,
    COUNT(DISTINCT p.id_persona) AS total_alumnos,
    AVG(subquery.total_materias) AS promedio_materias
FROM
    Persona p
        JOIN
    Localidad l ON p.fk_localidad = l.id_localidad
        JOIN
    (
        SELECT
            pm.id_persona,
            COUNT(pm.id_materia) AS total_materias
        FROM
            PersonaMateria pm
        GROUP BY
            pm.id_persona
    ) AS subquery ON p.id_persona = subquery.id_persona
WHERE
    p.es_docente = FALSE
GROUP BY
    l.nombre_localidad
ORDER BY
    total_alumnos DESC;

-- 3. A) Con Vista
CREATE VIEW MateriasPorEstudiante AS
SELECT id_persona, COUNT(id_materia) AS total_materias
FROM PersonaMateria
GROUP BY id_persona;

SELECT
    l.nombre_localidad,
    COUNT(DISTINCT p.id_persona) AS total_alumnos,
    AVG(m.total_materias) AS promedio_materias
FROM Persona p
         JOIN Localidad l ON p.fk_localidad = l.id_localidad
         JOIN MateriasPorEstudiante m ON p.id_persona = m.id_persona
WHERE p.es_docente = FALSE
GROUP BY l.nombre_localidad
ORDER BY total_alumnos DESC;

-- 3. B) Consulta Normal:
SELECT DISTINCT
    p1.apellido AS Apellido_Alumno,
    p2.apellido AS Apellido_Mentor,
    h.nombre_hobbie AS Interes_Comun,
    p2.exp_sql AS Experiencia_Mentor_SQL,
    p2.exp_nosql AS Experiencia_Mentor_NoSQL
FROM
    Persona p1
        JOIN
    PersonaHobbie ph1 ON p1.id_persona = ph1.id_persona
        JOIN
    Hobbie h ON ph1.id_hobbie = h.id_hobbie
        JOIN
    PersonaHobbie ph2 ON h.id_hobbie = ph2.id_hobbie
        JOIN
    Persona p2 ON ph2.id_persona = p2.id_persona
WHERE
    p1.id_persona != p2.id_persona -- Evitar que alguien sea su propio mentor
  AND (p2.exp_sql = TRUE OR p2.exp_nosql = TRUE) -- El mentor debe tener experiencia
  AND p2.es_docente = FALSE
LIMIT 100;

-- 3. B) Con Vista
CREATE VIEW Mentores AS
SELECT id_persona, apellido, exp_sql, exp_nosql
FROM Persona
WHERE  (exp_sql = TRUE OR exp_nosql = TRUE) AND es_docente = FALSE;

SELECT DISTINCT
    p1.apellido AS Apellido_Alumno,
    p2.apellido AS Apellido_Mentor,
    h.nombre_hobbie AS Interes_Comun,
    p2.exp_sql AS Experiencia_Mentor_SQL,
    p2.exp_nosql AS Experiencia_Mentor_NoSQL
FROM Persona p1
         JOIN PersonaHobbie ph1 ON p1.id_persona = ph1.id_persona
         JOIN Hobbie h ON ph1.id_hobbie = h.id_hobbie
         JOIN PersonaHobbie ph2 ON h.id_hobbie = ph2.id_hobbie
         JOIN Mentores p2 ON ph2.id_persona = p2.id_persona
WHERE p1.id_persona != p2.id_persona
LIMIT 100;

/* Indices compuestos
Este índice acelera la evaluación de las condiciones del WHERE al permitir buscar
   eficientemente personas con experiencia en SQL/NoSQL y que no sean docentes.
*/
CREATE INDEX idx_persona_experiencia ON Persona(exp_sql, exp_nosql, es_docente);
CREATE INDEX idx_persona_es_docente ON Persona(fk_grupo, es_docente);
/*
indices :
Dado que el GROUP BY requiere agrupar por id_persona, un índice en esta columna
reduce significativamente el tiempo de ejecución en grandes volúmenes de datos
*/
CREATE INDEX idx_personamateria_idpersona ON PersonaMateria(id_persona);
CREATE INDEX idx_persona_fk_localidad ON Persona(fk_localidad);
CREATE INDEX idx_persona_hobbie_id_persona ON PersonaHobbie(id_persona);
CREATE INDEX idx_persona_hobbie_id_hobbie ON PersonaHobbie(id_hobbie);
CREATE INDEX idx_hobbie_nombre_hobbie ON Hobbie(nombre_hobbie);
CREATE INDEX idx_localidad_id_localidad ON Localidad(id_localidad);
CREATE INDEX idx_persona_fk_grupo ON Persona(fk_grupo);
CREATE INDEX idx_persona_id ON Persona(id_persona);
CREATE INDEX idx_persona_materia_id_persona ON PersonaMateria(id_persona);
CREATE INDEX idx_persona_materia_id_materia ON PersonaMateria(id_materia);
CREATE INDEX idx_materia_id_materia ON Materia(id_materia);

--  VERIFICACIONES
-- No hay duplicados
SELECT dni, COUNT(*)
FROM Persona
WHERE dni IS NOT NULL
GROUP BY dni
HAVING COUNT(*) > 1;

-- Todos los alumnos tienen grupo, rol y las mascotas tienen dueño y especie
SELECT p.id_persona
FROM Persona p
         LEFT JOIN Grupo g ON p.fk_grupo = g.id_grupo
WHERE p.fk_grupo IS NOT NULL AND g.id_grupo IS NULL;

SELECT m.id_mascota
FROM Mascota m
         LEFT JOIN TipoMascota t ON m.fk_tipo = t.id_tipo
WHERE m.fk_tipo IS NOT NULL AND t.id_tipo IS NULL;

SELECT pm.id_persona, pm.id_materia
FROM PersonaMateria pm
         LEFT JOIN Persona p ON pm.id_persona = p.id_persona
         LEFT JOIN Materia m ON pm.id_materia = m.id_materia
WHERE p.id_persona IS NULL OR m.id_materia IS NULL;

SELECT m.id_mascota
FROM Mascota m
         LEFT JOIN Persona p ON p.id_persona = m.id_persona
WHERE m.id_persona IS NULL AND p.id_persona IS NOT NULL;

-- Verificar NOT NULL
SELECT *
FROM Persona
WHERE id_persona IS NULL
    OR apellido IS NULL
    OR email IS NULL
    OR fk_localidad IS NULL;

SELECT *
FROM Mascota
WHERE id_persona IS NULL
   OR nombre_mascota IS NULL
   OR fk_tipo IS NULL;

SELECT *
FROM Recomendacion
WHERE tipo IS NULL
   OR descripcion IS NULL;

SELECT *
FROM Hobbie
WHERE nombre_hobbie IS NULL;

SELECT *
FROM TipoMascota
WHERE especie IS NULL;

-- Intergridad
SELECT id_persona
FROM Persona
WHERE es_docente = TRUE AND (exp_nosql = FALSE OR exp_sql = FALSE);

-- Tablas intermedias
SELECT id_persona, id_hobbie, COUNT(*)
FROM PersonaHobbie
GROUP BY id_persona, id_hobbie
HAVING COUNT(*) > 1;

SELECT id_persona, id_materia, COUNT(*)
FROM PersonaMateria
GROUP BY id_persona, id_materia
HAVING COUNT(*) > 1;

SELECT id_persona, id_reco, COUNT(*)
FROM PersonaRecomendacion
GROUP BY id_persona, id_reco
HAVING COUNT(*) > 1;



