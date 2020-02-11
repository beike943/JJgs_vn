function OnUse()
	if GetPKFlag() ~= 0 then
		Msg2Player("Trong tr¹ng th¸i PK kh«ng thÓ sö dông b¸nh nh©n møt");
		return 0;
	end;
	if DelItem(2,1,389,1) == 1 then
		RestoreAll();
		Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt møt, håi phôc tÊt c¶ sinh lùc, néi lùc, thÓ lùc.");
		Msg2_LeiTai("B¸nh nh©n møt");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(23,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(29,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(30,GetName().."Sö dông 1	"..szItemName);
end;
