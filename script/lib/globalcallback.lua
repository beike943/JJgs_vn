Include("\\script\\misc\\valueablelog\\valueablelog.lua")

function AddItemCallBack(nItemIndex,nPlayerIndex)
	VET_OnValueableItemAdd(nItemIndex,nPlayerIndex);
end

function RemoveItemCallBack(nItemIndex,nBelonerIndex)
end