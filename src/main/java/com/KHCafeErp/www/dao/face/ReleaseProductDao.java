package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.dto.ReleaseProduct;
import com.KHCafeErp.www.util.Paging;

public interface ReleaseProductDao {
	
	/**
	 * 19-12-31 유진
	 * 출고 정보 넣기
	 * @param releaseProduct - 출고된 상품 정보
	 */
	public void insertRelease(Release release);

	/**
	 * 20-01-01 유진
	 * 발주 목록 조회
	 * @return - 발주 목록
	 */
	public List<Release> selectReleaseList(Paging paging);

	/**
	 * 20-01-01 유진
	 * 출고 총 갯수
	 * @param release - 출고 정보
	 * @return - 전체 갯수
	 */
	public int selectReleaseListCnt(Release release);

	/**
	 * 20-01-03 유진
	 * 출고 엑셀 업로드
	 * @param releaseProduct - 출고 정보
	 */
	public void insertReleaseProduct(ReleaseProduct releaseProduct);

	/**
	 * 20-01-03 유진
	 * orderNo 조회
	 * @param release - 엑셀에서 받아온 출고 정보
	 * @return - orderNo
	 */
	public int selectOrderNo(Release release);
}
