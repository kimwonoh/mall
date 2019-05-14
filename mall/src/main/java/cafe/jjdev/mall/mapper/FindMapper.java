package cafe.jjdev.mall.mapper;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.Member;

@Mapper
public interface FindMapper {
		public Member memberPwFind(Member member);
		public Member memberIdFind(Member member);
}
