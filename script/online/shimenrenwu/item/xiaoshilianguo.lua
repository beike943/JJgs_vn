function OnUse()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(1783) >= nDate then
		Talk(1,"","Mét ngµy chØ cã thÓ sö dông 1 lÇn Thİ LuyÖn qu¶ s­ m«n");
		return 0;
	end;
	if DelItem(2,1,423,1) == 1 then
		ModifyGoldenExp(400000)
		Msg2Player("B¹n nhËn ®­îc 400000 ®iÓm søc kháe");
		SetTask(1783,nDate);
	end;
end;