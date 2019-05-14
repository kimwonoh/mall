package cafe.jjdev.mall.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cafe.jjdev.mall.conponent.EmailConponent;
import cafe.jjdev.mall.mapper.FindMapper;
import cafe.jjdev.mall.mapper.MemberMapper;
import cafe.jjdev.mall.mapper.MemberOutMapper;
import cafe.jjdev.mall.vo.Member;

@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private MemberOutMapper memberOutMapper;
	@Autowired
	private EmailConponent emailConponent;
	@Autowired
	private FindMapper findMapper;
	
	
	//아이디 찾기
	public Member memberFindId(Member member) {
		return findMapper.memberIdFind(member);
	}
	
	
	//비밀번호 찾기
	public void memberFindPassword(Member member) {
		emailConponent.sendSimpleMessage("dosl981017@naver.com", "당신의!! 비밀번호는!!", findMapper.memberPwFind(member));
		
	}
	
	
	// 회원탈퇴
	public int removeMember(Member member, HttpSession session) {
		System.out.println("member 서비스 removeMember 변수확인중" + member);
		Member loginMember = (Member) session.getAttribute("loginMember");
		memberOutMapper.deleteMemberConsumer(loginMember);
		System.out.println("member 서비스 removeMember 변수확인중");
		memberOutMapper.deleteMemberByNo(loginMember);
		session.invalidate();
		return memberMapper.deleteMember(loginMember);
	}
	
	
	// 업데이트
	public int modifyMember(Member member) {
		System.out.println("member 서비스 modifyMember 변수확인중" + member);
		return memberMapper.updateMember(member);
	}

	
	// 비밀번호 하나만 수정
	public void passModifyMember(Map<String, String> map) {
		System.out.println("member 서비스 passModifyMember 변수확인중" + map);
		int ModifyMember = memberMapper.passWordModifyMember(map);
		System.out.println("ModifyMember 서비스 passModifyMember 변수확인중" + ModifyMember);
	}
	
	
	//회원 한명 상세 보기
	public Member selectMember(Member member) {
		System.out.println("member 서비스 selectMember 변수확인중" + member);
		return memberMapper.selectMemberOne(member);
	}
	
	//로그인 처리
	public Member getMember(Member member) {
		System.out.println("member 서비스 getMember 변수확인중" + member);
		Member loginMember = memberMapper.loginMember(member);
		System.out.println("member 서비스 loginMember 변수확인중" + loginMember);
		return loginMember;
		
	}
	
	//인설트 맴버
	public void addMember(Member member) {
		System.out.println("member 서비스 addmember 변수확인중" + member);
		String memberId = memberOutMapper.idCheck(member);
		System.out.println("memberId 서비스 addmember 변수확인중" + memberId);
		String memberId2 = memberOutMapper.idCheck2(member);		
		System.out.println("memberId2 서비스 addmember 변수확인중" + memberId2);	
		if (memberId2 == null) {
			System.out.println("사용이 가능한 아이디입니다.");
			if(memberId == null) {
				System.out.println("회원가입 성공했다");
				memberMapper.insertMember(member);
				memberMapper.insertMemberConsumer(member);
			} else {
				System.out.println("회원가입 실패했다");
			}
		} else {
			System.out.println("사용이 불가능한 아이디입니다.");
		}			
		
	}
	
}
