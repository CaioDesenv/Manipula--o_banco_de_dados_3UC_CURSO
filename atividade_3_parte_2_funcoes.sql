#script 1 atividade 3#
select * from medico;
ALTER TABLE medico add em_atividade varchar(1) not null;

UPDATE medico SET
em_atividade = 'A' where id = 1 or id = 2 or id = 3 or id = 4 or id = 5 or id = 6 or id = 7 or id = 8 or id = 9 or id = 10;
#em_atividade = 'I' where id = 2 or id = 4 or id = 6 or id = 8 or id = 10;
select * from medico;

#---------------------script 2 atividade3 ----------------------------------------------------------------------------------------------------#

select * from internacao;

UPDATE internacao SET
data_prev_alta = data_entrada+3 where id = (9)

#-------------------------script 3 atividade 3---------------------------------------------#
#excluir o último convênio cadastrado e todas as consultas relacionadas a ele.
select * from convenio;
select * from enfer_inter;
select * from  enfermeiro;
select * from especialidade;
select * from  especialidade_medico;
select * from  internacao;
select * from  medico;
select * from  paciente;
select * from  paciente_convenio;
select * from  quarto;
select * from receita;
select * from tipo_quarto;
select * from consultas;

use hospital;

update paciente set
convenio_id = null
where id = 6 or id = 7;


update internacao set
paciente_id = null
where id = 14 or id = 16;

update receita set
consultas_id = null
where id = 13;

delete from receita where id = 13;

update paciente_convenio set
consultas_id = null
where id = 95;

update paciente_convenio set
consultas_id = null
where id = 95;

delete from paciente_convenio where id = 95;

update enfer_inter set
internacao_id = null
where id = 11 or id = 12 or id = 15 or id = 16;

update enfer_inter set
enfermeiro_id = null
where id = 11 or id = 12 or id = 15 or id = 16;

delete from enfer_inter where id = 11 or id = 12 or id = 15 or id = 16;

update internacao set
quarto_id = null
where id = 14 or id = 16;

update internacao set
medico_id = null
where id = 14 or id = 16;

delete from internacao where id = 14 or id = 16;

update consultas set
medico_id = null
where id = 10;

delete from consultas where id = 10;

delete from convenio where id = 7;














