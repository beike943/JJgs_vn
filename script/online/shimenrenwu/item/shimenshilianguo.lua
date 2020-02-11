function OnUse()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(1784) >= nDate then
		Talk(1,"","Mét ngµy chØ cã thÓ sö dông 1 lÇn Thİ LuyÖn qu¶ s­ m«n");
		return 0;
	end;
	if DelItem(2,1,424,1) == 1 then
		ModifyGoldenExp(1000000)
		Msg2Player("B¹n nhËn ®­îc 1 triÖu ®iÓm søc kháe");
		SetTask(1784,nDate);
	end;
end;