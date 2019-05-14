package cafe.jjdev.mall.mapper;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.Member;
@Mapper
public interface MemberOutMapper {
	
	public int deleteMemberByNo(Member member);
	public String idCheck(Member member);
	public String idCheck2(Member member);
	public int deleteMemberConsumer(Member member);
}
