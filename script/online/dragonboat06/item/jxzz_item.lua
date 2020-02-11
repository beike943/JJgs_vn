function OnUse()
	if GetPKFlag() ~= 0 then
		Msg2Player("Trong tr¹ng th¸i PK kh«ng thÓ sö dông b¸nh Ýt Gia H­ng");
		return 0;
	end;
	if DelItem(2,1,392,1) == 1 then
		RestoreAll();
		ModifyExp(500000)
		Msg2Player("B¹n ¨n 1 b¸nh Ýt Gia H­ng nhËn ®­îc 50 v¹n kinh nghiÖm, lËp tøc håi phôc sinh lùc vµ néi lùc");
		WriteLog(GetName().."®· ¨n 1 c¸i b¸nh Ýt gia h­ng");
		Msg2_LeiTai("B¸nh Ýt Gia H­ng");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(23,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(29,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(30,GetName().."Sö dông 1	"..szItemName);
end;
