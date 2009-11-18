/**
 * TSysParameterAddAction.java
 */

package com.sxit.system.action;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.sxit.common.BasicService;
import com.sxit.common.action.AbstractListAction;
import com.sxit.models.system.SysParameter;

/**
 * 
 * 用户信息列表根据参数名查询
 * @author 华锋 2008-2-25 上午11:12:05
 * 
 */
public class SysParameterListAction extends AbstractListAction {

	private String paramname;
	
	public SysParameterListAction() {
		this.rightCode = "sysParameterList";
	}

	
	private int typeid;
	
	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}

	/**
	 * @return the paramname
	 */
	public String getParamname() {
		return paramname;
	}

	/**
	 * @param paramname the paramname to set
	 */
	public void setParamname(String paramname) {
		this.paramname = paramname;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.sxit.common.action.AbstractAction#go()
	 */
	@Override
	protected String go() throws Exception {

		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(SysParameter.class).add(Restrictions.eq("typeid",typeid));
		// 这里要判断出登录帐号所属的group
		// 如果是admin，看所有的，如果不是admin,则根据登录人员的所属角色,判断角色对用户和对部门的可见性

		if (paramname != null && !"".equals(paramname))
			detachedCriteria.add(Restrictions.like("paramname", paramname, MatchMode.ANYWHERE));
	
		// 按createtime逆序排序
		detachedCriteria.addOrder(Order.asc("createtime"));
		BasicService service = (BasicService) getBean("basicService");
		this.page = service.findPageByCriteria(detachedCriteria, pageSize, pageNo);
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	
}
