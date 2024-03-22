import pymysql
import UserController


def db_conn():
    db = pymysql.connect(
    user = 'nana',
    passwd = 'nana1234',
    host = 'database-1.cjy2bjpz7ukq.ap-northeast-2.rds.amazonaws.com',
    db = 'project',
    charset = 'utf8',
    autocommit = True
    )
    #객체 만들어서 반환해주기
    return db

#유저등록
def insertUser(userid, email, userpasswd, username, iddate):
    con = db_conn()
    cursor = con.cursor()

    sql_insert = 'insert into user (userid, email, userpasswd, username, iddate) values (%s,%s,%s,%s,%s)'
    result_num = cursor.execute(sql_insert,(userid, email, userpasswd, username, iddate))
    #결과 반환하지않고 걍 cursor.execute(sql_insert,(dname,loc)) 이렇게 할 수도 있음.
    
    cursor.close()
    con.close()
    
    return f'<script>alert("회원가입이 완료되었습니다!")</script>'

#유저삭제
def deleteUser(userno):
    con = db_conn()
    cursor = con.cursor()

    sql_delete = 'delete from user where userno = %s'
    result_num = cursor.execute(sql_delete,(userno))

    cursor.close()
    con.close()
    
    return '<script>alert("탈퇴하셨습니다!")</script>'


#유저정보찾기
def search_user(userid,userpasswd):

    con = db_conn()
    cursor = con.cursor(cursor=pymysql.cursors.DictCursor)

    #입력받은 userid, userpasswd에 대하여 sql테이블user에서 있으면
    sql_search = 'select * from user where userid = %s and userpasswd = %s'
    cursor.execute(sql_search,(userid,userpasswd))

    result = cursor.fetchone()
    
    cursor.close()
    con.close()

    return result

#유저정보찾기222222 -> id로만찾음 ( 수정할때 아이디같으면 안된다고하려고)
def search_user2(userid):

    con = db_conn()
    cursor = con.cursor(cursor=pymysql.cursors.DictCursor)

    sql_search = 'select * from user where userid = %s '
    cursor.execute(sql_search,(userid))

    #질문 >> 값이 없을때 result값이 무엇인지############-> None임 
    result = cursor.fetchone()
    
    cursor.close()
    con.close()

    return result

#유저 정보 출력 
def print_user(userid,userpasswd):

    con = db_conn()
    cursor = con.cursor(cursor=pymysql.cursors.DictCursor)

    #입력받은 userid, userpasswd에 대하여 sql테이블user에서 있으면
    sql_search = 'select * from user where userid = %s and userpasswd = %s'
    cursor.execute(sql_search,(userid,userpasswd))

    result = cursor.fetchone()

    cursor.close()
    con.close()

    return result


#유저 업데이트
def updateUser(userid, email, userpasswd, username, userno):
    #수정할값들이들어옴
    con = db_conn()
    cursor = con.cursor()

    sql_update = 'update user set userid=%s, email=%s, userpasswd=%s,username=%s where userno=%s'
    result_num = cursor.execute(sql_update,(userid, email, userpasswd, username, userno))

    cursor.close()
    con.close()
    return '<script>alert("저장되었습니다")</script>'