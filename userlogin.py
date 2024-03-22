from flask import *
from flask_cors import CORS
import dbconnect as d


user_bp = Blueprint('user',__name__)

@user_bp.before_request
def before_request():
    g.userno = session.get('userno', None)
# @user_bp.route("/")
# def index():
#     return "Hello, World!"

@user_bp.route("/signup", methods=['POST','GET'])
def signup():
    if request.method=='GET':
        return render_template('sign_up.html')
    else:
        userid=request.form['userid']
        email = request.form['email']
        userpasswd = request.form['userpasswd']
        username = request.form['username']
        iddate=request.form['iddate']
        d.insertUser(userid,email,userpasswd,username,iddate)
        return 'Signup successful, click <a href="/login">here</a> to login again'
    
@user_bp.route('/login', methods=['POST','GET'])
def login():
    if request.method=='GET':
        return render_template('login.html')
    else:
        action_type = request.form['submitType']
        userid=request.form['userid']
        userpasswd = request.form['userpasswd']
        user = d.search_user(userid,userpasswd)
        #LOGIN 눌렀을때(로그인진행)
        if action_type == 'LOGIN':
            if user==None: # 유저아닐때
                return '아이디와 비번 다시확인해주세요!!!, click <a href="/login">here</a> to login again'
            else: #유저일때
                session['login_info'] = user
                return redirect(url_for('home'))
        #SIGNUP 눌렀을때(회원가입페이지로이동)
        elif action_type == 'SIGNUP':
            return redirect(url_for('user.signup'))
        
@user_bp.route('/mypage2', methods=['POST','GET'])
def mypage2():
    if request.method == 'GET':
        return render_template('mypage2.html')
    else:
        action_type = request.form['submitType']
        #회원정보수정 눌렀을 때
        if action_type == '회원정보수정':
            return redirect(url_for('user.update2'))
        #탈퇴하기 눌렀을 때
        elif action_type == '탈퇴하기':
            return redirect(url_for('user.delete2'))
        
@user_bp.route('/update2', methods=['POST','GET'])
def update2():
    if request.method=='GET':
        return render_template('update2.html')
    else:
        action_type = request.form['submitType']
        userid=request.form['userid']
        email = request.form['email']
        userpasswd = request.form['userpasswd']
        username = request.form['username']
        userno = session['login_info'].get('userno', None)
        if action_type=='저장':
            if d.search_user2(userid)==None: # userid없을때
                d.updateUser(userid,email,userpasswd,username,userno)
                return '회원정보가 수정되었습니다! 다시로그인해주세요, click <a href="/login">here</a> to login again'
            else: #userid있을때
                return '이미 사용중인 아이디입니다! click <a href="/update2">here</a> to 회원정보수정 again'
            
@user_bp.route('/delete2', methods=['POST','GET'])
def delete2():
    if request.method == 'GET':
        return render_template('delete2.html')
    else:
        action_type = request.form['submitType']
        userno = session['login_info'].get('userno', None)
        if action_type == '네':
            d.deleteUser(userno)
            session.pop('login_info', None) #세션에서 데이터 지워줌
            return render_template('login.html')
        elif action_type =='아니오':
            return render_template('mypage2.html')

@user_bp.route('/logout')
def logout():
    if 'login_info' in session :  # 세션에 데이터가 있는지 없는지
        session.pop('login_info', None) #세션에서 데이터 지워줌
        return render_template('login.html')
    else :
        return '<script>alert("이미 로그아웃 되어 있습니다.")</script><a href="/login">로그인 다시하기</a>' 
    
if __name__=='__main__':
    # user_bp.run(debug=True)
    pass

#d.deleteUser(userid) 삭제하는거 했음.>> 회원가입페이지에서 이용됨
