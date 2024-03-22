import pymysql
from datetime import timedelta, datetime
from flask import jsonify
import logging
from logging.config import fileConfig

# 로깅 설정
#fileConfig('logging.conf', encoding='utf-8')
logger = logging.getLogger(__name__)

class db_connection: 
    def get_db():
        logger.info("getDB")
        project_db = pymysql.connect(
            user='nana',
            passwd='nana1234',
            host='database-1.cjy2bjpz7ukq.ap-northeast-2.rds.amazonaws.com',
            db='project',
            charset='utf8',
            autocommit=True
        )
        return project_db
    
class EventDao:
    def __init__(self):
        pass

    def select_all(self, userno):  
        conn = None
        cursor = None
        try:
            logger.info(f"select_all - userno: {userno}")
            conn = db_connection.get_db()
            cursor = conn.cursor(pymysql.cursors.DictCursor)
            cursor.execute("SELECT id, title, class, UNIX_TIMESTAMP(start_date)*1000 as start, UNIX_TIMESTAMP(end_date)*1000 as end, memo FROM event where userno=%s", userno) 
            rows = cursor.fetchall()
            resp = jsonify({'success': 1, 'result': rows})
            resp.status_code = 200
            return resp
        except Exception as e:
            logger.error(f"Error in select_all: {e}")
        finally:
            if cursor:
                cursor.close() 
            if conn:
                conn.close()
    
    def select_one(self, event_id):
        cursor = None
        try:
            logger.info(f"select_one - event_id: {event_id}")
            cursor = db_connection.get_db().cursor(pymysql.cursors.DictCursor)
            sql = "SELECT * FROM event where id=%s;"
            cursor.execute(sql, (event_id))
            result = cursor.fetchone()
            return result
        except Exception as e:
            logger.error(f"Error in select_one: {e}")
        finally:
            if cursor:
                cursor.close()
            if db_connection.get_db():
                db_connection.get_db().close()
        
    def insert_event(self, title, memo, start_date, end_date, priority, userno):
        cursor = None
        try:
            logger.info(f"insert_event - title: {title}, userno: {userno}")
            start_date = datetime.strptime(start_date, "%Y-%m-%d %H:%M")
            end_date = datetime.strptime(end_date, "%Y-%m-%d %H:%M")
            cursor = db_connection.get_db().cursor(pymysql.cursors.DictCursor)

            if priority=='높음':
                    priority = 'event-important'
            elif priority=='중간':
                    priority = 'event-info'
            elif priority=='낮음':
                    priority = ''

            sql = "insert into event(title, memo, start_date, end_date, class, userno) values(%s, %s, %s, %s, %s, %s)"
            result = cursor.execute(sql, (title, memo, start_date, end_date, priority, userno))
            logger.info(f"insert_event - result: {result}")
            return result
        except Exception as e:
            logger.error(f"Error in insert_event: {e}")
        finally:
            if cursor:
                cursor.close()
            if db_connection.get_db():
                db_connection.get_db().close()
    
    def update_event(self, event_id, title, memo, start_date, end_date, priority, userno):
        cursor = None
        try:
            logger.info(f"update_event - event_id: {event_id}, userno: {userno}")
            cursor = db_connection.get_db().cursor(pymysql.cursors.DictCursor)

            if priority=='높음':
                    priority = 'event-important'
            elif priority=='중간':
                    priority = 'event-info'
            elif priority=='낮음':
                    priority = ''

            sql = "UPDATE event SET title=%s, memo=%s, start_date=%s, end_date=%s, class=%s WHERE id=%s and userno=%s"
            result = cursor.execute(sql, (title, memo, start_date, end_date, priority, event_id, userno))
            logger.info(f"update_event - result: {result}")
            return result
        except Exception as e:
            logger.error(f"Error in update_event: {e}")
        finally:
            if cursor:
                cursor.close()
            if db_connection.get_db():
                db_connection.get_db().close()
    
    def delete_event(self, event_id, userno):
        cursor = None
        try:
            logger.info(f"delete_event - event_id: {event_id}, userno: {userno}")
            cursor = db_connection.get_db().cursor(pymysql.cursors.DictCursor)
            sql = "delete from event where id=%s and userno=%s"
            result = cursor.execute(sql, (event_id, userno))
            logger.info(f"delete_event - result: {result}")
            return result
        except Exception as e:
            logger.error(f"Error in delete_event: {e}")
        finally:
            if cursor:
                cursor.close()
            if db_connection.get_db():
                db_connection.get_db().close()
