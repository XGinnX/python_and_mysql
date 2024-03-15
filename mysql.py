import MySQLdb

host = "localhost"
user = "user_teste_aplic"
password = "123456s"
db = "escola_estrutura"
port = 3306

# Abre conexão com dados
con = MySQLdb.connect(host, user, password, db, port)

#c = con.cursor()
c = con.cursor(MySQLdb.cursors.DictCursor) # permite que o retorno do banco venha como dicionário


#Consultas 
print("--------------SELECT------------------------")

def select(campos, tabelas, where=None):

    global c # Permite usar o C dentro do escopo local
    
    query = "select " + campos + " FROM " + tabelas
    if(where): #Valida se foi adicionado algum Where
        query = query + " WHERE " + where
    
    c.execute(query) 
    
    return c.fetchall()

#print(select("nome, cpf, data_nascimento","alunos","id_aluno < 5"))

result = select("nome, cpf","alunos","id_aluno < 7")
print(result[0])
print(result[0]["cpf"]) #Pega o primeiro item da lista e busca a chave "cpf"

# Inserção
print("--------------INSERT------------------------")


def insert(valores, tabela, campos=None):
    global c, con 
    
    query = "INSERT INTO " + tabela
    if(campos):
        query = query + "(" + campos + ") "
    query = query + " VALUES " + ",".join(["(" + v + ")" for v in valores])

    c.execute(query)
    con.commit()
        
valores = [
    "DEFAULT,'Marina Bettim', '2020-02-02','Av. Aricanga, 1521', 'São Paulo', 'SP', '12345678911','565656569'",
    "DEFAULT,'Miguel Bettim', '2021-01-12','Av. Aricanga, 1521', 'São Paulo', 'SP', '12345658911','565651269'"
]

insert(valores, "alunos")
print(select("nome, cpf, data_nascimento","alunos","id_aluno > 23"))

print("--------------UPDATE------------------------")


def update(campos, tabelas, where=None):
    global c, con
    
    query = "UPDATE " + tabelas
    
    query = query + " SET " + ','.join([campo + " = '" + valor +"'" for campo,valor in campos.items()])
    if(where): #Valida se foi adicionado algum Where
        query = query + " WHERE " + where
    c.execute(query)
    con.commit()
    
update({"nome":"Miguel", "cidade":"londres"}, "alunos", "id_aluno = 29 or id_aluno = 28")

print("--------------DELETE------------------------")

def delete (tabela, where):
    global c, con
    
    query = "DELETE FROM " + tabela + " WHERE " + where 
    
    c.execute(query)
    con.commit()

delete("alunos", "id_aluno > 19 and nome = 'Miguel' ")