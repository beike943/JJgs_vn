--经脉系统境界控制
Include("\\settings\\static_script\\meridian\\meridian_title.lua")

--指定穴位指定等级的特殊需求条件是否达成
--1=已达成
--0=未达成
function CheckCondition(nLevel, bNotify)
	print(format("[%s]undefined meridian level %d", GetName(), nLevel))
	return 0;
end

--获取指定穴位指定等级的特殊需求描述文本
--返回szDescription
function GetConditionDesc(nLevel)
	local str = format("")
	return str;
end

--境界升级前特殊需求需要执行的操作
--1=操作成功
--0=操作失败
function DoBeforeLevelUpdateCallBack(nNewLevel)
	return 1;
end


--境界升级后特殊需求需要执行的操作
--1=操作成功
--0=操作失败
function DoAfterLevelUpdateCallBack(nNewLevel)
	merdiantitle_check_add_title(0)--经脉添加称号
	return 1;
end