--»ı·ÖÅÆ 
--by vivi
--2008/11/06

function OnUse()
	local nPoint = GetTask(1351);
	if nPoint >= 200 then
		Talk(1,"","Dïng Tİch lòy bµi ®æi 10 ®iÓm tİch lòy, nhiÒu nhÊt lµ 200 ®iÓm, hiÖn giê ng­¬i ®· ®ñ 200 ®iÓm, kh«ng thÓ sö dông n÷a.");
		return 0;
	end
	Say("Dïng Tİch lòy bµi ®æi 10 ®iÓm tİch lòy, nhiÒu nhÊt lµ 200 ®iÓm, ®iÓm hiÖn giê cña ng­¬i lµ: <color=yellow>"..GetTask(1351).."<color>, ng­¬i x¸c nhËn muèn sö dông chø?",
		2,
		"\n§óng/ask_use_num",
		"\nKh«ng cÇn/nothing");
end

function ask_use_num()
	local nPoint = GetTask(1351);
	local nNum = ceil((200-nPoint)/10);
	local nPai = GetItemCount(2,0,1089);
	AskClientForNumber("confirm_give_jifen", 1, min(nNum,nPai), "Ng­¬i muèn dïng bao nhiªu Tİch lòy bµi?");
end

function confirm_give_jifen(nCount)
	if GetItemCount(2,0,1089) < nCount then
		Talk(1,"","Tİch lòy bµi trªn ng­êi ng­¬i kh«ng ®ñ.");
		return 0;
	end
	if DelItem(2,0,1089,nCount) == 1 then
		SetTask(1351,GetTask(1351)+nCount*10);
		if GetTask(1351) >= 200 then
			SetTask(1351,200);
			Msg2Player("B¹n nhËn ®­îc "..(nCount*10).."§iÓm tİch lòy ho¹t ®éng");
			Msg2Player("§iÓm cña ng­¬i ®· ®ñ 200, mçi ng­êi nhiÒu nhÊt chØ cã thÓ tİch lòy 200 ®iÓm.");
		else
			Msg2Player("B¹n nhËn ®­îc "..(nCount*10).."§iÓm tİch lòy ho¹t ®éng");
		end
	end
end

function nothing()

end