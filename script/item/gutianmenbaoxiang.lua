--古天门宝箱物品脚本
Include("\\settings\\static_script\\item\\item_gutianmenbaoxiang.lua")
Include("\\script\\system_switch_config.lua")

function OnUse(nItemIdx)
	--disable this item script when tongtian mission is not open
	if IsTongTianHuanJingMissionSystemOpen() == 1 then
		return OnUse_Real(nItemIdx)
	end
end