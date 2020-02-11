Include("\\settings\\static_script\\gem\\imp_item_gem_box.lua")

--\script\item\item_gem_box.lua
function OnUse(nItemIdx)
	return OnOpen_GemBox_FromItem(nItemIdx)
end