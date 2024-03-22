#기능 클래스
import User

class UserController:
    def __init__(self):
        self.list_user = []

    # 유저정보 입력 메서드
    def add_user(self, new_user) :
        self.list_user.append(new_user)
        print(f'{new_user.userid} 회원가입이 완료되었습니다!.')

    # 사용자로 회원가입때 정보를 받는 메서드
    def input_user(self):
        input_data = input('기본정보를 입력해주세요.\n 예) 10,개발팀,서울')
        dept_data = input_data.split(',')
        # print(dept_data)
        print('--')

        return User(dept_data[0], dept_data[1], dept_data[2], dept_data[3], dept_data[4], dept_data[5])
    
    # 전체 user 리스트를 출력하는 메서드
    def print_list(self) :
        print('userno\t유저아이디\t유저이메일\t유저비밀번호\t유저이름\t생성날짜ㅇ')
        print('-----------------')
        for d in self.list_user :
            print(d)
        
        print('-- userid 정보 전체 리스트 출력 완료')

    # userid를 기반으로 index 값을 찾는 메서드
    def search_index(self, userid) :
        index = -1
        for idx, u in enumerate(self.list_user) :
            # print('>>>>>>>>>>>> ', idx, d)
            if u.userid == userid :
                # print('s_index : ' , idx)
                return idx
            
        return index+1 #-------------> 처음 userid가 1부터라고했을때


    # userid로 정보 삭제
    def delete_user(self) :
        userid = input('삭제할 유저아이디를 입력하세요. >>>')
        # 부서번호로 유저아이디 위치 찾기
        search_idx = self.search_index(userid)

        if search_idx > -1 :
            del self.list_user[search_idx]
            print(userid, '님의 정보가 삭제되었습니다.')
        else :
            print('찾으시는 유저정보가 존재하지 않습니다.')
        
        print('-- 삭제 기능 종료')
            

    # userid로 정보 검색
    def search_user(self) :
        userid = input('검색할 유저아이디를 입력하세요. >>>')
        # 부서번호로 index 위치 찾기
        search_idx = self.search_index(userid)

        #print('search_idx', search_idx)

        if search_idx > -1 :            
            print(userid, '님의 정보 ----------')
            print(self.list_user[search_idx])
        else :
            print('찾으시는 유저정보가 존재하지 않습니다.')
        
        print('-- 검색 기능 종료')

    # 유저id로 검색 후 정보 수정
    def edit_user(self) :
        userid = input('수정할 userid를 입력하세요. >>>')
        # 부서번호로 index 위치 찾기
        search_idx = self.search_index(userid)        

        if search_idx > -1 :
            self.list_user[search_idx] = self.input_user()
            print('정보가 수정되었습니다.')
        else :
            print('찾으시는 유저정보가 존재하지 않습니다.')
            
        print('-- 수정 기능 종료')



if __name__=='__main__' : 
    controller = UserController()
    controller.print_list()