Include("\\script\\misc\\valueablelog\\valueable_item.lua")

VET_TB_VALUEABLE_ACTION_TYPE = 
{
	[1] = "Add",
	[2] = "Remove",
}

function VET_OnValueableItemAdd(nItemIndex,nPlayerIndex)
	local nOldPlayerIdx = PlayerIndex;
	local strPlayerName = "";
	local strAcc = "";
	local tbItemInfo = GetItemInfoByIndex(nItemIndex, 1);
	local strDate = "["..date("%Y-%m-%d %H:%M:%S").."]"
	
	if (nPlayerIndex ~= nil and nPlayerIndex > 0) then
		PlayerIndex = nPlayerIndex;
		strPlayerName = GetName();
		strAcc = GetAccount();
	end
	
	local nItemPointer = VET_IsValueable(tbItemInfo.genre, tbItemInfo.detail, tbItemInfo.particular)
	
	if (tbItemInfo ~= nil and nItemPointer ~= 0) then
		VET_WriteValueableLog(1, "%s\t%s\t%d,%d,%d\t%d\t%u\t%s\t%s", strDate, VET_TB_VALUEABLE_ITEM[nItemPointer][1], tbItemInfo.genre, tbItemInfo.detail, tbItemInfo.particular, tbItemInfo.statck, tbItemInfo.randseed, strPlayerName, strAcc);
	end
	
	PlayerIndex = nOldPlayerIdx;
end

function VET_IsValueable(nG,nD,nP)
	if (type(nG) ~= "number" or type(nD) ~= "number" or type(nP) ~= "number" ) then
		return 0;
	end
	
	for i=1, getn(VET_TB_VALUEABLE_ITEM) do
		if (VET_TB_VALUEABLE_ITEM[i][2] == nG and VET_TB_VALUEABLE_ITEM[i][3] == nD and VET_TB_VALUEABLE_ITEM[i][4] == nP) then
			return i;
		end
	end
	
	return 0;
end

function VET_WriteValueableLog(nType, strFormat, ...)
	local strAction = VET_TB_VALUEABLE_ACTION_TYPE[nType] or "unknow";
	local strLog = format(strFormat, unpack(arg));
	local strDate = date("%Y_%m_%d");

	local hFile = openfile(format("logs/Valueable/%s/%s.log", strDate, strAction), "a+");
	if (hFile == nil) then
		execute(format("mkdir \"%s\"", "logs/Valueable/"));
		execute(format("mkdir \"%s\"", format("logs/Valueable/%s/", strDate)));
		hFile = openfile(format("logs/Valueable/%s/%s.log", strDate, strAction), "a+");
	end
	if (hFile ~= nil) then
		write (hFile, strLog .. "\n");
		closefile (hFile);
	end
end
