--07Ê¥µ®»î¶¯ÎäÁÖ±¦µä½Å±¾
--by vivi
--2007/12/17

g_szThisFile = "\\script\\item\\wulinbaodian.lua";

tGaojiMiji = { --Ô­À´µÚ2ÁÐÎª¸ß¼¶ÐÂ·¨ ºóÀ´È¡ÏûÁË
	[2] = {{"Kim Cang B¸t Nh· Kinh",0,107,166},{"Kim Cang B¸t Nh· Kinh",0,107,166},{"Kim Cang Phôc Ma kinh",0,107,1},{"Kim Cang Phôc Ma T©m Ph¸p",0,107,2}},
	[3] = {{"V« TrÇn Bå §Ò Kinh",0,107,168},{"V« TrÇn Bå §Ò Kinh",0,107,168},{"V« TrÇn MËt tÞch",0,107,5},{"V« TrÇn T©m Ph¸p",0,107,6}},
	[4] = {{"TiÒm Long TÞch DiÖt Kinh",0,107,167},{"TiÒm Long TÞch DiÖt Kinh",0,107,167},{"TiÒm Long MËt tÞch",0,107,3},{"TiÒm Long T©m Ph¸p",0,107,4}},
	[6] = {{"Thiªn La Liªn Ch©u Lôc",0,107,169},{"Thiªn La Liªn Ch©u Lôc",0,107,169},{"Thiªn La MËt TÞch",0,107,7},{"Thiªn La T©m Ph¸p",0,107,8}},
	[8] = {{"Nh­ ý Kim §Ønh MËt TÞch",0,107,170},{"Nh­ ý Kim §Ønh MËt TÞch",0,107,170},{"Nh­ ý MËt TÞch",0,107,9},{"Nh­ ý T©m Ph¸p",0,107,10}},
	[9] = {{"BÝch H¶i TuyÖt ¢m Phæ",0,107,171},{"BÝch H¶i TuyÖt ¢m Phæ",0,107,171},{"BÝch H¶i Phæ",0,107,11},{"BÝch H¶i T©m Ph¸p",0,107,12}},
	[11] = {{"Hçn §én TrÊn Nh¹c MËt TÞch"	,0,107,172},{"Hçn §én TrÊn Nh¹c MËt TÞch"	,0,107,172},{"Hçn §én MËt tÞch"	,0,107,13},{"Hçn §én T©m Ph¸p",0	,107,14}},
	[12] = {{"Quü Thiªn Du Long MËt TÞch",0	,107,173},{"Quü Thiªn Du Long MËt TÞch",0	,107,173},{"Quý Thiªn MËt tÞch",0	,107,15},{"Quý Thiªn T©m Ph¸p",0	,107,16}},
	[14] = {{"HuyÔn ¶nh Mª Tung MËt TÞch",0,107,174},{"HuyÔn ¶nh Mª Tung MËt TÞch",0,107,174},{"HuyÒn ¶nh MËt tÞch",0,107,17},{"HuyÒn ¶nh T©m Ph¸p",0,107,18}},
	[15] = {{"Qu©n Tö TiÖt Phong MËt TÞch",0	,107,175},{"Qu©n Tö TiÖt Phong MËt TÞch",0	,107,175},{"Qu©n Tö MËt tÞch",0	,107,19},{"Qu©n Tö T©m Ph¸p",0,107,20}},
	[17] = {{"TrÊn Qu©n Phi Long Th­¬ng Phæ"	,0,107,176},{"TrÊn Qu©n Phi Long Th­¬ng Phæ"	,0,107,176},{"TrÊn Qu©n MËt tÞch"	,0,107,21},{"TrÊn Qu©n T©m Ph¸p",0,107,22}},
	[18] = {{"Xuyªn V©n L¹c Hång MËt TÞch",0	,107,177},{"Xuyªn V©n L¹c Hång MËt TÞch",0	,107,177},{"Xuyªn V©n MËt tÞch",0	,107,23},{"Xuyªn V©n T©m Ph¸p",0	,107,24}},
	[20] = {{"U Minh Phong Ma Lôc",0,107,178},{"U Minh Phong Ma Lôc",0,107,178},{"U Minh Quû Lôc",0,107,25},{"U Minh T©m Ph¸p",0,107,26}},
	[21] = {{"Linh Cæ HuyÔn Tµ Lôc",0,107,179},{"Linh Cæ HuyÔn Tµ Lôc",0,107,179},{"Linh Cæ MËt tÞch",0,107,27},{"Linh Cæ T©m Ph¸p",0,107,28}}
};

function OnUse()
	local strtab = {
		"Dïng 5 Ngò Hµnh MËt TÞch ®æi 1 Ngò Hµnh MËt TÞch toµn tËp (TÊt nhiªn cã thÓ söa ®Õn tÇng 10)/#change_miji(1)",
		"Dïng 1 L¨ng Ba Vi Bé ®æi 1 L¨ng Ba Vi Bé toµn tËp (TÊt nhiªn cã thÓ söa ®Õn tÇng 10)/#change_miji(2)",
		"Ta muèn dïng MËt tÞch s­ m«n s¬ cÊp (t©m ph¸p) ®æi MËt tÞch s­ m«n cao cÊp/#change_miji(3)",
		"Ta chØ ®Õn xem thö/nothing"
			}
	Say("B¹n ®· tra Vâ L©m B¶o §iÓn, ph¸t hiÖn cã thÓ so¹n thµnh MËt TÞch míi",
		getn(strtab),
		strtab)
end

function change_miji(nType)
	if nType == 1 then
		Say("B¹n x¸c ®Þnh dïng 5 Ngò Hµnh MËt TÞch ®æi 1 Ngò Hµnh MËt TÞch toµn tËp? (TÊt nhiªn Cã thÓ söa ®Õn tÇng 10). Vâ L©m B¶o §iÓn sÏ biÕn mÊt.",
			2,
			"§ång ý/#confirm_change_miji(1)",
			"Kh«ng, ta nhÇm!/nothing");
	elseif nType == 2 then
		Say("B¹n x¸c ®Þnh dïng 1 L¨ng Ba Vi Bé ®æi 1 L¨ng Ba Vi Bé toµn tËp (TÊt nhiªn Cã thÓ söa ®Õn tÇng 10) chø? Vâ L©m B¶o §iÓn công sÏ bÞ mÊt!",
			2,
			"§ång ý/#confirm_change_miji(2)",
			"Kh«ng, ta nhÇm!/nothing");
	elseif nType == 3 then
		local nRoute = GetPlayerRoute();
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute ==16 or nRoute == 19 then
			Talk(1,"","<color=green>Vâ L©m B¶o §iÓn<color>: Hay lµ thiÕu hiÖp vµo l­u ph¸i tr­íc råi ®Õn ®æi MËt tÞch s­ m«n.");
			return 0;
		end		
		PutinItemBox("Giao MËt tÞch" ,1, "B¹n cã muèn ®æi MËt tÞch nµy kh«ng?",g_szThisFile,1);	
	end		
end

function confirm_change_miji(nType)
	if nType == 1 then
		if GetItemCount(0,107,155) < 5 then
			Talk(1,"","Trong ng­êi b¹n kh«ng cã 5 Ngò Hµnh MËt TÞch ");
			return
		end;
		if GetItemCount(2,1,3206) < 1 then
			Talk(1,"","Trong ng­êi b¹n kh«ng cã 1 Vâ L©m B¶o §iÓn ");
			return
		end;		
		if DelItem(0,107,155,5) == 1 and DelItem(2,1,3206,1) == 1 then
		local add_flag = AddItem(0,107,157,1);
		if add_flag == 1 then
			Msg2Player("Chóc mõng B¹n nhËn ®­îc 1 Ngò Hµnh MËt TÞch toµn tËp ");
			Msg2Global("Ng­êi ch¬i"..GetName().."Dïng Vâ L©m B¶o §iÓn h·y söa ch÷a phôc håi Ngò Hµnh MËt TÞch thµnh Ngò Hµnh MËt TÞch toµn tËp!");
			WriteLog("07 Ho¹t ®éng Gi¸ng sinh: Ng­êi ch¬i "..GetName().."Dïng Vâ L©m B¶o §iÓn nhËn ®­îc 1 Ngò Hµnh MËt TÞch toµn tËp.");
		else
			WriteLog("07 Ho¹t ®éng Gi¸ng sinh: Ng­êi ch¬i "..GetName().."Dïng Vâ L©m B¶o §iÓn thu vÒ Ngò Hµnh MËt TÞch toµn tËp thÊt b¹i:"..add_flag);
		end
		else
			Talk(1,"","Ph¶i cã 5 Ngò Hµnh MËt TÞch vµ 1 Vâ L©m B¶o §iÓn míi cã thÓ ®æi 1 Ngò Hµnh MËt TÞch toµn tËp.");
		end
	elseif nType == 2 then
	  if GetItemCount(0,112,78) < 1 then
	    Talk(1,"","Trong ng­êi b¹n kh«ng cã L¨ng Ba Vi Bé");
	    return
	  end
		if GetItemCount(2,1,3206) < 1 then
			Talk(1,"","Trong ng­êi b¹n kh«ng cã 1 Vâ L©m B¶o §iÓn ");
			return
		end;	  
 	  if DelItem(0,112,78,1) == 1 and DelItem(2,1,3206,1) == 1 then
 	 		local add_flag = AddItem(0,112,158,1); 
 	 		if add_flag == 1 then
 	 			Msg2Player("Chóc mõng B¹n nhËn ®­îc 1 L¨ng Ba Vi Bé toµn tËp");
 	 			Msg2Global("Ng­êi ch¬i"..GetName().."Dïng Vâ L©m B¶o §iÓn h·y söa ch÷a phôc håi L¨ng Ba Vi Bé thµnh L¨ng Ba Vi Bé toµn tËp!");
 	 			WriteLog("07 Ho¹t ®éng Gi¸ng sinh: Ng­êi ch¬i "..GetName().."Dïng Vâ L©m B¶o §iÓn nhËn ®­îc 1 L¨ng Ba Vi Bé toµn tËp.");
 	 		else
 	 			WriteLog("07 Ho¹t ®éng Gi¸ng sinh: Ng­êi ch¬i "..GetName().."Dïng Vâ L©m B¶o §iÓn thu vÒ L¨ng Ba Vi Bé toµn tËp thÊt b¹i:"..add_flag);
 	 		end
 	 	else
 	 		Talk(1,"","Ph¶i cã 1 L¨ng Ba Vi Bé vµ 1 Vâ L©m B¶o §iÓn míi cã thÓ ®æi 1 L¨ng Ba Vi Bé toµn tËp.");
 	 	end
	end
end

function nothing()

end

function OnPutinCheck(nParam,nItemIdx,nID1,nID2,nID3)
	-- Ëø¶¨µÄ²»ÈÃ½»
	if GetItemSpecialAttr(nItemIdx, "LOCK") > 0 then
		Say("<color=green>Vâ L©m B¶o §iÓn<color>: §©y lµ vËt phÈm thiÕu hiÖp rÊt quý, thiÕu hiÖp ®· khãa, kh«ng thÓ ®æi, nÕu muèn ®æi th× h·y më khãa.", 0)
		return 0;
	end	
	local nRoute = GetPlayerRoute();
	if (nID1 == tGaojiMiji[nRoute][3][2] and nID2 == tGaojiMiji[nRoute][3][3] and nID3 == tGaojiMiji[nRoute][3][4]) or (nID1 == tGaojiMiji[nRoute][4][2] and nID2 == tGaojiMiji[nRoute][4][3] and nID3 == tGaojiMiji[nRoute][4][4])	then
		return 1
	end	

	Say("<color=green>Vâ L©m B¶o §iÓn<color>: §©y kh«ng ph¶i lµ vËt ta cÇn, thø ta cÇn lµ <color=yellow>"..tGaojiMiji[nRoute][3][1].." hoÆc "..tGaojiMiji[nRoute][4][1].."<color>, ng­¬i h·y xem kü l¹i.",0);
	return 0
end

function OnPutinComplete(nParam)
	local nRoute = GetPlayerRoute();
	local tbDelItemInfo = GetPutinItem();
	local nCherk = 0;
	local nDelflag = 0;

	if (tbDelItemInfo[1][2] == tGaojiMiji[nRoute][3][2] and tbDelItemInfo[1][3] == tGaojiMiji[nRoute][3][3] and tbDelItemInfo[1][4] == tGaojiMiji[nRoute][3][4]) or (tbDelItemInfo[1][2] == tGaojiMiji[nRoute][4][2] and tbDelItemInfo[1][3] == tGaojiMiji[nRoute][4][3] and tbDelItemInfo[1][4] == tGaojiMiji[nRoute][4][4])	then
		nCherk = 1;
	end

	if nCherk ~= 1 then
		Talk(1,"","<color=green>Vâ L©m B¶o §iÓn<color>: VËt ng­¬i giao h×nh nh­ cã chót vÊn ®Ò, phiÒn ng­¬i xem l¹i gióp.");
		return 0;
	end		
	if DelItemByIndex(tbDelItemInfo[1][1],-1) == 1 and DelItem(2,1,3206,1) == 1 then
		local nAddFlag = AddItem(tGaojiMiji[nRoute][1][2],tGaojiMiji[nRoute][1][3],tGaojiMiji[nRoute][1][4],1);
		if nAddFlag == 1 then
			Talk(1,"","<color=green>Vâ L©m B¶o §iÓn<color>: Chóc mõng ng­¬i ®· ®æi "..tGaojiMiji[nRoute][1][1].."Thµnh c«ng.");
			WriteLog("Vâ L©m B¶o §iÓn: Ng­êi ch¬i"..GetName().." ®· ®æi ®­îc mËt tÞch"..tGaojiMiji[nRoute][1][1]);
		else
			WriteLog("Vâ L©m B¶o §iÓn: Ng­êi ch¬i"..GetName().."§æi mËt tÞch"..tGaojiMiji[nRoute][1][1].." thÊt b¹i, ký hiÖu:"..nAddFlag);
		end
	else
		Talk(1,"","<color=green>Vâ L©m B¶o §iÓn<color>: VËt ng­¬i giao h×nh nh­ cã chót vÊn ®Ò, phiÒn ng­¬i xem l¹i gióp.");
	end
end