package cafe.jjdev.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.Board;

//@Mapper 인터페이스에게 붙이게되있다
@Mapper			
public interface BoardMapper {	// @Mapper붙어있으면 ximplements BoardMapper 만든다  xml을 참조해서 만든다  BoardMapper boardMapper 그렇게 만들어진 객체를 Autowired에 
	
	public int updateBoard(Board board);
	public int deleteBoard(Board board);
	public Board selectBoard(int boardNo);
	public List<Board> selectBoardList(Map<String, Integer> map);
	public int selectBoardCount();
	public int insertBoard(Board board);
	//컨트롤러는 서비스에 맞춘다
	//서비스는 요청기준에 맞춘다
}
