function OnUse()
	if DelItem(2,1,390,1) == 1 then
		local nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			local nLevel = GetLevel();
			local nNeedExp = floor((nLevel^2*125000)/(80^2))
			ModifyExp(nNeedExp)
			Msg2Player("B¹n ¨n 1 b¸nh Ýt trøng muèi nhËn ®­îc"..nNeedExp.." ®iÓm kinh nghiÖm")
		elseif nRandomNum <= 20 then
			CastState("state_confusion",0,10*18);
			Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt nh©n trøng ®· h­, bÞ lo¹n trong 10 gi©y.");
		elseif nRandomNum <= 30 then
			CastState("state_sleep",0,10*18);
			Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt nh©n trøng ®· h­, bÞ mª trong 10 gi©y.");
		elseif nRandomNum <= 40 then
			CastState("state_vertigo",0,10*18);
			Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt nh©n trøng ®· h­, bÞ cho¸ng trong 10 gi©y.");
		elseif nRandomNum <= 50 then
			CastState("state_move_speed_percent_add",20,10*60*18,1,1001);	--10·ÖÖÓÌá¸ßÒÆ¶¯ËÙ¶È20%
			Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt nh©n trøng, tèc ®é di chuyÓn t¨ng 20% trong 10 phót.");
		elseif nRandomNum <= 60 then
			CastState("state_life_percent_per10s_anytime",10,10*60*18,1,1007);
			Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt nh©n trøng, mçi 10 gi©y håi phôc 10% sinh lùc trong vßng 10 phót.");
		elseif nRandomNum <= 70 then
			CastState("state_neili_percent_per10s_anytime",10,10*60*18,1,1008);
			Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt nh©n trøng, mçi 10 gi©y håi phôc 10% néi lùc trong vßng 10 phót.");
		elseif nRandomNum <= 80 then
			CastState("state_p_attack_percent_add",20,10*60*18,1,1009);
			CastState("state_m_attack_percent_add",20,10*60*18,1,1010);
			Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt nh©n trøng, t¨ng 20% lùc tÊn c«ng néi ngo¹i c«ng trong vßng 10 phót.");
		elseif nRandomNum <= 90 then
			CastState("state_p_attack_percent_dec",20,10*60*18,1,1011);
			CastState("state_m_attack_percent_dec",20,10*60*18,1,1012);
			Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt nh©n trøng ®· h­, gi¶m 20% lùc tÊn c«ng néi ngo¹i c«ng trong vßng 10 phót.");
		elseif nRandomNum <= 100 then
			CastState("state_life_max_percent_add",30,10*60*18,1,1013);
			Msg2Player("B¹n ®· ¨n 1 c¸i b¸nh Ýt nh©n trøng, t¨ng 30% l­îng m¸u trong vßng 10 phót.");
		end;
		Msg2_LeiTai("B¸nh Ýt trøng muèi");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(23,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(29,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(30,GetName().."Sö dông 1	"..szItemName);
end;
