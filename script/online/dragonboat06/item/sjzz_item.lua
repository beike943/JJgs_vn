function OnUse()
	if DelItem(2,1,391,1) == 1 then
		CastState("state_add_strength",50,5*60*18,1,1002);--Ôö¼ÓÁ¦Á¿xµã
		CastState("state_add_energy",50,5*60*18,1,1003);--Ôö¼ÓÄÚ¹¦xµã
		CastState("state_add_vitality",50,5*60*18,1,1004);--Ôö¼Ó¸ù¹Çxµã
		CastState("state_add_dexterity",50,5*60*18,1,1005);--Ôö¼ÓÉí·¨xµã
		CastState("state_add_observe",50,5*60*18,1,1006);--Ôö¼Ó¶´²ìxµã
		Msg2Player("B¹n ®· ¨n 1 b¸nh İt thËp cÈm, trong vßng 5 phót tÊt c¶ ®iÓm c¬ b¶n t¨ng 50");
		Msg2_LeiTai("B¸nh İt thËp cÈm");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(23,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(29,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(30,GetName().."Sö dông 1	"..szItemName);
end;
