function OnUse(nItemIndex)
	local nLevel = GetLevel()
	local nNeedExp = floor((nLevel^2*100000)/(80^2))
	local selTab = {
			"§ång ý/#confirm("..nItemIndex..")",
			"Hñy bá/nothing",
			}
	Say("§¼ng cÊp hiÖn t¹i cã thÓ nhËn ®­îc <color=yellow>"..nNeedExp.."<color> ®iÓm kinh nghiÖm. B¹n muèn sö dông kh«ng?",
		getn(selTab),
		selTab)
end;

function confirm(nItemIndex)
	if GetTask(559) > GetTask(1714)*4 then
		Talk(1,"","Giang hå t©m ®¾c cña ®¹i hiÖp ®· lÜnh ngé ®Õn møc cùc h¹n råi, kh«ng cÇn ph¶i sö dông thªm ®©u.");
		return 0;
	end;
	if DelItemByIndex(nItemIndex,1) ~= 0 then
		local nLevel = GetLevel()
		local nNeedExp = floor((nLevel^2*100000)/(80^2))
		ModifyExp(nNeedExp)
		Msg2Player("B¹n nhËn ®­îc "..nNeedExp.." ®iÓm kinh nghiÖm.")
		SetTask(559,GetTask(559)+1);
	end;
end;

function nothing()

end;