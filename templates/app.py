import secrets
import db_config 
from flask import *
from flask_cors import CORS
from board import board_bp
from userlogin import user_bp
from chat_main import chat_bp
import logging
from logging.config import fileConfig

app = Flask(__name__)
#app.config['SECRET_KEY'] = secrets.token_hex(24)
app.config['SECRET_KEY'] = 'AAAAAAAAAAAAAA'

# 로깅 설정
#fileConfig('logging.conf', encoding='utf-8')
logger = logging.getLogger(__name__)

CORS(app)

db_config.db_connection.get_db()
event_dao = db_config.EventDao()

app.register_blueprint(board_bp)
app.register_blueprint(user_bp)
app.register_blueprint(chat_bp)

@app.route('/')
def home():
    #로그인 안한 상태면 로그인 페이지로
    if 'login_info' not in session:
        logger.info("로그인 필요")
        return redirect(url_for("user.login"))
    
    #로그인 이미 한 상태면 
    else:
        if 'login_info' in session:
            logger.info("Home route accessed")
            logger.info(f"userno :::{session['login_info'].get('userno', None)} ")
            return render_template('calendar_events.html')
        else:
            # 세션에 login_info가 없을 경우의 처리
            return redirect(url_for("user.login"))
        


# 자신의 이벤트 전체 보기
@app.route('/calendar-events')
def calendar_events():
    print("print(__name__)" , __name__)
    print(__name__)
    logger.info("Calendar events route accessed")
    resp = event_dao.select_all(session['login_info'].get('userno', None))
    return resp

# 한 이벤트 상세보기
@app.route('/calendar_events.html/<event_id>')
def select_one(event_id):
    #음수, 문자열이 들어왔을 때 예외처리하기
    try:
        event_id = int(event_id)  # 정수로 변환 시도
        temp = event_dao.select_one(event_id)
        #음수일때 처리
        if event_id < 0:
            raise ValueError("음수 입력.")
        #없는 일정에 접근할때 처리
        if temp is None :
            raise ValueError("존재하지 않는 일정.")
        
        logger.info(f"Select one route accessed - event_id: {event_id}")
        result = event_dao.select_one(event_id)
        logger.info("Result :: " , result)
        return render_template('result_data.html', result=result, userno=session['login_info'].get('userno', None))
    #문자열일때 처리
    except ValueError as e:
        # ValueError가 발생하면 400 Bad Request 응답을 보내기
        abort(400, f"올바르지 않은 접근입니다. {e}") 

@app.route('/insert_event', methods=['POST'])
def insert_event():
    #실제 db에 insert 하기

    #userno = userno
    event_name = request.form['event_name']
    memo = request.form['memo']
    from_date = request.form['from_date']
    end_date = request.form['end_date']
    priority = request.form['priority']
    userno = session['login_info'].get('userno', None)

    # 시작 일자와 끝 일자 비교
    if from_date > end_date:
        logger.warning("Insert event - Invalid date range")
        return render_template('alert.html')
    elif end_date < from_date:
        logger.warning("Insert event - Invalid date range")
        return render_template('alert.html')
    else:
        logger.info(f"Insert event - user: {userno}, event_name: {event_name}, memo: {memo}, from_date: {from_date}, end_date: {end_date}, priority: {priority}")
        event_dao.insert_event(event_name, memo, from_date, end_date, priority, userno)
        return redirect(url_for("home"))

# 수정 겸 삭제
@app.route('/update_event', methods=['POST'])
def update_event():
    action_type = request.form['submitType']

    # update
    if action_type == '수정':
        logger.info("Update event route accessed - 수정")
        id = request.form['id']
        event_name = request.form['event_name']
        memo = request.form['memo']
        from_date = request.form['from_date']
        end_date = request.form['end_date']
        priority = request.form['priority']
        userno = session['login_info'].get('userno', None)

        # 시작 일자와 끝 일자 비교
        if from_date > end_date:
            logger.warning("Update event - Invalid date range")
            return render_template('alert.html')
        elif end_date < from_date:
            logger.warning("Update event - Invalid date range")
            return render_template('alert.html')
        else:
            logger.info(f"Update event - id: {id}, event_name: {event_name}, memo: {memo}, from_date: {from_date}, end_date: {end_date}, priority: {priority}, userno: {userno}")
            event_dao.update_event(id, event_name, memo, from_date, end_date, priority, userno)
            return redirect(url_for("home"))
    # delete
    elif action_type == '삭제':
        id = request.form['id']
        logger.info(f"Delete event - id: {id}, userno: {session['login_info'].get('userno', None)}")
        event_dao.delete_event(id, session['login_info'].get('userno', None))
        return redirect(url_for("home"))
    else:
        logger.warning("Invalid action type")
        return 'Invalid action type'

if __name__ == "__main__":
    app.run(debug=True)
