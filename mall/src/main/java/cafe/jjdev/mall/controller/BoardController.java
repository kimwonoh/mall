package cafe.jjdev.mall.controller;


import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import cafe.jjdev.mall.commons.PathStr;
import cafe.jjdev.mall.service.BoardService;
import cafe.jjdev.mall.vo.Board;
import cafe.jjdev.mall.vo.BoardComment;
import cafe.jjdev.mall.vo.BoardFile;
import cafe.jjdev.mall.vo.BoardRequest;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	
	//보드리스트
	@GetMapping(value="/board/getBoardList")
	public String getBoardList(Model model,@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage) {
		Map<String, Object> map = boardService.getBoardList(currentPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardCount", map.get("boardCount"));
		model.addAttribute("currentPage", currentPage);

		return "/board/getBoardList";
	}
	//상세보기
	@GetMapping(value = "/board/getBoard")
	public String getBoard(Model model, @RequestParam(value = "boardNo", required = true) int boardNo) throws Exception {
		Map<String, Object> map = boardService.getBoardAndCommentList(boardNo);
		//댓글 출력, 파일보여주기
		model.addAttribute("boardFile", map.get("boardFile"));
		model.addAttribute("board", map.get("board"));
		model.addAttribute("boardCommentList", map.get("boardCommentList"));
		return "/board/getBoard";
	}
	//수정 액션
	@PostMapping(value = "/board/modifyBoard")
	public String modifyBoard(Board board) {
		int result = boardService.modifyBoard(board);
		return "redirect:/board/getBoard?boardNo"+board.getBoardNo();
		
	}
	//수정폼
	@GetMapping(value = "/board/modifyBoard")
	public String modifyBoard(Model model, @RequestParam(value="boardNo", required=true) int boardNo) {
		Map<String, Object> map = boardService.getBoardAndCommentList(boardNo);
		Board board = boardService.getBoard(boardNo);
		model.addAttribute("boardFile",map.get("boardFile"));
		model.addAttribute("board", board);
		return "board/modifyBoard";
	}
	//삭제폼
	@GetMapping(value = "/board/removeBoard")
	public String deleteBoard(Model model, @RequestParam(value="boardNo", required=true)int boardNo) {
		model.addAttribute("boardNo", boardNo);
		return "board/removeBoard";
	}
	//삭제액션
	@PostMapping(value = "/board/removeBoard")
	public String deleteBoard(Board board) {
		boardService.removeBoard(board ,PathStr.UPLOAD_PATH);
		return "redirect:"+"/board/getBoardList";
	}
	//입력폼
	@GetMapping(value = "/board/addBoard")
	public String addBoard() {
		System.out.println("[cafe.jjdev.mall.controller.BoardControllrt.addBoard] Get방식addBoard메서드 실행");
		return "board/addBoard";
	}
	//입력액션
	@PostMapping(value = "/board/addBoard")
	public String addBoard(BoardRequest boardRequest) {
		System.out.println("[cafe.jjdev.mall.controller.BoardControllrt.addBoard] Post방식addBoard메서드 실행");
		//매개변수 값 출력
		System.out.println("[cafe.jjdev.mall.controller.BoardControllrt.addBoard] boardRequest: "+boardRequest);
		//Service 객체 안의 addUser메서드의 매개변수에 User 객체를 대입후 호출
		//String path = ServletUriComponentsBuilder.frozmCurrentContextPath().path("upload").toUriString();
		//ServletUriComponentsBuilder.fromCurrentContextPath() == request.getContextPath() 동일
		boardService.addBoard(boardRequest, PathStr.UPLOAD_PATH);
		return "redirect:"+"/board/getBoardList";
	}
	@GetMapping(value = "/board/removeBoardFile")
	public String deleteBoardFile(BoardFile boardFile) {
		boardService.removeBoardFile(boardFile, PathStr.UPLOAD_PATH);
		return "redirect:/board/modifyBoard?boardNo="+boardFile.getBoardNo();
	}
}
