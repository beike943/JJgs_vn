-- ÉùÍûÀàÎïÆ·µÄ³ÆºÅ½Å±¾

tTab =
{
--ÎïÆ·´óÀà£¬¸±Àà£¬ÏêÏ¸Àà±ğ£¬ĞèÒªÉùÍû£¬³ÆºÅÃû³Æ£¬¶ÔÓ¦³ÆºÅ±íÄÚµÄ´óÀà£¬¸±Àà£¬³ÖĞøÊ±¼ä(ÕæÊµÊ±¼ä)
	{2,1,1037,	1000 ,	"Giang hå thiÕu hiÖp",	22,	7 ,	3600 * 24 * 30},
	{2,1,1038,	2000 ,	"Giang hå h¶o h¸n",	22,	8 ,	3600 * 24 * 30},
	{2,1,1039,	3000 ,	"Vâ l©m hµo kiÖt",	22,	9 ,	3600 * 24 * 30},
	{2,1,1040,	5000 ,	"Vâ l©m cao thñ",	22,	10,	3600 * 24 * 30},
	{2,1,1041,	7000 ,	"Mét thêi ®¹i hiÖp",	22,	11,	3600 * 24 * 30},
	{2,1,1042,	10000,	"C¸i thÕ anh hµo",	22,	12,	3600 * 24 * 30},	
	{2,1,1043,	15000,	"NhÊt ®¹i t«n s­",	22,	13,	3600 * 24 * 30},	
	{2,1,1044,	24000,	"Vâ l©m ®Ö nhÊt",	22,	14,	3600 * 24 * 30},	
	{2,1,1045,	35000,	"TuyÖt thÕ cao nh©n",	22,	15,	3600 * 24 * 30},	
	{2,1,1046,	50000,	"Vâ l©m thÇn tho¹i",	22,	16,	3600 * 24 * 30},	
}               
                
function GetPlayerSex()
	if GetSex() == 1 then
		return "ThiÕu hiÖp"
	else
		return "N÷ hiÖp "
	end
end

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	
	Say("NÕu danh väng cña b¹n ®¹t ®Õn <color=yellow>"..tTab[nTabIndex][5].."<color> sÏ cã th«ng b¸o réng r·i trong giang hå, muèn sö dông?", 2, "§óng/#yes_say("..nTabIndex..")", "Sai/no_say")
end

function yes_say(nTabIndex)
	local nRet = GetReputation()
	local nExist = 0
	for index, value in tTab do
		if IsTitleExist(tTab[index][6], tTab[index][7]) > 0 then
			nExist = index
			break
		end
	end
	
	if nRet < tTab[nTabIndex][4] then
		Say("VŞ "..GetPlayerSex()..", danh väng cña b¹n ch­a ®¹t cÊp ®é nµy!", 0)
	elseif nTabIndex <= nExist then
		Say("Danh tiÕng cña b¹n ®· lan truyÒn kh¾p giang hå", 0)
	elseif DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
		-- É¾µôµÍµÈ¼¶µÄÉùÍû³ÆºÅ
		for index, value in tTab do
			RemoveTitle(value[6], value[7])
		end
		local nGenre = tTab[nTabIndex][6]
		local nDetail = tTab[nTabIndex][7]
		local nTime = tTab[nTabIndex][8]
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("Danh tiÕng cña b¹n ®· lan truyÒn kh¾p giang hå")
		SetCurTitle(nGenre, nDetail)
	end
end

function no_say()

end