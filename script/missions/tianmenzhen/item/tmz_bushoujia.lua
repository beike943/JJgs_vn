--²¶ÊŞ¼Ğ

function OnUse(nItemIdx)
	if chk_can_use() == 0 then
		Say("Kh«ng thÓ sö dông vËt phÈm nµy trong b¶n ®å",0)
		return 0;
	end	
	if GetFightState() == 0 then
		Talk(1,"","Kh«ng thÓ sö dông vËt phÈm trong tr¹ng th¸i nµy");
		return 0;
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		DoFireworks(1344,1);
		Msg2Player("§· ®Æt bÉy.");
	end 
end

function chk_can_use()
	local nMapID = GetMapTemplate(SubWorld);
	if nMapID ~= 6006 and nMapID ~= 6027 then
		return 0;
	else
		return 1;
	end
end