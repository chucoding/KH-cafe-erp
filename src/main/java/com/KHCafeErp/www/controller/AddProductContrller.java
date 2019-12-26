package com.KHCafeErp.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.ProductOption;
import com.KHCafeErp.www.service.face.AddProductService;

@Controller
public class AddProductContrller {

	@Autowired AddProductService addProductService;
	
	private static final Logger logger = LoggerFactory.getLogger(AddProductContrller.class);
	
	@RequestMapping(value = "/product/index", method=RequestMethod.GET)
	public void productIndex() {
		logger.info("상품등록 첫 페이지");
	}
	
	// 상품 옵션 목록  
	@RequestMapping(value = "/product/option/list", method=RequestMethod.GET)
	public String optionList(Model model) {
		logger.info("optionList()");

		List<ProductOption> optionList = addProductService.selectOption();

		model.addAttribute("optionList", optionList);
		
		return "/product/productOption";
	}

	// 상품 옵션 등록
	@RequestMapping(value = "/product/option/register")
	public ModelAndView getOption(ModelAndView mav) {
		
		return mav;
	}
	
	//판매지점 등록
	@RequestMapping(value="/product/addShop", method=RequestMethod.GET)
	public void addShop() {

	}
}
