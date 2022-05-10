DROP DATABASE IF EXISTS engsoft;
CREATE DATABASE engsoft;
\c engsoft;

CREATE TABLE "usuarios" (
  "id" INT PRIMARY KEY NOT NULL,
  "nome" VARCHAR(100) NOT NULL,
  "email" VARCHAR(100) NOT NULL,
  "senha" VARCHAR(300) NOT NULL,
  "ehadmin" boolean NOT NULL,
  "blocked" boolean,
  "banned" boolean
);

CREATE TABLE "trilhas" (
  "id" INT PRIMARY KEY NOT NULL,
  "owner" INT NOT NULL,
  "descricao" VARCHAR(100),
  "nome" VARCHAR(100),
  "categoria" VARCHAR(100),
  "capa" VARCHAR(100),
  "likes" INT
);

CREATE TABLE "videos" (
  "id" INT PRIMARY KEY NOT NULL,
  "url" VARCHAR(300) NOT NULL,
  "nome" VARCHAR(100),
  "id_trilha" INT,
  "likes" INT
);

CREATE TABLE "comentarios" (
  "id" INT PRIMARY KEY NOT NULL,
  "conteudo" VARCHAR(200),
  "id_usuario" INT NOT NULL,
  "id_trilha" INT NOT NULL
);

CREATE TABLE "denuncias" (
  "id" INT PRIMARY KEY NOT NULL,
  "razao" VARCHAR(200),
  "id_trilha" int NOT NULL
);

CREATE TABLE "favoritos" (
  "id" INT PRIMARY KEY NOT NULL,
  "id_trilha" int NOT NULL,
  "id_usuario" int NOT NULL
);

ALTER TABLE "comentarios" 
  ADD FOREIGN KEY ("id_usuario") 
  REFERENCES "usuarios" ("id") 
  ON DELETE CASCADE;

ALTER TABLE "denuncias" 
  ADD FOREIGN KEY ("id_trilha") 
  REFERENCES "trilhas" ("id") 
  ON DELETE CASCADE;

ALTER TABLE "trilhas" 
  ADD FOREIGN KEY ("owner") 
  REFERENCES "usuarios" ("id") 
  ON DELETE CASCADE;

ALTER TABLE "videos" 
  ADD FOREIGN KEY ("id_trilha") 
  REFERENCES "trilhas" ("id") 
  ON DELETE CASCADE;

ALTER TABLE "comentarios" 
  ADD FOREIGN KEY ("id_trilha") 
  REFERENCES "trilhas" ("id") 
  ON DELETE CASCADE;

ALTER TABLE "favoritos" 
  ADD FOREIGN KEY ("id_trilha") 
  REFERENCES "trilhas" ("id") 
  ON DELETE CASCADE;

INSERT INTO usuarios(id, nome, email, senha, ehadmin, blocked, banned) VALUES(1, 'Lucas', 'lucas@gmail.com', 'abacate', true, false , false);
INSERT INTO usuarios(id, nome, email, senha, ehadmin, blocked, banned) VALUES(2, 'Jesus', 'jesus@hotmail.com', 'pepino', false, true, false);

INSERT INTO trilhas(id, owner, nome, descricao, categoria, capa, likes) VALUES(1, 1, 'Teoria dos Grafos', 'Trilha de estudos para a matéria Teoria dos Grafos', 'Ciência da computação', 'https://i.imgur.com/plms1Um.jpg', 72);
INSERT INTO trilhas(id, owner, nome, descricao, categoria, capa, likes) VALUES(2, 2, 'Sistemas Operacionais', 'Trilha de estudos para a matéria Sistemas Operacionais', 'Ciência da computação', 'https://i.imgur.com/VEtkTXc.png', 75);
INSERT INTO trilhas(id, owner, nome, descricao, categoria, capa, likes) VALUES(3, 2, 'Rust desbravado', 'Desbravando Rust com diversos exemplos práticos', 'Engenharia de sistemas', 'https://i.imgur.com/yUPdXs3.png', 60);

INSERT INTO comentarios(id, conteudo, id_usuario, id_trilha) VALUES (1, 'Trilha ruim. Assunto não contempla todos os pontos da matéria', 2, 1);
INSERT INTO comentarios(id, conteudo, id_usuario, id_trilha) VALUES (2, 'Trilha show!!!', 1, 1);

INSERT INTO videos(id, nome, url, id_trilha, likes) VALUES (1, 'Árvores', 'https://www.youtube.com/watch?v=flyK0iVIHgI',1, 60);
INSERT INTO videos(id, nome, url, id_trilha, likes) VALUES (3, 'Algoritmo do menor caminho (en-US)', 'https://www.youtube.com/watch?v=pVfj6mxhdMw',1, 60);
INSERT INTO videos(id, nome, url, id_trilha, likes) VALUES (2, 'Compiladores', 'https://www.youtube.com/watch?v=gxlxHYv-9oo',2, 60);
INSERT INTO videos(id, nome, url, id_trilha, likes) VALUES (4, 'Problemas simples de Grafos', 'https://www.youtube.com/watch?v=Dx7CNMxRuV4',1, 60);

INSERT INTO denuncias(id, razao, id_trilha) VALUES (1, 'Videos não relacionados ao tema da trilha', 2);
INSERT INTO denuncias(id, razao, id_trilha) VALUES (2, 'Trilha com conteúdo impróprio', 1);