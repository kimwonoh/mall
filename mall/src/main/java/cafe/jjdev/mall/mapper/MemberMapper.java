package cafe.jjdev.mall.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.Board;
import cafe.jjdev.mall.vo.Member;

@Mapper
public interface MemberMapper {
	public int insertMember(Member member);
	public Member loginMember(Member member);
	public Member selectMemberOne(Member member);
	public int passWordModifyMember(Map<String, String> map);
	public int updateMember(Member member);
	public int deleteMember(Member member);
	public int insertMemberConsumer(Member member);
}
