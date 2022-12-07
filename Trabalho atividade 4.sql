
#__________________________________________________________________________________________________________________________________________________________________________
# script 1 atividade 4

# Todos os dados e o valor médio das consultas do ano de 2020 e
# das que foram feitas sob convênio.

# script 1 atividade 4 	
# ajuste para obter os valores das consultas de 2020 

insert into consultas(data_hora,medico_id,valor_consulta)
values 		('2020-01-15 10:30:10',1,2,0),
			('2020-01-20 12:35:09',5,5,300),
            ('2020-02-11 13:11:21',7,8,0),
            ('2020-04-12 16:10:25',4,3,0),
			('2020-04-28 09:20:55',10,14,250),
            ('2020-06-13 10:50:44',4,6,0),
            ('2020-07-27 15:12:31',5,9,350),
            ('2020-09-23 08:02:10',3,11,0);
            
# Todos os dados das consultas do ano de 2020
SELECT c.id, c.data_hora, m.nome as Nome_medico, p.nome as Nome_paciente, c.valor_consulta, c.valor_cons_conve 
FROM consultas as c join medico as m join paciente as p 
on c.medico_id = m.id and c.paciente_id = p.id 
WHERE data_hora >= '2019-12-30 00:00:00';

# Valor medio das consultas realizadas em 2020
alter table consultas modify column valor_consulta DECIMAL(9,2) null;
alter table consultas modify column valor_cons_conve DECIMAL(9,2) null;

SELECT AVG(valor_consulta) as valor_medio_consultas2020 FROM consultas WHERE data_hora >= '2019-12-30 00:00:00';

# para obter o valor medio das consultas sob convenio em 2020 foi realizado algumas alterações e inserções.
# foi add uma coluna que registra o valor das consultas feitas sob convênio.
alter table consultas add valor_cons_conve DECIMAL(9,2) null;

update consultas set valor_cons_conve = 250.00
where id = 1 or id = 3 or id = 6 or id = 8 or id = 10 or id = 11 or id = 14 
or id = 15 or id = 18 or id = 19 or id = 21 or id = 23 or id = 24 or id = 26 or id = 28;

update consultas set valor_cons_conve = null
where id = 2 or id = 4 or id = 5 or id = 7 or id = 9 or id = 12 or id = 13 or id = 16 or id = 17
or id = 20 or id = 22 or id = 25 or id = 27;

# valor medio das consultas realizadas sob convenio no ano de 2020
SELECT AVG(valor_cons_conve) as valor_medio2020_convenio FROM consultas WHERE data_hora >= '2019-12-30 00:00:00';

#__________________________________________________________________________________________________________________________________________________________________________
#Script 2 atividade 4

# foi criado uma tabela para referenciar o id das consultas que tiveram a data de alta dos pacientes enstendida
create table data_alta_estendida(
id int not null auto_increment,
internacao_id int,
data_saida_hospital varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (internacao_id) REFERENCES internacao(id)
);

# Povoamento da tabela para obter os dados dos pacientes que tiveram suas internações estendidas
INSERT INTO data_alta_estendida(internacao_id, data_alta_hospital)
VALUES		(11,'2015-02-29 09:35:01'),
			(12,'2015-04-17 15:20:21'),
            (15,'2015-10-20 04:40:55'),
            (17,'2016-04-25 16:12:01'),
            (18,'2016-07-29-29 07:15:22');
            
# Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.

select i.data_entrada, i.data_prev_alta, i.procedimento, m.nome, q.numero, p.nome, d.internacao_id, d.data_saida_hospital
	FROM internacao as i join data_alta_estendida as d join medico as m join paciente as p join quarto as q
    on i.id = d.internacao_id and i.medico_id = m.id and  i.paciente_id = p.id and i.quarto_id = q.tipo_quarto_id;
 

# script 3 atividade 4

# Receituário completo da primeira consulta registrada com
# receituário associado

select * from consultas join receita on consultas.id = 1 = receita.consultas_id;

#__________________________________________________________________________________________________________________________________________________________________________

# script 4 atividade 4

# Todos os dados da consulta de maior valor e também da de menor
# valor (ambas as consultas não foram realizadas sob convênio).

SELECT c.id, c.data_hora, m.nome as Nome_medico, p.nome as Nome_paciente, c.valor_consulta, c.valor_cons_conve 
FROM consultas as c join medico as m join paciente as p 
on c.medico_id = m.id and c.paciente_id = p.id 
where valor_consulta = (select max(valor_consulta) from consultas);


SELECT c.id, c.data_hora, m.nome as Nome_medico, p.nome as Nome_paciente, c.valor_consulta, c.valor_cons_conve 
FROM consultas as c join medico as m join paciente as p 
on c.medico_id = m.id and c.paciente_id = p.id 
where valor_consulta = (select min(valor_consulta) from consultas);
#__________________________________________________________________________________________________________________________________________________________________________
#script 5 atividade 4

# Todos os dados das internações em seus respectivos quartos,
# calculando o total da internação a partir do valor de diária do quarto e o
# número de dias entre a entrada e a alta

select i.id, i.data_entrada, i.data_prev_alta, i.procedimento, m.nome as Nome_medico, p.nome as Nome_paciente, q.numero as Quarto_internado, 
datediff(data_prev_alta, data_entrada)*t.valor_diaria as valor_total_internacao, t.valor_diaria, datediff(data_prev_alta, data_entrada) as Dias_internado
	from internacao as i join medico as m join paciente as p join quarto as q join tipo_quarto as t
		on i.medico_id = m.id and i.quarto_id = q.id and i.paciente_id = p.id and q.tipo_quarto_id = t.id order by id;
        
#__________________________________________________________________________________________________________________________________________________________________________

# script 6 atividade 4

# Data, procedimento e número de quarto de internações em quartos
# do tipo “apartamento”

# foi criado uma tabela para referenciar as internações e seus respectivos longradouros 

create table tipo(
id int not null auto_increment,
longradouro varchar(45) not null,
primary key(id)
);

alter table tipo_quarto add tipo_id int null;
alter table tipo_quarto add foreign key (tipo_id) references tipo(id);
 
 # povoamento da tabela tipo
insert into tipo(longradouro)
values 		('Casa'),
			('Apartamento'),
            ('Hospital');
            
update tipo_quarto set tipo_id = 2
	where id = 3;
update tipo_quarto set tipo_id = 3
	where id = 2;
update tipo_quarto set tipo_id = 1
	where id = 4;


 select date(i.data_entrada) as data_consulta, i.procedimento, q.numero as numero_quarto, t.longradouro as longradouro
	from internacao as i join quarto as q join tipo as t join tipo_quarto as s
    on i.quarto_id = q.tipo_quarto_id and t.id = s.tipo_id where s.id = 3;
    
#__________________________________________________________________________________________________________________________________________________________________________

# script 7 atividade 4

# Nome do paciente, data da consulta e especialidade de todas as
# consultas em que os pacientes eram menores de 18 anos na data da
# consulta e cuja especialidade não seja “pediatria”, ordenando por data de
# realização da consulta

# foi criado uma coluna em consultas para referenciar o id da especialidade em que o paciente buscou no hospital.
alter table consultas add especialidade_id int null;
alter table consultas add foreign key (especialidade_id) references especialidade(id);

update consultas set especialidade_id = 1
where id = 8 or id = 21

update consultas set especialidade_id = 2
where id = 1 or id = 15

update consultas set especialidade_id = 3
where id = 6 or id = 12 or id = 18 or id = 28 

update consultas set especialidade_id = 4
where id = 3 or id = 24 or id = 26

update consultas set especialidade_id = 5
where id = 5 or id = 14 or id = 16 or id = 22 or id = 27

update consultas set especialidade_id = 6
where id = 9

update consultas set especialidade_id = 7
where id = 4 or id = 17 or id = 23

update consultas set especialidade_id = 8
where id = 7 or id = 11 or id = 19


update consultas set especialidade_id = 9
where id = 1 or id = 10 or id = 13 

update consultas set especialidade_id = 10
where id = 2 or id = 20 or id = 25

#__________________________________________________________________________________________________________________________________________________________________________
# consulta reajustada para obter os dados.
    
select p.nome as Nome_paciente, date(c.data_hora) as Data_consulta, e.nome_especialidade, 
TIMESTAMPDIFF(YEAR, p.data_nasc, c.data_hora) as IDADEdiaCONSULTA   
from consultas as c join paciente as p join especialidade as e  on c.especialidade_id = e.id and c.paciente_id = p.id  and 
TIMESTAMPDIFF(YEAR, date(p.data_nasc), c.data_hora) < 18 and 
TIMESTAMPDIFF(YEAR, date(p.data_nasc), c.data_hora) > 0  where e.nome_especialidade <> 'pediatria' 
order by IDADEdiaCONSULTA 

#__________________________________________________________________________________________________________________________________________________________________________

#script 8 atividade 4

# foi realizado um ajuste para obter consultas realizadas pela especialidade = Gastroenterologia
 update especialidade set nome_especialidade = 'Gastroenterologia'
 where id = 2
 update especialidade set nome_especialidade = 'Clinico Geral'
 where id = 3

# Nome do paciente, nome do médico, data da internação e
# procedimentos das internações realizadas por médicos da especialidade
# “gastroenterologia”, que tenham acontecido em “enfermaria

select i.id, ei.id as id_Inter_enfermagem, p.nome as Nome_paciente, m.nome as Nome_medico, 
date(i.data_entrada) as data_internacao,  i.procedimento as Procedimento, e.nome_especialidade
from internacao as i join paciente as p join medico as m  join especialidade as e join enfer_inter as ei 
join especialidade_medico as em  on i.paciente_id=p.id and i.medico_id=m.id and ei.internacao_id=i.id and em.especialidade_id=e.id
and e.id=ei.enfermeiro_id
where i.id=ei.internacao_id and nome_especialidade = 'Gastroenterologia'


#__________________________________________________________________________________________________________________________________________________________________________

# script 9 atividade 4

# Os nomes dos médicos, seus CRMs e a quantidade de consultas
# que cada um realizou

select c.id, count(c.medico_id) as Qtd_consultas, m.nome as nome_medico, m.CRM
from consultas c join medico m 
on m.id=c.medico_id
group by c.medico_id order by id

#__________________________________________________________________________________________________________________________________________________________________________

# script 10 atividade 4

# Os nomes, CREs e número de internações de enfermeiros que
# participaram de mais de uma internação

select ei.id, count(ei.enfermeiro_id) as Num_intercoes, e.nome as Nome_enfermeiro, e.CRE
from enfer_inter ei join enfermeiro e
on e.id=ei.enfermeiro_id
group by ei.enfermeiro_id
having count(ei.enfermeiro_id) > 1
order by id;

