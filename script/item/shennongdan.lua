TASKVAL_SHENNONGDAN	= 2502		-- ¸ÃÈÎÎñ±äÁ¿±£´æÉñÅ©µ¤µÄÊ£ÓàÊ±¼ä£¨·ÖÖÓ£©
SHENNONGDAN_TIME	= 8 * 60	-- Ò»¸öÉñÅ©µ¤µÄÊ±¼äÊÇ8¸öĞ¡Ê±£¨µ¥Î»ÊÇ·ÖÖÓ£©

function OnUse()
	local val = GetTask(TASKVAL_SHENNONGDAN)
	local UseShennong = {
		"Dïng 1 ThÇn N«ng §¬n cã thÓ nhËn ®­îc <color=yellow>8 giê<color> ThÇn N«ng §¬n.",
		"HiÖn ThÇn N«ng §¬n cßn d­ <color=yellow>".. val .."<color> phót, b¹n muèn dïng ThÇn N«ng §¬n kh«ng?",
		"Sö dông ThÇn N«ng ®¬n/ask_number",
		"§Ó ta nghÜ l¹i/no"
	}
	Say(UseShennong[1]..UseShennong[2],2,UseShennong[3],UseShennong[4])
end

function ask_number()
	local nItemNum = GetItemCount(2,1,343);
	if nItemNum < 1 then
		Say("HiÖn b¹n kh«ng cã ®ñ ThÇn N«ng §¬n!",1,"§ång ı/OnUse");
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	AskClientForNumber("UseShennongdan",1,nItemNum,"Xin hái dïng mÊy c¸i");
end
function UseShennongdan(nCount)
	if GetTask(TASKVAL_SHENNONGDAN) + SHENNONGDAN_TIME * nCount > 200000000 then--³¬¹ı2ÒÚÉÏÏŞ
		Say("V­ît qu¸ thêi gian giíi h¹n!",1,"§ång ı/no");
		return
	end
	if DelItem(2,1,343,nCount) == 1 then
		local value = GetTask(TASKVAL_SHENNONGDAN) + SHENNONGDAN_TIME * nCount
		SetTask(TASKVAL_SHENNONGDAN, value)
		Say("Thêi gian ThÇn N«ng ®¬n cña b¹n lµ <color=yellow>" .. value .. "<color> phót !", 0)
	else
		WriteLog("Dïng ThÇn N«ng §¬n:"..GetName().."Hñy bá ThÇn N«ng §¬n thÊt b¹i!");
		Say("HiÖn b¹n kh«ng cã ®ñ ThÇn N«ng §¬n!",1,"§ång ı/OnUse");
		return
	end
end
function no()
end
