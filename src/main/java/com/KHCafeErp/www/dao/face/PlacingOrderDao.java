package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.util.Paging;

public interface PlacingOrderDao {

	/**
	 * 전체 발주 리스트 개수 구하기
	 * 2019-12-31 서현석
	 * 
	 * @param placingOrder - 검색조건
	 * @return int - 총 갯수
	 */
	public int selectPlacingOrderListCnt(PlacingOrder placingOrder);

	/**
	 * 발주 리스트 불러오기
	 * 2019-12-31 서현석
	 * 
	 * @param paging - 페이징 객체
	 * @return list - 발주 리스트
	 */
	public List<PlacingOrder> selectPlacingOrderList(Paging paging);

}
