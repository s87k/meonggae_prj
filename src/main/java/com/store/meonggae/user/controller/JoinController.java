package com.store.meonggae.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.store.meonggae.user.join.service.JoinService;
import com.store.meonggae.user.join.vo.JoinVO;

@Controller
public class JoinController {

	@Autowired
	private JoinService joinService;

	// 아이디 중복확인
	@GetMapping("/join_page/id_dup.do")
	public String idDup(@RequestParam("id") String id, Model model) {
		boolean result = joinService.chkIdDup(id);
		model.addAttribute("result",result);

		return "join_page/id_dup";
	}

	@GetMapping("/join_page/nick_dup.do")
	public String nickDup(@RequestParam("nick") String nick, Model model) {
		boolean result = joinService.chkNickDup(nick);
		model.addAttribute("result",result);

		return "join_page/nick_dup";
	}

	// 회원 등록
	@RequestMapping(value = "memJoin.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public RedirectView insertJoin(JoinVO joinVO) {
		int memResult = joinService.insertMem(joinVO.getNick());
		int detailResult = joinService.insertMemDetail(joinVO);

		String result = "false";
		if (memResult == 1 && detailResult == 1) {
			result = "true";
		}
		String redirectUrl = "join_page/mem_join.do?result=" + result;
		return new RedirectView(redirectUrl);
	}// insertJoin

}
