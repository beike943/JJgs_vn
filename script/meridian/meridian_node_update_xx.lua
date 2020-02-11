--经脉系统穴位特殊需求模板

--指定穴位指定等级的特殊需求条件是否达成
--1=已达成
--0=未达成
function CheckCondition(nNodeId, nLevel, bNotify)
	if GetTask(2951) == nLevel then
		return 1;
	end
	if 0 ~= bNotify then
		Msg2Player(format("GetTask(2951) ~= %d", nLevel))
	end
	return 0;
end

--获取指定穴位指定等级的特殊需求描述文本
--返回szDescription
function GetConditionDesc(nNodeId, nLevel)
	local str = format("GetTask(2951) == %d", nLevel)
	return str;
end

--穴位升级后特殊需求需要执行的操作
--1=操作成功
--0=操作失败
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	return 1;
end