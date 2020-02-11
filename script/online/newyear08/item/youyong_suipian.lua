--ÓĞÓÃµÄÍ­Æ÷ËéÆ¬½Å±¾
--by vivi
--2008/02/17

--ÁéÊ¯Í·ÎÄ¼ş
Include("\\script\\lib\\lingshi_head.lua");

function OnUse()
	Say("<color=yellow>20<color>M¶nh ®ång khİ cã thÓ ®æi lÊy <color=yellow>1<color>linh th¹ch ngÉu nhiªn cÊp 1-5. B¹n muèn ®æi bao nhiªu?",
		4,
		"Ta muèn ®æi 1 linh th¹ch ngÉu nhiªn cÊp 1-5/#youyong_lingshi(1)",
		"Ta muèn ®æi 10 linh th¹ch ngÉu nhiªn cÊp 1-5/#youyong_lingshi(10)",
		"Ta muèn ®æi 50 linh th¹ch ngÉu nhiªn cÊp 1-5/#youyong_lingshi(50)",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function youyong_lingshi(nNum)
	Say("§æi <color=yellow>"..nNum.."<color> linh th¹ch ngÉu nhiªn cÊp 1-5 cÇn <color=yellow>"..(20*nNum).." <color>m¶nh ®ång h÷u dông. B¹n chÊp nhËn?",
		2,
		"õ, ta muèn ®æi./#confirm_youyong("..nNum..")",
		"Kh«ng, ta nhÇm!/OnUse")
end

function confirm_youyong(nNum)
	local nNeedNum = 20*nNum;
	if GetItemCount(2,1,3217) < nNeedNum then
		Talk(1,"","Trªn ng­êi b¹n kh«ng ®ñ <color=yellow>m¶nh ®ång h÷u dông<color>.");
		return
	end
	if DelItem(2,1,3217,nNeedNum) == 1 then
		for i=1,nNum do
			local nRand = random(1,5);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
		end
	end
end

function nothing()

end