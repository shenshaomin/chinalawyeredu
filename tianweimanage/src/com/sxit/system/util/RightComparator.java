/**
 * MenuComparator.java
 */
package com.sxit.system.util;

import java.util.Comparator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sxit.models.system.SysRight;

/**
 * @author 华锋
 * 2008-3-4 下午09:28:54
 *
 */
public class RightComparator implements Comparator {
//	private static Log LOG = LogFactory.getLog(RightComparator.class);
	/* (non-Javadoc)
	 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
	 */
	public int compare(Object o1, Object o2) {
		// TODO Auto-generated method stub
		SysRight m1=(SysRight)o1;
		SysRight m2=(SysRight)o2;
//	    LOG.debug(m1.getRightcode()+"="+m1.getCompareid()+","+m2.getRightcode()+"="+m2.getCompareid());
        return m1.getCompareid()>m2.getCompareid()?1:0;
	}
}