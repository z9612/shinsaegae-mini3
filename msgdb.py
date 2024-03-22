import pymysql
# DB 연결 : connect()

# DB 연결한 Connection 객체를 반환하는 함수
def db_conn():
    db=pymysql.connect(

    host='database-1.cjy2bjpz7ukq.ap-northeast-2.rds.amazonaws.com',
    user='nana',
    password='nana1234',
    db='project',
    charset='utf8',
    autocommit=True
    )
    return db

def showmessage(chatid):
    result=[]
    con=db_conn()
    cursor=con.cursor(pymysql.cursors.DictCursor)
    sql_select='select chatid,userno,text from project.chatting where chatid=%s '
    cursor.execute(sql_select,chatid)
    result=cursor.fetchall()
    cursor.close()
    con.close()
    return result

def sendmessage(chatid,userno,text):
    con =db_conn()
    cursor=con.cursor()
    sql_insert='insert into project.chatting (text,chatid,userno)  values(%s,%s,%s);'
    result_num=cursor.execute(sql_insert,(text,chatid,userno))
    cursor.close()
    con.close()
    return result_num