import MySQLdb

host = "localhost"
user = "user_teste_aplic"
password = "123456s"
db = "escola_estrutura"
port = 3306

# Abre conexão com dados
con = MySQLdb.connect(host, user, password, db, port)

c = con.cursor()

def select(campos, tabelas, where=None):

    global c # Permite usar o C dentro do escopo local
    
    query = "select " + campos + " FROM " + tabelas
    if(where): #Valida se foi adicionado algum Where
        query = query + " WHERE " + where
    
    c.execute(query) 
    
    return c.fetchall()

print(select("nome, cpf","alunos","id_aluno < 5"))





