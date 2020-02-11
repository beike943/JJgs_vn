--½Å±¾Ãû³Æ£ºÎ÷±±Çø¹Ø¿¨bossËÀÍöº¯Êı
--½Å±¾¹¦ÄÜ£ºbossËÀÍö£¬Ö÷ÒªÊÇ½±ÀøµÄ¸øÓÚmissionµÄÏà¹Ø²Ù×÷
--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-08-06
--´úÂëĞŞ¸Ä¼ÇÂ¼
--±¸×¢£ºÎÒÓĞÎÒstyle
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\task\\world\\xibei\\task_head.lua")
Include("\\script\\task\\world\\xibei\\task_main.lua")
Include("\\script\\task\\world\\task_head.lua")

	Tb_boss_script = {
						{"Cæ D­¬ng Thó","guyang_death_1",""},
						{"TrÊn Mé Thó","zhenmu_death_1",""},
						{"Quû T­íng Qu©n","ghost_death_1",""},
						{"D­îc V­¬ng","drugking_death_1",""},
						{"Ngò Hµnh Kim Sø","iron_death_1",""},
						{"Ngò Hµnh Thñy Sø","water_death_1",""},
						{"Ngò Hµnh Méc Sø","wood_death_1",""},
						{"Ngò Hµnh Háa Sø","fire_death_1",""},
						{"Ngò Hµnh Thæ Sø","dust_death_1",""},
						{"Thèng lÜnh t­îng binhHoanT­îng ","binma_yong_death_1",""},
						{"TrÊn Mé ThóHoan T­îng ","zhenmu_jia_death_1",""},
						{"TrÊn mé T­íng qu©nHoan T­îng ","zhenmu_jj_death_1",""},
						{"HuyÕt Ma Nh©nHoan T­îng ","xuemo_death_1",""},
						{"Quû T­¬ng §ÇuHoan T­îng ","gui_jj_death_1",""},
						{"Nguyªn h×nh Hoan T­îng","sheng_death_1",""},
						}
	Tb_stage6_boss_info = {
		{"Hoan T­îng (T­íng lÜnh t­îng)","Thèng lÜnh t­îng binhHoanT­îng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan T­îng (Cæ D­¬ng Thó)","TrÊn Mé ThóHoan T­îng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan T­îng (TrÊn mé T­íng qu©n)","TrÊn mé T­íng qu©nHoan T­îng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan T­îng (HuyÕt Ma Nh©n)","HuyÕt Ma Nh©nHoan T­îng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan T­îng (Quû T­¬ng §Çu)","Quû T­¬ng §ÇuHoan T­îng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Nguyªn h×nh Hoan T­îng","Nguyªn h×nh Hoan T­îng - Con trai",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
	}
--¹ÖÎïËÀÍöÖ÷º¯Êı
function OnDeath(monster_index)
	local monster_name = GetNpcName(monster_index)
	local stage_diff = GetMissionV(MS_DIFF)
	if stage_diff ~= 1 and stage_diff ~= 2 then
		return
	end
	for i = 1,getn(Tb_boss_script) do
		if monster_name == Tb_boss_script[i][1] then
			dostring(Tb_boss_script[i][1+stage_diff].."("..monster_index..","..PlayerIndex..")")
		end
	end
end
--============================ÆÕÍ¨¹Ø¿¨´¦Àí===========================
function guyang_death_1(monster_index)
	local strTalk = {
		"(1 ¸nh hång quang lãe lªn cïng víi tiÕng rİt chãi tai)",
		"Ng­êi ch¬i: ??!? (¸nh hµo quang vµ tiÕng rİt lóc n·y lµ sao? Hay nªn ®i hái DiÖp Tö Thu.)",
		}
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	for i=1,getn(player) do
	  PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_02) == 17 and IsPlayerDeath() == 0 then
			DelItem(2,0,704,1)--ËøÑı·û
			DelItem(2,0,759,1)--ÌÒÄ¾½£
			AddItem(2,0,705,1,1)--Ñª»ê¾§ÆÇ
			TalkEx("",strTalk)
			SetTask(TASK_XB_ID_02,18)
			TaskTip("§· ®¸nh b¹i Cæ D­¬ng Thó , trë vÒ C«n L«n gÆp DiÖp Tö Thu. ")
			Msg2Player("§· ®¸nh b¹i Cæ D­¬ng Thó , trë vÒ C«n L«n gÆp DiÖp Tö Thu. ")
		end
	end
	normal_stage_finish()
end
function zhenmu_death_1(monster_index)
	local strTalk = {
		"Mét ©m thanh lín vang lªn, lèi vµo tÇng 2 ®· më, mau chãng vµo lÊy b¶o r­¬ng dùa theo chØ dÉn cña mËt hµm T©y H¹ Ph¸p v­¬ng."
		}
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷	
	for i=1,getn(player) do
	  PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 25 and IsPlayerDeath() == 0 then
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,26);
			TaskTip("Mau vµo lÊy b¶o r­¬ng dùa theo chØ dÉn cña mËt hµm T©y H¹ Ph¸p v­¬ng.");
			Msg2Player("Mau vµo lÊy b¶o r­¬ng dùa theo chØ dÉn cña mËt hµm T©y H¹ Ph¸p v­¬ng.");
			GivePlayerAward("Award_XB_32","Easy");
		end
	end
	normal_stage_finish()
end
function ghost_death_1(monster_index)
	local strTalk = {
		"Ch¼ng lÏ ®©y lµ MÆc §Êu KiÕm? Ngäc béi nµy lµ g×? Sao kh«ng thÊy mËt ®å Thiªn Hµ X· T¾c? Tr¶o V­¬ng ®· ®Òn téi, kh«ng ai cña NhÊt PhÈm §­êng vµo tÇng 2. Nh÷ng vËt nµy nhÊt ®Şnh cã liªn quan tíi vî cña T­ M· tiÒn bèi, tèt nhÊt nªn hái «ng ta tr­íc."
		};
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	for i=1,getn(player) do
		PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 27 and IsPlayerDeath() == 0 then
			DelItem(2,0,717,1);--É¾È¥·Ç³£µÀ·û
			AddItem(2,0,718,1,1);--»ñµÃÄ«¶·
			AddItem(2,0,719,1,1);--»ñµÃÓñÅå
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,28);
			TaskTip("Mang cho T­ M· Minh Phong nh÷ng vËt cã trong b¶o r­¬ng.");
			Msg2Player("Mang cho T­ M· Minh Phong nh÷ng vËt cã trong b¶o r­¬ng.");
		end
	end
	normal_stage_finish()
end
function drugking_death_1(monster_index)

	local strTalk = {
		"Ta ®· chuÈn bŞ cho ng­êi 100 d­îc nh©n. D­îc Nh©n d­îc ph­¬ng nghiÖp ®· phèi thµnh, ®Òu dïng nguyªn liªu D­îc Nh©n Th¶o trong d­îc v­¬ng ®éng.",
		"Kh«ng hay råi, T©y H¹ muèn t¹o ra ®éi qu©n D­îc Nh©n, giê ph­¬ng thuèc ®· n»m trong tay ta, ph¶i vÒ gÆp ¢u D­¬ng tiÒn bèi.",
		}

	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§	
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	for i=1,getn(player) do
		PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 47 and IsPlayerDeath() == 0 then
			DelItem(2,0,760,1)	--É¾³ıÒ©ÍõÒ×Èİ×°
			AddItem(2,0,726,1,1);--´òµ¹Ò©ÍõµÃµ½Ò©ÈËÒ©·½
			AddItem(2,0,727,1,1);--Î÷ÏÄ·¨ÍõÊéº¯
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,48);
			TaskTip("Håi b¸o ¢u D­¬ng Häa, T©y H¹ Cèc t×m ph­¬ng thuèc D­îc V­¬ng t¹o ra ®éi qu©n D­îc Nh©n, viÖc nµy v« cïng cÊp b¸ch.");
			Msg2Player("Håi b¸o ¢u D­¬ng Häa, T©y H¹ Cèc t×m ph­¬ng thuèc D­îc V­¬ng t¹o ra ®éi qu©n D­îc Nh©n, viÖc nµy v« cïng cÊp b¸ch.");
		end
	end
	normal_stage_finish()
end
function iron_death_1(monster_index)
	local strTalk = {
		"§· ®¸nh b¹i Ngò Hµnh Sø, vÒ b¸o l¹i Th¸c B¹t Ho»ng."
		}	
	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TaskTip("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function water_death_1(monster_index)
	local strTalk = {
			"§· ®¸nh b¹i Ngò Hµnh Sø, vÒ b¸o l¹i Th¸c B¹t Ho»ng."
			}	
	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TaskTip("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function wood_death_1(monster_index)

	local strTalk = {
		"§· ®¸nh b¹i Ngò Hµnh Sø, vÒ b¸o l¹i Th¸c B¹t Ho»ng."
		}	
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TaskTip("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function fire_death_1(monster_index)

	local strTalk = {
		"§· ®¸nh b¹i Ngò Hµnh Sø, vÒ b¸o l¹i Th¸c B¹t Ho»ng."
		}	
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TaskTip("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function dust_death_1(monster_index)

	local strTalk = {
		"§· ®¸nh b¹i Ngò Hµnh Sø, vÒ b¸o l¹i Th¸c B¹t Ho»ng."
		}	
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TaskTip("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function binma_yong_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	nNpcIndex = CreateNpc("Hoan T­îng (Cæ D­¬ng Thó)","TrÊn Mé ThóHoan T­îng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi ®· tiªu diÖt ¶o ¶nh Thèng lÜnh t­îng binh m·, Hoan T­îng biÕn hãa thµnh TrÊn Mé Thó!");
			Msg2Player("Khi ®· tiªu diÖt ¶o ¶nh Thèng lÜnh t­îng binh m·, Hoan T­îng biÕn hãa thµnh TrÊn Mé Thó!");
		end
	end
end

function zhenmu_jia_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	nNpcIndex = CreateNpc("Hoan T­îng (TrÊn mé T­íng qu©n)","TrÊn mé T­íng qu©nHoan T­îng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi ®· tiªu diÖt Hoan T­îng TrÊn Mé Thó, Hoan T­îng hãa thµnh TrÊn mé T­íng qu©n!");
			Msg2Player("Khi ®· tiªu diÖt Hoan T­îng TrÊn Mé Thó, Hoan T­îng hãa thµnh TrÊn mé T­íng qu©n!");
		end
	end
end

function zhenmu_jj_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	nNpcIndex = CreateNpc("Hoan T­îng (HuyÕt Ma Nh©n)","HuyÕt Ma Nh©nHoan T­îng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi ®· tiªu diÖt ¶o ¶nh TrÊn mé T­íng qu©n, Hoan T­îng hãa thµnh HuyÕt Ma Nh©n!");
			Msg2Player("Khi ®· tiªu diÖt ¶o ¶nh TrÊn mé T­íng qu©n, Hoan T­îng hãa thµnh HuyÕt Ma Nh©n!");
		end
	end
end

function xuemo_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	nNpcIndex = CreateNpc("Hoan T­îng (Quû T­¬ng §Çu)","Quû T­¬ng §ÇuHoan T­îng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi ®· tiªu diÖt ¶o ¶nh HuyÕt Ma Nh©n, Hoan T­îng hãa thµnh Quû T­¬ng §Çu! ");
			Msg2Player("Khi ®· tiªu diÖt ¶o ¶nh HuyÕt Ma Nh©n, Hoan T­îng hãa thµnh Quû T­¬ng §Çu! ");
		end
	end
end

function gui_jj_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	nNpcIndex = CreateNpc("Nguyªn h×nh Hoan T­îng","Nguyªn h×nh Hoan T­îng",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--²Ù×÷
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Tiªu diÖt ¶o ¶nh Quû T­¬ng §Çu, nguyªn h×nh cña Hoan T­îng-Con trai xuÊt hiÖn!!");
			Msg2Player("Tiªu diÖt ¶o ¶nh Quû T­¬ng §Çu, nguyªn h×nh cña Hoan T­îng-Con trai xuÊt hiÖn!!");
		end
	end
end

function sheng_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	local strSay = {
		"Khi ®¸nh b¹i nguyªn h×nh cña Hoan T­îng , theo lêi cña DiÖp Tö Thu, lóc nµy ph¶i dïng thÇn chó phong Ên nã. Xin chän c©u thÇn chó phong Ên: ",
		HUANXIANG_CURSE[1].."/#Confirm_Curse(1)",
		HUANXIANG_CURSE[2].."/#Confirm_Curse(2)",
		HUANXIANG_CURSE[3].."/#Confirm_Curse(3)",
		}
	SetNpcLifeTime(monster_index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	--È¡µÃ¹Ø¿¨µÄËùÓĞÍæ¼ÒË÷Òı
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	normal_stage_finish()
	--²Ù×÷
	for i=1,getn(player) do
	  PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 64 and IsPlayerDeath() == 0 then
			SetPlayerScript("\\script\\missions\\northwest_mission\\npc\\boss_death.lua")
			SelectSay(strSay);
		end
	end
end

--È·ÈÏÖäÓï
function Confirm_Curse(index)
	local strTalk = {};
	--·âÓ¡³É¹¦
	if GetTask(HUANGXIANG_CURSE_ID) == index then
		SetTask(TASK_XB_ID_01,65);
		strTalk = {
			"Ng­êi ch¬i: Nguyªn h×nh Hoan T­îng ®· bŞ phong Ên thµnh c«ng, sau khi tÆng ph¸p khİ cho B¹ch Thiªn Thµnh liÒn tr¶ th¸p phong yªu cho DiÖp Tö Thu. "
			}
		Msg2Player("Sau khi tÆng ph¸p khİ phong Ên cho B¹ch Thiªn Thµnh, th× mang tr¶ th¸p phong Ên cho DiÖp Tö Thu. ");
		TaskTip("Sau khi tÆng ph¸p khİ phong Ên cho B¹ch Thiªn Thµnh, th× mang tr¶ th¸p phong Ên cho DiÖp Tö Thu. ");
	--·âÓ¡Ê§°Ü
	else
		strTalk = {
			"ThÇn chó kh«ng hiÖu lùc, nguyªn h×nh Hoan T­îng ®· ch¹y tho¸t!"
			}
	end
	TalkEx("",strTalk);
end
--¹Ø¿¨³É¹¦Íê³É
function normal_stage_finish()
	SetMissionV(MS_TIMMER_LOOP_ID,6)
end
--µÚÎå¹ØbossË÷ÒıµÄ¸üĞÂ
function stage_5_boss_index_deal(monster_index)
	local boss_index_att = 0		--ÁÙÊ±bossË÷Òı±äÁ¿
	local boss_index_att_0 = 0		--¿Õ°×Ë÷ÒıÎ»ÖÃ
	for i = MS_BOSS_INDEX_1,MS_BOSS_INDEX_5 do
		if GetMissionV(i) == 0 then
			boss_index_att_0 = i
			break
		elseif monster_index == GetMissionV(i) then
			boss_index_att = i
		end
	end
	SetMissionV(boss_index_att,GetMissionV(boss_index_att_0-1))
	SetMissionV((boss_index_att_0-1),0)
end
--============================¸´ÔÓ¹Ø¿¨´¦Àí===========================
--°µÈÕÊ¹ºÍÃ÷ÔÂÊ¹
function moon_sun_death(kill_index)
	--Èç¹ûÊÇ¹ÅÑôÊŞÉ±ËÀµÄ²»×ö´¦Àí
	if kill_index == 0 then
		return
	end
	--Èç¹ûÊÇÍæ¼ÒÉ±ËÀµÄÔò¼õÉÙÑªÄ§ÈËµÄÊıÁ¿
	mf_SetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM,(mf_GetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM) - 1))
end
--ÑªÄ§ÈË
function blood_monster_death(kill_index)
	--Ö»×ö¼õÒ»µÄ´¦Àí
	mf_SetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM,(mf_GetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM) - 1))
end
--ÁúºÍºüÀê
function dragon_fox_death(kill_index)
	--Èç¹ûÊÇ¹ÅÑôÊŞÉ±ËÀµÄ
	if kill_index == 0 then
		local boss_index = mf_GetMissionV(MS_ID,MS_BOSS_INDEX_ID)
		stage_1_boss_add_life(boss_index,1,1)
	end
	mf_SetMissionV(MS_ID,MS_DRAGON_FOX_NUM,(mf_GetMissionV(MS_ID,MS_DRAGON_FOX_NUM)-1))
end
--¹ÅÑôÊŞ
function stage_1_boss_death()
	--·¢ÏûÏ¢
	Zgc_pub_mission_team_msg("“Cæ D­¬ng Thó” bŞ tiªu diÖt, v­ît qua ¶i!")
	--ÉèÖÃ¹Ø¿¨×´Ì¬
	mf_SetMissionV(MS_ID,MS_STATE_ID,MS_state_wait_end)
	--½±Àø¸øÓÚ
	--½øÈë¹Ø¿¨Íê³É×´Ì¬£¬ÖØĞÂÉèÖÃ´¥·¢Æ÷
end
