--ÎÄ¼þÃû£º½ø¶ÈÌõ»Øµ÷Ö÷º¯Êý
--¹¦    ÄÜ£ºÆô¶¯½ø¶ÈÌõºó³É¹¦»òÊ§°Üµ÷ÓÃµÄº¯Êý
--³ÌÐò¿ª·¢ÈË£ºË§¸ç
--½Å±¾ÐèÇóÌá½»ÈË£º´å³¤
--¿ª·¢Ê±¼ä£º20070126
--±¸	×¢£º	µ÷ÓÃ£ºDoWait(n1,n2,n3) n1: ³É¹¦ºóµ÷ÓÃµÄº¯ÊýµÄË÷Òý n1: Ê§°Üºóµ÷ÓÃµÄº¯ÊýµÄË÷Òý n3: ½ø¶ÈÌõµÈ´ýÊ±¼ä
--		»Øµ÷£ºmain(deal_suc,deal_fail,deal_flag)£¬µÚÒ»¸ö²ÎÊýÊÇ³É¹¦µ÷ÓÃ±êÖ¾£¬µÚ¶þ¸ö²ÎÊýÊÇÊ§°Üµ÷ÓÃ±êÖ¾£¬µÚÈý¸öÊÇ´¦Àí³É¹¦Óë·ñµÄ±êÖ¾¡£ËùÓÐµ÷ÓÃµÚÒ»¡¢¶þ¸ö²ÎÊý²»ÄÜÖØ¸´¡£
--		Èç£º10ÃëÖÓµÄ¿ªÏäÊ±¼ä¡£DoWait(1,2,10)£¬¿Í»§¶Ë³öÏÖ10ÃëµÄ½ø¶ÈÌõ£¬³É¹¦£¨main(1,2,1)£©»òÊ§°Ü£¨main(1,2,0)£©¾ùµ÷ÓÃ»Øµ÷º¯Êý£¬Ö»ÊÇ³É¹¦´«Èëmainº¯ÊýµÄdeal_flag²ÎÊýÎª1£¬Ê§°ÜÎª0
--		ÈçÓÐÒÉÎÊÇë×ÉÑ¯´å³¤»òË§¸ç¡£
--ÕÔ¹ó´º¹«¹²ÎÄ¼þ
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
Include("\\script\\gongcheng\\prison\\prison_head.lua")
Include("\\script\\task\\npc\\´¢±¸Îï×Ê.lua")
Include("\\script\\lib\\writelog.lua");
--2010Äê1ÔÂ´º½Ú»î¶¯
Include("\\script\\online_activites\\2010_01\\activites_01\\head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

--============================¹«¹²±äÁ¿¶¨ÒåÇø===============================
g_szThisFile = "\\script\\global\\action_bar_callback.lua"

---------°ï»á¹¥³ÇÕ½Ö®×ÊÔ´±£»¤Ïà¹Ø
	--1¡¢¼ÇÂ¼ÊÇ·ñ±»Õ¼ÓÃ
	box_belong_ID = 2					--¸ÃÖµ³õÊ¼»¯Îª1
	--2¡¢ÖÜÐòÊý
	box_open_week_ID = 4				--¸ÃÖµ³õÊ¼»¯Îª0
	--¿ªÊ¼´ò¿ªµÄÊ±¼ä
	box_open_time_ID = 5				--³õÊ¼»¯Îª0
	--NPCË÷Òý¼ÇÂ¼ID
	TasktempID_npc_index = 166
	--³Ç½¼¶ÔÓ¦µÄ³ÇÊÐ
	Tb_map_2_city = {}
	Tb_map_2_city[105] = 100
	Tb_map_2_city[108] = 100
	Tb_map_2_city[304] = 300
	Tb_map_2_city[308] = 300
	Tb_map_2_city[218] = 350
	Tb_map_2_city[406] = 350
--Î÷±±Çø¹Ø¿¨µÚËÄ¹ØID
	grass_index_TasktempID = 188		--´æ·Å²ÝµÄË÷Òý
	grass_id_state = 0					--´æ·Å¸Ã²ÝÄ¿Ç°µÄ×´Ì¬£¬0Îª³õÊ¼×´Ì¬£¬1ÎªÊ¹ÓÃ°Î³ö×´Ì¬
	grass_id_sys_time = 1			--´æ·Å¸Ã²ÙÉÏ´Î²Ù×÷µÄÊ±¼ä£¬ÓëÉÏÒ»ÌõÅäºÏÍê³ÉÕ¼ÓÐ»úÖÆ
	grass_kill_num = 1424			--°Î³ýÁË¶àÉÙÒ©ÈË²Ý
--½áÊø
--===============================Ö÷Âß¼­Çø==================================
function main(deal_suc,deal_fail,deal_flag)
	--ÇëÍ¨¹ýÌîtableµÄ·½Ê½ÊµÏÖµ÷ÓÃ¶ÔÓ¦º¯Êý---------------
	----------------------------------------------------
	local deal_action_total = {
			--¶ÔÓ¦µ÷ÓÃº¯Êý£¬ÆæÊýË÷Òý±íÊ¾³É¹¦Ëùµ÷ÓÃµÄº¯Êý£¬Å¼ÊýË÷Òý±íÊ¾Ê§°ÜËùµ÷ÓÃµÄº¯Êý
			[1] = af_spring_huashan_open_suc,		--2007Äê´º½Ú»ªÉ½¾º¼¼»î¶¯
			[2] = af_spring_huashan_open_fail,	
			[3] = af_killer_hall_open_box_suc,		--É±ÊÖÌÃ±¦Ïä
			[4] = af_killer_hall_open_box_fail,	
			[5] = af_arrest_finish,
			[6] = af_arrest_fail,
			[7] = af_conf_resource_open_suc,		--°ï»á×ÊÔ´±£»¤ 
			[8] = af_conf_resource_open_fail,
			[9]	= conf_task_open_suc,
			[10]= conf_task_open_fail,
			[11] = northwest_stage4_grass_suc,
			[12] = northwest_stage4_grass_fail,
			[13] = confirm_lucky_award_suc,
			[14] = confirm_lucky_award_fail,
			[15] = confirm_translife_suc,
			[16] = open_vet_201001_hongbao_success,
			[17] = open_vet_201001_hongbao_failed,
			[19] = open_newres_success,
			[20] = open_newres_failed,
			[21] = open_golden_chest_success,	
		  	[22] = FG_GatherSuccess,
		  	[23] = FG_GatherFailure,
		  	[24] = gtask_WuZi_116_suc,
		  	[25] = gtask_WuZi_116_fail,
		  	[26] = bkl_openbox_suc,
		  	[27] = bkl_openbox_fail,
		  	[28] = tuyetanh_openbox_suc,
		  	[29] = tuyetanh_openbox_fail,
		  	[30] = chieuda_openbox_suc,
		  	[31] = xichtho_openbox_suc,
			
			--ÎÒÃÇ½«Ê¹ÓÃ100ÒÔºóµÄË÷Òý
			--We will use the table index after 100
			[101] = ttd_talk_suc,
			[102] = ttd_talk_fail,
			[103] = gtask_Mfzp_80_suc,
			[104] = gtask_Mfzp_80_fail,
			[105] = qht_diji_box_suc,
			[106] = qht_diji_box_fail,
			[107] = qht_zhongji_box_suc,
			[108] = qht_zhongji_box_fail,
			[109] = qht_gaoji_box_suc,
			[110] = qht_gaoji_box_fail,
			[111] = zq_battle_song_lingqi_suc,
			[112] = zq_battle_song_lingqi_fail,
			[113] = zq_battle_liao_lingqi_suc,
			[114] = zq_battle_liao_lingqi_fail,
			[115] = vet_201305_refinedan_suc,
			[116] = vet_201305_refinedan_fail,
			[117] = tm_use_siling_keyin_suc,
			[118] = tm_use_siling_keyin_fail,
			[119] = eyt_open_flag_suc,
			[120] = eyt_open_flag_fail,
			--the max table index is 255
	}
	if deal_flag == 1 then
		deal_action_total[deal_suc]();
	else
		deal_action_total[deal_fail]();
	end;
end

--=====================2007Äê´º½Ú»ªÉ½¾º¼¼»î¶¯=========================
--***********************¿ª±¦Ïä³É¹¦´¦Àíº¯Êý****************************
function af_spring_huashan_open_suc()
	if IsTongMember() == 0 then
		Say("Ph¶i gia nhËp bang héi míi nhÆt ®­îc b¶o r­¬ng!", 0)
		return
	end

	local npc_index = GetGlbValue(501)
	if npc_index == 0 or GetNpcName(npc_index) ~= "B¶o r­¬ng Hoa s¬n" then			--ÅÐ¶ÏÏä×ÓÊÇ·ñ´æÔÚ
		return
	end
	SetUnitCurStates(npc_index,2,1)
	SetUnitCurStates(npc_index,4,zgc_pub_day_turn(1))						--´æÈë½ñÌìÊ±¼ä
	SetNpcLifeTime(npc_index,0)

--	local player_sex = GetSex()
	local add_flag = 0
	local prize_name = ""
	local nRandom = random(1,100)
	
	if nRandom <= 50 then
		add_flag = AddItem(0,102,15,1,1,2,24,3,14,0,0)
		prize_name = "Hång PhØ Thóy Hé Th©n Phï"
	else
		add_flag = AddItem(0,102,20,1,1,2,24,3,14,0,0)
		prize_name = "Toµn Th¹ch Giíi ChØ"
	end
	--½±ÀøÔö¼ÓÊÇ·ñ³É¹¦µÄÏà¹Ø´¦Àí
	if add_flag == 1 then
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc: "..prize_name.."!")
		Msg2SubWorld(format("%s ®· ®o¹t ®­îc b¶o r­¬ng Hoa S¬n, trong b¶o r­¬ng cã chøa: %s ", GetName(), prize_name))
		WriteLogEx("Bang hoi tinh anh","nhËn","1",prize_name,"",GetTongName())
	else
		WriteLog("[Ho¹t ®éng bang héi tinh anh] : ".."Ng­êi ch¬i "..GetName().." NhËn ®­îc phÇn th­ëng:"..prize_name.." Thªm thÊt b¹i, ký hiÖu:"..add_flag)
	end

	local tBook =
	{
		[1] = {"Chiªm Y Phæ",	0,	107,	66,	1,	},
		[2] = {"Tö Hµ MËt tÞch",	0,	107,	65,	1,	},
		[3] = {"Thiªn Hµ MËt tÞch",	0,	107,	64,	1,	},
	}

	for i=1, getn(tBook) do
		add_item_first_tong(tBook[i])
	end

	local tWeapon =
	{
		[1] = {"§¹i Hµo L«i Th­¬ng",	0,	6,	108,	130,	},
		[2] = {"ThÇn Cung",		0,	4,	119,	130,	},
		[3] = {"V¹n NhÉn",		0,	0,	14,		220,	},
		[4] = {"A La H¸n Tr­îng",	0,	8,	97,		100,	},
		[5] = {"Cæ §Ýnh",		0,	3,	64,		200,	},
		[6] = {"LiÖt DiÖm",		0,	5,	40,		200,	},
		[7] = {"ThÇn Hµnh",		0,	9,	86,		130,	},
		[8] = {"Háa Tinh",		0,	2,	36,		90,		},
		[9] = {"Hi Nh©n CÇm",	0,	10,	75,		140,	},
		[10] = {"M·nh hæ",		0,	11,	12,		200,	},
		[11] = {"L¨ng Phong",		0,	7,	12,		200,	},
		[12] = {"M·n Thiªn Hoa Vò",	0,	1,	53,		130,	},
	}
	local tAttribute =
	{
		[1]  	= {28,	100, 	{{5,500}, {6,300}, {7,200}}},
		[2]  	= {41,	80, 	{{5,800}, {6,200}}},
		[3]  	= {42,	80, 	{{5,800}, {6,200}}},
		[4]  	= {63,	20, 	{{5,900}, {6,95}, {7,5}}},
		[5]  	= {64,	20, 	{{5,900}, {6,95}, {7,5}}},
		[6]  	= {7, 		50, 	{{5,700}, {6,250}, {7,50}}},
		[7] 	= {94,	70, 	{{5,500}, {6,300}, {7,200}}},
		[8]  	= {95,	70, 	{{5,500}, {6,300}, {7,200}}},
		[9]  	= {96,	70, 	{{5,500}, {6,300}, {7,200}}},
		[10] 	= {97,	70, 	{{5,500}, {6,300}, {7,200}}},
		[11] 	= {98,	70, 	{{5,500}, {6,300}, {7,200}}},
		[12] 	= {69,	80, 	{{5,500}, {6,300}, {7,200}}},
		[13] 	= {99,	80,	{{2,700}, {3,300}}},
		[14] 	= {30,	50, 	{{5,500}, {6,300}, {7,200}}},
		[15] 	= {50,	20, 	{{6,500}, {7,500}}},
		[16] 	= {49,	20, 	{{6,500}, {7,500}}},
		[17] 	= {102,	15,	{{5,800}, {6,200}}},
		[18] 	= {27,	15, 	{{3,950}, {4,50}}},
		[19] 	= {85,	10, 	{{3,600}, {4,400}}},
		[20] 	= {86,	10, 	{{3,600}, {4,400}}},
	}
	local nRandomWeapon = random(1, getn(tWeapon))
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}

	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib(tAttribute,nPerTurn)
		nPerTurn = nPerTurn - tAttribute[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib(tAttribute[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute[nRandomAttr][1]
		tremove(tAttribute, nRandomAttr)
	end
	
	add_flag = AddItem(tWeapon[nRandomWeapon][2],tWeapon[nRandomWeapon][3],tWeapon[nRandomWeapon][4],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon[nRandomWeapon][1]
	if add_flag == 1 then
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc: "..prize_name.."!")
		Msg2SubWorld(format("%s ®· ®o¹t ®­îc b¶o r­¬ng Hoa S¬n, trong b¶o r­¬ng cã chøa: %s ", GetName(), prize_name))
		WriteLogEx("Bang hoi tinh anh","nhËn","1",prize_name,"",GetTongName())
	else
		WriteLog("[Ho¹t ®éng bang héi tinh anh] : ".."Ng­êi ch¬i "..GetName().." NhËn ®­îc phÇn th­ëng:"..prize_name.." Thªm thÊt b¹i, ký hiÖu:"..add_flag)
	end

	local nDateStart = tonumber(date("%y%m%d"))		--¼ÇÂ¼°ïÖÚ¿ÉÒÔÁì½±µÄÆðÊ¼Ê±¼ä
	local nPrizeFlag = 1							--¼ÇÂ¼°ïÖ÷ÊÇ·ñ¿ÉÒÔÁìÈ¡½±Àø(Ö»ÄÜÁìÈ¡Ò»´Î£¬ÁìÈ¡½±Àøºó¼´ÉèÖÃÎª0)
	AddRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "", 0, "0", "dds", nDateStart, nPrizeFlag, GetTongName())
	
	--´´½¨Ê¤ÀûÕßÆìÖÄ	
	local flag_index = CreateNpc("Tiªu s­-®èi tho¹i",GetTongName(),GetWorldPos())
	SetNpcLifeTime(flag_index,21600)
	
	Msg2Global("Ho¹t ®éng bang héi tinh anh ®· kÕt thóc, bang héi tinh anh lÇn nµy lµ:  "..GetTongName())
	mf_Talk2Camp(46, 0, "Ho¹t ®éng bang héi tinh anh ®· kÕt thóc, bang héi tinh anh lÇn nµy lµ:  "..GetTongName());
	for i=1, 3 do
		AddGlobalNews("Ho¹t ®éng bang héi tinh anh ®· kÕt thóc, bang héi tinh anh lÇn nµy lµ:  "..GetTongName())
	end

	mf_SetMissionV(46,7,1,969)
	mf_SetMissionV(46,1,3,969)
	WriteLogEx("Bang hoi tinh anh","më b¶o r­¬ng thµnh c«ng","","","",GetTongName())
end

function get_random_attrib(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][2]
		if nRandom <= nBase then
			return i			
		end
	end	
end

function add_item_first_tong(tItem)
	local szLogTitle = "[Ho¹t ®éng bang héi tinh anh] : "
	local nRetCode = AddItem(tItem[2],tItem[3],tItem[4],tItem[5]);
	if nRetCode == 1 then
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc: "..tItem[1].."!")
		WriteLog(szLogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." c¸i "..tItem[1]);
	else
		WriteLog(szLogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." c¸i "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

--***********************¿ª±¦ÏäÊ§°Ü´¦Àíº¯Êý****************************
function af_spring_huashan_open_fail()
	local npc_index = GetGlbValue(501)
	if npc_index == 0 or GetNpcName(npc_index) ~= "B¶o r­¬ng Hoa s¬n" then
		return
	end
--	SetUnitCurStates(npc_index,2,0)
end

--***************°ï»á×ÊÔ´±£»¤ÈÎÎñÏä×Ó¿ªÆô£¨³É¹¦£©**********************
function af_conf_resource_open_suc()
	local npc_index = GetTaskTemp(TasktempID_npc_index)			--»ñÈ¡NPCË÷Òý
	if GetNpcName(npc_index) ~= "B¶o r­¬ng Tµi nguyªn" then
		return
	end
	if GetFightState() == 0 then
		return
	end
	if GetPKFlag() == 0 then
		Talk(1,"","B¹n ph¶i ë tr¹ng th¸i chiÕn ®Êu míi cã thÓ më r­¬ng.")
		return
	end
	SetUnitCurStates(npc_index,box_open_week_ID,zgc_pub_day_turn(7))
	SetUnitCurStates(npc_index,box_belong_ID,1)
	--°Ñ¶ÔÓ¦µØ·½µÄÇ®¼õÉÙ
	local mapid = GetWorldPos()
	local map_2_city = Tb_map_2_city[mapid]
	if map_2_city == nil then
		return
	end
	if AddCityBoxCount(map_2_city,-1) == 1 then
		if random(1,100) <= 33 then
			Earn(1000000)
			Msg2Player("B¹n ®· më ®­îc B¶o r­¬ng, nhËn ®­îc 100 vµng!")
			WriteLogEx("Cong Thanh Chien","Më R­¬ng Tµi Nguyªn",100,"vµng")
		else
			local nRet, nItemIdx = AddItem(2,1,1210,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,24*60*60)
				Msg2Player("B¹n ®· më ®­îc B¶o r­¬ng, nhËn ®­îc B¶o r­¬ng Tµi nguyªn!")				
			end
			WriteLogEx("Cong Thanh Chien","Më R­¬ng Tµi Nguyªn",1,"B¶o r­¬ng Tµi nguyªn")
		end
		Msg2SubWorld("Ng­êi ch¬i: "..GetName().." Më B¶o r­¬ng Tµi nguyªn thµnh c«ng!")
		local flag_index = CreateNpc("Tiªu s­-®èi tho¹i","Ng­êi më:"..GetName(),GetNpcWorldPos(npc_index))
		SetNpcLifeTime(flag_index,21600)	
	end
end
--***************°ï»á×ÊÔ´±£»¤ÈÎÎñÏä×Ó¿ªÆô£¨Ê§°Ü£©**********************
function af_conf_resource_open_fail()
	local npc_index = GetTaskTemp(TasktempID_npc_index)			--»ñÈ¡NPCË÷Òý
	SetUnitCurStates(npc_index,box_belong_ID,1)
	SetUnitCurStates(npc_index,box_open_time_ID,0)
	SetTaskTemp(TasktempID_npc_index,0)
end

function open_newres_success()
	local npc_index = GetTaskTemp(TSK_TMP_NEWRES)
	if GetNpcName(npc_index) == "" then
		return
	end
	if GetFightState() == 0 then
		return
	end	
	SetUnitCurStates(npc_index,box_belong_ID,1)	
	local mapid = GetWorldPos()	
	if mapid ~= 606 then
		return
	end
	award_point()
end

function open_newres_failed()
	local npc_index = GetTaskTemp(TSK_TMP_NEWRES)
	SetUnitCurStates(npc_index,box_belong_ID,1)
	SetUnitCurStates(npc_index,box_open_time_ID,0)
	SetTaskTemp(TSK_TMP_NEWRES,0)
end

function award_point()
	local nChuyenSinh = GetTranslifeCount()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nLev_GetExp = 0
	local nMapID1, nX1, nY1 = GetWorldPos()
	local nMapID2, nX2, nY2 = 0,0,0
	local nTeamSize = GetTeamSize();
	local nTimeBegin = GetTask(TSK_TIME_KICHHOAT_TNC) -- thªm tªn task 2285
	local nRemain = GetTime() - nTimeBegin
	nRemain = 60 - floor(nRemain/60)
	if nRemain < 0 then
		nRemain = 0
	end
	if nPhucSinh >= 1 then
		nLev_GetExp = 5*100 + nPhucSinh*120 + GetLevel()
	else
		nLev_GetExp = nChuyenSinh*100 + GetLevel()
	end
	
	local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
	if nTeamSize == 0 or nTeamSize == 1 then		
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
			local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)--GetTask(TSK_NEWRES_POINT)
			if nPoint < 2500 then
				if 0 < nRemain then
					SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1 * nTypeDouble)
					ModifyExp(nLev_GetExp * 8 * nTypeDouble)
					Msg2Player("Thêi gian hç trî cßn l¹i lµ: "..nRemain.." phót")
				else
					SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1)
					ModifyExp(nLev_GetExp * 8)
				end
			end
			nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)--GetTask(TSK_NEWRES_POINT)
			if nPoint < 2500 then
				Msg2Player("TÝch lòy thu thËp: "..nPoint.."/2500")
			else
				Msg2Player("TÝch lòy thu thËp: 2500/2500")
			end
			if nPoint >= 2500 then
				gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,2)
				TaskTip("B¹n ®· hoµn thµnh nhiÖm vô thu thËp tµi nguyªn.")
				WriteLogEx("TL TNChien","Hoµn thµnh nhiÖm vô")
			end
		end
	else
	    	local nOldIndex = PlayerIndex;
	    	for i = 1, nTeamSize do
	     		PlayerIndex = GetTeamMember(i);
	     		nMapID2, nX2, nY2 = GetWorldPos()
	     		if nMapID2 == 606 and GetFightState()== 1 then
	     			if IsPlayerDeath() == 0 then
		     			if DistanceBetweenPoints(nMapID1, nX1, nY1, nMapID2, nX2, nY2) <= 23 then
				        	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
				        		local nTypeDoublePT = floor(GetTask(TSK_NEWRES_POINT)/10000)
							local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000) --GetTask(TSK_NEWRES_POINT)
							local nTimeBeginPT = GetTask(TSK_TIME_KICHHOAT_TNC) -- thªm tªn task 2285
							local nRemainPT = GetTime() - nTimeBeginPT
							nRemainPT = 60 - floor(nRemainPT/60)
							if nRemainPT < 0 then
								nRemainPT = 0
							end
							local nChuyenSinh_mem = GetTranslifeCount()
							local nPhucSinh_mem = GetPlayerRebornParam(0)
							local nLev_GetExp_mem = 0
							if nPhucSinh_mem >= 1 then
								nLev_GetExp_mem = 5*100 + nPhucSinh_mem*120 + GetLevel()
							else
								nLev_GetExp_mem = nChuyenSinh_mem*100 + GetLevel()
							end
							if nPoint < 2500 then
								if 0 < nRemainPT then
									SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) + (1 * nTypeDoublePT - 1))
									ModifyExp(nLev_GetExp_mem * 8 * ( nTypeDoublePT - 1))
									Msg2Player("Thêi gian hç trî cßn l¹i lµ: "..nRemainPT.." phót")
								end
								SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1)
								ModifyExp(nLev_GetExp_mem * 8)							
							end
							nPoint = mod(GetTask(TSK_NEWRES_POINT),10000) --GetTask(TSK_NEWRES_POINT)
							if nPoint < 2500 then
								Msg2Player("B¹n ®· thu thËp thµnh c«ng: "..nPoint.."/2500")
							else
								Msg2Player("B¹n ®· thu thËp thµnh c«ng: 2500/2500")
							end
							if nPoint >= 2500 then
								gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,2)
								TaskTip("B¹n ®· hoµn thµnh nhiÖm vô thu thËp tµi nguyªn.")
								WriteLogEx("TL TNChien","Hoµn thµnh nhiÖm vô")
							end
						end
					end
				end
			end
		end
	    	PlayerIndex = nOldIndex;
	end
end

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end;


function af_killer_hall_open_box_suc()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	local sNpcName = GetNpcName(nNpcIdx);
	if sNpcName == "H­¬ng chñ B¶o r­¬ng" then
		KH_Give_Award(NPC_TYPE_XIANGZHU);
	elseif sNpcName == "Phã §­êng Chñ B¶o R­¬ng" then
		KH_Give_Award(NPC_TYPE_FUTANGZHU);	
	elseif sNpcName == "Lý §¹i Chñy B¶o R­¬ng" then
		KH_Give_Award(NPC_TYPE_LIDAZUI);
	else
		WriteLog("[S¸t Thñ ®­êng b¸o lçi]: Lóc më r­¬ng ph¸t hiÖn tªn Npc sai:"..tostring(sNpcName));
	end;
end;

function af_killer_hall_open_box_fail()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	KH_SetUnit_CurStates(nNpcIdx,2,0)
end;
function af_arrest_finish()
	if GetTaskTemp(10) ~= 2132 then		-- ÕâÀï×öÒ»ÏÂÅÐ¶Ï£¬·ñÔòºÜÓÐ¿ÉÄÜÊÇ¿Í»§¶ËËæÒâ·¢ÉÏÀ´µÄÊý¾Ý
		return
	end
	SetTaskTemp(10, 0)
	local szSelfName = GetName()
	-- Ãû²¶ÊÇÄÄ¸ö°ïÅÉµÄ
	local szTixiaTong = GetTongName()
	if IsTongMember() == 0 then
		szTixiaTong = ""
	end
	-- ×ö¾àÀëÅÐ¶Ï
	local nSelfMapID, nSelfX, nSelfY = GetWorldPos()
	local nTarMapID, nTarX, nTarY
	if GetItemCount(2,1,1211) <= 0 then
		Msg2Player("Ph¶i cã 1 Thµnh §« TÇm N· LÖnh míi cã thÓ truy n·.")
		return
	end
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTask(450)
	if PlayerIndex > 0 then
		nTarMapID, nTarX, nTarY = GetWorldPos()
		local nDist = distance_between_points(nSelfMapID, nSelfX, nSelfY, nTarMapID, nTarX, nTarY)
		if nDist ~= -1 and nDist <= 20 then	-- ÔÚÓÐÐ§¾àÀëÖ®ÄÚ
			-- ×¥µ½ÀÎÀïÃæÈ¥
			if IsPlayerDeath() > 0 then			-- Èç¹ûÊÇËÀµÄ£¬ÏÈÔ­µØ»îÁËÔÙ·É
				RevivePlayer(0)
			end
			
			local nPrisonMap = citywar_get_throw_where()
			print("nPrisonMap = "..nPrisonMap)
			if nPrisonMap ~= nil and nPrisonMap > 0 then
				CleanInteractive()
				if NewWorld(nPrisonMap, tCityWarPrisonPos[1], tCityWarPrisonPos[2]) == 1 then
					SetPlayerRevivalPos(nPrisonMap, nPrisonMap)
					
					StallEnable(0)	-- ²»ÄÜ°ÚÌ¯
					ForbidRead(1)	--²»ÄÜÐÞÊé
					UseScrollEnable(0)	--½ûÖ¹Ê¹ÓÃ»Ø³Ç
					SetFightState(0)	-- Õ½¶·×´Ì¬
					CreateTrigger(1, 1109, CITYWAR_STEP_TRIGGER)		-- ÀÎ·¿Ê±¼ä¼Æ²½Æ÷
					ContinueTimer(GetTrigger(CITYWAR_STEP_TRIGGER))
					-- ¸ù¾Ý±»×¥µÄÒ»Ë²¼äÅÐ¶ÏÒª½»¶àÉÙÇ®
					local nPay = 0
					local nRet = IsTongMember()
					if nRet == 0 then								-- ÎÞ°ïÅÉ
						nPay = 1
					elseif nRet == 1 or nRet == 2 or nRet == 3 then	-- °ïÖ÷,¸±°ïÖ÷ºÍ³¤ÀÏ
						nPay = 100
					elseif nRet == 4 then
						nPay = 50
					elseif nRet == 5 then
						nPay = 10
					elseif nRet ~= 0 then
						nPay = 3
					end
					
					-- Èç¹ûÊÇ70¼¶Ò»ÏÂ,¾Í²»ÓÃ½»Ç®
					if GetLevel() < 70 then
						nPay = 0
					end
					CustomDataSave("tongcitywar_arrest_tong", "sd", szTixiaTong, nPay)	--  ¼ÇÂ¼×¥ÄãÃû²¶ËùÊôµÄ°ï»áºÍÐèÒª½»¶àÉÙÇ®
					Msg2Player("B¹n bÞ "..szSelfName.."Truy n·")
					PlayerIndex = nOldPlayer
					DelItem(2,1,1211,1)
				end
			end
		else
			Msg2Player("B¹n ®· trèn tho¸t thµnh c«ng sö truy n· cña "..szSelfName..". ")
			PlayerIndex = nOldPlayer
			Msg2Player("Môc tiªu kh«ng ë trong ph¹m vi hiÖu lùc, truy n· thÊt b¹i")
		end
	end
	PlayerIndex = nOldPlayer
end

function af_arrest_fail()
	if GetTaskTemp(10) ~= 2132 then
		return
	end
	SetTaskTemp(10, 0)
	local szSelfName = GetName()
	Msg2Player("Truy n· bÞ gi¸n ®o¹n, truy n· thÊt b¹i")
	local nOldPlayer = PlayerIndex
	-- 
	PlayerIndex = GetTask(450)
	Msg2Player("B¹n ®· trèn tho¸t thµnh c«ng sö truy n· cña "..szSelfName..". ")
	PlayerIndex = nOldPlayer
end
--=================°ï»á²½·ÇÑÌÈÎÎñ±¦ÏäÊ°È¡»úÖÆÐÞ¸Ä================
function conf_task_open_suc()
		local npc_index = GetTaskTemp(166) 
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		local add_flag_total = 0
		local npc_name = GetNpcName(npc_index)
		if npc_name == "R­¬ng cña C«n L«n N« ®Ó l¹i" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,526,1)
			if add_flag == 0 then
				WriteLog("NhiÖm vô BOSS ngÉu nhiªn bang héi: C«n L«n N« bá l¹i r­¬ng thÊt b¹i, ký hiÖu:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R­¬ng cña Bïi Hµng ®Ó l¹i" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,527,1)
			if add_flag == 0 then
				WriteLog("NhiÖm vô BOSS ngÉu nhiªn bang héi: Bïi Hµng bá l¹i r­¬ng thÊt b¹i, ký hiÖu:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R­¬ng cña LiÔu NghÞ ®Ó l¹i" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,528,1)
			if add_flag == 0 then
				WriteLog("NhiÖm vô BOSS ngÉu nhiªn bang héi: LiÔu NghÞ bá l¹i r­¬ng thÊt b¹i, ký hiÖu:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R­¬ng cña Hång TuyÕn ®Ó l¹i" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,529,1)
			if add_flag == 0 then
				WriteLog("NhiÖm vô BOSS ngÉu nhiªn bang héi: Hång TuyÕn bá l¹i r­¬ng thÊt b¹i, ký hiÖu:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R­¬ng s¾t cña H¹ C¶nh Th¾ng" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,530,1)
			if add_flag == 0 then
				WriteLog("NhiÖm vô BOSS ngÉu nhiªn bang héi: Thªm r­¬ng s¾t H¹ C¶nh Th¾ng thÊt b¹i, ký hiÖu:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R­¬ng s¾t cña NhiÕp §¹i Chïy" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,531,1)
			if add_flag == 0 then
				WriteLog("NhiÖm vô BOSS ngÉu nhiªn bang héi: Thªm r­¬ng s¾t NhiÕp §¹i Chïy thÊt b¹i, ký hiÖu:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "B¶o r­¬ng cña Bé Phi Yªn" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,532,1)
			if random(1,100) <= 30 then
				AddItem(2,1,30130,2)
				SendTongMessage(GetName().." NhÆt ®­îc 2 Phi Yªn Th¹ch.")
				WriteLogEx("Mo ruong Bo Phi Yen","nhËn",2,"Phi Yªn Th¹ch")
			end			
			AddItem(2,1,30071,1)
			SendTongMessage(GetName().." NhÆt ®­îc 1 Nh©m S©m V¹n N¨m.")
			WriteLogEx("Mo ruong Bo Phi Yen","nhËn",1,"Nh©m S©m V¹n N¨m")
			if add_flag == 0 then
				WriteLog("NhiÖm vô BOSS ngÉu nhiªn bang héi: Thªm B¸ch B¶o r­¬ng Bé Phi Yªn thÊt b¹i, ký hiÖu:"..add_flag)
			else
				add_flag_total = 1
				AddGlobalNews(GetTongName().."H¹ gôc Bé Phi Yªn nhËn ®­îc B¸ch B¶o r­¬ng!")
			end
		end
		if add_flag_total == 1 then
			SendTongMessage(GetName().." NhÆt ®­îc "..npc_name..".")
			Msg2SubWorld(GetTongName().." Bang héi: "..GetName().." NhÆt ®­îc "..npc_name..".")
			WriteLog("NhiÖm vô Bé Phi Yªn: Ng­êi ch¬i ["..GetName().."] t¹i Map :"..GetWorldPos() .."NhÆt ®­îc "..npc_name)
		end
end

function conf_task_open_fail()
	local npc_index = GetTaskTemp(166) 
	SetUnitCurStates(npc_index,Box_belong_ID,0)
end
--=================Î÷±±Çø¹Ø¿¨µÚËÄ¹ØÒ©²Ý°Î³ý======================
Tb_stage4_buff_info = {
	{61210625,60,21},
	{61210626,60,22},
	{61210627,60,23},
	{61210628,60,24},
	{61210629,60,25},
}
--°Î³ý³É¹¦
function northwest_stage4_grass_suc()
	local grass_index = GetTaskTemp(grass_index_TasktempID)
	if grass_index_chk(grass_index) ~= 1 then
		return
	end
	SetNpcLifeTime(grass_index,0)
	local num_now = GetTask(grass_kill_num)+1
	SetTask(grass_kill_num,num_now)
	--¸ºÃæbuffÔö¼Óº¯Êý
	local poision_level = num_now/5
	if mod(poision_level,1) == 0 then
		if poision_level > 5 then
			poision_level = 5 
		end
		--¼Óbuff
		CastState("state_diffuse_skill_effect",Tb_stage4_buff_info[poision_level][1],-1,1,19801223)
		AddTitle(Tb_stage4_buff_info[poision_level][2],Tb_stage4_buff_info[poision_level][3])
		SetCurTitle(Tb_stage4_buff_info[poision_level][2],Tb_stage4_buff_info[poision_level][3])
		Msg2Player("B¹n ®· h¸i ®­îc "..num_now.." 'D­îc Nh©n Th¶o', ®éc cña D­îc Nh©n Th¶o ®· thÊm vµo ng­êi b¹n!")
	else--Î´ÖÐ¶¾¶Ô»°
		Msg2Player("B¹n ®· h¸i ®­îc "..num_now.." 'D­îc Nh©n Th¶o', sè l­îng h¸i cµng nhiÒu ®éc tróng cµng nÆng, h·y cÈn thËn!")
	end
end
--°Î³ýÊ§°Ü
function northwest_stage4_grass_fail()
	local grass_index = GetTaskTemp(grass_index_TasktempID)
	if grass_index_chk(grass_index) ~= 1 then
		return
	end
	SetUnitCurStates(grass_index,grass_id_state,0)
end
--²ÝË÷Òý¼ì²âº¯Êý
function grass_index_chk(grass_index)
	if grass_index == 0 then
		return 0
	elseif GetNpcName(grass_index) ~= "D­îc Nh©n Th¶o" then
		return 0
	else
		return 1
	end
end

tlucky_award = {
				{"V¹n VËt Quy Nguyªn §¬n", 909, {1,0,11,1}, 0},
				{"H¾c Ngäc §o¹n Tôc Cao", 909, {1,0,6,1}, 0},
				{"Sinh Sinh Hãa T¸n", 909,{1,0,16,1}, 0},
				{"Ma §ao Th¹ch C©p 1", 789, {2,1,30428,1}, 15*24*60*60},
				{"Ma §ao Th¹ch C©p 2", 312, {2,1,30429,1}, 15*24*60*60},	
				{"Ma §ao Th¹ch C©p 3", 99, {2,1,30430,1}, 15*24*60*60},			
				{"B¨ng Th¹ch", 600, {2,1,149,1}, 0},			
				{"M¶nh B¨ng Th¹ch", 1464, {2,1,148,1}, 0},	
				{"Cæ Linh Th¹ch", 100, {2,1,30368,1}, 0},	
				{"Cæ Linh Ngäc", 100, {2,1,30369,1}, 0},	
				{"M¶nh Thiªn Cang", 253, {2,1,30390,1}, 0},
				{"Méc R­¬ng", 3553, {2,1,30340,1}, 0},
				{"Thiªn Th¹ch Linh Th¹ch", 1, {2,1,1068,1}, 7*24*60*60},
				{"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", 1, {2,1,1067,1}, 7*24*60*60},
				{"§¹i §Þnh Hån", 1, {2,1,1113,1}, 7*24*60*60},								
		}

-------------------------Quay sè Ingame-----------------------------------------------

tbAwardQuaySo  = {
	[1] = {[1] = {nCheckExp = 0, nExp = 5000000}, nRate = 30.00},
	[2] = {[1] = {nCheckExp = 0,nExp = 10000000}, nRate = 12.00},
	[3] = {[1] = {nCheckExp = 0,nExp = 20000000}, nRate = 5.00},
	[4] = {[1] = {nCheckExp = 0,nExp = 50000000}, nRate = 3.00},
	[5] = {[1] = {nCheckExp = 0,nExp = 100000000}, nRate = 2.00},
	[6] = {[1] = {nDanhvong = 100}, nRate = 15.00},
	[7] = {[1] = {nSumon = 100}, nRate = 15.00},
	[8] = {[1] = {nQuancong = 3000}, nRate = 5.00},
	[9] = {[1] = {item={{gdp={2,1,30497,10,4}, name = "Ma Tinh"}}}, nRate = 5.00},
	[10] = {[1] = {item={{gdp={2,1,149,1,1}, name = "B¨ng Th¹ch"}}}, nRate = 2.00},
	[11] = {[1] = {item={{gdp={2,1,30428,1,1}, name = "Ma §ao Th¹ch cÊp 1", nExpired = 7*24*3600}}}, nRate = 2.00},
	[12] = {[1] = {item={{gdp={2,1,30429,1,1}, name = "Ma §ao Th¹ch cÊp 2", nExpired = 7*24*3600}}}, nRate = 2.00},
	[13] = {[1] = {item={{gdp={2,1,1009,1,1}, name = "Thiªn Th¹ch Tinh Th¹ch"}}}, nRate = 1.50},
	[14] = {[1] = {item={{gdp={2,1,1000,1,1}, name = "Bµn Long BÝch", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[6] = {[1] = {item={{gdp={2,1,30523,1,1}, name = "CÊp 3 TÈy T©m Th¹ch"}}}, nRate = 5.00},
--	[7] = {[1] = {item={{gdp={2,1,30529,1,1}, name = "CÊp 3 LuyÖn L« ThiÕt"}}}, nRate = 5.00},
--	[8] = {[1] = {item={{gdp={2,1,30534,1,1}, name = "ThiÕt Tinh cÊp 2"}}}, nRate = 5.00},
--	[9] = {[1] = {item={{gdp={2,1,30535,1,1}, name = "ThiÕt Tinh cÊp 3"}}}, nRate = 5.00},	
--	[11] = {[1] = {item={{gdp={2,1,30426,1,1}, name = "C­êng Hãa QuyÓn 14", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[12] = {[1] = {item={{gdp={2,1,30427,1,1}, name = "C­êng Hãa QuyÓn 15", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[17] = {[1] = {item={{gdp={2,1,30430,1,1}, name = "Ma §ao Th¹ch cÊp 3", nExpired = 7*24*3600}}}, nRate = 2.00},
--	[21] = {[1] = {item={{gdp={2,1,3356,1,1}, name = "Tói Thiªn Th¹ch Tinh Th¹ch", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[22] = {[1] = {item={{gdp={2,1,1051,1,1}, name = "Bao Thiªn Th¹ch Tinh Th¹ch", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[24] = {[1] = {item={{gdp={2,1,1001,1,1}, name = "Hßa ThÞ BÝch", nExpired = 7*24*3600}}}, nRate = 0.50},
}
--VET_2012_QUAYSOINGAME  = {
--	{1, 555, "C­êng Hãa QuyÓn 12", {2,1,30424, 1}, 15* 24 * 3600},
--	{1, 666, "C­êng Hãa QuyÓn 13", {2,1,30425, 1}, 15* 24 * 3600},
--	{1, 777, "C­êng Hãa QuyÓn 14", {2,1,30426, 1}, 15* 24 * 3600},	
--	{1, 888, "C­êng Hãa QuyÓn 15", {2,1,30427, 1}, 15* 24 * 3600},	
--	{1, 3003, "6 Méc R­¬ng", {2,1,30340, 6}, 0},	
--	{1, 1616, "6 Tói tiÒn", {2,1,30367, 6}, 0},	
--	{1, 1234, "M¶nh Thiªn Cang", {2,1,30390, 1}, 0},
--	{1, 1234, "M¶nh Thiªn M«n", {2,1,30410, 1}, 0},
--	{1, 22, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2,1,1067, 1}, 7* 24 * 3600},
--	{1, 5, "§¹i §Þnh Hån", {2,1,1113, 1}, 7*24*60*60},				
--}
-- MËt tÞch cao cÊp 
VET_2012_GAOJIMIJI = {
	{1, 988, "Kim Cang B¸t Nh· Ch©n QuyÓn ", {0, 107, 204, 1}, 0},
	{1, 368, "TiÒm Long Tóc DiÖt Ch©n QuyÓn", {0, 107, 205, 1}, 0},
	{1, 714, "V« TrÇn Bå §Ò Ch©n QuyÓn", {0, 107, 206, 1}, 0},
	{1, 888, "Thiªn La Liªn Ch©u Ch©n QuyÓn", {0, 107, 207, 1}, 0},
	{1, 348, "Nh­ ý Kim §Ønh Ch©n QuyÓn", {0, 107, 208, 1}, 0},
	{1, 524, "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn", {0, 107, 209, 1}, 0},
	{1, 888, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn", {0, 107, 210, 1}, 0},
	{1, 888, "Quú Thiªn Du Long Ch©n QuyÓn", {0, 107, 211, 1}, 0},
	{1, 668, "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn", {0, 107, 212, 1}, 0},
	{1, 714, "Qu©n Tö §íi Phong Ch©n QuyÓn", {0, 107, 213, 1}, 0},
	{1, 568, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn", {0, 107, 214, 1}, 0},
	{1, 668, "Xuyªn V©n L¹c Hång Ch©n QuyÓn", {0, 107, 215, 1}, 0},
	{1, 888, "HuyÒn Minh Phong Ma Ch©n QuyÓn", {0, 107, 216, 1}, 0},
	{1, 888, "Linh Cæ HuyÒn Tµ Ch©n QuyÓn", {0, 107, 217, 1}, 0},
	{1, 0, "Cöu Thiªn Phong L«i Ch©n QuyÓn", {0, 107, 218, 1}, 0},
	{1, 0, "Hång TrÇn Tóy Méng Ch©n QuyÓn", {0, 107, 222, 1}, 0},
	{1, 0, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn", {0, 107, 223, 1}, 0},
}

function VIET_Give70GaojiMiji()
	gf_EventGiveRandAward(VET_2012_GAOJIMIJI,10000,1)
end
--------------------------------------------------------------------
	
--TSK_LUCKY_DRAW = 1539

function confirm_lucky_award_suc()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	if nExtVal <= 0 then
		Talk(1, "", szNpcName.."Sè lÇn nhËn th­ëng may m¾n cña c¸c h¹ kh«ng cßn.");
		return
	end
	
	if gf_JudgeRoomWeight(1,100,szNpcName) == 0 then
		return
	end
	
	if PayExtPoint(EXT_QUAYSOINGAME,1) == 1 then
--		SetTask(TSK_LUCKY_DRAW, GetTask(TSK_LUCKY_DRAW) + 1)
		LIB_Award.szLogTitle = "QUAY SO IN GAME 201312"
		LIB_Award.szLogAction = "nhËn"
		LIB_Award:AwardByRate(tbAwardQuaySo)
	end
end

function confirm_lucky_award_fail()
end

function confirm_translife_suc()
	Say("Chóc mõng ng­¬i ®· lÜnh héi ®­îc thªm 2 thµnh Hçn Nguyªn C«ng! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/go_exit")
end

t_dig_award_1 = {		    
	    	{1, 15, "Thiªn th¹ch", {2, 2, 8, 1}, 0},
	    	{1, 15, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
	    	{1, 25, "B¨ng th¹ch", {2, 1, 149, 1}, 0},
	    	{3, 45, 100000, 1},
}

t_dig_award_2 = {
		{1, 1, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 30*24*3600},
	    	{1, 10, "Thiªn Th¹ch Linh Th¹ch", {2, 1, 1068, 1}, 30*24*3600},
	    	{1, 5000, "Phi Yªn Th¹ch", {2, 1, 30130, 1}, 0},
	    	{1, 5000, "Tö Quang ThÇn Th¹ch", {2, 1, 30131, 1}, 0},
	    	{1, 10000, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},
	    	{3, 1, 100000000, 1},
	    	{3, 100, 10000000, 1},
	    	{3, 100000, 1000000, 1},
	    	{3, 879888, 100000, 1},	
}
	
function open_golden_chest_success()	
	local npc_index = GetTargetNpc()
	if npc_index < 0 then
		return
	end	
	local nDigCount = GetTask(2189)
	if mod(nDigCount,7) == 0 then
		local nRand = gf_GetRandItemByTable(t_dig_award_2,1000000,9)
		if t_dig_award_2[nRand][1] == 1 then
			gf_AddItemEx2(t_dig_award_2[nRand][4],t_dig_award_2[nRand][3],szHKLBLogHeader,"TÇn L¨ng b¶o tµng",t_dig_award_2[nRand][5],1)
		else
			gf_EventGiveCustomAward(t_dig_award_2[nRand][1] - 1, t_dig_award_2[nRand][3], t_dig_award_2[nRand][4] or 1, szHKLBLogHeader, "TÇn L¨ng b¶o tµng");
		end		
		if nRand >= 1 and nRand <= 4 then
			AddGlobalNews("[TÇn L¨ng B¶o Tµng] Nghe nãi ®¹i hiÖp <color=green>"..GetName().."<color> ®· may m¾n ®µo ®­îc kho b¸u <color=yellow>"..t_dig_award_2[nRand][3].."<color>, xung quanh khu vùc ®ã ch¾c ch¾n cßn rÊt  nhiÒu B¶o VËt.")
		end				
	else
		gf_EventGiveRandAward(t_dig_award_1,100,4,szHKLBLogHeader,"TÇn L¨ng b¶o tµng")
	end
end


TASK_USE_HONGBAO = 1542
BYTE_USE_DAY = 1
BYTE_USE_COUNT = 2

function open_vet_201001_hongbao_success()
	local nTaskVal = GetTask(TASK_USE_HONGBAO)
	local nDay = tonumber(date("%d"))
	if GetByte(nTaskVal,BYTE_USE_DAY) ~= nDay then
		nTaskVal = SetByte(nTaskVal,BYTE_USE_DAY,nDay)
		nTaskVal = SetByte(nTaskVal,BYTE_USE_COUNT,0)
		SetTask(TASK_USE_HONGBAO,nTaskVal)
	end
	
	nTaskByte = GetByte(GetTask(TASK_USE_HONGBAO),BYTE_USE_COUNT)
	if nTaskByte >= 8 then
		Talk(1,"","Mçi ngµy chØ cã thÓ sö dông 8 Bao l× x× may m¾n!")
		return 0;
	end
	
	SetTask(TASK_USE_HONGBAO, SetByte(GetTask(TASK_USE_HONGBAO),BYTE_USE_COUNT, nTaskByte + 1))
	
    	VET_201001_GiveHongBaoAward(GetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX));
    	SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, 0);    
end

function open_vet_201001_hongbao_failed()
    SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, 0);
end

function go_exit()
	ExitGame()
end

function gtask_WuZi_116_suc()
	shaohui_wuzi()
end

function gtask_WuZi_116_fail()
	--do_nothing
end

function ttd_talk_suc()
	SendScript2VM("\\settings\\static_script\\missions\\hunduantongtianding\\mission.lua","stageFight3:callBack()");
end

function ttd_talk_fail()
	return 0;
end

function gtask_Mfzp_80_suc()
	SendScript2VM("\\script\\task\\item\\Ãð·¨ÕóÅÌ.lua","deal_rezult()");
end

function gtask_Mfzp_80_fail()
	return 0;
end

function qht_diji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\diji_box.lua","diji_suc_call_back()");
end

function qht_diji_box_fail()
end

function qht_zhongji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\zhongji_box.lua","zhongji_suc_call_back()");
end

function qht_zhongji_box_fail()
end

function qht_gaoji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\gaoji_box.lua","gaoji_suc_call_back()");
end

function qht_gaoji_box_fail()
end

function zq_battle_song_lingqi_suc()
	SendScript2VM("\\script\\function\\zq_battles\\item\\item_song_lq.lua", "exec_transmit()");
end

function zq_battle_song_lingqi_fail()
end

function zq_battle_liao_lingqi_suc()
	SendScript2VM("\\script\\function\\zq_battles\\item\\item_liao_lq.lua", "exec_transmit()");
end

function zq_battle_liao_lingqi_fail()
end

function bkl_openbox_suc()
	SendScript2VM("\\script\\vng\\bkl_box\\bkl_box_npc.lua","bkl_box_award()");
end

function bkl_openbox_fail()
end

function  tuyetanh_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","tuyetanh_box_award()");
end

function  chieuda_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","chieuda_box_award()");
end

function  xichtho_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","xichtho_box_award()");
end

function  tuyetanh_openbox_fail()
end

function vet_201305_refinedan_suc()
	SendScript2VM("\\script\\online_activites\\201305\\refine_dan.lua", "Vet_201305_Refine_Dan_Suc()");
end

function vet_201305_refinedan_fail()
end

function tm_use_siling_keyin_suc()
	SendScript2VM("\\script\\missions\\tong_melee\\item\\siling_keyin.lua", "dowait_cb()");
end

function tm_use_siling_keyin_fail()
end

function eyt_open_flag_suc()
	SetPlayerScript("\\script\\missions\\eyt_battle\\eyt_head.lua");
	SendScript2VM("\\script\\missions\\eyt_battle\\eyt_head.lua", "eyt_OpenFlag()");
end

function eyt_open_flag_fail()
end
