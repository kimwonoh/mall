package cafe.jjdev.mall.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import cafe.jjdev.mall.commons.PathStr;
import cafe.jjdev.mall.mapper.BoardCommentMapper;
import cafe.jjdev.mall.mapper.BoardFileMapper;
import cafe.jjdev.mall.mapper.BoardMapper;
import cafe.jjdev.mall.vo.Board;
import cafe.jjdev.mall.vo.BoardComment;
import cafe.jjdev.mall.vo.BoardFile;
import cafe.jjdev.mall.vo.BoardRequest;

//@ 에노테이션이 있기때문에 부팅될때 BoardService의 객체를 만든다
@Service
@Transactional //이서비스안에 있는 모든 매서드는 오류가발생하면 취소되도록 되있다. 꼭서비스 클래스 하위쪽만 넣어야된다
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private BoardCommentMapper boardCommentMapper;
	@Autowired
	private BoardFileMapper boardFileMapper;

	//릴레이션 관계에 있을때
	//겟보드 앤드 커멘트 리스트 (getboard map)
	public Map<String, Object> getBoardAndCommentList(int boardNo) {		
		Board board = boardMapper.selectBoard(boardNo);
		BoardFile boardFile = boardFileMapper.selectBoardFileList(boardNo);
		List<BoardComment> boardCommentList = boardCommentMapper.selectBoardCommentListByBoardNo(boardNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardFile", boardFile);
		map.put("board", board);
		map.put("boardCommentList", boardCommentList);		
		return map;
	}
	// 업데이트
		public int modifyBoard(Board board) {
			
			return boardMapper.updateBoard(board);
		}
	//겟보드 리스트 (getboard 페이징)
	public Map<String, Object> getBoardList(int currentPage) {
		final int ROW_PER_PAGE = 10; //한페이지에 몇개씩 볼
		int beginRow = (currentPage-1)*ROW_PER_PAGE;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", ROW_PER_PAGE);
		
		List<Board> list = boardMapper.selectBoardList(map);
		int boardCount = boardMapper.selectBoardCount();
		int lastPage = boardCount/ROW_PER_PAGE;
		if(boardCount%ROW_PER_PAGE != 0) {
			lastPage++;
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("boardCount", boardCount);
		
		return returnMap;
	}
	// 에드보드 (insert 작업)
	public void addBoard(BoardRequest boardRequest, String path) {
	// 1. BoardRequest -> Board	
		Board board = new Board();
		board.setBoardPw(boardRequest.getBoardPw());
		board.setBoardTitle(boardRequest.getBoardTitle());
		board.setBoardContent(boardRequest.getBoardContent());
		board.setBoardUser(boardRequest.getBoardUser());
		board.setBoardDate(boardRequest.getBoardDate());
		board.setBoardNo(boardRequest.getBoardNo());
		System.out.println("board 에드보드의 보드리퀘스트 "+board);
		boardMapper.insertBoard(board);	
	
	// 2. BoardRequest -> MultipartFile -> BoardFile	
		MultipartFile multipartFile = boardRequest.getBoardfile();
		if(multipartFile.isEmpty() == false) {
		System.out.println("multipartFile 에드보드의 보드리퀘스트 "+multipartFile);								
		String contentType = multipartFile.getContentType();
		String name = multipartFile.getName();	
		
		String originalFileName = multipartFile.getOriginalFilename();
		
		int i = originalFileName.lastIndexOf(".");	
		String originName = originalFileName.substring(0, i);
		
		String ext = originalFileName.substring(i+1).toLowerCase();//소문자로 바꿔준다.
		//새로운 랜덤 아이디를 생성하는것 그후 스트링 타입으로 바꿔주기
		UUID uuid = UUID.randomUUID();
		String saveName = uuid.toString().replace("-","");
		
		long size = multipartFile.getSize();
		System.out.println("i 에드보드의 보드리퀘스트 "+i);
		System.out.println("originName 에드보드의 보드리퀘스트 "+originName);	
		System.out.println("ext 에드보드의 보드리퀘스트 "+ext);	
		System.out.println("saveName 에드보드의 보드리퀘스트 "+saveName);	
		
		BoardFile boardFile = new BoardFile();
		boardFile.setBoardFileSize(multipartFile.getSize());
		boardFile.setBoardFileType(multipartFile.getContentType());
		boardFile.setBoardFileOriginName(originName);
		boardFile.setBoardFileSaveName(saveName);
		boardFile.setBoardFileExt(ext);
		boardFile.setBoardNo(board.getBoardNo());	
		System.out.println("boardFile 에드보드의 보드리퀘스트 "+boardFile);
	
	//폴더에 저장	
		
		File file = new File(path+"/"+saveName+"."+ext); //빈파일후
		try{
			multipartFile.transferTo(file); //카피가 이루어진다.
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		boardFileMapper.insertBoardFile(boardFile);	
	}
}
	//전체 삭제
	public void removeBoard(Board board, String removePath) {
		int commentResult = boardCommentMapper.deleteBoardCommentByBoardNo(board.getBoardNo());	
		BoardFile boardFile = boardFileMapper.selectBoardFileList(board.getBoardNo());
		if(boardFile != null) {
			File file = new File(removePath + "/" + boardFile.getBoardFileSaveName()+ "." + boardFile.getBoardFileExt());
			file.delete();	
		}
		int fileResult = boardFileMapper.deleteBoardFile(board.getBoardNo());
		int boardResult = boardMapper.deleteBoard(board);
	}
	
	public Board getBoard(int boardNo) {
		
		return boardMapper.selectBoard(boardNo);
	}
	
	public void removeBoardFile(BoardFile boardFile, String removeFilePath) {
		BoardFile removeFile = boardFileMapper.selectBoardFileList(boardFile.getBoardNo());
		File file = new File(removeFilePath + "/" + removeFile.getBoardFileSaveName()+ "." + removeFile.getBoardFileExt());
		System.out.println("file 뿌아아앙"+file);
		file.delete();
		int deleteResult = boardFileMapper.deleteBoardOneFile(boardFile.getBoardFileNo());
	}
}	
	

/*
 * @Autowired private AMapper aMapper;
 * 
 * @Autowired private BMapper bMapper;
 * 
 * public Map getAB() { x = aMapper.selectX(); y = bMapper.selectY();
 * map.put("x", x); map.put("y", y); return map; }
 */
	
	
	