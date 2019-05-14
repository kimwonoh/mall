package cafe.jjdev.mall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cafe.jjdev.mall.mapper.BoardCommentMapper;
import cafe.jjdev.mall.vo.BoardComment;
@Service
@Transactional
public class BoardCommentService {
	@Autowired
	public BoardCommentMapper boardCommentMapper;
	//댓글하나만 삭제
	public void deleteBoardByComment(BoardComment boardComment) {
		int boardCommentResult = boardCommentMapper.deleteBoardCommentByCommentNo(boardComment.getBoardCommentNo());
	}
	
	public int addBoardComment(BoardComment boardComment) {
		return boardCommentMapper.insertBoardComment(boardComment);
	}
}
