--经脉系统境界控制
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\settings\\static_script\\meridian\\meridian_title.lua")

--指定穴位指定等级的特殊需求条件是否达成
--1=已达成
--0=未达成
function CheckCondition(nLevel, bNotify)
	print(format("[%s]undefined meridian level %d", GetName(), nLevel))
	return 0
	
--	if 4 ~= nLevel then
--		return 0
--	end
--	if 1 ~= meridianlevel_check_require(nLevel, bNotify) then
--		return 0
--	end
--	--完成任务条件判断
--	return 1;
end

--获取指定穴位指定等级的特殊需求描述文本
--返回szDescription
function GetConditionDesc(nLevel)
	--local szNpcDesc = format("激活%s境界可找<color=yellow>岳不群<color>冲击境界瓶颈", meridianlevel_getname(nLevel - 1))
	--local str = format("%s\n或%s", format("完成%s系列任务","??"), szNpcDesc)
	
	local str=""
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
	--merdiantitle_check_add_title(0)--经脉添加称号
	return 1;
end

