package cafe.jjdev.mall.mapper;


import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.BoardFile;

@Mapper
public interface BoardFileMapper {
	public int insertBoardFile(BoardFile boardFile);
	public BoardFile selectBoardFileList(int boardNo);
	public int deleteBoardFile(int boardNo);
	public int deleteBoardOneFile(int BoardNo);
}
