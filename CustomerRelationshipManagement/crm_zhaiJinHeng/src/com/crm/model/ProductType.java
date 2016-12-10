package com.crm.model;
import java.util.Date;
/**
 * 商品类别实体类-------对应------->商品类别数据库中的b_product_type表
 * @author Administrator
 *
 */
public class ProductType implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3133485325142772823L;
	
	private Integer id;
	private int pid;//父id(上一级id)
	private String fcode;
	private String code;//编码
	private String name;//名称
	private String remark;//备注
	private Integer sort;//排序相关（序号）
	private Date createTime;//创建日期
	
	private String fatherName;
	
	
	public ProductType() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	
}
