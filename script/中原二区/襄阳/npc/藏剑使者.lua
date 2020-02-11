-- ================================================================================================ <INCLUDE> ====
Include("\\script\\²Ø½£É½×¯\\task_script\\ÏåÑô\\task_head.lua");

-- ================================================================================================ <CONST> ====
-- ------------------------------------------------------------------------------------------------ <Act I> ----
-- ------------------------------------------------------------------------------------------------ <Act II> ----
-- ------------------------------------------------------------------------------------------------ <Act III> ----
-- ------------------------------------------------------------------------------------------------ <Act IV> ----
-- ------------------------------------------------------------------------------------------------ <Act V> ----
-- ------------------------------------------------------------------------------------------------ <Act VI> ----
-- ------------------------------------------------------------------------------------------------ <Act VII> ----
-- ------------------------------------------------------------------------------------------------ <Act VIII> ----
-- ------------------------------------------------------------------------------------------------ <Act IX> ---

-- ================================================================================================ <Variable> ====
-- ------------------------------------------------------------------------------------------------ <Act I> ----
ACT1_BOSS_Index = {}
-- ------------------------------------------------------------------------------------------------ <Act I Function> ----
function ACT1_Trap()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()
	-- ===========Ìå·þ¹æÔò£º½øÈë²Ø½£½±Àø20G edit by yanjun================
	local nPreservedPlayerIndex = PlayerIndex;	--±£ÁôPlayerIndex
    	local nMemCount = GetTeamSize();	--»ñµÃ¶ÓÎéÈËÊý
    	for i=1,nMemCount do
    		PlayerIndex = GetTeamMember(i);	--»ñµÃ¶ÓÔ±Index
		Earn(200000);	--½±Àø20G
		Msg2Player("PhÇn th­ëng: 20 tiÒn vµng.")
	end
	PlayerIndex = nPreservedPlayerIndex;	--»Ö¸´Ö®Ç°µÄPlayerIndex	
	-- ===================================================================	
	if (TC_TASK_EventCount[nZone][2] ~= 1) and (TC_STAGE_State[nZone] >= 10) then
		TC_STAGE_State[nZone] = 11
		TC_TASK_EventCount[nZone][2] = 1
		MC_NoSpawnNPCs(nStage, nMaxLevel, "Gia ®inh")
		MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia ®inh")
		-- Stage Event Start
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
--		Msg2Player(nETRow.." "..TM_GetMinLevel())
		local nScore = TB_BONUS_TABLE[nETRow][1]/30
		local nCTime = random(180, 360)
		local nRelation = random(-5, 0)
		SetTask(TB_BONUS_SCORE, (GetTask(TB_BONUS_SCORE)+nScore))	-- Ôö¼Ó»ý·Ö
		if random(1,100000) <= 80000 then
			SetTask(TB_BONUS_RELATION, (GetTask(TB_BONUS_RELATION)+nRelation))		-- ½µµÍÓÑºÃ¶È
			Msg2Player("Hµng lo¹t gia ®inh phÉn né……")
		end
		if random(1,100000) <= 50000 then
			CastState("state_confusion",100, nCTime)
			Msg2Player("Th×nh l×nh bÞ mai phôc, ch»ng biÕt xoay së ra sao.")
		end
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 3, 1)
		SetTask(SB_EVENT_STAGE[1], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
--		TaskTip("ÌØÊâÊÂ¼þ¼¤»î£ºÉ½ÃÅ¡¤¼Ò¶¡ÏÝÚå\n    »ý·Ö±ä»¯£º+"..nScore.."\n    ÓÑºÃ±ä»¯£º"..nRelation.."\n    ¾ªÏÅÊ±¼ä£º"..(nCTime/18).."s")
		TaskTip("G©y ra sù kiÖn ®Æc biÖt: S¬n M«n. C¹m bÉy gia ®inh")
		-- Stage Event End
		MU_Msg2Team("Cã ng­êi lÎn vµo s¬n trang! Ng­êi ®©u mau b¾t h¾n!", 2)
		MU_Msg2Team("PhÝa tr­íc xuÊt hiÖn nhiÒu hé viÖn gia ®inh.")
	end
end
function ACT1_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		if TC_STAGE_State[nZone] < 11 then
--			MC_BeSpawnNPCs(nStage, nMaxLevel, "¿´ÃÅ¹·")
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		else
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		end
	end 
end
function ACT1_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_Name == "Gia ®inh" then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
--		MU_Msg2Team(TC_TASK_EventCount[nZone][1].."/"..TC_TASK_Conditions[nZone][1])
	end
	if (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][1]) and (TC_STAGE_State[nZone] <= 11) then
		TC_STAGE_State[nZone] = 12
		ACT1_BOSS_Index[nZone] = MC_CreateBoss(1)
		MU_Msg2Team("KÎ nµo d¸m vµo Tµng KiÕm s¬n trang n¸o lo¹n vËy?", 2)
		MU_Msg2Team("Kinh ®éng ®Õn Tæng qu¶n ngo¹i viÖn!")
		TC_TASK_Conditions[nZone][4] = TC_TASK_Conditions[nZone][4] + TC_KILL_Stage[nZone]
--		Msg2Player("fenlu: "..TC_TASK_Conditions[nZone][4])
	end
	if (TC_KILL_Stage[nZone] == TC_TASK_Conditions[nZone][4]) and (random(1, 100000) <= 75000) and (TC_STAGE_State[nZone] == 12) then
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 4, 1)
		SetTask(SB_EVENT_STAGE[1], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 4, 1)
		AddUnitStates(ACT1_BOSS_Index[nZone], 1, GetUnitBaseStates(ACT1_BOSS_Index[nZone], 1)*2)
		AddUnitStates(ACT1_BOSS_Index[nZone], 2, GetUnitBaseStates(ACT1_BOSS_Index[nZone], 2)*2)
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
		TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
		TB_AddScore(3, random(-5, 0))
		TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: S¬n M«n. Tæng qu¶n ngo¹i viÖn phÉn né")
		MU_Msg2Team("D¸m ®Õn Tµng KiÕm s¬n trang g©y chuyÖn! H·y xem ta d¹y dç c¸c ng­¬i thÕ nµo!!!", 2)
		-- Stage Event End
	end
	if TT_TARGET_Name == "Chã canh" then
		TC_TASK_EventCount[nZone][3] = TC_TASK_EventCount[nZone][3] + 1
--		Msg2Player("¿´ÃÅ¹·£º "..TC_TASK_EventCount[nZone][3].."/"..TC_TASK_Conditions[nZone][3])
		if (TC_TASK_EventCount[nZone][3] == TC_TASK_Conditions[nZone][3]) then
			-- Stage Event Start
			local nRnd = random(1,100000)
--			Msg2Player("Random: "..nRnd)
			if nRnd <= 20000 then
				local nETRow = MU_Div(TM_GetMinLevel()) - 2
				TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
				TB_AddScore(3, random(-5, 0))
				local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 2, 1)
				SetTask(SB_EVENT_STAGE[1], nFlag)
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
				local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
				local LastedCreatedUnit = CreateNpc("Gia ®inh"..tostring(nlevel), "Gia ®inh phÉn né", GetWorldPos())		
				MC_Add2Group(LastedCreatedUnit)
				AddUnitStates(LastedCreatedUnit, 1, GetUnitBaseStates(LastedCreatedUnit, 1)*5)
				AddUnitStates(LastedCreatedUnit, 2, GetUnitBaseStates(LastedCreatedUnit, 2)*5)
				TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: S¬n M«n.Gia ®inh phÉn né")
				MU_Msg2Team("Gia ®inh phÉn né: Bän ng­¬i d¸m ®¶ th­¬ng chã yªu cña ta nu«i! H·y xem lîi h¹i cña ta!", 2)
			end
			-- Stage Event End
		end
	end
	if TT_TARGET_Name == "Tæng qu¶n ngo¹i viÖn" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
--		Msg2Player("hahaha:"..TC_TASK_EventCount[nZone][3])
		if (TC_TASK_EventCount[nZone][3] == 0) and (GetBit(SB_STAGE_RECORD[nZone], 4) == 0) then
			-- Stage Event Start
			MU_Msg2Team("C¸c ng­¬i v­ît qua s¬n trang, ch­a ®¶ th­¬ng bÊt cø Chã gi÷ nhµ nµo! Xem ng­¬i ch¼ng ph¶i kÎ hung tµn, ta kh«ng lµm khã ng­¬i n÷a!", 2)
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 1, 1)
			SetTask(SB_EVENT_STAGE[1], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
			TB_AddScore(3, random(5, 10))
			TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: S¬n M«n. LÔ Ngé")
			-- Stage Event End
		else
			MU_Msg2Team("C¸c ng­¬i ®Ó ta ®îi l©u qu¸!", 2)
		end
		MU_Msg2Team("Tæng qu¶n ngo¹i viÖn ®· bÞ ®¸nh b¹i!")
	end
	if TT_TARGET_Name == "Gia ®inh phÉn né" then
		MU_Msg2Team("Gia ®inh phÉn né: 55555555555!", 2)
	end
end
-- ------------------------------------------------------------------------------------------------ <Act II> ----
ACT2_BOSSTALK = {
"§Õn ®óng lóc l¾m, bæn trang cã viÖc nµy cÇn th­¬ng l­îng. Khi c¸c ng­¬i vµo ®¹i viÖn th× Thiªn C­¬ng Du Long kiÕm bçng nhiªn biÕn mÊt. Ta kh«ng nghi ngê c¸c ng­¬i nh­ng viÖc nµy còng nªn lµm râ.",
"Sao l¹i nãi hå ®å vËy? H·y xem ®©y!/ACT2_StartBoss",
"Lêi tæng qu¶n/ACT2_StartBossWithRules",
"NÕu c¸c ng­¬i kh«ng cã tËt giËt m×nh, hµ tÊt ph¶i xÊu hæ mµ hãa giËn thÕ? Xem Tµng KiÕm s¬n trang ta lµ chèn kh«ng ng­êi µ? B©y ®©u? B¾t nã cho ta!",
"Ch¾c ch¾n cã kÎ ®¸nh c¾p Du Long kiÕm råi vu oan cho ta, Ta ph¶i lµm râ chuyÖn nµy míi ®­îc. \n §­îc! Ta ®îi tin cña ng­¬i!",
"Ch­a cã tin tøc Du Long kiÕm sao? ChuyÖn nµy e r»ng cã chót kh¶ nghi!",
"Th× ra lµ do S¬n trang gi¸o ®¸nh c¾p! ThËt cã lçi víi c¸c vÞ, l·o phu v« cïng xÊu hæ! Tæng qu¶n ngo¹i viÖn nãi: C¸c vÞ qu¶ thËt th©n thñ bÊt phµm! L·o phu muèn lÜnh gi¸o vµi chiªu, xin c¸c vÞ tËn t×nh chØ b¶o! B©y ®©u? Lui!",
"TiÓu tÆc kia! C¸c ng­¬i kh«ng thÓ ®i ®­îc! §¹i tiÓu th­ ®ang chê c¸c ng­¬i ë hËu viÖn!",
"Qu¶ lµ tuæi trÎ tµi cao, l·o phu kh«ng th¾ng næi c¸c ng­¬i! Xin mêi vµo trong.",
"C©y kiÕm BÝch Tµm mµ c¸c ng­¬i t×m ®­îc kh«ng ph¶i lµ b¶o kiÕm ta lµm mÊt nh­ng nã ®­îc ®óc tõ XXX. NÕu gÆp ®­îc tæng qu¶n XXX nhí mang tr¶ l¹i cho h¾n.",
"Qua Liªn Hoµn Sµo lµ ®Õn ®µi ®óc kiÕm, nÕu gÆp ®­îc tæng qu¶n th× göi l¹i cho h¾n, nhí ®õng lµm kinh ®éng tiÓu th­."}		-- ³õ²½¶¨Îª»ñµÃ[±ù¾§]µÄÈÎÎñ
ACT2_GotSword = {}
-- ------------------------------------------------------------------------------------------------ <Act II Function> ----
function ACT2_Talk()
	local nZone = TC_GetTeamZone()
	if TC_STAGE_State[nZone] < 16 then
		if TM_IsCaptain() == 1 then
			Say(ACT2_BOSSTALK[1], 2, ACT2_BOSSTALK[2], ACT2_BOSSTALK[3])
		else
			Talk(1, "", ACT2_BOSSTALK[1])
		end
	else
		if TC_STAGE_State[nZone] == 16 then
			Talk(1, "", ACT2_BOSSTALK[6])
		elseif TC_STAGE_State[nZone] == 17 then
			Talk(1, "", ACT2_BOSSTALK[7])
			MC_Del4Group(TT_GetTarget(), 0)
			MC_ClearGroup(2)
			TC_STAGE_State[nZone] = 19
			MC_CreateBoss(2)
			-- Stage Event Start
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 2, 1)
			SetTask(SB_EVENT_STAGE[2], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/30))
			TB_AddScore(3, random(1, 5))
			TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: S¬n M«n.Thñy L¹c Th¹ch XuÊt?")
			-- Stage Event End
		elseif TC_STAGE_State[nZone] == 18 then
			Talk(1, "", ACT2_BOSSTALK[10])
			MC_Del4Group(TT_GetTarget(), 0)
			MC_ClearGroup(2)
			TC_STAGE_State[nZone] = 19
			MC_CreateBoss(2)
			ACT2_GotSword[nZone] = 1					-- ÓÃÀ´¼ÇÂ¼ÊÇ·ñµÃµ½ÁË ±Ì²Ï½£
			-- Stage Event Start
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 3, 1)
			SetTask(SB_EVENT_STAGE[2], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/30))
			TB_AddScore(3, random(1, 5))
			TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: S¬n M«n. KiÕm TÆc")
			-- Stage Event End
		end
	end
end
function ACT2_StartBoss()
	local nZone = TC_GetTeamZone()
	TC_STAGE_State[nZone] = 11			-- 11~14 ÊÇ²»½»½£
	MC_Del4Group(TT_GetTarget(), 0)
	local nBossIndex = MC_CreateBoss(2)
	AddUnitStates(nBossIndex, 1, 100)
	MU_Msg2Team(ACT2_BOSSTALK[4], 2)
	-- Stage Event Start
	local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 1, 1)
	SetTask(SB_EVENT_STAGE[2], nFlag)
	SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
	local nETRow = MU_Div(TM_GetMinLevel()) - 2
	TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/40))
	TB_AddScore(3, random(-5, 0))
	TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: S¬n M«n. HiÓu lÇm")
	-- Stage Event End
end
function ACT2_StartBossWithRules()
	local nZone = TC_GetTeamZone()
	TC_STAGE_State[nZone] = 16			-- 16~19 ÊÇ½»½£
	MU_Msg2Team(ACT2_BOSSTALK[5], 2)
end
function ACT2_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		if TC_STAGE_State[nZone] < 11 then
			MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia ®inh")
		elseif TC_STAGE_State[nZone] < 19 then
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		end
	end 
end
function ACT2_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "Gi¸o ®Çu") and (TC_STAGE_State[nZone] == 16) then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
--		MU_Msg2Team(TC_TASK_EventCount[nZone][1].."/"..TC_TASK_Conditions[nZone][1])
		if (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][1]) then
			if (random(1,100000) <= 30000) or (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][2]) then
				TC_STAGE_State[nZone] = 17
				MU_Msg2Team(GetName().." §¸nh b¹i S¬n trang gi¸o ®Çu ph¸t hiÖn 1 thanh h¾c kiÕm.", 2)
				MU_Msg2Team("§éi nhËn ®­îc vËt phÈm nhiÖm vô: Du Long.")
			elseif random(1,100000) <= 10000 then
				TC_STAGE_State[nZone] = 18
				MU_Msg2Team(GetName().." §¸nh b¹i S¬n trang gi¸o ®Çu ph¸t hiÖn 1 thanh lôc kiÕm.", 2)
				MU_Msg2Team("§éi nhËn ®­îc vËt phÈm nhiÖm vô: BÝch Tµm")
			end
		end
	end
	if TT_TARGET_Name == "Tæng qu¶n néi viÖn" then
		if (TC_STAGE_State[nZone] == 11) then
			MU_Msg2Team(ACT2_BOSSTALK[8], 2)
		elseif (TC_STAGE_State[nZone] == 19) and (ACT2_GotSword[nZone] ~= 1) then
			MU_Msg2Team(ACT2_BOSSTALK[9], 2)
		elseif (TC_STAGE_State[nZone] == 19) and (ACT2_GotSword[nZone] == 1) then
			MU_Msg2Team(ACT2_BOSSTALK[11], 1)
		end
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("Tæng qu¶n ngo¹i viÖn ®· bÞ ®¸nh b¹i!")
	end
end
-- ------------------------------------------------------------------------------------------------ <Act III> ----
ACT3_ODDER_POS = {
{1587, 3134}, {1609, 3111}, {1631, 3088}, {1660, 3092}, {1684, 3113}, {1681, 3132}, {1664, 3153}, {1644, 3174}}
ACT3_ODDER_Table = {}
ACT3_Keeper = {}
ACT3_Traped = {}
ACT3_CONTRACK = {2, 0, 213}				-- ÂôÉíÆõ
ACT3_SKEY = {2, 0, 337}					-- ÒøÔ¿³×
ACT3_CKEY = {2, 0, 336}					-- Í­Ô¿³×
ACT3_ContrackSent = {}
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT3_Trap()
	local nZone = TC_GetTeamZone()
	-- Stage Event Start
	Msg2Player("B¹n ®· giÉm lªn v­ên hoa…… "..ACT3_Traped[nZone].."/3]")
	ACT3_Traped[nZone] = ACT3_Traped[nZone] + 1
	-- Stage Event End
end
function ACT3_Talk()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_ModID == "¡n mµy" then
		-- Stage Event Start
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
		TB_AddScore(1, (TB_BONUS_TABLE[nETRow][3]/30))
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 3, 1)
		SetTask(SB_EVENT_STAGE[3], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
		if (GetItemCount(ACT3_CONTRACK[1], ACT3_CONTRACK[2], ACT3_CONTRACK[3]) >= 1) and (ACT3_ContrackSent[nZone] == 0) then
			DelItem(ACT3_CONTRACK[1], ACT3_CONTRACK[2], ACT3_CONTRACK[3], 1)
			ACT3_ContrackSent[nZone] = 1
			if random(1,100000) < 10000 then
				AddItem(ACT3_SKEY[1], ACT3_SKEY[2], ACT3_SKEY[3], 1)
			else
				AddItem(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3], 1)
			end
			MU_Msg2Team("§©y lµ <color=green>Ch×a khãa thÇn kú<color> tr­íc ®©y khi tiÓu nh©n bÞ l¹c ë hËu s¬n nhÆt ®­îc, xin tÆng l¹i cho ®¹i nh©n!", 1)
		elseif (ACT3_ContrackSent[nZone] == 1) then
			MU_Msg2Team("§a t¹ ®¹i nh©n! Cuèi cïng tiÓu nh©n ®· ®­îc tù do!", 2)
		else
			MU_Msg2Team("TiÓu nh©n vèn sèng ë T« Ch©u, §¹i tiÓu th­ b¹o ng­îc, c­íp tiÒn cña råi b¾t giam cÇm ®Õn nay (sôt sïi khãc)…C¸c ®¹i hiÖp thÇn c«ng c¸i thÕ, xãt th­¬ng kÎ khèn khæ nµy h·y gióp 2800 l­îng chuéc th©n ®Ó tiÓu nh©n trë vÒ ®oµn tô víi gia ®×nh!", 1)
		end
		-- Stage Event End
	end
end
function ACT3_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 19) then
		MC_BeSpawnNPCs(nStage, nMaxLevel, "Gia ®inh")
	end 
end
function ACT3_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "Gia ®inh") and (TC_TASK_EventCount[nZone][1] < TC_TASK_Conditions[nZone][1]) then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
--		MU_Msg2Team(TC_TASK_EventCount[nZone][1].."/"..TC_TASK_Conditions[nZone][1])
		if mod(TC_TASK_EventCount[nZone][1], 2) == 0 then
			MU_Msg2Team(MU_GetColoredText("L·o béc", "green")..": Ng­êi ®©u! Cã kÎ x©m nhËp HËu viÖn trém ®å!", 2)
			ACT3_CreateOdder()
		end
	end
	if (TT_TARGET_Name == "L·o béc") then
		TC_STAGE_State[nZone] = TC_STAGE_State[nZone] + 1
--		Msg2Player(TC_STAGE_State[nZone])
		if TC_STAGE_State[nZone] == 18 then
			TC_STAGE_State[nZone] = 19
			local nBossIndex = MC_CreateBoss(3)
			if ACT3_Traped[nZone] >= 3 then
				MU_Msg2Team("KÎ nµo d¸m ®Õn ®©y n¸o lo¹n, kinh ®éng bæn tiÓu th­ nghØ ng¬i? ¸i da! Sao ®¹p n¸t hoa phï dung cña ta! ThËt kh«ng thÓ tha thø!", 2)
				-- Stage Event Start
				local nETRow = MU_Div(TM_GetMinLevel()) - 2
				TB_AddScore(1, (TB_BONUS_TABLE[nETRow][3]/30))
				TB_AddScore(3, random(-5,0))
				local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 2, 1)
				SetTask(SB_EVENT_STAGE[3], nFlag)
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
				AddUnitStates(nBossIndex, 1, GetUnitBaseStates(nBossIndex, 1)*(ACT3_Traped[nZone]^0.5))
				AddUnitStates(nBossIndex, 2, GetUnitBaseStates(nBossIndex, 2)*(ACT3_Traped[nZone]^0.5))
				TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: HËu Hoa Viªn. §¹i tiÓu th­ phÉn né")
				-- Stage Event End
			else
				MU_Msg2Team("KÎ nµo d¸m ®Õn ®©y n¸o lo¹n, kinh ®éng bæn tiÓu th­ nghØ ng¬i?", 2)
			end
			MU_Msg2Team("§· lµm kinh ®éng §¹i tiÓu th­!")
		end
	end
	if (TC_TASK_EventCount[nZone][2] >= 6) and (TC_STAGE_State[nZone] <= 12) and (ACT3_Keeper[nZone] == 0) then		-- ÅÐ¶ÏÊÇ·ñÓÐ 6 ¸öÅ®ÆÍÍ¬Ê±´æÔÚ
		-- Stage Event Start
		ACT3_Keeper[nZone] = 1
		-- Stage Event End
	end
	if (TC_STAGE_State[nZone] == 19) and (ACT3_Keeper[nZone] == 1) then			-- ³öÏÖÖ´ÊÂ
		ACT3_Keeper[nZone] = 2
		if random(1, 100000) <= 80000 then
			-- Stage Event Start
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 1, 1)
			SetTask(SB_EVENT_STAGE[3], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
			local nMapID = GetWorldPos()
			local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
			local LastedCreatedUnit = CreateNpc("L·o béc"..tostring(nlevel), "HËu Hoa Viªn nghi tr­îng", nMapID, 1630, 3147)		
			MC_Add2Group(LastedCreatedUnit)
			AddUnitStates(LastedCreatedUnit, 1, GetUnitBaseStates(LastedCreatedUnit, 1)*5)
			AddUnitStates(LastedCreatedUnit, 2, GetUnitBaseStates(LastedCreatedUnit, 2)*5)
			TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: HËu Hoa Viªn.HËu Hoa Viªn nghi tr­îng")
			MU_Msg2Team("L¹i cã kÎ to gan x©m nhËp HËu Hoa viªn! §¹i tiÓu th­ ph¸i ta ®Õn b¶o vÖ!", 2)
			-- Stage Event End
		end
	end
	if TT_TARGET_Name == "§¹i tiÓu th­" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		if TM_SexCount() == 0 then
			-- Stage Event Start
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
			TB_AddScore(3, random(4, 6))
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 4, 1)
			SetTask(SB_EVENT_STAGE[3], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 4, 1)
			TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: HËu Hoa Viªn. T©m t­ thiÕu n÷")
			MU_Msg2Team("C¸c c« n­¬ng qu¶ nhiªn vâ nghÖ cao c­êng! Bæn tiÓu th­ vèn kh©m phôc c¸c n÷ nh©n kh«ng tá vÎ nhu m× Îo l¶, chøng tá n÷ nhi ta kh«ng thua g× bän nam nh©n ®¸ng tr¸ch! Mêi ch­ vÞ ®i qua! H·y gióp ta gi¸o huÊn mÊy g· kia!", 2)
			-- Stage Event End
		else
			MU_Msg2Team("C¸c ng­¬i ®· ®¹p n¸t hoa phï dung cña ta, ch¹y ®©u cho tho¸t hö?", 2)
		end
		MU_Msg2Team("§· ®¸nh b¹i §¹i tiÓu th­!")
		if random(1,100000) <= 90000 then
			local nMapID = GetWorldPos()
			local nRndPoint = random(1, 8)
			local LastedCreatedUnit = CreateNpc("¡n mµy", "Gia ®inh ®¸ng th­¬ng", nMapID, ACT3_ODDER_POS[nRndPoint][1], ACT3_ODDER_POS[nRndPoint][2])
			SetNpcDeathScript(LastedCreatedUnit, SF_FILE)
			MC_Add2Group(LastedCreatedUnit)
			MU_Msg2Team("Gia ®inh ®¸ng th­¬ng:......", 2)
		end
	end
end
-- ------------------------------------------------------------------------------------------------ <Act IV> ----
ACT4_SWITCH_POS = {					-- »ú¹Ø×ø±ê
{1796, 2912}, {1810, 2955}, {1856, 2977}, {1761, 2949}, {1770, 2999}, {1818, 3009}, {1714, 2998}, {1741, 3032}, {1772, 3064}}
ACT4_SWITCH_DEFENDER = {			-- »ú¹ØÊØÎÀ
{{1795, 2911}, {1801, 2910}, {1798, 2900}, {1790, 2907}}, {{1801, 2960}, {1806, 2952}, {1812, 2942}, {1804, 2949}},
{{1856, 2981}, {1862, 2973}, {1857, 2963}, {1850, 2972}}, {{1761, 2853}, {1767, 2947}, {1763, 2938}, {1756, 2944}},
{{1769, 3004}, {1776, 2995}, {1772, 2986}, {1764, 2993}}, {{1817, 3013}, {1822, 3005}, {1819, 2996}, {1812, 3005}},
{{1713, 3003}, {1708, 2995}, {1719, 2996}, {1716, 2985}}, {{1741, 3037}, {1747, 3030}, {1743, 3020}, {1736, 3027}},
{{1772, 3070}, {1777, 3062}, {1773, 3051}, {1766, 3059}}}
ACT4_SWITCH_Name = {"<Tö Thanh L­ h­¬ng >","<Thanh Lam L­ h­¬ng >","<Tö Lam L­ h­¬ng >"}
ACT4_SWITCH_Table = {}
ACT4_SWITCH_Count = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
ACT4_SWITCH_DEBUFF = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
ACT4_SWITCH_TimeLim = {{999,999,999},{999,999,999},{999,999,999},{999,999,999},{999,999,999}}
ACT4_SWITCH_Index = {{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}}}
ACT4_BOSS_Spwaned = {0,0,0,0,0}
-- ------------------------------------------------------------------------------------------------ <Act IV Function> ----
function ACT4_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		MC_BeSpawnNPCs(nStage, nMaxLevel)
		if mod(TC_TIMER_Count[nZone],2) == 0 then		-- Ã¿28ÃëÌí¼ÓÒ»´Î Debuff
--			MU_Msg2Team("Ê±¼ä¾­¹ýÖÐ¡­¡­ ["..TC_TIMER_Count[nZone].."]")
			ACT4_Debuff(1)
		end
--		Msg2Player(ACT4_SWITCH_TimeLim[nZone][1].."/"..ACT4_SWITCH_TimeLim[nZone][2].."/"..ACT4_SWITCH_TimeLim[nZone][3])
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][1] then
			ACT4_RebrithSwitch(nZone, 1)
			ACT4_SWITCH_TimeLim[nZone][1] = 999
			MU_Msg2Team("Kú Th¹ch c¶m øng, bÞ ph¸ ho¹i"..ACT4_SWITCH_Name[1].."®· tù ®éng trïng sinh!")
		end
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][2] then
			ACT4_RebrithSwitch(nZone, 2)
			ACT4_SWITCH_TimeLim[nZone][2] = 999
			MU_Msg2Team("Kú Th¹ch c¶m øng, bÞ ph¸ ho¹i"..ACT4_SWITCH_Name[2].."®· tù ®éng trïng sinh!")
		end
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][3] then
			ACT4_RebrithSwitch(nZone, 3)
			ACT4_SWITCH_TimeLim[nZone][3] = 999
			MU_Msg2Team("Kú Th¹ch c¶m øng, bÞ ph¸ ho¹i"..ACT4_SWITCH_Name[3].."®· tù ®éng trïng sinh!")
		end
	end 
end
function ACT4_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_ModID == "Ng­êi V« h×nh2" then
		local nType = ACT4_GetSwitchType(TT_TARGET_Name)
		ACT4_SWITCH_TimeLim[nZone][nType] = TC_TIMER_Count[nZone] + 6				-- Ê±¼ä°¡Ê±¼ä
		ACT4_SWITCH_Count[nZone][nType] = ACT4_SWITCH_Count[nZone][nType] - 1
		MU_Msg2Team("Trong 90 gi©y h·y ph¸ háng 1"..ACT4_SWITCH_Name[nType]..", b»ng kh«ng Kú Th¹ch c¶m øng bÞ ph¸ háng"..ACT4_SWITCH_Name[nType].." sÏ tù ®éng trïng sinh!")
		MC_Del4Group(TT_TARGET_Index, 2)
		for i=1,3 do
			for j=1,3 do
				if ACT4_SWITCH_Index[nZone][i][j] == TT_TARGET_Index then
					ACT4_SWITCH_Index[nZone][i][j] = 0
				end
			end
		end
		if (ACT4_SWITCH_Count[nZone][nType] == 0) then
			ACT4_SWITCH_DEBUFF[nZone][nType] = 1
			ACT4_SWITCH_TimeLim[nZone][nType] = 999
			if (ACT4_BOSS_Spwaned[nZone] == 0) then
				MU_Msg2Team("TiÕp tôc th¼ng tiÕn lµ cÊm ®Þa cña bæn trang, c¸c anh hïng h·y quay l¹i ®i!",2)
				MC_CreateBoss(4)
				ACT4_BOSS_Spwaned[nZone] = 1
			else
				MU_Msg2Team("®¸nh Çm mét tiÕng,"..ACT4_SWITCH_Name[nType].."®· bÞ ph¸ háng hoµn toµn, kh«ng thÓ trïng sinh n÷a, ®· ph¸t huy hÕt uy lùc!")
			end
		end
	end
	if TT_TARGET_Name == "§¹i trang chñ" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("Bän ta chê xem! C¸c ng­¬i ch¹y kh«ng tho¸t ®©u!", 2)
		MU_Msg2Team("§· ®¸nh b¹i §¹i trang chñ!")
	end
end

-- ------------------------------------------------------------------------------------------------ <Act V> ----
ACT5_SWORD_PICKPOS = {					-- È¡½£×ø±ê
{1710, 3317}, {1673, 3343}, {1678, 3407}, {1718, 3420}, {1728, 3363}}
ACT5_SWORD_DROPPOS = {					-- ²å½£×ø±ê
{1632, 3193}, {1610, 3164}, {1583, 3170}, {1574, 3203}, {1600, 3225}}
ACT5_SWORD_PICKDEFENDER = {				-- È¡½£Ê±ÊØÎÀ×ø±ê
{{1710, 3326}, {1716, 3325}, {1714, 3330}, {1711, 3332}, {1707, 3330}, {1704, 3324}},
{{1682, 3341}, {1681, 3330}, {1685, 3334}, {1686, 3340}, {1685, 3347}, {1682, 3350}},
{{1686, 3400}, {1684, 3390}, {1689, 3391}, {1691, 3398}, {1690, 3405}, {1687, 3408}},
{{1710, 3404}, {1716, 3399}, {1711, 3395}, {1706, 3396}, {1705, 3404}, {1705, 3411}},
{{1720, 3357}, {1721, 3345}, {1716, 3349}, {1715, 3358}, {1719, 3364}, {1723, 3365}}}
ACT5_SWORD_DROPDEFENDER = {				-- ²å½£Ê±ÊØÎÀ×ø±ê
{{1630, 3188}, {1634, 3185}, {1630, 3179}, {1625, 3182}, {1625, 3190}, {1628, 3196}},
{{1609, 3165}, {1606, 3159}, {1605, 3166}, {1608, 3171}, {1612, 3171}, {1615, 3168}},
{{1585, 3172}, {1587, 3164}, {1588, 3171}, {1586, 3175}, {1582, 3175}, {1579, 3172}},
{{1575, 3199}, {1569, 3195}, {1573, 3192}, {1577, 3193}, {1579, 3201}, {1578, 3207}},
{{1599, 3216}, {1607, 3217}, {1603, 3211}, {1597, 3211}, {1596, 3219}, {1597, 3227}}}
ACT5_SWORD_SHAPE = {
{{1, 1}, {2, 2}, {3, 3}, {4, 4}, {5, 5}},	-- ½ð¹é½ð£¬Ä¾¹éÄ¾£¬Ë®¹éË®£¬»ð¹é»ð£¬ÍÁ¹éÍÁ
{{1, 3}, {3, 2}, {2, 4}, {4, 5}, {5, 1}},	-- ½ðÉúË®£¬Ë®ÉúÄ¾£¬Ä¾Éú»ð£¬»ðÉúÍÁ£¬ÍÁÉú½ð
{{1, 2}, {2, 5}, {5, 3}, {3, 4}, {4, 1}},	-- ½ð¿ËÄ¾£¬Ä¾¿ËÍÁ£¬ÍÁ¿ËË®£¬Ë®¿Ë»ð£¬»ð¿Ë½ð
{{1, 4}, {4, 3}, {3, 5}, {5, 2}, {2, 1}},	-- ½ð´Ó»ð£¬»ð´ÓË®£¬Ë®´ÓÍÁ£¬ÍÁ´ÓÄ¾£¬Ä¾´Ó½ð
{{1, 5}, {5, 4}, {4, 2}, {2, 3}, {3, 1}}}	-- ½ðÆÆÍÁ£¬ÍÁÆÆ»ð£¬»ðÆÆÄ¾£¬Ä¾ÆÆË®£¬Ë®ÆÆ½ð
ACT5_SWORD_SHAPEWORD = {
"Kim quy Kim, Méc quy Méc, Thñy quy Thñy, Háa quy Háa, Thæ quy Thæ, ®Òu lµ <color=metal>T­¬ng ThÕ<color>.",
"Kim sinh Thñy, Thñy sinh Méc, Méc sinh Háa, Háa sinh Thæ, Thæ sinh Kim, ®Òu lµ <color=metal>T­¬ng Sinh<color>.",
"Kim kh¾c Méc, Méc kh¾c Thæ, Thæ kh¾c Thñy, Thñy kh¾c Háa, Háa kh¾c Kim, ®Òu lµ <color=metal>T­¬ng Tö<color>.",
"Kim tïng Háa, Háa tïng Thñy, Thñy tïng Thæ, Thæ tïng Méc, Méc tïng Kim, ®Òu lµ <color=metal>T­¬ng Tr×<color>.",
"Kim ph¸ Thæ, Thæ ph¸ Háa, Háa ph¸ Méc, Méc ph¸ Thñy, Thñy ph¸ Kim, ®Òu lµ <color=metal>T­¬ng Ph¸<color>."}
ACT5_PICKORDER_Table = {}
ACT5_DROP_ROW = {0,0,0,0,0}		-- ¼ÇÂ¼²å½£Ê±È·¶¨µÄÏà
-- ------------------------------------------------------------------------------------------------ <Act V Function> ----
function ACT5_Talk()
	local nZone = TC_GetTeamZone()
	local nStatesLimit = 100
	if TT_TARGET_ModID ~= "" then
--		Msg2Player(type(TT_TARGET_ModID))
--		return
	end
	local nSwordType = ACT5_GetSwordFlag(TT_GetTarget())
	if TC_STAGE_State[nZone] < 15 then
		if (TT_TARGET_Name == "Kim kiÕm") and (GetStrength() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "Méc kiÕm") and (GetDexterity() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "Thñy kiÕm") and (GetEnergy() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "Háa KiÕm") and (GetObserve() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "Thæ kiÕm") and (GetVitality() >= nStatesLimit) then
		else
			Msg2Player("B¹n kh«ng ®ñ n¨ng lùc rót thanh kiÕm nµy!")
			return
		end
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
		if TC_TASK_EventCount[nZone][1] == 1 then
			ACT5_PICKORDER_Table[nZone] = {}
		end
		ACT5_PICKORDER_Table[nZone][TC_TASK_EventCount[nZone][1]] = TT_TARGET_Name
		MU_Msg2Team(TT_TARGET_Name.."®· bÞ rót ra!", 2)
		MC_Del4Group(TT_GetTarget(), 0)
--		Msg2Player(nSwordType.." "..TT_TARGET_Name)
		ACT5_CreateDefender(nSwordType, TT_TARGET_Name)
	else
		Msg2Player(GetName().."nhÊp vµo KiÕm ®µi.")
		local nWithOrder = ACT5_Word2Num(ACT5_PICKORDER_Table[nZone][TC_TASK_EventCount[nZone][2]])
		local IndexForLoop = 1
		local IndexForLoopEnd = 5
		if ACT5_DROP_ROW[nZone] ~= 0 then
			IndexForLoop = ACT5_DROP_ROW[nZone]
			IndexForLoopEnd = ACT5_DROP_ROW[nZone]
		end
		for i=IndexForLoop, IndexForLoopEnd do
			for j=1, 5 do
				if (ACT5_SWORD_SHAPE[i][j][1] == nWithOrder) and (ACT5_SWORD_SHAPE[i][j][2] == nSwordType) then
					if (ACT5_DROP_ROW[nZone] == 0) or (ACT5_DROP_ROW[nZone] == i) then
						ACT5_DROP_ROW[nZone] = i
						TC_TASK_EventCount[nZone][2] = TC_TASK_EventCount[nZone][2] + 1
						MC_Del4Group(TT_GetTarget(), 0)
						MU_Msg2Team(GetName().."®©m "..ACT5_Word2Num(nWithOrder).." vµo "..ACT5_Word2Num(nSwordType)..". ["..(TC_TASK_EventCount[nZone][2]-1).."/"..(TC_TASK_Conditions[nZone][2]-1).."]")
						if TC_TASK_EventCount[nZone][2] >= TC_TASK_Conditions[nZone][2] then
							MC_CreateBoss(5)
							MU_Msg2Team("Tr­ëng l·o Tµng KiÕm C¸c:"..ACT5_SWORD_SHAPEWORD[ACT5_DROP_ROW[nZone]].."§· l©u ko cã ai d¸m qua ®©y. TiÓu tö! Ng­¬i l¹i ®Õn µ? §Ó ta xem b¶n lÜnh cña ng­¬i thÕ nµo.", 2)
							MU_Msg2Team("Tr­ëng l·o Tµng KiÕm C¸c hiÖn th©n!")
							-- Stage Event Start
							local nETRow = MU_Div(TM_GetMinLevel()) - 2
							TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/30))
							TB_AddScore(3, random(3, 6))
							local nFlag = SetBit(GetTask(SB_EVENT_STAGE[5]), ACT5_DROP_ROW[nZone], 1)
							SetTask(SB_EVENT_STAGE[5], nFlag)
							SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], ACT5_DROP_ROW[nZone], 1)
							TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: Tµng KiÕm C¸c. Ngò hµnh chi t­¬ng")
							-- Stage Event End
						end
						return
					end
				end
			end
		end
		MU_Msg2Team("C¾m kiÕm xuèng ph¸t hiÖn mét luång søc m¹nh déi ra, khã lßng ®Þch næi!")
		ACT5_CreateDefender(nSwordType, 1)		
	end
end
function ACT5_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
end
function ACT5_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "B¶o vÖ ngò hµnh") and (TC_STAGE_State[nZone] < 15) then
		TC_STAGE_State[nZone] = TC_STAGE_State[nZone] + 1
--		MU_Msg2Team((TC_STAGE_State[nZone]-10).."/5")
		if TC_STAGE_State[nZone] == 15 then
			ACT5_CreateDesk()
			MU_Msg2Team("Tµng KiÕm C¸c §¹i ViÖn väng ®Õn tiÕng ch¹y nÆng nÒ cña guång quay.", 2)
		end
	end
	if (TT_TARGET_Name == "Tr­ëng l·o Tµng KiÕm C¸c") then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("Giang s¬n l¾m ng­êi tµi giái! LÏ nµo ta l¹i bã gèi n¬i nµy! ThËt ta ®· giµ råi sao?", 2)
		MU_Msg2Team("§· ®¸nh b¹i Tr­ëng l·o Tµng KiÕm C¸c!")	
	end
end

-- ------------------------------------------------------------------------------------------------ <Act VI> ----
-- ------------------------------------------------------------------------------------------------ <Act VII> ----
-- ------------------------------------------------------------------------------------------------ <Act VIII> ----
ACT8_PATH_Pointer = {}
ACT8_PATH_PortIn = {
{8,1387,3093},{8,1432,3161},{8,1441,3046},
{8,1536,3157},{8,1593,3081},{8,1534,3052},
{8,1597,2839},{8,1551,2752},{8,1546,2863},
{8,1429,2752},{8,1381,2834},{8,1437,2866},
{8,1489,3108},{8,1572,2946},{8,1484,2786},{8,1405,2956}}
ACT8_PATH_PortOut = {
{8,1383,3098},{8,1427,3163},{8,1437,3053},
{8,1542,3161},{8,1598,3086},{8,1539,3058},
{8,1594,2845},{8,1547,2758},{8,1541,2866},
{8,1434,2753},{8,1382,2842},{8,1438,2871},
{8,1489,3116},{8,1566,2949},{8,1483,2794},{8,1409,2961}}
ACT8_CHEST_S_Pos = {
{1378,3098}, {1434,3046}, {1423,3165}, {1495,3117}, {1546,3161}, {1541,3050}, {1589,3090}, {1564,2941},
{1590,2837}, {1539,2859}, {1545,2750}, {1491,2790}, {1438,2750}, {1444,2865}, {1389,2830}, {1409,2947}}
ACT8_CHEST_L_Pos = {
{1378,2989}, {1489,3168}, {1510,3154}, {1594,2984}, {1589,2936}, {1497,2755}, {1473,2756}, {1383,2947}, {1497,3030},
{1590,2837}, {1513,3103}, {1522,3021}, {1505,2963}, {1520,2921}, {1510,2889}, {1472,2887}, {1459,2927}, {1444,3000}}
ACT8_CHEST_StoreIndex = {}
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT8_CalculatePath(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local PATH_Pointer = {}
	local TP_COMMON = {{1, 2, 3},{1, 3, 2},{2, 1, 3},{2, 3, 1},{3, 1, 2},{3, 2, 1}}
	local TP_START = {{3, 2, 1},{2, 3, 1},{3, 1, 2},{1, 3, 2}}
	local TP_END = {{1, 3, 2},{2, 3, 1},{3, 2, 1},{3, 1, 2}}
	local GroupPath = {{1, 2, 3},{1, 2, 3},{1, 2, 3},{1, 2, 3}}
	local GroupPathLink = {1, 2, 3, 4}
	local GroupStart = random(1, 4)
	GroupPathLink[GroupStart] = 1
	local GroupEnd = GroupPathLink[random(2, 4)]
	GroupPathLink = {1, 2, 3, 4}
	for i=1, 4 do
		local nTempRND = random(i, 4)
		local nTempEXC = GroupPathLink[nTempRND]
		GroupPathLink[nTempRND] = GroupPathLink[i]
		GroupPathLink[i] = nTempEXC
	end
	for i=1, 4 do
		if i == GroupStart then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_START[nTempRND][j]
			end
		elseif i == GroupEnd then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_END[nTempRND][j]
			end
		else
			local nTempRND = random(i, 6)
			for j=1, 3 do
				GroupPath[i][j] = TP_COMMON[nTempRND][j]
			end
		end	
	end
	local nCurGroup = 0
	local nPreGroup = 0
	local nNextGroup = 0
	local nTempINT = 0
	for i=1, 4 do
		for j=1, 4 do
			if i == GroupPathLink[j] then
				nCurGroup = j
			end
		end
		nPreGroup = nCurGroup - 1
		nNextGroup = nCurGroup + 1
		if nPreGroup == 0 then
			nPreGroup = 4
		end
		if nNextGroup == 5 then
			nNextGroup = 1
		end
		local nCurGroupIndex = (GroupPathLink[nCurGroup]-1)*3
		local nPreGroupIndex = (GroupPathLink[nPreGroup]-1)*3
		local nNextGroupIndex = (GroupPathLink[nNextGroup]-1)*3
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]] = nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]
		PATH_Pointer[nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]] = nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]
		PATH_Pointer[nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]
		if i == GroupStart then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 0
		elseif i == GroupEnd then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 17
		else
			local nBonusPos = 13 + nTempINT * 2
			nTempINT = nTempINT + 1
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = nBonusPos
			PATH_Pointer[nBonusPos] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
			PATH_Pointer[nBonusPos+1] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
		end
	end
	ACT8_PATH_Pointer[nZone] = {}
	for i=1, 16 do
		ACT8_PATH_Pointer[nZone][i] = PATH_Pointer[i]
	end
end
--------------------------------------------------------------------------------

function ACT8_Trap()
	local nZone = TC_GetTeamZone()
	ACT8_CalculatePath();
	TC_STAGE_State[nZone] = 20;
	if (TC_STAGE_State[nZone] >= 10) then
		local nTrapIndex = ACT8_GetTPTIndex()
		local nTrapTarget = ACT8_PATH_Pointer[nZone][nTrapIndex]
--		local nMapID = 898 + nZone * 10
--		if (nTrapTarget >= 1) and (nTrapTarget <= 16) then
--			nMapID = ACT8_PATH_PortOut[nTrapTarget][1] - 10 + nZone * 10
--		end
		local nMapID = GetWorldPos();
		if nTrapTarget == 0 then
		elseif nTrapTarget == 17 then
		elseif (nTrapTarget == 13) or (nTrapTarget == 15) then
			if random(1, 10000) <= 5000 then
				NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget][2], ACT8_PATH_PortOut[nTrapTarget][3])
			else
				NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget+1][2], ACT8_PATH_PortOut[nTrapTarget+1][3])
			end
		else
			NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget][2], ACT8_PATH_PortOut[nTrapTarget][3])
		end
	end
end
function ACT8_Timer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 30) then
		MC_BeSpawnNPCs(nStage, nMaxLevel)
	end
	if mod(TC_TIMER_Count[nZone], 20) == 0 then
		ACT8_DelSmallChest()
		ACT8_CreateSmallChest()
	end
end
function ACT8_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_Name == "Hoµng Kim b¶o r­¬ng" then
		Earn(100000)
	end
	if TT_TARGET_Name == "R­¬ng b¹c" then
		ModifyExp(100000)
	end
end
-- ------------------------------------------------------------------------------------------------ <Act IX> ----
SWORD_LOC = {{1505, 3154}, {1473, 3335}, {1612, 3374}, {1677, 3218}, {1589, 3116}}
SWORD_NAME = {"Kim KiÕm phong kh¾c", "Méc KiÕm phong kh¾c", "Thñy KiÕm phong kh¾c", "Háa KiÕm phong kh¾c", "Thæ KiÕm phong kh¾c"}
SWORD_MINNAME = {"Kim kiÕm", "Méc kiÕm", "Thñy kiÕm", "Háa KiÕm", "Thæ kiÕm"}
SWORD_SEALTIME = {}
SWORD_SEALINDEX = {}
SWORD_BOSSSPWANED = {0,0,0,0,0}
SWORD_SleepOne = {}
-- ------------------------------------------------------------------------------------------------ <Act IX Function> ----
function ACT9_Talk()
	if TT_TARGET_ModID == "Bµn Long Trô" then
		Talk(1,"","Cöu TuyÖt hiÖn thÕ, kiÕm khÝ tung hoµnh, trªn trêi d­íi ®Êt, duy ng· ®éc t«n!")
	end
end
function ACT9_Timer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if 	TC_STAGE_State[nZone] < 10 then
		return
	end
	for i=1, 5 do
		if (SWORD_SEALINDEX[nZone][i] > 0) then
			if TC_TIMER_Count[nZone] < SWORD_SEALTIME[nZone][i] then		-- Ã»µ½Ê±¼ä
				Msg2Player(SWORD_MINNAME[i].."Phong kh¾c ®ang ®­îc gi¶i khãa. ["..TC_TIMER_Count[nZone].."/"..SWORD_SEALTIME[nZone][i].."]["..SWORD_SEALINDEX[nZone][i].."]")
				MC_BeSpawnNPCs(nStage, nMaxLevel, SWORD_MINNAME[i])
			else															-- µ½Ê±¼äÁË
				MC_Del4Group(SWORD_SEALINDEX[nZone][i], 0)
				Msg2Player(SWORD_MINNAME[i].."gi¶i khãa hoµn thµnh. ["..SWORD_SEALINDEX[nZone][i].."]")
				SWORD_SEALTIME[nZone][i] = 0
				SWORD_SEALINDEX[nZone][i] = -1	
			end
		end
	end
	local nSealCount = 0
	for i=1,5 do
		if SWORD_SEALINDEX[nZone][1] == -1 then
			nSealCount = nSealCount + 1
		end
	end
	if (SWORD_SEALINDEX[nZone][1] < 0) and (SWORD_SEALINDEX[nZone][2] < 0) and (SWORD_SEALINDEX[nZone][3] < 0) and (SWORD_SEALINDEX[nZone][4] < 0) and (SWORD_SEALINDEX[nZone][5] < 0) and (SWORD_BOSSSPWANED[nZone] == 0) then
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
		AddUnitStates(nBossIndex, 1, GetUnitBaseStates(nBossIndex, 1)*(nSealCount+1))
		AddUnitStates(nBossIndex, 2, GetUnitBaseStates(nBossIndex, 2)*(nSealCount+1))
		AddUnitStates(nBossIndex, 3, GetUnitBaseStates(nBossIndex, 3)*(nSealCount+1))
		AddUnitStates(nBossIndex, 4, GetUnitBaseStates(nBossIndex, 4)*(nSealCount+1))
		AddUnitStates(nBossIndex, 5, GetUnitBaseStates(nBossIndex, 5)*(nSealCount+1))
	end
end
function ACT9_Killer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMapID = GetWorldPos()
	local nLevel = MU_Div(TM_GetMaxLevel())*10
	local nMaxLevel = TM_GetMaxLevel()
	local nSwordFlag = 0
	for i=1,5 do
		if TT_TARGET_Name == SWORD_NAME[i] then
			nSwordFlag = i
			break;
		end
	end
	for i=1,5 do
		if TT_TARGET_Name == SWORD_NAME[i].."(§ang gi¶i khãa)" then
			MC_Del4Group(TT_TARGET_Index, 2)
			Msg2Player("Ng¨n chÆn"..SWORD_MINNAME[i].."Gi¶i khãa thµnh c«ng.["..SWORD_SEALINDEX[nZone][i].."]")
			SWORD_SEALTIME[nZone][i] = 0
			SWORD_SEALINDEX[nZone][i] = -2	
			break;
		end
	end
	local nSealCount = 0
	for i=1,5 do
		if SWORD_SEALINDEX[nZone][1] == -1 then
			nSealCount = nSealCount + 1
		end
	end
	if (SWORD_SEALINDEX[nZone][1] < 0) and (SWORD_SEALINDEX[nZone][2] < 0) and (SWORD_SEALINDEX[nZone][3] < 0) and (SWORD_SEALINDEX[nZone][4] < 0) and (SWORD_SEALINDEX[nZone][5] < 0) and (SWORD_BOSSSPWANED[nZone] == 0) then
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
		AddUnitStates(nBossIndex, 1, GetUnitBaseStates(nBossIndex, 1)*(nSealCount+1))
		AddUnitStates(nBossIndex, 2, GetUnitBaseStates(nBossIndex, 2)*(nSealCount+1))
		AddUnitStates(nBossIndex, 3, GetUnitBaseStates(nBossIndex, 3)*(nSealCount+1))
		AddUnitStates(nBossIndex, 4, GetUnitBaseStates(nBossIndex, 4)*(nSealCount+1))
		AddUnitStates(nBossIndex, 5, GetUnitBaseStates(nBossIndex, 5)*(nSealCount+1))
	end
	if nSwordFlag ~= 0 then
		local nBossIndex = CreateNpc("KiÕm ®µi"..nLevel, SWORD_NAME[nSwordFlag].."(§ang gi¶i khãa)", nMapID, SWORD_LOC[nSwordFlag][1], SWORD_LOC[nSwordFlag][2])
		MC_Add2Group(nBossIndex)
		MC_BeSpawnNPCs(nStage, nMaxLevel, SWORD_MINNAME[nSwordFlag], nil, 1)			-- Ë¢ÊØÎÀ
		SWORD_SEALTIME[nZone][nSwordFlag] = TC_TIMER_Count[nZone] + 40		-- ¼ÇÂ¼¿ªÊ¼½â³ý·âÓ¡µÄ½£Ì¨µÄ½â³ýÊ±¼ä
		if SWORD_SEALTIME[nZone][nSwordFlag] >= 127 then
			SWORD_SEALTIME[nZone][nSwordFlag] = 127
		end
		SWORD_SEALINDEX[nZone][nSwordFlag] = nBossIndex						-- ¼ÇÂ¼¿ªÊ¼½â³ý·âÓ¡µÄ½£Ì¨µÄINDEX
	end
-- ===============Ìå·þ¹æÔò£ºÍ¨¹Ø½±Àø edit by yanjun============================
       local nPreservedPlayerIndex = PlayerIndex;	--±£ÁôPlayerIndex
	local nMemCount = GetTeamSize();	--»ñµÃ¶ÓÎéÈËÊý
	for i=1,nMemCount do
		PlayerIndex = GetTeamMember(i);	
		Earn(5000000)	--½±Àø500G
		Msg2Player("PhÇn th­ëng v­ît ¶i: nhËn ®­îc 50 tiÒn vµng.")
		randomseed(os.time)
		local nHorse_type = random(3,7)	
		AddItem(0,105,nHorse_type,1,1)	--½±ÀøÒ»Æ¥70¼¶µÄÂí(Ëæ»úÀàÐÍ)
		Msg2Player("PhÇn th­ëng v­ît ¶i: nhËn ®­îc 1 con tuÊn m·.")
		nRoute = GetPlayerRoute()	
		local nType = nRoute*100+floor(GetLevel()/10)*10+GetBody()
		AddItem(0,103,nType,1,1)	--½±ÀøÌ××°£ºÃ±×Ó
		AddItem(0,100,nType,1,1)	--½±ÀøÌ××°£ºÄÚÒÂ
		AddItem(0,101,nType,1,1)	--½±ÀøÌ××°£ºÄÚ¿ã
		AddItem(0,102,nType,1,1)	--½±ÀøÌ××°£ºÊÎÎï
		--½±ÀøÌ××°:ÎäÆ÷
		if nRoute == 2 then	
			AddItem(0,3,nType,1,1) --ÉÙÁÖË×¼Ò½±ÀøÁ½¼þÎäÆ÷
			AddItem(0,5,nType,1,1)
		elseif nRoute == 3 then
			AddItem(0,8,nType,1,1)
		elseif nRoute == 4 then
			AddItem(0,0,nType,1,1)
		elseif nRoute == 6 then
			AddItem(0,1,nType,1,1)
		elseif nRoute == 8 then
			AddItem(0,2,nType,1,1)
		elseif nRoute == 9 then
			AddItem(0,10,nType,1,1)
		elseif nRoute == 11 then
			AddItem(0,0,nType,1,1)
		elseif nRoute == 12 then
			AddItem(0,5,nType,1,1)
		elseif nRoute == 14 then
			AddItem(0,2,nType,1,1)
		elseif nRoute == 15 then
			AddItem(0,9,nType,1,1)
		end
		Msg2Player("PhÇn th­ëng v­ît ¶i: nhËn ®­îc 1 trang bÞ.")
	end
-- =============================================================================
end

-- ================================================================================================ <MAIN> ====
-- ------------------------------------------------------------------------------------------------ <Function> ----
function main()

	local nMapId = GetWorldPos();
	if mod(nMapId, 10) == 8 then
		ACT8_Trap();
	end;
	
--	local nZone = TC_GetTeamZone()
--	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
--	TT_SetTarget(TT_TARGET_Index)
--	if (nZone < 1) or (nZone == nil) and (TT_TARGET_ModID == "Íõ°²Ê¯") and (TT_TARGET_Name == "²Ø½£Ê¹Õß") then
--		GS_EnterTaskTalk()
--	else
----		Msg2Player(TT_TARGET_Name.." "..GetName())
----		if (TT_TARGET_ModID ~= "Íõ°²Ê¯") and (TT_TARGET_Name == GetName()) then
--		if TM_IsPlayer() == 1 then
--			On_Trap()
--		elseif (TT_TARGET_ModID == "Íõ°²Ê¯") and (TT_TARGET_Name == "²Ø½£Ê¹Õß") then	-- Ö»ÓÐÔÚºÍ²Ø½£Ê¹ÕßËµ»°µÄÊ±ºò²ÅÓÐÐ§¹û
--			GS_TalkWithMessenger()
--		elseif (TT_TARGET_ModID == "Ïä×ÓÇ®") and (TT_TARGET_Name == "¾«ÖÂµÄÏä×Ó") then
--			On_Dropis()
--		else	-- ÆäËûÇé¿ö£¨Ä¿Ç°Îª¶Ô»°£©
--			On_Talk()
--		end
--	end
-----------------------------------------------------------------------------------
end

-- ================================================================================================ <TRIGGER> ====
-- ------------------------------------------------------------------------------------------------ <Timer Function> ----
function Period_Timer()
	local nZone = TC_GetTeamZone()
	TT_Stepper()			-- ¼Ç²½Æ÷
	if TC_CheckTimer() == 1 then
		return
	end
	if mod(TC_TIMER_Count[nZone],4) == 0 then
		MU_Msg2Team("Trong thêi gian ®· qua....["..TC_TIMER_Count[nZone].."]")
	end
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
		ACT1_Timer()
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		ACT2_Timer()
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Timer()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
		ACT4_Timer()
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_Timer()
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		ACT8_Timer()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		ACT9_Timer()
	end	
end

-- ------------------------------------------------------------------------------------------------ <Killer Function> ----
function Killing_Unit()
	local nZone = TC_GetTeamZone()
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
--	Msg2Player(TT_TARGET_Name.." µÄµ±Ç°µÈ¼¶Îª£º "..GetUnitBaseStates(TT_TARGET_Index, 0))
	local nTargetLife = GetUnitBaseStates(TT_TARGET_Index, 1)
	if (GetItemCount(2,0,334) >= 1) and (random(1,100000) <= 10000) then
		local nDrainedLife = (nTargetLife*GetLevel()/100)*0.02
		ModifyLife(GetLife()+nDrainedLife)
		nDrainedLife = SB_Div(nDrainedLife, 1)
		if nDrainedLife > 0 then
			Msg2Player("[HuyÕt Ph¸ch]cña b¹n ph¸t ra ¸nh s¸ng hång mê ¶o, ®· kh«i phôc cho b¹n"..nDrainedLife.." ®iÓm sinh lùc.")
		end
	end
	if (GetItemCount(2,0,335) >= 1) and (random(1,100000) <= 10000) then
		local nDrainedNeili = (nTargetLife*GetLevel()/100)*0.02
		ModifyNeili(GetNeili()+nDrainedNeili)
		nDrainedNeili = SB_Div(nDrainedNeili, 1)
		if nDrainedNeili > 0 then
			Msg2Player("[Thñy Tinh]cña b¹n ph¸t ra ¸nh s¸ng xanh, ®· kh«i phôc cho b¹n"..nDrainedNeili.." ®iÓm néi lùc.")
		end
	end
	TC_RefKilledNpc()				-- É±ÈËÊýÁ¿¼ÇÂ¼
	if TT_TARGET_Name == "B¶o r­¬ng ngÉu nhiªn" then
		TB_OpenCommonChest()
	else
		TT_SetTarget(TT_TARGET_Index)
		MC_Del4Group(TT_TARGET_Index, 2)
--		Msg2Player("É±ÈËÀ­! Stage "..TC_STAGE_Index[nZone].." Zone "..nZone)
		
		if TC_STAGE_Index[nZone] == 1 then					-- ACT I
			ACT1_Killer()
		elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
			ACT2_Killer()
		elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
			ACT3_Killer()
		elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
			ACT4_Killer()
		elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
			ACT5_Killer()
		elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
		elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
		elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
			ACT8_Killer()
		elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
			ACT9_Killer()
		end	
		GT_Drop(TT_TARGET_Name, 2)
	end
	local nChecka, nCheckb = SB_Div(TC_KILL_Stage[nZone], 50)
--	Msg2Player("Ô¿³×µôÂä£º"..nChecka.."/"..nCheckb.." ["..TC_KILL_KeyGot[nZone].."/".."1]")
	if (nCheckb == 0) and (TC_KILL_KeyGot[nZone] >= 1) then
		TC_KILL_KeyGot[nZone] = TC_KILL_KeyGot[nZone] - 1
		AddItem(2,0,336,1)
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 3, 1)
		SetTask(SB_EVENT_STAGE[10], nFlag)
		TB_AddScore(3, random(0, 2))
		TaskTip("KÝch ho¹t sù kiÖn ®Æc biÖt: Th«ng th­êng. Ch×a khãa s¾t")
		-- Stage Event End
	end
end

-- ------------------------------------------------------------------------------------------------ <Rect Function> ----
function Leave_Map()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
--	Msg2Player(TC_STAGE_State[nZone].." "..nStage.." "..GetWorldPos())
	if (TC_STAGE_State[nZone] < 30) and (nStage >= 1) and (nStage <= 9) then
--		Msg2Player("»ØÈ¥³Ô·¹¿©¡­¡­")
		TM_LeaveMap(nZone, PlayerIndex)
	end
end

-- ------------------------------------------------------------------------------------------------ <DropChest Function> ----
function On_Dropis()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	if nIsUsed == 1 then
		Msg2Player("R­¬ng nµy hiÖn ®ang cã ng­êi sö dông.")
		return
	end
	if nIsLocked == 0 then											-- Ã»ÓÐÉÏËøµÄÏä×Ó
		local nNewChestState = SetBit(nChestState, 2, 1) - nChestState
		AddUnitStates(nChestIndex, 8, nNewChestState)				-- ÉèÖÃÏä×ÓµÄ¶ÀÕ¼È¨ÏÞ
		On_Dropis_Loot()
	elseif nIsLocked == 1 then										-- ÉÏËøµÄÏä×Ó
		if GetItemCount(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3]) < 1 then
			Msg2Player("Kh«ng cã ®óng ch×a khãa, sao cã thÓ më r­¬ng!")
		elseif GetItemCount(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3]) >= 1 then
			Say("Sö dông ch×a khãa më r­¬ng nµy?", 2, "Sö dông ch×a khãa/On_Dropis_Open", "Rêi khái/On_Dropis_Exit")
		end
	end
end
function On_Dropis_Open()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	if nIsLocked == 1 then
		if GetItemCount(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3]) >= 1 then
			DelItem(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3], 1)
			AddUnitStates(nChestIndex, 8, (2-nChestState))		-- ¿ªËø²¢ÇÒÉèÖÃ¶ÀÕ¼Ä£Ê½
			MU_Msg2Team(GetName().."§· kÝch ho¹t b¶o r­¬ng. ("..nChestIndex..")")
			On_Dropis_Loot()
		else
			Msg2Player("Kh«ng cã ®óng ch×a khãa, sao cã thÓ më r­¬ng!")
		end
	else
		local nNewChestState = SetBit(nChestState, 2, 1) - nChestState			-- ÉèÖÃÏä×ÓµÄ¶ÀÕ¼È¨ÏÞ
		AddUnitStates(nChestIndex, 8, SetBit(nChestState, 2, 1))				-- ÉèÖÃÏä×ÓµÄ¶ÀÕ¼È¨ÏÞ
		On_Dropis_Loot()
	end
end
function On_Dropis_Loot()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local aGearsIndex = {GetUnitCurStates(nChestIndex, 5), GetUnitCurStates(nChestIndex, 6), GetUnitCurStates(nChestIndex, 1)}
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	local nBody =  GetBody()
	aGearsIndex[3] = aGearsIndex[3] + nBody
--	Msg2Player("#"..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
	Say("Trong r­¬ng cã"..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2]).."trang bÞ, muèn lÊy kh«ng?", 2, "LÊy trang bÞ/On_Dropis_Get", "Rêi khái/On_Dropis_Exit")
	MU_Msg2Team(GetName().."Trong r­¬ng"..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2]).."trang bÞ")
end
function On_Dropis_Get()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local aGearsIndex = {GetUnitCurStates(nChestIndex, 5), GetUnitCurStates(nChestIndex, 6), GetUnitCurStates(nChestIndex, 1)}
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	local nBody = GetBody()
	-- emei & shaolin check
	local nFaction = MU_Div(aGearsIndex[3], 100)
	if (nFaction == 2) or (nFaction == 3) then
		if nBody > 2 then
			aGearsIndex[3] = aGearsIndex[3] + random(1, 2)
		else
			aGearsIndex[3] = aGearsIndex[3] + nBody
		end
	elseif (nFaction == 8) or (nFaction == 9) then
		if nBody < 3 then
			aGearsIndex[3] = aGearsIndex[3] + random(3, 4)
		else
			aGearsIndex[3] = aGearsIndex[3] + nBody
		end
	else
		aGearsIndex[3] = aGearsIndex[3] + nBody
	end
	AddItem(aGearsIndex[1], aGearsIndex[2], aGearsIndex[3], 1)
--	Msg2Player("#"..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
	MU_Msg2Team(GetName().."NhÆt ®­îc "..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2])..".."..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
	MC_Del4Group(nChestIndex, 0)
end
function On_Dropis_Exit()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	local nNewChestState = SetBit(nChestState, 2, 0) - nChestState
	AddUnitStates(nChestIndex, 8, nNewChestState)	-- ½â³ýÏä×ÓµÄ¶ÀÕ¼È¨ÏÞ
end
-- ------------------------------------------------------------------------------------------------ <Trap Function> ----
function On_Trap()
--	local nZone = TC_GetTeamZone()
--	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
----	Msg2Player("²Èµ½ BB ÁË¡­¡­")
--	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
----		ACT1_Trap()
--	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
--	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
--		ACT3_Trap()
--	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
--	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
--	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
--	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
--	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		ACT8_Trap()
--	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
--	end	
end

-- ------------------------------------------------------------------------------------------------ <Talk Function> ----
function On_Talk()
	local nZone = TC_GetTeamZone()
--	Msg2Player("Ëµ»°ÖÐ¡­¡­")
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		ACT2_Talk()
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Talk()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_Talk()
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		ACT9_Talk()
	end	
end

-- ================================================================================================ <GAME STAGE> ====
-- ------------------------------------------------------------------------------------------------ <Function> ----
function OnDeath()
--	Msg2Player("Death."..GetTriggeringUnit())
end

-- ================================================================================================ <SCORE BAR> ====
SB_PAGE_INFO = {
"Thu håi mËt tÞch",
"Xem phÇn thø 1 [Th«ng tin c¬ b¶n cña Tµng KiÕm s¬n trang] ",
"Xem phÇn thø 2 [Th«ng tin nh©n vËt][VÒ ®iÓm tÝch lòy] ",
"Xem phÇn thø 3 [Th«ng tin v­ît ¶i][Tin tøc ¶i] ",
"Xem phÇn thø 4 [Sù kiÖn v­ît ¶i]",
"Xem phÇn bªn trªn",
"Xem phÇn bªn d­íi"}

-- Í¨³£ÊÇ·¢ÉúÊÂ¼þºó¼¤»îÏÔÊ¾ÕâÐ©ÐÅÏ¢£¬µ«Ò²ÓÐ¸ö±ðÏ¡ÓÐÐÅÏ¢ÊÇÍ¨¹ýÄ³ÖÖÍ¾¾¶¼¤»îºó²Å»á·´Ó³ÔÚÓÎÏ·ÖÐ¡£
SB_EVENT_CRUSTG = 1809		-- ¼ÇÂ¼µ±Ç°·­µ½µÚNÒ³µÄ±äÁ¿ºÅ Task
SB_EVENT_STAGE = {1811, 1812, 1813, 1814, 1815,  1816, 1817, 1818, 1819, 1810}		-- ¼ÇÂ¼¹Ø¿¨ÊÂ¼þµÄ±äÁ¿ºÅ Task
SB_STAGE_RECORD = {}
SB_EVENT_TITLE = {
{"  .  ", "  S¬n  ", "      ", "  M«n  ", "      "},
{"  .  ", "  §¹i  ", "      ", "  viÖn  ", "      "},
{"  .  ", "  HËu  ", "  Hoa  ", "  Viªn  ", "      "},
{"  .  ", "  Liªn  ", "  Hoµn   ", "  sµo  ", "      "},
{"  .  ", "  Tµng  ", "  KiÕm  ", "  c¸c  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  Tö  ", "  Tróc  ", "  L©m  ", "      "},
{"  .  ", "  KiÕm  ", "      ", "  Trñng  ", "      "},
{"  .  ", "  th«ng  ", "      ", "  Th­êng  ", "      "}}
SB_EVENT_CONT = {
	{"  [Ch­a giÕt ®­îc <color=metal>Chã canh cöa<color> nµo ]",
	 "  [GiÕt nhiÒu <color=metal>Chã canh cöa<color> cã thÓ chäc tøc <color=metal>Gia ®inh phÉn né<color>]",
	 "  [Qua cöa sÏ gÆp rÊt nhiÒu <color=metal>Gia ®inh hé viÖn<color> mai phôc ]",
	 "  [§¸nh b¹i nhiÒu <color=metal>Gia ®inh hé viÖn<color> cã thÓ chäc tøc <color=metal>Tæng qu¶n Ngo¹i viÖn<color>]",
	 "  ??????",
	 "  ??????",
	 "S¬n M«n"},
	{"  [Cã thÓ ®èi tho¹i víi <color=metal>Tæng qu¶n Néi viÖn<color>, chän trùc tiÕp chiÕn ®Êu!]",
	 "  [Gióp <color=metal>Tæng qu¶n Néi viÖn<color> t×m Du Long kiÕm vÒ, cã thÓ cïng h¾n luyÖn tËp vâ nghÖ.]",
	 "  [Khi gióp <color=metal>Tæng qu¶n Néi viÖn<color> t×m Du Long kiÕm cã thÓ thÊy ®­îc BÝch Tµm kiÕm.]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "§¹i ViÖn"},
	{"  [NÕu <color=metal>N÷ l·o béc<color> ë HËu Hoa Viªn qu¸ nhiÒu cã thÓ lµm kinh ®éng <color=metal>HËu Hoa Viªn nghi tr­îng<color> ]",
	 "  [§i qua v­ên hoa, sÏ khiÕn <color=metal>§¹i tiÓu th­<color> cµng phÉn né.]",
	 "  [NÕu t×m ®­îc <color=metal>Gia ®inh<color> bÞ <color=metal>§¹i tiÓu th­<color> bøc hiÕp, gióp h¾n tr¶ tiÒn chuéc th©n.]",							-- ¿É½»»»»ñµÃÔ¿³×
	 "  [<color=metal>§¹i tiÓu th­<color> sÏ kh«ng qu¸ lµm khã (nÕu ®éi ngò ®Òu lµ n÷)]",
	 "  ??????",
	 "  ??????",
	 "HËu hoa viªn"},
	{"  [LÊy ®­îc 3 viªn kú th¹ch <color=metal>Ngò hµnh kiÕm linh<color> sÏ xuÊt hiÖn]",
	 "  [LÊy ®­îc<color=metal>Kim Ngäc Thè<color>, míi cã thÓ vµo <color=metal>Tµng KiÕm C¸c<color> ]",
	 "  [LÊy ®­îc<color=metal>Méc Ngäc Thè<color>, míi cã thÓ vµo <color=metal>!<color> ]",
	 "  [LÊy ®­îc<color=metal>Háa Ngäc Thè<color>, míi cã thÓ vµo <color=metal>!<color> ]",
	 "  ??????",
	 "  ??????",
	 "Liªn Hoµn Sµo"},
	{"  [Kim quy Kim, Méc quy Méc, Thñy quy Thñy, Háa quy Háa, Thæ quy Thæ, ®Òu lµ <color=metal>T­¬ng ThÕ<color> ]",	-- 70¼¶ÒÔÉÏ Ö»ÔÚÕâÀïµôÂä Ø¤°ï¡¤ÍµÌì»»ÈÕ¾÷Òª		¶ëáÒ¡¤¸²Ë®ÐÄ·¨¾÷Òª
	 "  [Kim sinh Thñy, Thñy sinh Méc, Méc sinh Háa, Háa sinh Thæ, Thæ sinh Kim, ®Òu lµ <color=metal>T­¬ng Sinh<color> ]",	-- 70¼¶ÒÔÉÏ Ö»ÔÚÕâÀïµôÂä ¶ëáÒ¡¤´ó´È´ó±¯Öä¾÷Òª	ÉÙÁÖ¡¤´ó³ËÈçÀ´ÐÄ·¨¾÷Òª
	 "  [Kim kh¾c Méc, Méc kh¾c Thæ, Thæ kh¾c Thñy, Thñy kh¾c Háa, Háa kh¾c Kim, ®Òu lµ <color=metal>T­¬ng Tö<color> ]",	-- 70¼¶ÒÔÉÏ Ö»ÔÚÕâÀïµôÂä ÌÆÃÅ¡¤±©ÓêÀæ»¨Õë¾÷Òª	Îäµ±¡¤²ÐÓ°¾÷ÐÄ·¨
	 "  [Kim tïng Háa, Háa tïng Thñy, Thñy tïng Thæ, Thæ tïng Méc, Méc tïng Kim,®Òu lµ <color=metal>T­¬ng Tr×<color> ]",	-- 60¼¶ÒÔÉÏ Ö»ÔÚÕâÀïµôÂä Îäµ±¡¤ÐþÎä½£Õó¾÷Òª		ÉÙÁÖ¡¤ÂÞººÕó¾÷Òª
	 "  [Kim ph¸ Thæ, Thæ ph¸ Háa, Háa ph¸ Méc, Méc ph¸ Thñy, Thñy ph¸ Kim, ®Òu lµ <color=metal>T­¬ng Ph¸<color> ]",	-- 60¼¶ÒÔÉÏ Ö»ÔÚÕâÀïµôÂä ÉÙÁÖ¡¤ÎÞÏàÉñ¹¦¾÷Òª		Ø¤°ï¡¤×íµû¾÷Òª
	 "  ??????",
	 "Tµng KiÕm c¸c"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Tö Tróc l©m"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "KiÕm Chñng"},
	{"  ??????",
	 "  [§é h¶o h÷u cµng cao, cã thÓ ®Õn gÆp Sø gi¶ Tµng KiÕm kÝch ho¹t r­¬ng, kh«ng tiªu hao Anh Hïng thiÕp]",
	 "  [Khi giÕt qu¸i ë mçi ¶i ®Òu cã thÓ nhËn ®­îc ch×a khãa më R­¬ng tinh chÕ ]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Th«ng Th­êng"}}
SB_UNKNOWN_INFO = "  [?????? ]"
-- ------------------------------------------------------------------------------------------------ <Function> ----
function SB_Page_0()
end
function SB_Page_1()
	local nZone = TC_GetTeamZone()
	if not ((nZone >= 1) and (nZone <= 5)) then
		SB_Page_1_Bak()
	else
		GS_ViewZone(nZone)
	end
end
function SB_Page_1_Bak()
	local sL1 = "<color=green>.<color><color=gold>Liªn quan ®Õn S¬n trang<color>: <color=gray>X n¨m Y Tµng KiÕm s¬n trang thiÕt lËp ®Õn nay ch¼ng nh÷ng ®· thu nhËn nhiÒu danh kiÕm trong thiªn h¹, mµ cßn cã c«ng nghÖ ®óc t¹o vò khÝ phßng vÖ lµ tuyÖt kü bÝ truyÒn ®Ö nhÊt trong giang hå. NhiÒu nh©n sÜ t×m ®Õn mong t×m cho m×nh ThÇn Binh B¶o Gi¸p.<color>".."\n"
	local sL2 = ""..""
	local sL3 = ""..""
	local sL4 = "<color=green>.<color> <color=gold>Liªn quan ®Õn Khiªu chiÕn<color>: <color=gray>HiÖn nay trang chñ mêi c¸c nh©n sÜ ®Õn Tµng KiÕm s¬n trang. Nh÷ng ai cã thµnh ý xin ®Õn gÆp sø gi¶ ë T­¬ng D­¬ng<color>.".."\n"
	local sL5 = ""..""
	local sL6 = ""..""
	
	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."./SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL3..sL4..sL5..sL6, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_2()
	local nName = "<color=wood>"..SB_FormatStr().."<color>"
	local nScore = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_SCORE), 12).."<color>"
	local nTime = tostring(GetTask(TB_BONUS_TIME))
	local nDataS, nDataM, nDataH = 0, 0, 0
	nTime, nDataS = SB_Div(nTime, 60)
	nTime, nDataM = SB_Div(nTime, 60)
	nTime, nDataH = SB_Div(nTime, 60)
	local nData = "<color=green>"..SB_FormatStr(nDataH, 5, 3).."<color><color=water>:<color><color=green>"..SB_FormatStr(nDataM, 2, 3).."<color><color=water>:<color><color=green>"..SB_FormatStr(nDataS, 2, 3).."<color><color=water>'<color>"
	local nRelation = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_RELATION), 8)
	
	local sL1 = "<color=green>.<color><color=gold>Th«ng tin nh©n vËt<color>: <color=gray>Bao gåm ®iÓm danh väng vµ n¨ng lùc chiÕn ®Êu.<color>".."\n"
	local sL2 = "  Tªn:"..nName.."  Danh väng: ChiÕn ®Êu:".."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=green>.<color> <color=gold>§iÓm tÝch lòy<color>: <color=gray>Tr×nh ®é h¶o h÷u biÓu thÞ tr×nh ®é quan hÖ thÕ lùc trong Tµng KiÕm s¬n trang.<color>".."\n"
	local sL5 = "  TÝch lòy:"..nScore.."  Thêi gian:"..nData.."  Quan hÖ S¬n trang:"..nRelation.."\n"
	local sL6 = "".."\n"	

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end	
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."./SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)	
end
function SB_Page_3()
	local nPlayed = GetTask(TB_BONUS_PLAYED)
	local nFinished = GetTask(TB_BONUS_FINISHED)
	local nSRate = "<color=wood>0%<color>"
	if nPlayed ~= 0 then
		nSRate = "<color=wood>"..(SB_Div(((nFinished*10000)/nPlayed), 1)/100).."<color>%"
	end
	local nPlayed = "<color=wood>"..SB_FormatStr(nPlayed, 12) .."<color>"
	local nFinished = "<color=wood>"..SB_FormatStr(nFinished, 12).."<color>"
	local nStage = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_STAGE), 12).."<color>"
	local nKilled = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_KILLED), 12).."<color>"
	local nBecaptain = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_BECAPTAIN), 12).."<color>"
	
	local sL1 = "<color=green>.<color><color=gold>Tin tøc v­ît ¶i<color>: <color=gray>Th«ng qua sè lÇn tham dù vµ sè lÇn ®· th«ng qua ®Ó tÝnh tû lÖ.<color>".."\n"
	local sL2 = "  Sè lÇn tham dù:"..nPlayed.."  Sè lÇn v­ît ¶i:"..nFinished.."  Tû lÖ th«ng qua:"..nSRate.."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=green>.<color><color=gold>Th«ng tin ¶i<color>: <color=gray>Ghi nhí vµi th«ng tin vuît ¶i ®¬n gi¶n.<color>".."\n"
	local sL5 = "  Tæng sè v­ît ¶i:"..nStage.."  Tæng sè s¸t qu¸i:"..nKilled.."  Sè lÇn ®éi tr­ëng:"..nBecaptain.."\n"
	local sL6 = "".."\n"

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."./SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_Event(nStage)
	if nStage == nil then
		nStage = GetTask(SB_EVENT_CRUSTG)
	end
	if (nStage < 1) or (nStage > 9) then
		nStage = 10
	end
	SetTask(SB_EVENT_CRUSTG, nStage)
	--local sLine = "  [<color=green>----"..SB_EVENT_CONT[nStage][7].."----<color>]".."\n"
	local sLine = ""
	for i=1,5 do
		sLine = sLine.."<color=green>"..SB_EVENT_TITLE[nStage][i].."<color>"
		if GetBit(GetTask(SB_EVENT_STAGE[nStage]), i) == 1 then
			sLine = sLine..SB_EVENT_CONT[nStage][i].."\n"
		else
			sLine = sLine..SB_UNKNOWN_INFO.."\n"
		end
	end
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	local sP0 = SB_PAGE_INFO[6].." ["..SB_EVENT_CONT[nStagePre][7].."]/SB_Page_Event_Pre"
	local sP1 = SB_PAGE_INFO[7].." ["..SB_EVENT_CONT[nStageNext][7].."]/SB_Page_Event_Next"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[1].."/SB_Page_0"
	Say(sLine, 4, sP0, sP1, sP2, sP3)
end
function SB_Page_Event_Pre()
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	SB_Page_Event(nStagePre)
end
function SB_Page_Event_Next()
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	SB_Page_Event(nStageNext)
end

function OnUse()
	SB_Page_2()
end

