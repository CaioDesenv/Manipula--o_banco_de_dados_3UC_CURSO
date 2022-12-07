create database hospital;
use hospital;

create table medico (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
data_nasc DATE NOT NULL,
CRM VARCHAR(45) NOT NULL UNIQUE,
estado_CRM VARCHAR(2) NOT NULL,
telefone VARCHAR(11) NOT NULL,
endereco VARCHAR(100),
primary key(id)
);
CREATE TABLE especialidade(
id INT NOT NULL AUTO_INCREMENT,
nome_especialidade VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
);

SELECT * FROM medico;
SELECT * FROM especialidade;
SELECT * FROM especialidade_medico;

CREATE TABLE especialidade_medico (
id INT NOT NULL AUTO_INCREMENT,
especialidade_id INT NOT NULL,
medico_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(medico_id) references medico(id),
FOREIGN KEY(especialidade_id) references especialidade(id)
);
CREATE TABLE enfermeiro (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(11) NOT NULL,
CRE VARCHAR(45) NOT NULL UNIQUE,
PRIMARY KEY(id) 
);

ALTER TABLE informacao(
id INT NOT NULL AUTO_INCREMENT,
data_entrada DATE NOT NULL,
data_prev_alta DATE NOT NULL,
procedimento VARCHAR(200) NOT NULL,
PRIMARY KEY(id),

ALTER TABLE informacao ADD medico_id INT;
ALTER TABLE informacao ADD quarto_id INT;

ALTER TABLE informacao ADD FOREIGN KEY(medico_id) references medico(id);
ALTER TABLE informacao ADD FOREIGN KEY(quarto_id) references quarto(id);
);

CREATE TABLE enfer_inform(
id INT NOT NULL AUTO_INCREMENT,
enfermeiro_id INT,
informacao_id INT,
PRIMARY KEY(id),
FOREIGN KEY(enfermeiro_id) references enfermeiro(id),
FOREIGN KEY(informacao_id) references informacao(id)
);

CREATE TABLE tipo_quarto(
id INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(100) NOT NULL,
valor_diaria DECIMAL(9,2) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE quarto(
id INT NOT NULL AUTO_INCREMENT,
numero INT NOT NULL UNIQUE,
tipo VARCHAR(45) NOT NULL,
PRIMARY KEY(id),
tipo_quarto_id INT,
FOREIGN KEY(tipo_quarto_id) references tipo_quarto(id)
);

CREATE TABLE convenio(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cnpj VARCHAR(20) NOT NULL UNIQUE,
numero_carteirinha VARCHAR(20) NOT NULL UNIQUE,
tempo_carencia DATE NOT NULL,
paciente_id INT NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE paciente(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
data_nasc DATE NOT NULL,
endereco VARCHAR(200) NOT NULL,
telefone VARCHAR(11) NOT NULL UNIQUE,
e_mail VARCHAR(100)  UNIQUE,
CPF VARCHAR(11) NOT NULL UNIQUE,
RG VARCHAR(20) NOT NULL UNIQUE,
se_convenio CHAR(1) NOT NULL,
PRIMARY KEY (id),
convenio_id INT
);
ALTER TABLE paciente ADD FOREIGN KEY(convenio_id) references convenio(id);

CREATE TABLE consultas(
id INT NOT NULL AUTO_INCREMENT,
data_hora DATETIME NOT NULL,
valor_consulta DECIMAL(9,2),
PRIMARY KEY(id),
medico_id INT,
paciente_id INT,
FOREIGN KEY(medico_id) references medico(id),
FOREIGN KEY(paciente_id) references paciente(id)
);

CREATE TABLE receita(
id INT NOT NULL AUTO_INCREMENT,
medicamentos VARCHAR(100) NOT NULL,
quatidade DECIMAL(9,2) NOT NULL,
receita_remedio VARCHAR(100) NOT NULL,
nome_especialidade_paciente VARCHAR(100) NOT NULL,
consultas_id INT,
PRIMARY KEY (id),
FOREIGN KEY(consultas_id) references consultas(id)
);

CREATE TABLE paciente_convenio(
id INT NOT NULL AUTO_INCREMENT,
convenio_id INT,
consultas_id INT,
PRIMARY KEY(id),
FOREIGN KEY(consultas_id) references consultas(id),
FOREIGN KEY(convenio_id) references convenio(id)
);






