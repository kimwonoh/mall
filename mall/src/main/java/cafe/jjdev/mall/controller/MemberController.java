package cafe.jjdev.mall.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import cafe.jjdev.mall.service.MemberService;
import cafe.jjdev.mall.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//1.로그인 폼
	@GetMapping("/member/login")
	public String getMember(HttpSession session) {
		if(session.getAttribute("loginMember") != null) {
			return "rediect:/";
		} else {
			return "member/login";
		}
	}	
	//2.로그인 액션
	@PostMapping("/member/login")
	public String getMember(HttpSession session, Member member) {	
		Member loginMember = memberService.getMember(member);
		System.out.println("post방식 로그인액션 member 확인용"+ member);
		System.out.println("post방식 로그인액션 loginMember 확인용"+ loginMember);
		if(loginMember == null) {
			return "redirect:/";
		} else {
			session.setAttribute("loginMember", loginMember);
			System.out.println("post방식 로그인액션 session 확인용"+ session);
			return "redirect:/";
		}
	}
	//3. 로그아웃
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	//4. 회원가입 폼 (완성)
	@GetMapping(value="/member/addMember")
	public String addMember() {
		System.out.println("get방식 회원가입폼 확인용");
		
		return "member/addMember";
	}
	//5.회원가입 액션 (완성)
	@PostMapping(value="/member/addMember")
	public String addMember(Member member) {
		System.out.println("post방식 회원가입액션 확인용");
		memberService.addMember(member);
		return "/index";
	}
	//6. 회원 한명 상세보기 개인정보확인 get selectMember (완성)
	@GetMapping(value="/member/getMemberOne")
	public String selectMemberOne(Model model, HttpSession session) {
		System.out.println("post방식 셀렉트맴버원 session 확인용"+ session);
		Member member = (Member) session.getAttribute("loginMember");
		Member getMemberOne = memberService.getMember(member);	
		System.out.println("post방식 셀렉트맴버원 member 확인용"+ member);
		System.out.println("post방식 셀렉트맴버원 getMemberOne 확인용"+ getMemberOne);		
		model.addAttribute("getMemberOne", getMemberOne);
		return "member/getMemberOne";
	}
	//7. 비밀번호 수정폼 get 아이디저장후 맴버테이블에서 삭제 (완성)
	@GetMapping(value="/member/PasswordModifyMember")
	public String PassModifyMember() {
		System.out.println("post방식 비밀번호수정폼 확인용");
		return "member/PasswordModifyMember";
	}
	
	//8. 비밀번호 수정액션 post (완성)
	@PostMapping(value="/member/PasswordModifyMember")
	public String PassModifyMember(String getMemberOnePw, String memberPw, HttpSession session) {
		System.out.println("post방식 포스트모디파이 입니다.");
		System.out.println("post방식 포스트모디파이 getMemberOnePw 확인용"+ getMemberOnePw);
		System.out.println("post방식 포스트모디파이 memberPw 확인용"+ memberPw);
		Map<String, String> map = new HashMap<String, String>();
		map.put("getMemberOnePw", getMemberOnePw);
		map.put("memberPw", memberPw);
		Member member = (Member)session.getAttribute("loginMember");
		map.put("memberId", member.getMemberId());
		System.out.println("post방식 포스트모디파이 map 확인용"+ map);
		System.out.println("post방식 포스트모디파이 member 확인용"+ member);		
		memberService.passModifyMember(map);
		return "redirect:/member/getMemberOne";
	}
	//9. 회원정보 수정폼 get (완성)
	@GetMapping(value="/member/modifyMember")
	public String ModifyMember(Model model, HttpSession session) {
		System.out.println("get방식 회원수정폼 확인용");
		Member member = (Member) session.getAttribute("loginMember");
		Member getMemberOne = memberService.getMember(member);
		System.out.println("get방식 모디파이회원수정 member 확인용"+ member);
		System.out.println("get방식 모디파이회원수정 getMemberOne 확인용"+ getMemberOne);
		model.addAttribute("getMemberOne",getMemberOne);
		return "member/modifyMember";
	}
	//10. 회원정보 수정액션  post (완성)
	@PostMapping(value="/member/modifyMember")
	public String ModifyMember(Member member) {
		System.out.println("post방식 회원수정액션 확인용");
		int result = memberService.modifyMember(member);
		System.out.println("post방식 모디파이회원수정 result 확인용"+result);
		return "redirect:/member/getMemberOne";
	}
	//11 .회원탈퇴 폼 MemberCintroller.removeMember -> removeMember.jsp (완성)
	@GetMapping(value="/member/removeMember") 
	public String deleteMember(Model model, HttpSession session) {
		System.out.println("get방식 회원탈퇴폼 확인용");
		Member member = (Member) session.getAttribute("loginMember");
		Member getMemberOne = memberService.getMember(member);
		System.out.println("get방식 딜리트회원탈퇴 member 확인용"+ member);
		System.out.println("get방식 딜리트회원탈퇴 getMemberOne 확인용"+ getMemberOne);
		model.addAttribute("getMemberOne",getMemberOne);
		return "member/removeMember";
	}
	//12. 회원탈퇴 액션 MemberCintroller.removeMember -> MemberService.removeMember (완성)
	@PostMapping(value="/member/removeMember")
	public String removeMember(Member member, HttpSession session) {
		System.out.println("post방식 회원탈퇴액션 확인용");
		memberService.removeMember(member, session);
		return "redirect:/";
	}

	//member_out_id 테이블 생성후 탈퇴시 member_out_id 테이블에 사용ID 저장  (완성)
	//13. 비밀번호 찾기 폼
	@GetMapping(value="/find/pwFind")
	public String memberFindPassword() {
		System.out.println("get방식 비밀번호찾기 확인용");
		return "find/pwFind";
	}
	
	//14.비밀번호 찾기 액션
	@PostMapping(value="/find/pwFind")
	public String memberFindPassword(Model model, Member member) {
		System.out.println("post방식 비밀번호찾기 확인용");
		memberService.memberFindPassword(member);
		System.out.println("post방식 비밀번호찾기 member2 확인용"+ member);
		return "/find/pwFindEmail";
	}
	//15.아이디 찾기 폼
	@GetMapping(value="/find/idFind")
	public String memberFindId() {
		System.out.println("get방식 아이디찾기 확인용");
		return "find/idFind";
	}
	
	//16. 아이디 찾기 액션
	@PostMapping(value="/find/idFind")
	public String memberFindId(Model model, Member member) {
		System.out.println("post방식 아이디찾기 확인용");
		Member member2 = memberService.memberFindId(member);
		System.out.println("post방식 아이디찾기 member2 확인용"+ member2);
		model.addAttribute("member2", member2);
		return "/find/idFind";
	}
}
