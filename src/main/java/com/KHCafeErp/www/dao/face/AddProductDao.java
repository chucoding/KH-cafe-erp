package com.KHCafeErp.www.dao.face;

import java.util.List;

import com.KHCafeErp.www.dto.ProductOption;

public interface AddProductDao {

	/**
	 * ��ϵǾ� �ִ� Option ��ȸ
	 * @return - Option ����Ʈ
	 */
	public List<ProductOption> selectOption();

}
