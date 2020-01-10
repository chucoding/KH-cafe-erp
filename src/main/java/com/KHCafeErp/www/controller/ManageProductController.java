package com.KHCafeErp.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.ImgFile;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.ManageProductService;
import com.KHCafeErp.www.util.ExcelWriter;
import com.KHCafeErp.www.util.Paging;

@Controller
public class ManageProductController {

	private static final Logger logger = LoggerFactory.getLogger(ManageProductController.class);
	@Autowired ManageProductService manageProductService;
	
	//리스트 불러오기
	@RequestMapping(value="/manageProduct/list", method=RequestMethod.GET)
	public void productList(Model model, Paging page,
			@RequestParam(defaultValue = "0") int productNo,
			String productName,
			@RequestParam(defaultValue = "0") int categoryNo,
			@RequestParam(defaultValue = "0") int categoryMapNo,
			@RequestParam(defaultValue = "0") int shopNo) {
		
		
////		logger.info("상품관리");
//		Product product = new Product();
//		product.setProductNo(productNo);
//		product.setProductName(productName);
//		product.setCategoryNo(categoryNo);
//		product.setCategoryMapNo(categoryMapNo);
//		product.setShopNo(shopNo);
//		
//		logger.info("검색조건 :" + product);
//
//		//페이징 계산
//		Paging paging = manageProductService.getPaging(page, product);
//		
//		model.addAttribute("paging", paging);
//
		List<CategoryBase> category = manageProductService.getcategoryList();
//		List<Shop> shop = manageProductService.getShopList();
////		
//		List<Product> productList = manageProductService.getProductListAll();
////		List<Product> productList = manageProductService.getProductList(paging, product);
//		
//		logger.info("검색결과 : " + productList);
//		
////		mav.setViewName("jsonView");
////		mav.addObject("product", productList);
//		mav.addObject("category", category);
////		mav.addObject("shop", shop);
////		mav.addObject("redirect", "/manageProduct/list");
		model.addAttribute("category", category);
//		model.addAttribute("shop", shop);
//		model.addAttribute("product", productList);
		
		
		
	}
	//카테고리 목록 불러오기
	@RequestMapping(value="/manageProduct/categoryDetail", method=RequestMethod.GET)
	public ModelAndView getCategoryDetail(@RequestParam(value = "value")int categoryNo, ModelAndView mav) {
		
		List<CategoryDetail> categoryDetail = manageProductService.getcategoryDetailList(categoryNo);
		
		mav.addObject("categoryDetail", categoryDetail);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//상품 정보 상세보기
	@RequestMapping(value="/manageProduct/view", method=RequestMethod.GET)
	public void getProductView(Model model, int productNo) {		

		List<CategoryBase> category = manageProductService.getcategoryList();
		Product product = manageProductService.getProduct(productNo);
		ImgFile imgfile = manageProductService.getImgFile(productNo);
		
		logger.info("view - " + category);
		model.addAttribute("category", category);
		model.addAttribute("product", product);
		model.addAttribute("imgfile", imgfile);
		

	}
	
	//상품 정보 수정하기
	@RequestMapping(value="/manageProduct/update", method=RequestMethod.GET)
	public ModelAndView updateProduct(Product product, ModelAndView mav) {
		logger.info("모달 값 : " + product.toString());
		
		manageProductService.editProduct(product);
		
		mav.setViewName("jsonView");
		mav.addObject("redirect", "/manageProduct/list");
		
		return mav;
	}
	
	@RequestMapping(value="manageProduct/updateFile")
	public ModelAndView updateFile(ImgFile file, ModelAndView mav) {
		
		logger.info("확인..." + file);
		logger.info("확인..." + file.getProductImage().getOriginalFilename());
		logger.info("확인..." + file.getProductImage().getSize());
		
		ImgFile imgFile = manageProductService.editFile(file, file.getProductNo());
		
//		ObjectMapper mapper = new ObjectMapper();
//		mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
//		
//		try {
//			String jsonString = mapper.writeValueAsString(new ImgFile());
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		mav.addObject("storedName", imgFile.getStoredName());
		mav.setViewName("jsonView");
		
		return mav;
//		return "redirect:/manageProduct/view?productNo="+file.getProductNo();
	}
	
	//상품 판매 시작 날짜 등록하기
	@RequestMapping(value="/manageProduct/selStartDate", method=RequestMethod.GET)
	public ModelAndView updateSelStartDate(Product product, ModelAndView mav) {
		logger.info("판매 시작 등록 모달 값 : " + product.toString());
		
		manageProductService.editSelStartDate(product);
		
		mav.setViewName("jsonView");
		mav.addObject("redirect", "/manageProduct/list");
		
		return mav;
	}

	//상품 판매 종료 날짜 등록하기
	@RequestMapping(value="/manageProduct/selEndDate", method=RequestMethod.GET)
	public ModelAndView updateSelEndDate(Product product, ModelAndView mav) {
		logger.info("판매 종료 등록 모달 값 : " + product.toString());
		
		manageProductService.editSelEndDate(product);

		mav.setViewName("jsonView");
		mav.addObject("redirect", "/manageProduct/list");

		return mav;
	}

	//상품 삭제하기
	@RequestMapping(value="/manageProduct/delete", method=RequestMethod.GET)
	public ModelAndView deleteProduct(Product product, ModelAndView mav) {
		logger.info("삭제 모달 값 : " + product.toString());
		
		manageProductService.deleteProduct(product);
		
		mav.setViewName("jsonView");
		mav.addObject("redirect", "/manageProduct/list");
		
		return mav;
	}
	
	@RequestMapping(value="/manageProduct/search", method=RequestMethod.GET)
	public ModelAndView search(ModelAndView mav, @RequestParam(defaultValue = "1") int curPage, Product product, HttpSession session) {
		
		// 매장번호 유효성 검사
	    int shopNo = 0;
	    String id = "";
	    if( session.getAttribute("shopNo")!=null && !"".equals(session.getAttribute("shopNo")) ) {
	    	shopNo = (int)session.getAttribute("shopNo");
	    	System.out.println("------------------------------shopNo : " + shopNo);
	    	product.setShopNo(shopNo);
	    }
	     
	    System.out.println("------------------------------shopNo : " + product);
		List<Product> data = manageProductService.getProductList(product);
		List llist = new ArrayList();
		List list = null;
		
		Shop shop =  manageProductService.getShopName(shopNo);
		
		//번호
		int i=1;
		for(Product pro : data) {
			list = new ArrayList();
			list.add(shop.getShopName());
			list.add(pro.getProductNo());
			list.add(pro.getProductName());
			list.add(pro.getOriginPrice());
			list.add(pro.getPrice());
			list.add(pro.getProductOrigin());
			list.add(pro.getEnrollDate());
			list.add(pro.getSelStartDate());
			list.add(pro.getSelEndDate());
			list.add(0);
			list.add(0);
			list.add(0);
			
			llist.add(list);
		}
		
		mav.addObject("data",llist);
		mav.setViewName("jsonView");
		
		return mav;
	}

	// 20-01-05 유진 : 상품 목록 엑셀 다운
	@RequestMapping(value = "/manageProduct/exceldown")
	public String excelDown() {
		
		List<Product> productList = manageProductService.getList();

		System.out.println(productList);
		 
		 ExcelWriter excelWriter=new ExcelWriter();
		 excelWriter.productXls(productList);
		 
		 logger.info("엑셀 다운 완료");
		 
		 return "redirect:/manageProduct/list";
	}
}
