
--鉴定卷轴

function OnUse(id)
	sel=GetItemLevel(id) --获取物品等级
	EnterIdentify(1,sel,id)--进入鉴定状态
end;
