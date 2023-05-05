package member;

public class MemberService {
	private MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao();
	}
	
	//가입
	public void join(MemberVo vo) {
		dao.insert(vo);
	}
	
	//내정보보기
	public MemberVo getMember(String userId) {
		return dao.select(userId);
	}
	
	//내정보수정
	public void editMyInfo(MemberVo vo) {
		dao.update(vo);
	}
	
	//탈퇴
	public void delMember(String userId) {
		dao.delete(userId);
	}
	
	//한줄소개 넣기
	public void lineInsert(String userId, String introLine) {
		dao.lineInsert(userId, introLine);
	}
	
	//한줄소개 없애기
	public void lineDel(String userId) {
		dao.lineDel(userId);
	}
}
