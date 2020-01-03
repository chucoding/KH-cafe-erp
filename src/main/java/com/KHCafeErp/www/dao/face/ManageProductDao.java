package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.CategoryBase;
import com.KHCafeErp.www.dto.CategoryDetail;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;

public interface ManageProductDao {
	/**
	 * 상품을 목록에서 삭제한다
	 * @param prouduct - 삭제할 상품 번호
	 */
	public void deleteProduct(Product prouduct);
	/**
	 * 검색조건으로 검색결과를 가져온다
	 * @param product - 검색 조건 값들
	 * @return - 검색 결과 리스트
	 */
//	public List<Product> selectSearchList(Product product);
	/**
	 * 상품판매 시작 날짜를 업데이트 한다
	 * @param product - 업데이트할 날짜 정보
	 */
	public void updateSelStartDate(Product product);
	/**
	 * 상품판매 종료 날짜를 업데이트 한다
	 * @param product - 업데이트할 날짜 정보
	 */
	public void updateSelEndDate(Product product);
	/**
	 * 상품정보를 업데이트한다
	 * @param product - 업데이트할 상품정보
	 */
	public void updateProduct(Product product);
	/**
	 * 등록되있는 상품 목록 불러오기
	 * @return - 상품 목록
	 */
	public List<Product> selectProductAll(Product product);
	/**
	 * 지점 목록 불러오기
	 * @return - 지점 목록
	 */
	public List<Shop> selectShopAll();
	/**
	 * 카테고리 목록 가져오기
	 * @return - 카테고리 목록
	 */
	public List<CategoryBase> selectCategoryAll();
	/**
	 * 세부 카테고리 목록 가져오기
	 * @return - 세부 카테고리 목록
	 */
	public List<CategoryDetail> selectCategoryDetail(int categoryNo);

	public Product selectProductByProductNo(int productNo);
}
