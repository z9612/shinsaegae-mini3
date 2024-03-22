# 유저 정보를 저장하는 클래스 정의
# 유저 정보를 출력하는 메서드

import pymysql

class User : 
    def __init__(self, userno, userid, email,userpasswd, username, iddate):
        self.userno = userno
        self.userid = userid
        self.email = email
        self.userpasswd = userpasswd
        self.username = username
        self.iddate = iddate

    def __str__(self) :
        return '{}\t{}\t{}'.format(self.userno, self.userif, self.email,self.userpasswd, self.username, self.iddate)