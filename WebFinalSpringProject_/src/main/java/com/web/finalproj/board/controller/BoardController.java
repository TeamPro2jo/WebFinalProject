package com.web.finalproj.board.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.finalproj.zzim.service.ZzimService;
import com.web.finalproj.board.dto.BoardSearchDTO;
import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.account.service.AccountService;
import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.board.service.BoardService;
import com.web.finalproj.zzim.dto.ZzimDTO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService board;
	
	@Autowired
	private AccountService account;
	
	@Autowired
	ZzimService zzim;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView main() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		List<BoardDTO> boardlist = null;
		boardlist = board.findAll();
		mv.setViewName("board/main");
		mv.addObject("boardlist", boardlist);
		
		return mv;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ModelAndView main(@ModelAttribute BoardSearchDTO search, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		List<BoardDTO> boardlist = null;
		String[] typeList = request.getParameterValues("type");
		String[] areaList = request.getParameterValues("area");
		String[] statList = request.getParameterValues("stat");
		String[] dealList = request.getParameterValues("deal");
		search.setTypeList(typeList);
		search.setAreaList(areaList);
		search.setStatList(statList);
		search.setDealList(dealList);
		
		if((search.getSearchType() == null || search.getSearchType().equals("선택"))
				&& search.getArea() == null && search.getType() == null
				&& search.getStat() == null && search.getDeal() == null) {
			boardlist = board.findAll();
		} else {
			boardlist = board.findList(search);
			String typecheck = Arrays.toString(typeList).replace("[", "").replace("]", "").replace(" ", "");
			mv.addObject("typecheck", typecheck);
			String areacheck = Arrays.toString(areaList).replace("[", "").replace("]", "").replace(" ", "");
			mv.addObject("areacheck", areacheck);
			String statcheck = Arrays.toString(statList).replace("[", "").replace("]", "").replace(" ", "");
			mv.addObject("statcheck", statcheck);
			String dealcheck = Arrays.toString(dealList).replace("[", "").replace("]", "").replace(" ", "");
			mv.addObject("dealcheck", dealcheck);
		}
		mv.setViewName("board/main");
		mv.addObject("boardlist", boardlist);
		
		return mv;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView datail(@RequestParam int bid, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("board/detail");
		mv.addObject("item", board.findId(bid));
		if(session.getAttribute("account") != null) {
			int aid = ((AccountDTO)session.getAttribute("account")).getId();
			ZzimDTO data = new ZzimDTO();
			data.setBid(bid);
			data.setAid(aid);
			boolean res = zzim.zzim(data);
			if(res) {
				mv.addObject("zzimcheck", true);
			} else {
				mv.addObject("zzimcheck", false);
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView write() throws Exception {
		ModelAndView mv = new ModelAndView("board/add");
		return mv;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String write(Model m, @ModelAttribute BoardDTO dto,
			@RequestParam MultipartFile[] file,HttpServletRequest req) throws Exception {
		String forward = "board/add";
		String origin_name="";
		String change_name = "";
		String file_ext = "";
		
		ArrayList<String> permit_ext = new ArrayList<String>();
		permit_ext.add("png"); permit_ext.add("jpg"); 
		
		if(file.length <= 5) {
		for(MultipartFile f: file) {
		 if(!f.isEmpty()) {
			 if(f.getSize() <= 10 * 1024*1024) {
				 //범용 고유 식별자 128 bit
				 UUID uuid = UUID.randomUUID();
				 
				 origin_name= f.getOriginalFilename();
				 //실제로 저장할 파일 명 /파일 다운로드 받을 때 사용해야 할 주소
				 change_name = uuid.toString() + "_" + origin_name;
				 file_ext= FilenameUtils.getExtension(f.getOriginalFilename());
				 
				 System.out.println("원본 파일명 : "+f.getOriginalFilename());	 
				 System.out.println("변경 된 파일명 : "+ change_name);
					System.out.println("파일크기 (바이트) : " + f.getSize());
					System.out.println("확장자 : "+ file_ext);
					
					 if(permit_ext.contains(file_ext)) {
						 System.out.println("혀용되는 확장자입니다");
						 
						 //파일저장
						 String root_path = req.getServletContext().getRealPath("/");
						 File save_path = new File(root_path + "/WEB-INF/resources/file/" );
						 if(!save_path.exists()) {
							  //파일을 저장 하기 위한 경로가 존재하지 않으면 생성
							 Files.createDirectories(save_path.toPath());
						 }
						 f.transferTo(new File(save_path + "/"+  change_name));
					 } else {
						 System.out.println("해당 확장자는 업로드 할 수 없습니다");
					 }
				 
			 } else {
				 System.out.println("업로드 파일의 크기가 큽니다.");
				 }
			 }
				 }
		}
		//파일 업로드 관련 기능 완료 후 주석 해제 바람
		boolean res = board.add(dto);
		
		if(res) {
			forward = "redirect:/board/detail?bid=" + dto.getBid();
		} else {
			m.addAttribute("data", dto);
			forward = "board/add";
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView modify(int bid) throws Exception {
		ModelAndView mv = new ModelAndView("board/update");
		mv.addObject("item", board.findId(bid));
		return mv;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String modify(Model m, @ModelAttribute BoardDTO dto) throws Exception {
		String forward = "";
		
		System.out.print(dto.toString());
		
		boolean res = board.update(dto);
		
		if(res) {
			forward = "redirect:/board/detail?bid=" + dto.getBid();
		} else {
			m.addAttribute("item", dto);
			forward = "board/update";
		}
		
		return forward;
	}

	/**
	 * @param id 
	 * @return
	 */
	public ModelAndView delete(int bid) {
		// TODO implement here
		return null;
	}

	/**
	 * @param title 
	 * @param btype 
	 * @param aid 
	 * @return
	 */
	public ModelAndView search(String title, int btype, int aid) {
		// TODO implement here
		return null;
	}

}
