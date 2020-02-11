g_szPacketName = "Hép T©n Nguyªn ngo¹i trang";
g_szItemName = "1 T©n Nguyªn ngo¹i trang";

function OnUse(nItemIdx)
	local selTab = {
				"§ång ı/#confirm("..nItemIdx..")",
				"Hñy bá/nothing",
				}
	Say("B¹n muèn më <color=yellow>"..g_szPacketName.."<color>? B¹n cã thÓ nhËn ®­îc <color=yellow>"..g_szItemName.."<color>.",getn(selTab),selTab);
end;

function confirm(nItemIdx)
	if gf_JudgeRoomWeight(1,50,"") == 0 then
		return 0;
	end;
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody();
		local nRet, nIndex = AddItem(0,109,495+nBody-1,1);
		if nRet == 1 then		
			SetItemExpireTime(nIndex, nExpireTime);
		end
		Msg2Player("B¹n nhËn ®­îc "..g_szItemName);
	end;
end;

--ÅĞ¶ÏÉíÉÏµÄ¸ñ×ÓºÍ¸ºÖØÂú²»Âú×ãÌõ¼ş£¬µÚÈı¸ö²ÎÊıÌîÁËµÄ»°±íÊ¾Òª×÷TalkÌáÊ¾£¬ÄÚÈİÊÇÌáÊ¾ÈËµÄÃû×Ö
function gf_JudgeRoomWeight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--Èç¹ûÌîÁËµÚÈı¸ö²ÎÊı
			Talk(1,"",szMsgHead.."Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang!");
		end;
		return 0;
	else
		return 1;
	end;
end;

function nothing()

end;