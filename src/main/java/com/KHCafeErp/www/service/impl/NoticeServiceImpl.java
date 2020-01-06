package com.KHCafeErp.www.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.NoticeDao;
import com.KHCafeErp.www.dto.NoticeBoard;
import com.KHCafeErp.www.service.face.NoticeService;
import com.KHCafeErp.www.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired private NoticeDao noticeDao;
	
	@Override
	public Paging getPaging(Paging inData) {
		
		//검색어
		Map<String, String> search = inData.getSearch(); 
		
		int totalCount = noticeDao.selectCntAll(search);
		
		Paging paging = new Paging(totalCount, inData.getCurPage());
		
		//검색어
		paging.setSearch(search);
		
		return paging;
	}

	@Override
	public List<NoticeBoard> list(Paging paging) {
		
		return noticeDao.selectPageList(paging);
	}

	@Override
	public void write(NoticeBoard board) {
		
		noticeDao.insert(board);
		
	}

	@Override
	public String getStaffName(NoticeBoard staffNo) {
		
		return noticeDao.selectStaffName(staffNo);
	}

	@Override
	public int getShopNo(int staffNo) {
		return noticeDao.selectShopNo(staffNo);
	}

	@Override
	public NoticeBoard boardView(NoticeBoard viewBoard) {
		
		return noticeDao.selectBoardByBoardNo(viewBoard);
		
	}

	@Override
	public void update(NoticeBoard board) {
		
		noticeDao.update(board);
		
	}

	@Override
	public void delete(NoticeBoard board) {
		
		noticeDao.delete(board);
		
	}
	

}
