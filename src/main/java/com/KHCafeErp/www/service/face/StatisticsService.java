package com.KHCafeErp.www.service.face;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.KHCafeErp.www.util.DateTerm;

public interface StatisticsService {

	/**
	 * 한달치 일별 통계자료 가져오기
	 * 2020-01-13 서현석
	 * 
	 * @param shopNo
	 * @return 통계자료
	 */
	List<Map> getStatistics(int shopNo);

	/**
	 * 월별 통계자료 가져오기
	 * 2020-01-13 서현석
	 * 
	 * @param dailyStatisticsMap
	 * @return
	 */
	Map getStatistics(HashMap<Integer, ArrayList<Map>> newMap);

	/**
	 * 일별 통계자료 가져오기(+검색조건)
	 * 2020-01-13 서현석
	 *  
	 * @param shopNoArr
	 * @param dateTerm
	 * @return List<Map>
	 */
	List<Map> getStatistics(int[] shopNoArr, DateTerm dateTerm);

	

}
