package com.fargo.basis.webapp.taglib;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;


/**
 * <p>This class is designed to render a <label> tag for labeling your forms and
 * adds an asterik (*) for required fields.  It was originally written by Erik
 * Hatcher (http://www.ehatchersolutions.com/JavaDevWithAnt/).
 * <p/>
 * <p>It is designed to be used as follows:
 * <pre>&lt;tag:label key="userForm.username"/&gt;</pre>
 *
 * @jsp.tag name="label" bodycontent="empty"
 */
public class DataFormateTag extends TagSupport {
	private String dataType;
	private String value;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	

	public int doStartTag() throws JspException {
		String rtn = value;
		try {

			if(value!=null && !"".equals(value.trim())){
				if ("AVA".equals(dataType)) {
					rtn = value;
				} else if ("AVB".equals(dataType)) {
					DecimalFormat df4 = new DecimalFormat("0");
					rtn=df4.format(new Double(value.trim()));
				} else if ("AVC".equals(dataType)) {
					DecimalFormat df4 = new DecimalFormat("0.00");
					rtn=df4.format(new Double(value.trim()));
				} else if ("AVD".equals(dataType) || "AVE".equals(dataType)) {
					rtn=value;
				} else if ("AVF".equals(dataType)) {
					rtn=value;
				} else if ("AVG".equals(dataType)) {
					rtn=value;
				} else if ("AVH".equals(dataType)) {
					rtn=value;
				} else if ("AVI".equals(dataType)) {
					DecimalFormat df4 = new DecimalFormat("0.00");
					rtn=df4.format(100*new Double(value.trim()));
				}
			}
			
			try {

				pageContext.getOut().write(rtn);

			} catch (IOException io) {
				throw new JspException(io);
			}

		} catch (Exception e) {
			e.printStackTrace();

			try {
				pageContext.getOut().write(value);
			} catch (IOException io) {
				throw new JspException(io);
			}
		}

		return super.doStartTag();
	}
	 
}
