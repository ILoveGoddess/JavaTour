package com.zrkc.syyh.dao;

import java.util.List;

import com.zrkc.syyh.model.EquipmentType;
import com.zrkc.syyh.model.EquipmentTypeModel;
import com.zrkc.syyh.model.Pageinfo;

public interface IEquTypeDao {

	List<EquipmentTypeModel> getAllEquipmentType(Pageinfo<EquipmentTypeModel> pageinfo);

	int getTotalRecord();

	void deleteEquById(String equipmentId);

	void updateEqu(String equipmentId, String equipmentName);

	void addEqu(EquipmentType equ);

}
