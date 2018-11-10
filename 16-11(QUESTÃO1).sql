
--LETRA A:
select DISTINCT d.nome, count(DISTINCT P.NOME) as QTD_PROF
from  fat_alocacao f,dim_disciplina d,dim_professor p 
where d.id_disciplina = f.id_disciplina and p.id_professor = f.id_professor
group by d.nome
order by QTD_PROF DESC
/
--LETRA B:

select nome from dim_professor

MINUS

select DISTINCT p.nome from fat_alocacao f, dim_professor p,dim_curso c 
where p.id_professor = f.id_professor and f.id_curso = c.id_curso
and c.nome = 'Pós-Graduação em Ciência da Computação'
/

--LETRA C:
SELECT p.nome, SUM(d.carga)/COUNT(*) AS MEDIA_CH
FROM fat_alocacao f, dim_professor p, dim_disciplina d 
WHERE f.id_disciplina = d.id_disciplina AND f.id_professor = p.id_professor 
GROUP BY p.nome 
ORDER BY MEDIA_CH desc
fetch first 5 rows only
/
--LETRA D:
select DISTINCT p.nome from fat_alocacao f, dim_professor p,dim_curso c 
where p.id_professor = f.id_professor and f.id_curso = c.id_curso
and c.nome = 'Bach. em Ciência da Computação'

INTERSECT

select DISTINCT p.nome from fat_alocacao f, dim_professor p,dim_curso c 
where p.id_professor = f.id_professor and f.id_curso = c.id_curso
and c.nome = 'Pós-Graduação em Ciência da Computação'
/

--LETRA E;
select s.codigo,count(*) as COUNT_SALA
from dim_sala s, fat_alocacao f
where s.id_sala = f.id_sala
group by s.codigo
order by COUNT_SALA DESC
fetch first 5 rows only
/

--LETRA F
select d.nome,count(*)  as QTD_TURMAS
from  fat_alocacao f,dim_disciplina d
where d.id_disciplina = f.id_disciplina
group by d.nome
order by QTD_TURMAS DESC
fetch first 5 rows only
/

--LETRA G
select DISTINCT p.nome, count(DISTINCT D.NOME) as DISC_PROF
from  fat_alocacao f,dim_disciplina d,dim_professor p 
where d.id_disciplina = f.id_disciplina and p.id_professor = f.id_professor
group by p.nome
order by DISC_PROF DESC
fetch first 5 rows only
/
