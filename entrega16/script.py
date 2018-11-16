import re
f = open("bd2.txt","r")
f2 = open("testfile.txt","w") 

f1 =f.readlines()

palavras = []
for line in f1:
	line = line.split("\n")[0]
	a = line[32:]
	b = filter(None, re.split("[, ; ( ) ]+",a))
	for j in b:
		palavras.append(j)
				
	a = "insert into fat_obj_tab_alocacao values((select ref(d) from dim_obj_tab_disciplina d where d.id_disciplina ="+palavras[0]+"),"
	b = "(select ref(p) from dim_obj_tab_professor p where p.id_professor =" + palavras[1]+"),"
	c = "(select ref(c) from dim_obj_tab_curso c where c.id_curso = "+ palavras[2]+"),"
	d = "(select ref(t) from dim_obj_tab_sala t where t.id_sala = "+palavras[3]+"),"+palavras[4]+","+palavras[5]+", "+palavras[6] +","+palavras[7] +");\n"
	f2.write(a+b+c+d)
	palavras=[]
	
f2.close()	