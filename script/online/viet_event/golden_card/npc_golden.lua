Include("\\script\\online\\viet_event\\golden_card\\golden_head.lua");
Include("\\script\\online\\viet_event\\golden_card\\npc_golden_saleman.lua");
Include("\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua");
Include("\\script\\weapon_upgrade\\upgrade_npc.lua");


function golden_award()
	local tSay = {
		"Ta muèn mua m· Hoµng Kim LÖnh Bµi/get_golden_card",
		"Ta muèn kİch ho¹t nhËn th­ëng ThiÕu Niªn Anh Hïng (nhËn th­ëng theo ®¼ng cÊp)/#activate_account(1)",
		"Ta muèn kİch ho¹t nhËn th­ëng Vâ L©m TiÒn Bèi/#activate_account(2)",
		"Ta muèn nhËn th­ëng Vâ L©m ChiÕn H÷u/get_friendly_award",
		"Ta muèn nhËn phÇn th­ëng mçi ngµy/get_golden_day",
		"Ta muèn nhËn th­ëng ngµy vµng/get_golden_weekday",
		"Ta muèn nhËn th­ëng theo ®¼ng cÊp (®· kİch ho¹t thµnh c«ng)/award_level",
		--"Ta muèn ®æi Tø Linh Bèi/award_golden_jewel",
		"T¹i h¹ chØ ghĞ ngang!/dlgover",
	}	
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>Hoµng Kim LÖnh Bµi<color>, c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng sau:", getn(tSay),tSay)
end

function get_golden_day()
	local tSay = {
		"Ta muèn nhËn vËt phÈm thu thËp + H¹t gièng/#confirm_get_golden_day(1)",
		"Ta muèn nhËn vËt phÈm thu thËp + Vµng/#confirm_get_golden_day(2)",
		"Ta muèn nhËn vËt phÈm thu thËp + Tu Ch©n YÕu QuyÕt/#confirm_get_golden_day(3)",
		"Ta muèn nhËn vËt phÈm thu thËp + Tr¸i C©y/#confirm_get_golden_day(4)",
		"T¹i h¹ chØ ghĞ ngang!/dlgover",
	}	
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>Hoµng Kim LÖnh Bµi<color>, mçi ngµy c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng sau:", getn(tSay),tSay)	
end

function confirm_get_golden_day(nIndex)
	local nType = CheckActivated()
	if nType == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã Hoµng Kim LÖnh Bµi hoÆc ch­a kİch ho¹t nhËn th­ëng.")
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_HKLB_DAILYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_HKLB_DAILYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_HKLB_DAILYAWARD), 100)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· nhËn th­ëng h«m nay råi. Mai quay l¹i nhĞ.")
		return
	end
	
	if gf_Judge_Room_Weight(6, 300, "Chñ Phßng M¸y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	SetTask(TSK_HKLB_DAILYAWARD, GetTask(TSK_HKLB_DAILYAWARD) + 1)
	
	local nLevel = floor(GetLevel()/10)
	if nLevel < 7 then
		nLevel = 7
	end
	
	gf_AddItemEx2(tb_everyday_award[nType][nLevel][2],tb_everyday_award[nType][nLevel][1], szHKLBLogHeader, szHKLBLogAction)
	if nIndex == 1 then
			gf_AddItemEx2({2,1,30086,tb_everyday_award[nType][nLevel][3],4},"H¹t Gièng", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
	elseif nIndex == 2 then
		Earn(tb_everyday_award[nType][nLevel][4] * 10000)
		Msg2Player("B¹n nhËn ®­îc "..tb_everyday_award[nType][nLevel][4].." vµng.")
	elseif nIndex == 3 then
		gf_AddItemEx2(tb_everyday_award_TCYQ[nType][nLevel],"Tu Ch©n YÕu QuyÕt", szHKLBLogHeader, szHKLBLogAction,7*24*60*60)
	elseif nIndex == 4 then
		gf_AddItemEx2(tb_everyday_award[nType][nLevel][7], tb_everyday_award[nType][nLevel][6], szHKLBLogHeader, szHKLBLogAction)
	end
end

function get_golden_weekday()
	local tSay = {}
	tinsert(tSay, "Ta muèn nhËn Gç Qu©n Dông + Qu©n C«ng Ch­¬ng + B¸t Nh· Nhá/#confirm_get_golden_weekday(1)")
	if GetLevel() >= 80 then
		tinsert(tSay, "Ta muèn nhËn Kho¸ng Th¹ch Qu©n Dông + Qu©n C«ng Ch­¬ng + B¸t Nh· Nhá/#confirm_get_golden_weekday(2)")
		tinsert(tSay, "Ta muèn nhËn Lóa M¹ch Qu©n Dông + Qu©n C«ng Ch­¬ng + B¸t Nh· Nhá/#confirm_get_golden_weekday(3)")
		tinsert(tSay, "Ta muèn nhËn Thuéc Da Qu©n Dông + Qu©n C«ng Ch­¬ng + B¸t Nh· Nhá/#confirm_get_golden_weekday(4)")
		tinsert(tSay, "Ta muèn nhËn T¬ T»m Qu©n Dông + Qu©n C«ng Ch­¬ng + B¸t Nh· Nhá/#confirm_get_golden_weekday(5)")
		tinsert(tSay, "Ta muèn nhËn D­îc Th¶o Qu©n Dông + Qu©n C«ng Ch­¬ng + B¸t Nh· Nhá/#confirm_get_golden_weekday(6)")
		tinsert(tSay, "Ta muèn nhËn Linh HuyÕt Qu©n Dông + Qu©n C«ng Ch­¬ng + B¸t Nh· Nhá/#confirm_get_golden_weekday(7)")
	end
	tinsert(tSay, "T¹i h¹ chØ ghĞ ngang!/dlgover")
	
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>Hoµng Kim LÖnh Bµi<color>, vµo c¸c ngµy thø 6, 7, Chñ NhËt hµng tuÇn c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng sau:", getn(tSay),tSay)		
end

function confirm_get_golden_weekday(nIndex)
	local nType = CheckActivated()
	if nType == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã Hoµng Kim LÖnh Bµi hoÆc ch­a kİch ho¹t nhËn th­ëng.")
		return
	end
	
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 5 and nWeek ~= 6 and nWeek ~= 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã thÓ nhËn phÇn th­ëng nµy vµo thø s¸u, thø b¶y vµ chñ nhËt.");
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_HKLB_GOLDENDAYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_HKLB_GOLDENDAYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_HKLB_GOLDENDAYAWARD), 100)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· nhËn th­ëng h«m nay råi. Mai quay l¹i nhĞ.")
		return
	end
	
	if gf_Judge_Room_Weight(10, 800, "Chñ Phßng M¸y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	SetTask(TSK_HKLB_GOLDENDAYAWARD, GetTask(TSK_HKLB_GOLDENDAYAWARD) + 1)
	local nLevel = floor(GetLevel()/10)
	if nLevel < 7 then
		nLevel = 7
	end
	
	if nLevel == 7 then
		gf_AddItemEx2(tb_golden_material_goldenday[1][2], tb_golden_material_goldenday[1][1], szHKLBLogHeader, szHKLBLogAction)
		gf_AddItemEx2({2,1,9999,1,4}, "Qu©n C«ng Ch­¬ng", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
		gf_AddItemEx2({2,0,504,tb_golden_material_goldenday[1][4],4}, "B¸t Nh· nhá", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
	elseif nLevel == 8 then
		gf_AddItemEx2(tb_golden_material_goldenday[nIndex + 1][2], tb_golden_material_goldenday[nIndex + 1][1], szHKLBLogHeader, szHKLBLogAction)
		gf_AddItemEx2({2,1,9999,1,4}, "Qu©n C«ng Ch­¬ng", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
		gf_AddItemEx2({2,0,504,tb_golden_material_goldenday[nIndex + 1][4],4}, "B¸t Nh· nhá", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
	elseif nLevel == 9 then
		gf_AddItemEx2(tb_golden_material_goldenday[nIndex + 8][2], tb_golden_material_goldenday[nIndex + 8][1], szHKLBLogHeader, szHKLBLogAction)
		gf_AddItemEx2({2,1,9999,1,4}, "Qu©n C«ng Ch­¬ng", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
		gf_AddItemEx2({2,0,504,tb_golden_material_goldenday[nIndex + 8][4],4}, "B¸t Nh· nhá", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
	end
end

function activate_account(nType)
	local nLevel = GetLevel()
	local nExp = GetExp()
	if CheckAccount() <= 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ kh«ng cã Hoµng Kim LÖnh Bµi.")
		return
	end
	
	if CheckActivated() ~= 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ®· ®­îc kİch ho¹t råi, kh«ng cÇn kİch ho¹t n÷a!");
		return
	end
	
	if nType == 1 then
		if CheckAccount() ~= 1 then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Kh«ng ph¶i ThiÕu Niªn Anh Hïng, kh«ng thÓ kİch ho¹t.");
			return
		end
		
		if CheckCharged() > 1 then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ho¹t ®éng chØ ¸p dông ®èi víi tµi kho¶n n¹p Hoµng Kim LÖnh Bµi lÇn ®Çu.");
			return
		end
		
		if ((nLevel > NEEDED_LEVEL) or (nExp > NEEDED_EXP)) then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ nh÷ng nh©n vËt ®¼ng cÊp tõ 73 trë xuèng, ®iÓm kinh nghiÖm tİch lòy kh«ng qu¸ 200 triÖu míi cã thÓ kİch ho¹t nhËn th­ëng!");
			return
		end
		
		if gf_SetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE, 3) == 1 then
			gf_SetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_LEVELAWARD, 1)
			gf_SetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_STATUS, 3)
			if nLevel < 73 then
				SetLevel(73,0)
				ModifyExp(20000000)			
			end
			ModifyReputation(3000, 0)
			Earn(999999)
			gf_WriteLogEx(szHKLBLogHeader, "Kİch ho¹t thµnh c«ng ThiÕu Niªn Anh Hïng")
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ®· ®­îc kİch ho¹t ThiÕu Niªn Anh Hïng! Vui lßng ®¨ng nhËp l¹i!");	
		end
	elseif nType == 2 then
		if CheckAccount() ~= 2 then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Kh«ng ph¶i Vâ L©m TiÒn Bèi, kh«ng thÓ kİch ho¹t.");
			return
		end
		
		if gf_SetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE, 4) == 1 then
			gf_SetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_STATUS, 4)
			SetTask(TSK_HKLB_REWARD, 0)
			SetTask(TSK_HKLB_EXCHANGE,0)
			gf_WriteLogEx(szHKLBLogHeader, "Kİch ho¹t thµnh c«ng Vâ L©m TiÒn Bèi")
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ®· ®­îc kİch ho¹t Vâ L©m TiÒn Bèi! Vui lßng ®¨ng nhËp l¹i!");	
		end
	end
end

function award_level()
	local tSay = {
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 74/#get_golden_award(74)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 75/#get_golden_award(75)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 76/#get_golden_award(76)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 77/#get_golden_award(77)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 78/#get_golden_award(78)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 79/#get_golden_award(79)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 80/#get_golden_award(80)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 81/#get_golden_award(81)",			
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 82/#get_golden_award(82)",	
					"Trang kÕ/award_level_2",
					"T¹i h¹ chØ ghĞ ngang!/dlgover",
			}
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>Hoµng Kim LÖnh Bµi<color>, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng.",	getn(tSay),tSay)	
end

function award_level_2()
	local tSay = {							
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 83/#get_golden_award(83)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 84/#get_golden_award(84)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 85/#get_golden_award(85)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 86/#get_golden_award(86)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 87/#get_golden_award(87)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 88/#get_golden_award(88)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 89/#get_golden_award(89)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 90/#get_golden_award(90)",
					"Trang kÕ/award_level_3",	
					"Trang tr­íc/award_level",
					"T¹i h¹ chØ ghĞ ngang!/dlgover",
			}
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>Hoµng Kim LÖnh Bµi<color>, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng.",	getn(tSay),tSay)		
end

function award_level_3()
	local tSay = {							
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 91/#get_golden_award(91)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 92/#get_golden_award(92)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 93/#get_golden_award(93)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 94/#get_golden_award(94)",	
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 95/#get_golden_award(95)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 96/#get_golden_award(96)",
					"Trang tr­íc/award_level_2",
					"T¹i h¹ chØ ghĞ ngang!/dlgover",
			}
	Say("<color=green>Chñ Phßng M¸y<color>: §èi víi c¸c tµi kho¶n cã <color=yellow>Hoµng Kim LÖnh Bµi<color>, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), c¸c h¹ cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng.",	getn(tSay),tSay)		
end

function get_golden_award(nLevel)
	if CheckActivated() ~= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ch­a kİch ho¹t nhËn th­ëng hoÆc kh«ng ph¶i ThiÕu Niªn Anh Hïng!");
		return
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	if tRouteSkillInfo[nRoute]== 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	if GetLevel() < 74 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp cña c¸c h¹ ch­a ®ñ 74, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	confim_get_golden_award(nLevel)
end

function confim_get_golden_award(nLevel)
	local nAwardLevel = CheckLevel();
	if nAwardLevel == 0 or nAwardLevel < nLevel then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Kh«ng ®ñ ®iÒu kiÖn ®iÓm qu©n c«ng, danh väng vµ ®iÓm s­ m«n ®Ó nhËn phÇn th­ëng nµy");
		return
	end
	if nLevel >= 89 then
		if GetExp() < tb_golden_award[nLevel][5] then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ph¶i cã ®ñ ".. tb_golden_award[nLevel][5].." ®iÓm kinh nghiÖm míi cã thÓ nhËn phÇn th­ëng cÊp "..nLevel.."!")
			return
		end
	end
	warning_get_golden_award(nLevel, nAwardLevel);
end

function warning_get_golden_award(nWantLevel, nLevel)
	Say("<color=green>Chñ Phßng M¸y<color>: NhËn phÇn th­ëng cÊp <color=red>"..nWantLevel.."<color>, c¸c h¹ cã thÓ nhËn phÇn th­ëng cao nhÊt lµ  phÇn th­ëng cÊp <color=red>"..nLevel.."<color>. Cã ch¾c muèn nhËn phÇn th­ëng cÊp "..nWantLevel.." kh«ng?",
		2,
		"Ta muèn nhËn /#confirm_confirm("..nWantLevel..")",
		"§Ó ta suy nghÜ l¹i xem./dlgover");
end

function confirm_confirm(nLevel)
	if CheckActivated() ~= 1 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ch­a kİch ho¹t nhËn th­ëng hoÆc kh«ng ph¶i ThiÕu Niªn Anh Hïng!");
		return
	end
	
	local nGet = CheckAwardLevel()
	if nGet > tb_golden_award[nLevel][4] then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn tiÕp n÷a!");
		return
	end
	
	if gf_Judge_Room_Weight(9, 500, "Chñ Phßng M¸y") == 0 then
		return
	end
	
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	local nGuanGong = GetTask(701)
	local szLogTitle = szHKLBLogHeader
	local szLogAction = "nhËn th­ëng theo cÊp"
	local nRet, nItemIdx = 0,0;
	
	if tRouteSkillInfo[nRoute] == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end	
	
	gf_SetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_LEVELAWARD, nGet + 1)
	if nLevel == 74 then										
		gf_AddItemEx2({2, 0, 553,2,4},"§¹i Nh©n S©m", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx({0, 107, 64,1,1},"Thiªn Hµ MËt tŞch")
		gf_AddItemEx({0, 107, 65,1,1},"Tö Hµ MËt tŞch")
		gf_AddItemEx({0, 107, 66,1,1},"Chiªm Y Phæ")
		gf_AddItemEx({0, 107, 60,1,1},"Tu La MËt tŞch")
		gf_AddItemEx({0, 107, 63,1,1},"Ngò Quû MËt tŞch")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);			
	elseif nLevel == 75 then
		 gf_AddItemEx2({2, 1, 9977,1,1},"Huy hiÖu chiÕn c«ng (Huy Hoµng)", szLogTitle, szLogAction, 7*24*60*60)
		 if nGuanGong >= 0 then
		 	gf_AddItemEx2({0, 109, 992 + nBody -1,1,1},"Tèng Qu©n Trang", szLogTitle, szLogAction, 60*24*60*60)
		 else
		 	gf_AddItemEx2({0, 109, 996 + nBody -1,1,1},"Liªu Qu©n Trang", szLogTitle, szLogAction, 60*24*60*60)
		 end	
		 Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 76 then
		local nRand = random(1, 100)
		if nRand <= 20 then
			gf_AddItemEx2({2,1,30172,100}, "Xoµi", szLogTitle, szLogAction)
		elseif nRand <= 40 then
			gf_AddItemEx2({2,1,30173,100}, "§µo", szLogTitle, szLogAction)
		elseif nRand <= 60 then
			gf_AddItemEx2({2,1,30174,100}, "MËn", szLogTitle, szLogAction)
		elseif nRand <= 80 then
			gf_AddItemEx2({2,1,30177,100}, "B¬", szLogTitle, szLogAction)
		else
			gf_AddItemEx2({2,1,30175,100}, "V¶i", szLogTitle, szLogAction)
		end
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 77 then
		if nGuanGong >= 0 then
			gf_AddItemEx({0, 100, 2231 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"Tèng §« Thèng chiÕn")
			gf_AddItemEx({0, 101, 2231 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"Tèng §« Thèng chiÕn")
			gf_AddItemEx({0, 103, 2231 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"Tèng §« Thèng chiÕn")
			nRet, nItemIdx = gf_AddItemEx({2, 1, 9988,1,1},"Phong th­ëng lÖnh_Tèng (§« Thèng)")
		else
			gf_AddItemEx({0, 100, 2235 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"Liªu §« Thèng chiÕn")
			gf_AddItemEx({0, 101, 2235 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"Liªu §« Thèng chiÕn")
			gf_AddItemEx({0, 103, 2235 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"Liªu §« Thèng chiÕn")	
			nRet, nItemIdx = gf_AddItemEx({2, 1, 9987,1,1},"Phong th­ëng lÖnh_Liªu (§« Thèng)")
		end
		if nRet == 1 then
		 	SetItemExpireTime(nItemIdx,30*24*60*60)
		end
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 78 then
		gf_AddItemEx2(tb_golden_skillbag[nRoute][2], tb_golden_skillbag[nRoute][1], szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][7], tb_golden_faction_tree[nRoute][6], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 79 then
		local nBody = GetBody()
		local tWeapons = {0, 3, 8, 0, 0, 1,  0, 2, 10, 0, 0, 5, 0, 2, 9, 0, 6, 4, 0, 7, 11}
		if nRoute ==8 or nRoute == 9 then
			nBody = nBody - 2		
		end
		AddItem(0, tWeapons[nRoute], nRoute * 100 + 20 + nBody, 1, 1, -1, -1, -1, -1, -1, -1, 0 , 6);	
		if nRoute == 2 then
			AddItem(0, tWeapons[12], nRoute * 100 + 20 + nBody, 1, 1, -1, -1, -1, -1, -1, -1, 0, 6);	
		end
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][9], tb_golden_faction_tree[nRoute][8], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 80 then
		GivePet1Award()
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 81 then
		gf_AddItemEx2({2, 1, 1068, 1, 4},"Thiªn Th¹ch Linh Th¹ch", szLogTitle, "nhËn ®­îc", 7*24*60*60)
		gf_AddItemEx2({0, 107, 160, 1}, "Tø Linh Thiªn ı Phæ", szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2({0, 107, 161, 1}, "Tø Linh Tö ı Phæ", szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)
			AddGlobalNews("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 Thiªn Th¹ch Linh Th¹ch, phÇn th­ëng cÊp 81 Hoµng Kim LÖnh Bµi")
  			Msg2SubWorld("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 Thiªn Th¹ch Linh Th¹ch, phÇn th­ëng cÊp 81 Hoµng Kim LÖnh Bµi")
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 82 then
		GoldenGiveJewel()
		gf_AddItemEx2({0, 107, 159, 1}, "Tø Linh ChiÕn ı Phæ", szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)	
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 83 then
		GoldenGiveJewel()
		gf_AddItemEx2(tb_golden_book_high[nRoute][2], tb_golden_book_high[nRoute][1], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)	
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 84 then
		gf_AddItemEx2({2, 1, 1068, 1, 1},"Thiªn Th¹ch Linh Th¹ch", szLogTitle, "nhËn ®­îc", 7*24*60*60)
		gf_AddItemEx2(tb_golden_book_med[nRoute][2], tb_golden_book_med[nRoute][1], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 85 then
		gf_AddItemEx2({2,1,30130,3}, "Phi Yªn Th¹ch", szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2({2,1,30131,1}, "Tö Quang ThÇn Th¹ch", szLogTitle, "nhËn ®­îc")
		gf_AddItemEx2(tb_golden_book_low[nRoute][2], tb_golden_book_low[nRoute][1], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 86 then
		GetTQVD()
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11] , tb_golden_faction_tree[nRoute][10], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 87 then
		GetTQVD()
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11] , tb_golden_faction_tree[nRoute][10], szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 88 then
		GetTQVD()
		gf_AddItemEx2({0, 107, 156, 1}, "B¸ch Th¶o mËt tŞch", szLogTitle, "nhËn ®­îc")
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 89 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ 25.000.000 ®iÓm kinh nghiÖm.")
		gf_AddItemEx2({2, 1, 504, 8, 4},"N÷ Oa Tinh Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 90 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ 25.000.000 ®iÓm kinh nghiÖm.")
		--gf_AddItemEx2({2,1,1067,1,4}, "§Şnh Hån Thiªn Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		AddTrangBiSuMon4()
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)
			AddGlobalNews("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 trang bi s­ m«n bé 4 ngÉu nhiªn, phÇn th­ëng cÊp 90 Hoµng Kim LÖnh Bµi")
  			Msg2SubWorld("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 trang bi s­ m«n bé 4 ngÉu nhiªn, phÇn th­ëng cÊp 90 Hoµng Kim LÖnh Bµi")
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 91 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ 25.000.000 ®iÓm kinh nghiÖm.")
		--gf_AddItemEx2({0,112,78,1,1}, "L¨ng Ba Vi Bé", szLogTitle, szLogAction)
		gf_AddItemEx2({2,0,1084,3,1}, "Thiªn Qu¸i Th¹ch", szLogTitle, szLogAction)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 92 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ 50.000.000 ®iÓm kinh nghiÖm.")
		--gf_AddItemEx2({2,1,1067,1,1}, "§Şnh Hån Thiªn Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({0,112,78,1,4}, "L¨ng Ba Vi Bé", szLogTitle, szLogAction)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 93 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ 50.000.000 ®iÓm kinh nghiÖm.")
		--gf_AddItemEx2({0,112,78,1,4}, "L¨ng Ba Vi Bé", szLogTitle, szLogAction)
		gf_AddItemEx2({2,1,1067,1,4}, "§Şnh Hån Thiªn Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)
		AddGlobalNews("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 §Şnh hån thiªn th¹ch, phÇn th­ëng cÊp 93 Hoµng Kim LÖnh Bµi")
  		Msg2SubWorld("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 §Şnh hån thiªn th¹ch, phÇn th­ëng cÊp 93 Hoµng Kim LÖnh Bµi")		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 94 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ 50.000.000 ®iÓm kinh nghiÖm.")
		--gf_AddItemEx2({2,1,1067,1,4}, "§Şnh Hån Thiªn Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		AddweaponFYVYDV94()
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)
		AddGlobalNews("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 Vò khİ (BFY,ViÖt Yªn, §¹i ViÖt Yªn) ngÉu nhiªn, phÇn th­ëng cÊp 94 Hoµng Kim LÖnh Bµi")
  		Msg2SubWorld("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 Vò khİ (BFY,ViÖt Yªn, §¹i ViÖt Yªn) ngÉu nhiªn, phÇn th­ëng cÊp 94 Hoµng Kim LÖnh Bµi")		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 95 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ 50.000.000 ®iÓm kinh nghiÖm.")
		gf_AddItemEx2({0,112,78,1,1}, "L¨ng Ba Vi Bé", szLogTitle, szLogAction)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	elseif nLevel == 96 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B¹n ®· bŞ trõ 50.000.000 ®iÓm kinh nghiÖm.")
		--gf_AddItemEx2({0,112,78,1,1}, "L¨ng Ba Vi Bé", szLogTitle, szLogAction)
		gf_AddItemEx2({2,1,1067,1,1}, "§Şnh Hån Thiªn Th¹ch", szLogTitle, szLogAction, 7*24*60*60)
		Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng cÊp "..nLevel.."!",0)	
		AddGlobalNews("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 §Şnh hån thiªn th¹ch, phÇn th­ëng cÊp 96 Hoµng Kim LÖnh Bµi")
  		Msg2SubWorld("Qu¶ lµ ThiÕu Niªn Anh Hïng, "..GetName().." ®· nhËn thµnh c«ng 1 §Şnh hån thiªn th¹ch, phÇn th­ëng cÊp 96 Hoµng Kim LÖnh Bµi")	
		WriteLogEx(szLogTitle,"nhËn phÇn th­ëng cÊp "..nLevel);
	else
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: §¼ng cÊp kh«ng ®óng!");
		WriteLogEx(szLogTitle,"®¼ng cÊp kh«ng ®óng???");
		return
	end
end

function dlgover()
end	
