
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate <= 20080128 then
		Talk(1,"","金钥匙只能在这个日期后使用<color=yellow>29.01.2008<color>.");
		return 0;
	end;
	if GetTask(1480) == 1 then
		Talk(1,"","每个角色只能使用一把金钥匙");
		return 0;
	end;
	if GetFightState() == 1 then
		Talk(1,"","战斗状态不能使用");
		return 0;
	end;
	local selTab = {
				"我同意/#use("..nItemIdx..")",
				"取消/nothing",
				}
	Say("你确定要用<color=yellow>金钥匙吗<color>?",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nPage = GetStoreBoxPageCount();
		SetStoreBoxPageCount(nPage+1);
		Msg2Player("你的箱子还有1页");
		SetTask(1480,1);
	end;	
end;

function nothing()

end;
