--Ãæ¶ÔÉè¼ÆÎÄµµÓÐÖÖ¶ÔÉú»îÊ§È¥ÁËÐÅÐÄµÄ¸Ï½Å£¬²»Òª·ÑÁ¦Æø¸ÄÁË£¬ÖØÐ´Ò»¸ö°Ñ
Include("\\script\\function\\cdkey\\ck_define.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\activity_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")

CK_TASK_GROUP = TaskManager:Create(CK_TASK_GROUP[1], CK_TASK_GROUP[2]);
CK_TASK_GROUP.Task1 = 1 --1,2,3Î»·Ö±ð±íÊ¾ÎäÁÖÐÂÐã£¬ÀÏÕ½ÓÑ£¬»îÔ¾×Å,4-11Î»ÓÂÍùÖ±Ç°ÈÎÎñ£¬°ÙÕ½É±¹ÖÈÎÎñ12-16¼ÇÂ¼,17-21Íê³É,°ÙÕ½¸±±¾ÈÎÎñ22-26¼ÇÂ¼£¬27-31½ÓÈ¡
CK_TASK_GROUP.Task2 = 2 --°ÙÕ½¸±±¾ÈÎÎñ1-5¿É½»£¬6-10Íê³É£¬--°ÙÕ½PVPÈÎÎñ11-17¼ÇÂ¼£¬18-24½ÓÈ¡£¬25-31¿É½»
CK_TASK_GROUP.Task3 = 3 --°ÙÕ½PVPÈÎÎñ1-7Íê³É,8-10É±¹Ö¼Ó³É£¬11-13¸±±¾¼Ó³É£¬14-16pvp¼Ó³É, 17+ÊÇËÙÕ½ËÙ¾öÈÎÎñ
CK_TASK_GROUP.Task4 = 4 --ÈÎÎñ±ê¼Ç
CK_TASK_GROUP.Task5 = 5 --´ó¸»ÎÌÏû·ÑÈÎÎñ¼ÆÊý
CK_TASK_GROUP.Score = 6 --»îÔ¾¶È
CK_TASK_GROUP.Award = 7 --°´Î»±ê¼Ç½±Àø

CK_NPC_NAME = "<color=green> §¹i Sø ho¹t ®éng: <color>";
CK_NPC_TITLE = "H·y nhanh chãng mêi b¹n bÌ ®Õn cïng ch¬i trß ch¬i nµo! B¹n bÌ cµng nhiÒu th× sÏ cã thªm nhiÒu niÒm vui!";

CK_NPC_DIALOG = {
	"Giíi thiÖu ho¹t ®éng/ck_ActInfo",
	"KÝch ho¹t danh hiÖu/ck_ActTilte",
	"NhiÖm vô Dòng C¶m TiÕn Tíi/ck_TaskForward",
	"NhiÖm vô Tr¨m TrËn Tr¨m Th¾ng/ck_BaiZhanBuDai",
	"NhiÖm vô Tèc ChiÕn Tèc Th¾ng/ck_FastTask",
	"NhiÖm vô §¹i Phó ¤ng/ck_ZiloTask",
	"Xem ®iÓm n¨ng ®éng/ck_QueryScore",
	"KiÓm tra thiªn kiªu lÖnh/cdk_QueryUseTianJiaoLingNum",
	"§iÓm n¨ng ®éng ®æi phÇn th­ëng/ck_ScoreAward",
}

function cdk_QueryUseTianJiaoLingNum()
	Say(CK_NPC_NAME..format("%s tæng sè thiªn kiªu lÖnh ®· sö dông<color=gold>%d<color>!", gf_GetPlayerSexName(), ck_GetCostIB()), 0);	
end

--»î¶¯ÊÇ·ñ¿ªÆô
function ck_IsOpen()
	return gf_CheckDuration(CK_START_TIME, CK_END_TIME);		
end

function ck_IsStatus()
		local nExtPoint = GetExtPoint(EXT_CDKEY)
		if GetBit(nExtPoint,2) == 1 or GetBit(nExtPoint,4) == 1 or GetBit(nExtPoint,6) == 1 then
			--Talk(1, "", "HiÖn t¹i kh«ng cã ho¹t ®éng nµo")
			return 0
		end
		return 1
end
--Ã¿ÈÕÇåÀí
function ck_DailyReset()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	--ÖØÖÃ°ÙÕ½²»´ùÈÎÎñ
	for i = 12, 31 do
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
	end
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task2, 0); 
	for i = 1, 16 do
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
	end
	--É¾³ý°ÙÕ½²»´ùµÄÈÎÎñ
	for i = 234, 238 do
		DirectDeleteTask(i)
	end
end

--»ñµÃµ±ÌìË÷Òý
function ck_GetRandIndex(nMax)
	local today = Date();
	local wDay = today:week();
	if wDay == 0 then wDay = 7 end
	return mod(wDay, nMax) + 1;	
end

--»ñÈ¡ÀàÐÍ
function ck_GetTitleType()
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) == 1 then
		return 1;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) == 1 then
		return 2;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) == 1 then
		return 3;
	end
	return 0;
end

--»ñµÃ¹±Ï×¶È
function ck_GetCkScore()
	return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score);
end

--Ôö¼Ó»ý·Ö
function ck_AddCkScore(nAdd)
	if not nAdd or nAdd < 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Score, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) + nAdd);
	Msg2Player(format("§iÓm n¨ng ®éng t¨ng %d, tæng ®iÓm lµ %d", nAdd, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score)));
end

--»î¶¯½éÉÜ
function ck_ActInfo(nIndex)
	local strTitle = 	{
		"Trong thêi gian ho¹t ®éng, ng­êi ch¬i sÏ nhËn ®­îc danh hiÖu phï hîp víi ®iÒu kiÖn cña b¶n th©n. TÊt c¶ danh hiÖu ®Òu cã hiÖu lùc lµ 2 th¸ng, vµ khi nh©n vËt th¾p s¸ng danh hiÖu th× kh¸ng tÊt c¶ sÏ t¨ng 10 ®iÓm. Ng­êi ch¬i ph¶i kÝch ho¹t danh hiÖu míi cã thÓ nhËn nhiÖm vô. NhiÖm vô Tr¨m TrËn Tr¨m Th¾ng, mçi ngµy chØ ®­îc lµm 1 lÇn. NhiÖm vô Tèc ChiÕn Tèc Th¾ng vµ §¹i Phó ¤ng th× trong thêi gian ho¹t ®éng chØ ®­îc hoµn thµnh 1 lÇn. NhiÖm vô Tr¨m TrËn Tr¨m Th¾ng cã thÓ hoµn thµnh theo c¸ nh©n vµ tæ ®éi, nÕu tæ ®éi th× phÇn th­ëng sÏ cao h¬n. Hoµn thµnh c¸c môc nhiÖm vô sÏ nhËn ®­îc ®iÓm kinh nghiÖm vµ ®é n¨ng ®éng. TÝch lòy ®é n¨ng ®éng cã thÓ ®æi phÇn th­ëng phong phó.",
		"L·o ChiÕn H÷u vµ Ng­êi N¨ng §éng tæ ®éi tham gia nhiÖm vô Tr¨m TrËn Tr¨m Th¾ng sÏ ®­îc gi¶i cao nhÊt.",
		"NhiÖm vô Dòng C¶m TiÕn Tíi chØ xuÊt hiÖn t¹i server míi,trong server míi gamer cÊp 10 vµ ®· kÝch ho¹t danh hiÖu Vâ L©m T©n Tó míi ®­îc nhËn nhiÖm vô.Hoµn thµnh xong nhiÖm vô nµy vµ ®¹t ®Õn cÊp 90, gamer Vâ L©m T©n Tó míi ®­îc tiÕp nhËn nhiÖm vô Tr¨m TrËn Tr¨m Th¾ng,Tèc ChiÕn Tèc Th¾ng vµ §¹i Phó ¤ng.",
	}
	local tbSay = {};
	nIndex = nIndex or 1;
	local Msg = strTitle[nIndex]; 
	if Msg then
		tbSay.msg = CK_NPC_NAME..Msg;
		tbSay.sel = {
			{"\n rót lui", "nothing"},
		};
		if strTitle[nIndex + 1] then
			tinsert(tbSay.sel, 1, {"Trang kÕ", format("#ck_ActInfo(%d)", nIndex + 1)})
		end
		temp_Talk(tbSay);
	end
end

--¼¤»î³ÆºÅ
function ck_ActTilte()
	local tSay = {}
	local nCheckServer = GetGlbValue(GLB_TSK_SERVER_ID)
	if nCheckServer == 92 then	-- or nCheckServer == 91
		tinsert(tSay,"Vâ L©m T©n Tó/ck_ActTilte_1");
	else
		tinsert(tSay,"L·o ChiÕn H÷u/ck_ActTilte_2");
		tinsert(tSay,"Ng­êi N¨ng §éng/ck_ActTilte_3");
	end
	tinsert(tSay,"T«i chØ xem xem th«i/nothing");
	local msg = format("Thêi gian kÕt thóc kÝch ho¹t lµ %d/%d/%d", CK_START_ACT[3], CK_START_ACT[2], CK_START_ACT[1]);
	Say(CK_NPC_NAME..format("%s muèn kÝch ho¹t danh hiÖu nµo?<color=red>%s<color>", gf_GetPlayerSexName(), msg), getn(tSay), tSay);
end

function ck_CanAct()
	return gf_CheckDuration(CK_START_TIME, CK_START_ACT);		
end

function ck_ActTilte_1()
	local nExtPoint = GetExtPoint(EXT_CDKEY)
	if GetBit(nExtPoint,9) == 1 then
		Talk(1,"",CK_NPC_NAME .."Tµi kho¶n c¸c h¹ ®· ®­îc kÝch ho¹t råi.")
		return 0
	end
	if ck_CanAct() ~= 1 then
		Say(CK_NPC_NAME.."Thêi gian kÝch ho¹t ®· kÕt thóc,kh«ng thÓ kÝch ho¹t danh hiÖu n÷a", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Vâ L©m T©n Tó"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "L·o ChiÕn H÷u"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Ng­êi N¨ng §éng"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(1), GetExtPoint(2))
--	local nExtPoint = GetExtPoint(EXT_CDKEY)
	--if GetExtPoint(1) == 1 and GetExtPoint(2) ~= 1 then
	if GetBit(nExtPoint,5) == 1 and GetBit(nExtPoint,6) ~= 1 then
		if CK_ES_SWITCH == 0 then
			Say(CK_NPC_NAME.."M¸y chñ nµy t¹m thêi kh«ng më nhËn danh hiÖu <color=gold>Vâ L©m T©n Tó<color>!", 0);
			return 0;
		end
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 1, 1);
--		PayExtPoint(1, 1);
		AddTitle(68, 1);
		SetTitleTime(68, 1, GetTime() + (60 * 24 * 3600));
		Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "Vâ L©m T©n Tó"))
		Say(CK_NPC_NAME..format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "Vâ L©m T©n Tó"), 0)
		gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 1)");
		CDKEY_SetExtBit(EXT_CDKEY,9,1)
		return 1;
	end
	Say(CK_NPC_NAME.."Nh©n vËt nµy kh«ng ®ñ ®iÒu kiÖn, kh«ng thÓ nhËn danh hiÖu!", 0);
end

function ck_ActTilte_2()
	local nExtPoint = GetExtPoint(EXT_CDKEY)
	if GetBit(nExtPoint,7) == 1 then
		Talk(1,"",CK_NPC_NAME .."Tµi kho¶n c¸c h¹ ®· ®­îc kÝch ho¹t råi.")
		return 0
	end
	if ck_CanAct() ~= 1 then
		Say(CK_NPC_NAME.."Thêi gian kÝch ho¹t ®· kÕt thóc,kh«ng thÓ kÝch ho¹t danh hiÖu n÷a", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Vâ L©m T©n Tó"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "L·o ChiÕn H÷u"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Ng­êi N¨ng §éng"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(3), GetExtPoint(4))
--	local nExtPoint = GetExtPoint(EXT_CDKEY)
	--if GetExtPoint(1) == 1 and GetExtPoint(2) ~= 1 then
	if GetBit(nExtPoint,1) == 1 and GetBit(nExtPoint,2) ~= 1 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 2, 1);
--		PayExtPoint(3, 1);
		AddTitle(68, 2);
		SetTitleTime(68, 2, GetTime() + (60 * 24 * 3600));
		Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "L·o ChiÕn H÷u"))
		Say(CK_NPC_NAME..format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "L·o ChiÕn H÷u"), 0)
		gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 2)");
		CDKEY_SetExtBit(EXT_CDKEY,7,1)
		return 1;
	end
	Say(CK_NPC_NAME.."Nh©n vËt nµy kh«ng ®ñ ®iÒu kiÖn, kh«ng thÓ nhËn danh hiÖu!", 0);
end

function ck_ActTilte_3()
	local nExtPoint = GetExtPoint(EXT_CDKEY)
	if GetBit(nExtPoint,8) == 1 then
		Talk(1,"",CK_NPC_NAME .."Tµi kho¶n c¸c h¹ ®· ®­îc kÝch ho¹t råi.")
		return 0
	end
	if ck_CanAct() ~= 1 then
		Say(CK_NPC_NAME.."Thêi gian kÝch ho¹t ®· kÕt thóc,kh«ng thÓ kÝch ho¹t danh hiÖu n÷a", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Vâ L©m T©n Tó"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "L·o ChiÕn H÷u"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
		Say(CK_NPC_NAME..format("§· nhËn danh hiÖu <color=gold>[%s]<color> råi", "Ng­êi N¨ng §éng"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(5), GetExtPoint(6))
--	local nExtPoint = GetExtPoint(EXT_CDKEY)
	--if GetExtPoint(1) == 1 and GetExtPoint(2) ~= 1 then
	if GetBit(nExtPoint,3) == 1 and GetBit(nExtPoint,4) ~= 1 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 3, 1);
--		PayExtPoint(5, 1);
		AddTitle(68, 3);
		SetTitleTime(68, 3, GetTime() + (60 * 24 * 3600));
		Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "Ng­êi N¨ng §éng"))
		Say(CK_NPC_NAME..format("NhËn ®­îc danh hiÖu <color=gold>[%s]<color>", "Ng­êi N¨ng §éng"), 0)
		gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 3)");
		CDKEY_SetExtBit(EXT_CDKEY,8,1)
		return 1;
	end
	Say(CK_NPC_NAME.."Nh©n vËt nµy kh«ng ®ñ ®iÒu kiÖn, kh«ng thÓ nhËn danh hiÖu!", 0);
end

--Task1:4-11Î»ÓÂÍùÖ±Ç°ÈÎÎñ
function ck_TaskForward()
	if CK_ES_SWITCH == 0 then
		Say(CK_NPC_NAME.."M¸y chñ nµy t¹m thêi kh«ng më chuçi nhiÖm vô <color=red>Dòng C¶m TiÕn Tíi<color>", 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 1 then
		Say(CK_NPC_NAME..format("ChØ cã <color=gold>[%s]<color> míi ®­îc nhËn nhiÖm vô nµy", "Vâ L©m T©n Tó"), 0)
		return 0;
	end
	if GetLevel() >= 90 or gf_GetPlayerRebornCount() > 0 then
		Say(CK_NPC_NAME.."Gamer 90 cÊp trë lªn hoÆc ®· chuyÓn sinh kh«ng thÓ tham gia nhiÖm vô nµy!",0);
		return 0;
	end
	local tSay = {}
	local tMsg = {"Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh"}
	for i = 1, getn(CK_TASK_FORWARD) do
		local nType = 0;
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i + 3) == 1 then
			nType = 4;
		else
			if tGtTask:check_cur_task(CK_TASK_FORWARD[i][2]) == 0 then
				nType = 1;
			else
				if DirectIsTaskFinish(CK_TASK_FORWARD[i][2]) then
					nType = 3;
				else
					nType = 2;
				end
			end
		end
		if tMsg[nType] then
			tinsert(tSay, CK_TASK_FORWARD[i][1]..format("(%s)/#ck_TaskFoward_do(%d, %d)", tMsg[nType], CK_TASK_FORWARD[i][2], i + 3));
		end
	end
	tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
	Say(CK_NPC_NAME.."NhiÖm vô Dòng C¶m TiÕn Tíi cã thÓ gióp ng­êi nhanh chãng t¨ng cÊp!",getn(tSay), tSay);
end

function ck_TaskFoward_do(nTaskID, nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
		Say(CK_NPC_NAME.."NhiÖm vô nµy ®· hoµn thµnh!", 0);
		return 0;
	end
	if nTaskIndex > 4 and CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex - 1) ~= 1 then
		Say(CK_NPC_NAME.."Ch­a hoµn thµnh nhiÖm vô tr­íc ®ã", 0);
		return 0;
	end
	if tGtTask:check_cur_task(nTaskID) == 0 then
		DirectGetGTask(nTaskID, 1)
	else
		if DirectIsTaskFinish(nTaskID) then
			if 1 == DirectFinishGTask(nTaskID, 2) then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
				Msg2Player("§· hoµn thµnh nhiÖm vô!")
			else
				Msg2Player("NhiÖm vô kh¸c th­êng, kh«ng thÓ hoµn thµnh!");
			end
		else
			Say(CK_NPC_NAME.."NhiÖm vô vÉn ch­a hoµn thµnh!", 0);
		end
	end
end

--ÓÂÍùÖ±Ç°½±Àø(¶ÔÍâ)
function ck_TaskForward_Award()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
		local nExp = GetExp()
		ModifyExp(-nExp)
		SetLevel(90, 1);
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		Say(CK_NPC_NAME..format("§¼ng cÊp nh©n vËt ®· n©ng cao ®Õn %d cÊp, xin ®¨ng nhËp l¹i!", 90), 1, "§¨ng nhËp l¹i/ExitGame");
	end
end

function ck_CheckCondition()
	local nKind = ck_GetTitleType();
	if nKind == 0 then
		Say(CK_NPC_NAME.."VÉn ch­a nhËn vµ kÝch ho¹t danh hiÖu nµo, kh«ng thÓ tham gia nhiÖm vô!", 0);
		return 0;
	end
	if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
		Say(CK_NPC_NAME..format("§»ng cÊp nh©n vËt kh«ng ®ñ %d cÊp, kh«ng thÓ tham gia nhiÖm vô !", 90), 0);
		return 0;
	end
	return 1;
end

function ck_BaiZhanBuDai()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nNhiÖm vô ®¸nh qu¸i/ck_BZBD_Kill",
		"\nNhiÖm vô phã b¶n/ck_BZBD_Raid",
		"\nNhiÖm vô PVP/ck_BZBD_PVP",
		"\nT«i chØ xem xem th«i/nothing",	
	}
	Say(CK_NPC_NAME.."NhiÖm vô <color=gold>Tr¨m TrËn Tr¨m Th¾ng<color>, nhËn ngÉu nhiªn h»ng ngµy, nhËn ®­îc nhiÒu kinh nghiÖm vµ ®é n¨ng ®éng!", getn(tSay), tSay);	
end

--Task3£º¼Ó³É
function ck_BZBD_GetType(nIndex1, nIndex2, nIndex3)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3) == 1 then
		return 0.8;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2) == 1 then
		return 0.8;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1) == 1 then
		return 0.2;
	end
	return 0;
end

function ck_BZBD_SetType(nIndex1, nIndex2, nIndex3)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 0)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 0)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 0)
	local nSize = gf_GetTeamSize();
	if nSize <= 1 then
		return 0;
	end
	--print("nSize =", nSize)
	local oldPlayerIndex = PlayerIndex;
	local nSelfType = ck_GetTitleType();
	if nSelfType == 0 then
		return 0;
	end
	--print("nSelfType =", nSelfType)
	if nSelfType == 1 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 1 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 1)
					return 1;
				end
			end
		end
	end
	if nSelfType == 2 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 3 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
					return 1;
				end
			end
		end
	end	
	if nSelfType == 3 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 3 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 1)
				end
				if ck_GetTitleType() == 2 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
				end
			end
		end
	end
	PlayerIndex = oldPlayerIndex;		
	--print("nIndex1 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1))
	--print("nIndex2 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2))
	--print("nIndex3 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3))	
end

--°ÙÕ½²»´ùÉ±¹ÖÈÎÎñ
--Task1:12-16¼ÇÂ¼,17-21Íê³É
function ck_BZBD_Kill()
	--Ã»ÓÐÈÎÎñ¾ÍËæ»ú·ÖÅäÁ½¸öÈÎÎñ
	local nCount = 0;
	local nTaskIndex1 = 0;
	local nTaskIndex2 = 0;
	for i = 12, 16 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) == 1 then
			if nTaskIndex1 == 0 then
				nTaskIndex1 = i - 11;
			elseif nTaskIndex2 == 0 then
				nTaskIndex2 = i - 11;
			end
			nCount = nCount + 1;
		end
	end
	if nCount ~= 2 then
		for i = 12, 21 do
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0)
		end
		nCount = ck_GetRandIndex(getn(CK_TASK_BZ_KILL));
		nTaskIndex1 = nCount;
		if 0 ~= mod(nCount + 3, 5) then
			nTaskIndex2 = mod(nCount + 3, 5);
		else
			nTaskIndex2 = 5;
		end
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 11 + nTaskIndex1, 1);
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 11 + nTaskIndex2, 1);
	end
	DebugOutput("nTaskIndex1, nTaskIndex2 =", nTaskIndex1, nTaskIndex2);
	--¸ø¶Ô»°
	local tSay = {}
	local tMsg = {"Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh"}
	local tTask = {nTaskIndex1, nTaskIndex2};
	for i = 1, getn(tTask) do
		local nType = 0;
		DebugOutput("tTask[i] =", tTask[i])
		local nType = 0;
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 16 + tTask[i]) == 1 then
			nType = 4;
		else
			if tGtTask:check_cur_task(CK_TASK_BZ_KILL[tTask[i]][2]) == 0 then
				nType = 1;
			else
				if DirectIsTaskFinish(CK_TASK_BZ_KILL[tTask[i]][2]) then
					nType = 3;
				else
					nType = 2;
				end
			end
		end
		if tMsg[nType] then
			tinsert(tSay, format("\n%s(%s)/#ck_BZBD_Kill_do(%d, %d)", CK_TASK_BZ_KILL[tTask[i]][1], tMsg[nType], CK_TASK_BZ_KILL[tTask[i]][2], 16 + tTask[i]));
		end
	end
	tinsert(tSay, "\nT«i chØ xem xem th«i/nothing");
	Say(CK_NPC_NAME.."Tr¨m TrËn Tr¨m Th¾ng-NhiÖm vô ®¸nh qu¸i!",getn(tSay), tSay);
end

function ck_BZBD_Kill_do(nTaskID, nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
		Say(CK_NPC_NAME.."NhiÖm vô nµy ®· hoµn thµnh!", 0);
		return 0;
	end
	if tGtTask:check_cur_task(nTaskID) == 0 then
		DirectGetGTask(nTaskID, 1)
	else
		DebugOutput(nTaskID, DirectIsTaskFinish(nTaskID))
		if DirectIsTaskFinish(nTaskID) then
			if 1 == DirectFinishGTask(nTaskID, 2) then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
				Msg2Player("§· hoµn thµnh nhiÖm vô!")
			else
				Msg2Player("NhiÖm vô kh¸c th­êng, kh«ng thÓ hoµn thµnh!");
			end
		else
			Say(CK_NPC_NAME.."NhiÖm vô vÉn ch­a hoµn thµnh!", 0);
		end
	end
end

--É±¹ÖÈÎÎñ½±Àø(¶ÔÍâ)
function ck_BZBD_Kill_Award()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	local nParam = ck_BZBD_GetType(8, 9, 10);
	gf_ModifyExp(floor(3000000*(1 + nParam)));
	ck_AddCkScore(floor(10 * (1 + nParam)));
end

--É±¹ÖÈÎÎñ¶ÔÍâ½Ó¿Ú
--½öÉèÖÃ¼Ó³ÉÏµÊý
function _ck_BZBD_Kill_Set()
	--print("_ck_BZBD_Kill_Set()")
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 12, 16 do 
			--print(i, CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i))
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 11;
			end
		end
		--print("nCount =", nCount)
		if nCount ~= 2 then
			return 0;
		end
		ck_BZBD_SetType(8, 9, 10);
	end);
end

--°ÙÕ½²»´ù¸±±¾ÈÎÎñ
--Task1:22-26¼ÇÂ¼£¬27-31½ÓÈ¡
--Task2:1-5¿É½»£¬6-10Íê³É
function ck_BZBD_Raid()
	local nCount = 0;
	local nTaskIndex = 0;
	for i = 22, 26 do 
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
			nCount = nCount + 1;
			nTaskIndex = i - 21;
		end
	end
	if nCount ~= 1 then
		for i = 22, 31 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
		end
		for i = 1, 10 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, i, 0);
		end
		nTaskIndex = ck_GetRandIndex(getn(CK_TASK_BZ_RAID));
--		--¹Ø±ÕÌ«Ò»ËþÈÎÎñ-------
--		if nTaskIndex == 5 then
--			nTaskIndex = 3;
--		end
--		-----------------------
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 21 + nTaskIndex, 1);
	end
	local tMsg = {"Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh"}
	local nType = 0;
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex) == 0 then
		nType = 1;
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) == 0 then
			nType = 2;
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex) == 0 then
				nType = 3;
			else
				nType = 4;
			end
		end
	end
	DebugOutput(CK_TASK_BZ_RAID[nTaskIndex], tMsg[nType], nTaskIndex)
	local tSay = {
		format("%s(%s)/#ck_BZBD_Raid_do(%d)",	CK_TASK_BZ_RAID[nTaskIndex], tMsg[nType], nTaskIndex),
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(CK_NPC_NAME.."Tr¨m TrËn Tr¨m Th¾ng-NhiÖm vô phã b¶n!", getn(tSay), tSay);
end

function ck_BZBD_Raid_do(nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex) == 0 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex, 1);
		Say(CK_NPC_NAME..format("§· nhËn nhiÖm vô <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) == 0 then
			Say(CK_NPC_NAME..format("Ch­a hoµn thµnh nhiÖm vô <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex) == 0 then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex, 1);
				--¸ø½±Àø
				ck_BZBD_Raid_Award();
			else
				Say(CK_NPC_NAME..format("§· hoµn thµnh nhiÖm vô <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
			end
		end
	end	
end

--°ÙÕ½²»´ù¸±±¾ÈÎÎñ½±Àø
function ck_BZBD_Raid_Award()
	local nParam = ck_BZBD_GetType(11, 12, 13);
	gf_ModifyExp(floor(5000000*(1 + nParam)));
	ck_AddCkScore(floor(15 * (1 + nParam)));
end

--¸±±¾ÈÎÎñ¶ÔÍâ½Ó¿Ú
function _ck_BZBD_Raid_Set(nCurIndex)
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 22, 26 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 21;
			end
		end
		if nCount ~= 1 then
			return 0;
		end
		if tonumber(%nCurIndex) ~= nTaskIndex then
			return 0;
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) ~= 1 then
			ck_BZBD_SetType(11, 12, 13);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex, 1);
			Msg2Player(format("§· hoµn thµnh nhiÖm vô %s", CK_TASK_BZ_RAID[nTaskIndex]));
		end
	end);
end

--°ÙÕ½²»´ùPVPÈÎÎñ
--Task2:11-17¼ÇÂ¼£¬18-24½ÓÈ¡£¬25-31¿É½»
--Task3:1-7Íê³É
function ck_BZBD_PVP()
	
--	if GetGlbValue(1023) == 92 then
--		local tSay = {
--			"Ta muèn nhËn th­ëng nhiÖm vô PVP/ck_BZBD_PVP_Award",
--			"\nT«i chØ xem xem th«i/nothing",
--		}
--		Say(CK_NPC_NAME.."Tr¨m TrËn Tr¨m Th¾ng-NhiÖm vô PVP!", getn(tSay), tSay);
--		return
--	end	
	
	local nCount = 0;
	local nTaskIndex = 0;
	for i = 11, 17 do 
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
			nCount = nCount + 1;
			nTaskIndex = i - 10;
		end
	end
	if nCount ~= 1 then
		for i = 18, 31 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, i, 0);
		end
		for i = 1, 7 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
		end
		nTaskIndex = random(7);
		--ÆÁ±Î3v3-------------
--		if nTaskIndex == 2 then
--			nTaskIndex = nTaskIndex + 1;
--		elseif nTaskIndex == 7 then
--			nTaskIndex = nTaskIndex - 1;
--		end
		----------------------
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 10 + nTaskIndex, 1);
	end
	local tMsg = {"Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh"}
	local nType = 0;
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex) == 0 then
		nType = 1;
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) == 0 then
			nType = 2;
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex) == 0 then
				nType = 3;
			else
				nType = 4;
			end
		end
	end
	local tSay = {
		format("%s(%s)/#ck_BZBD_PVP_do(%d)",	CK_TASK_BZ_PVP[nTaskIndex], tMsg[nType], nTaskIndex),
		"\nT«i chØ xem xem th«i/nothing",
	}
	Say(CK_NPC_NAME.."Tr¨m TrËn Tr¨m Th¾ng-NhiÖm vô PVP!", getn(tSay), tSay);
end

function ck_BZBD_PVP_do(nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex) == 0 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex, 1);
		Say(CK_NPC_NAME..format("§· nhËn <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) == 0 then
			Say(CK_NPC_NAME..format("Ch­a hoµn thµnh <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex) == 0 then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex, 1);
				--¸ø½±Àø
				ck_BZBD_PVP_Award();
			else
				Say(CK_NPC_NAME..format("§· hoµn thµnh <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
			end
		end
	end	
	--===========
	if nTaskIndex == 1 or nTaskIndex == 2 or nTaskIndex == 7 then
		local nTaskIndex = 0;
		for i = 11, 17 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
--				nCount = nCount + 1;
				nTaskIndex = i - 10;
			end
		end
--		if nCount ~= 1 then
--			return 0;
--		end
--		if tonumber(%nCurIndex) ~= nTaskIndex then
--			return 0;
--		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) ~= 1 then
			--ck_BZBD_SetType(14, 15, 16);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex, 1);
			Msg2Player(format("§· hoµn thµnh nhiÖm vô %s", CK_TASK_BZ_PVP[nTaskIndex]));
		end	
	end
	--===========
end

function ck_BZBD_PVP_Award()
	if GetGlbValue(1023) == 92 then
		if gf_GetTaskByte(TSK_NHIEMVUCDKEY,1) == 1 then
			Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng ngµy h«m nay råi. Xin vui lßng quay l¹i ngµy h«m sau!")
			return
		end
		gf_ModifyExp(14400000);
		ck_AddCkScore(36);
	
		--Set nhËn th­ëng mçi ngµy
		gf_SetTaskByte(TSK_NHIEMVUCDKEY,1,1)
		return
	end
	
	local nParam = 0.8; --ck_BZBD_GetType(14, 15, 16);
	gf_ModifyExp(floor(8000000*(1 + nParam)));
	ck_AddCkScore(floor(20 * (1 + nParam)));
end

--PVPÈÎÎñ¶ÔÍâ½Ó¿Ú
function _ck_BZBD_PVP_Set(nCurIndex)
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 11, 17 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 10;
			end
		end
		if nCount ~= 1 then
			return 0;
		end
		if tonumber(%nCurIndex) ~= nTaskIndex then
			return 0;
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) ~= 1 then
			--ck_BZBD_SetType(14, 15, 16);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex, 1);
			Msg2Player(format("§· hoµn thµnh nhiÖm vô %s", CK_TASK_BZ_PVP[nTaskIndex]));
		end
	end);
end

function ck_FastTask()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nNhiÖm vô bang héi/ck_FastTask_Tong",
		"\nNhiÖm vô h­íng dÉn/ck_FastTask_Guide",
		"\nT«i chØ xem xem th«i/nothing",	
	}
	Say(CK_NPC_NAME.."NhiÖm vô <color=gold>Tèc ChiÕn Tèc Th¾ng<color>, trong thêi gian ho¹t ®éng chØ ®­îc hoµn thµnh 1 lÇn, nhËn ®­îc nhiÒu kinh nghiÖm vµ ®é n¨ng ®éng!", getn(tSay), tSay);		
end

function ck_FastTask_Tong()
	local tSay = {
		"\nGia nhËp bang héi/ck_FastTask_Tong_1",
		"\nT¸i chiÕn ThÇn Thó/ck_FastTask_Tong_2",
		"\nN­íng thÞt bang ph¸i/ck_FastTask_Tong_3",
		"\nT«i chØ xem xem th«i/nothing",	
	}
	Say(CK_NPC_NAME.."<color=gold>Tèc ChiÕn Tèc Th¾ng<color>-NhiÖm vô bang héi!", getn(tSay), tSay);		
end

--Task3£º17Î»ÊÇ·ñÍê³É
function ck_FastTask_Tong_1(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Tong_1(1)",
			"\nT«i chØ xem xem th«i/nothing",	
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"Gia nhËp bang héi", "Gia nhËp mét bang héi bÊt kú, trë thµnh mét thµnh viªn trong bang", "Gia nhËp bang héi, cïng víi thµnh viªn kh¸c cè g¾ng ®Ó gióp bang héi ngµy cµng lín m¹nh", 3000000, 100);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 17) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if IsTongMember() <= 0 then
		Say(CK_NPC_NAME.."Kh«ng tháa ®iÒu kiÖn, kh«ng thÓ hoµn thµnh nhiÖm vô!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 17, 1);
	--½±Àø
	gf_ModifyExp(3000000);
	ck_AddCkScore(100);	
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Task3£º18Î»ÊÇ·ñÍê³É
function ck_FastTask_Tong_2(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Tong_2(1)",
			"\nT«i chØ xem xem th«i/nothing",	
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"T¸i chiÕn ThÇn Thó", "Nép 300 ®iÓm tÝch lòy tö quang", "Tham gia Tö Quang C¸c ®¸nh b¹i Tö Quang ThÇn Thó sÏ nhËn ®­îc ®iÓm tÝch lòy tö quang", 5000000, 200);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 18) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	--¿Û×Ï¹â»ý·Ö
	local TSK_POINT = 652;			--¼ÇÂ¼Íæ¼Ò¸öÈË¹Ø¿¨»ý·Ö
	if GetTask(TSK_POINT) < 300 then
		Say(CK_NPC_NAME..format("§iÓm tÝch lòy tö quang kh«ng ®ñ <color=red>%d<color> ®iÓm", 300), 0);
		return 0;
	end
	SetTask(TSK_POINT, GetTask(TSK_POINT) - 300);
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 18, 1);
	--½±Àø
	gf_ModifyExp(5000000);
	ck_AddCkScore(200);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Task3£º19Î»ÊÇ·ñÍê³É
function ck_FastTask_Tong_3(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Tong_3(1)",
			"\nT«i chØ xem xem th«i/nothing",	
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"N­íng thÞt bang ph¸i", "Tham dù tÝnh n¨ng N­íng thÞt bang ph¸i nép 10 M¶nh LÖnh Bµi Bang Ph¸i", "Ho¹t ®éng N­íng thÞt bang ph¸i v« cïng thó vÞ, mau ®i thu thËp M¶nh LÖnh Bµi Bang Ph¸i nµo!", 8000000, 300);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 19) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	--¿ÛËéÆ¬
	if DelItem(2, 1, 30588, 10) ~= 1 then
		Say(CK_NPC_NAME..format("<color=red>%s<color> trong tói kh«ng ®ñ <color=red>%d<color> c¸i", "M¶nh LÖnh Bµi Bang Héi", 10), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 19, 1);
	--½±Àø
	gf_ModifyExp(8000000);
	ck_AddCkScore(300);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

function ck_FastTask_Guide()
	local tSay = {
		"\nThÎ th¸ng/ck_FastTask_Guide_1",
		"\nThuèc viªn/ck_FastTask_Guide_2",
		"\nC©y B¸t Nh· Nhá/ck_FastTask_Guide_3",
		"\nN÷ Oa B¶o H¹p vµ Ng«i Sao May M¾n/ck_FastTask_Guide_4",
		"\nT«i chØ xem xem th«i/nothing",	
	}
	Say(CK_NPC_NAME.."<color=gold>Tèc ChiÕn Tèc Th¾ng<color>-NhiÖm vô h­íng dÉn!", getn(tSay), tSay);	
end

--Task3£º20Î»ÊÇ·ñÍê³É
function ck_FastTask_Guide_1(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Guide_1(1)",
			"\nT«i chØ xem xem th«i/nothing",	
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"ThÎ Th¸ng", "KÝch ho¹t thÎ th¸ng VIP vâ l©m", "KÝch ho¹t thÎ th¸ng, ch¬i trß ch¬i nhÑ nhµng h¬n", 8000000, 1200);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 20) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if IsActivatedVipCard() ~= 1 then
		Say(CK_NPC_NAME.."VÉn ch­a kÝch ho¹t thÎ th¸ng, kh«ng thÓ hoµn thµnh nhiÖm vô!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 20, 1);
	--½±Àø
	gf_ModifyExp(8000000);
	ck_AddCkScore(1200);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Task3£º21,22,23,24Î»
function ck_FastTask_Guide_2(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Guide_2(1)",
			"\nT«i chØ xem xem th«i/nothing",	
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"Thuèc viªn", "Ph©n biÖt sö dông 1 lÇn B¹ch CÇu Hoµn, Tam Thanh Hoµn vµ Lôc ThÇn Hoµn", "Sö dông c¸c lo¹i thuèc sÏ gióp b¹n mét tay", 5000000, 300);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 24) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 21) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "B¹ch C©u Hoµn"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 22) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "Tam Thanh hoµn"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 23) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "Lôc ThÇn hoµn"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 24, 1);
	--½±Àø
	gf_ModifyExp(5000000);
	ck_AddCkScore(300);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Ê¹ÓÃ°×¾ÔÍè
function _ck_UseItemBaiJu()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 21, 1);
end

--Ê¹ÓÃÈýÇåÍè
function _ck_UseItemSanQing()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 22, 1);
end

--Ê¹ÓÃÁùÉñÍè
function _ck_UseItemLiuShen()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 23, 1);
end

--Task3£º25,26Î»
function ck_FastTask_Guide_3(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Guide_3(1)",
			"\nT«i chØ xem xem th«i/nothing",	
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"C©y B¸t Nh· nhá", "Trång 1 C©y B¸t Nh· Nhá", "Trång C©y B¸t Nh· Nhá, nhËn ®­îc phÇn th­ëng kinh nghiÖm", 5000000, 600);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 26) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 25) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a trång <color=red>%s<color>", "C©y B¸t Nh· nhá"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 26, 1);
	--½±Àø
	gf_ModifyExp(5000000);
	ck_AddCkScore(600);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--ÖÖÖ²Ð¡°ãÈôÊ÷ÖÖ
function _ck_PlantSmallBanRuo()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 25, 1);	
end

--Task3£º27,28,29Î»
function ck_FastTask_Guide_4(nFlag)
	if not nFlag then
		local tSay = {
			"\nHoµn thµnh nhiÖm vô/#ck_FastTask_Guide_4(1)",
			"\nT«i chØ xem xem th«i/nothing",	
		}
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",
			"N÷ Oa B¶o H¹p vµ Ng«i Sao May M¾n", "Sö dông 1 lÇn N÷ Oa B¶o H¹p vµ Ng«i Sao May M¾n", "N÷ Oa B¶o H¹p vµ Ng«i Sao May M¾n lµ b¶o vËt, më ra xem thö bªn trong cã phÇn th­ëng kh«ng", 5000000, 900);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 29) ~= 0 then
		Say(CK_NPC_NAME.."§· hoµn thµnh nhiÖm vô nµy!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 27) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "N÷ Oa B¶o H¹p"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 28) ~= 1 then
		Say(CK_NPC_NAME..format("VÉn ch­a sö dông bÊt kú <color=red>%s<color>", "Ng«i sao may m¾n"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 29, 1);
	--½±Àø
	gf_ModifyExp(5000000);
	ck_AddCkScore(900);
	Msg2Player("NhiÖm vô hoµn thµnh!");
end

--Ê¹ÓÃÅ®æ´±¦ºÐ
function _ck_UseItemNvWa()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 27, 1);	
end

--Ê¹ÓÃÐÒÔËÐÇ
function _ck_UseItemLuckyStart()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 28, 1);		
end

function ck_ZiloTask()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nNhiÖm vô tÝch lòy thuéc tÝnh/ck_ZiloTask_1",
		"\nNhiÖm vô tiªu phÝ ¶i/ck_ZiloTask_2",
		"\nT«i chØ xem xem th«i/nothing",	
	}
	Say(CK_NPC_NAME.."NhiÖm vô <color=gold>§¹i Phó ¤ng<color>, trong thêi gian ho¹t ®éng chØ ®­îc hoµn thµnh 1 lÇn, cã thÓ nhËn ®­îc nhiÒu kinh nghiÖm vµ ®é n¨ng ®éng!", getn(tSay), tSay);		
end

--Task4£º1-7Íê³ÉÇé¿ö
function ck_ZiloTask_1(bTalk)
	local nTaskIndex = 0;
	for i = CK_TASK_ZILON_ATRR_BEGIN, getn(CK_TASK_ZILON_ATRR) do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
			nTaskIndex = i;
			break;
		end
	end
	if nTaskIndex == 0 then
		Say(CK_NPC_NAME..format("Chóc mõng %s ®· hoµn thµnh toµn bé <color=gold>nhiÖm vô tÝch lòy thuéc tÝnh<color>!", gf_GetPlayerSexName()), 0)
		return 0;
	end
	local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
	if not tCell then  return 0; end
	if not bTalk then
		local tSay = {
			"\nTa muèn hoµn thµnh/#ck_ZiloTask_1(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Str = format("Nh©n vËt ®· ®¹t chuyÓn sinh %d cÊp %d, tÝch lòy %d ®iÓm danh väng, %d ®iÓm s­ m«n, %d ®iÓm c«ng tr¹ng", tCell[2][1], tCell[2][2], tCell[2][3], tCell[2][4], tCell[2][5]);
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d",	tCell[1], Str, "Nç lùc tÝch lòy sÏ gióp b¶n th©n ngµy cµng lín m¹nh", tCell[3][1], tCell[3][2]);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if gf_GetPlayerRebornCount() < tCell[2][1] then
		Say(CK_NPC_NAME..format("CÊp chuyÓn sinh cña %s kh«ng ®ñ <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][1]), 0);
		return 0;
	end
	if GetLevel() < tCell[2][2] and gf_GetPlayerRebornCount() <= tCell[2][1] then
		Say(CK_NPC_NAME..format("§¼ng cÊp cña %s kh«ng ®ñ <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][2]), 0);
		return 0;
	end
	if GetReputation() < tCell[2][3] then
		Say(CK_NPC_NAME..format("§iÓm tÝch lòy danh väng cña %s kh«ng ®ñ <color=red>%d<color> ®iÓm", gf_GetPlayerSexName(), tCell[2][3]), 0);
		return 0;
	end
	if GetTask(336) < tCell[2][4] then
		Say(CK_NPC_NAME..format("§iÓm tÝch lòy s­ m«n cña %s kh«ng ®ñ <color=red>%d<color> ®iÓm", gf_GetPlayerSexName(), tCell[2][4]), 0);
		return 0;
	end
	if abs(GetTask(701)) < tCell[2][5] then
		Say(CK_NPC_NAME..format("§iÓm tÝch lòy c«ng tr¹ng cña %s kh«ng ®ñ <color=red>%d<color> ®iÓm", gf_GetPlayerSexName(), tCell[2][5]), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, nTaskIndex, 1);
	--½±Àø
	gf_ModifyExp(tCell[3][1]);
	ck_AddCkScore(tCell[3][2]);
	Msg2Player("NhiÖm vô hoµn thµnh!")
	ck_ZiloTask_1();
end

--Task4£º8-12Íê³ÉÇé¿ö
function ck_ZiloTask_2(bTalk)
	local nTaskIndex = 0;
	for i = CK_TASK_IB_COST_BEGIN, CK_TASK_IB_COST_BEGIN+getn(CK_TASK_IB_COST)-1 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
			nTaskIndex = i - CK_TASK_IB_COST_BEGIN + 1;
			break;
		end
	end
	if nTaskIndex == 0 then
		Say(CK_NPC_NAME..format("Chóc mõng %s ®· hoµn thµnh toµn bé <color=gold>nhiÖm vô tiªu phÝ<color>!", gf_GetPlayerSexName()), 0)
		return 0;
	end
	local tCell = CK_TASK_IB_COST[nTaskIndex];
	if not tCell then  return 0; end
	if not bTalk then
		local tSay = {
			"\nTa muèn hoµn thµnh/#ck_ZiloTask_2(1)",
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Str = format("Trong ¶i bÊt kú cña §Þa HuyÒn Cung, V¹n KiÕm Tròng, L­¬ng S¬n vµ Th¸i NhÊt Th¸p tÝch lòy sö dông %d Thiªn Kiªu LÖnh ®Ó më r­¬ng", tCell[2]);
		local Msg = format("Tªn nhiÖm vô: <color=gold>%s<color>\n§iÒu kiÖn nhiÖm vô:\n  %s\nH­íng dÉn nhiÖm vô:\n  %s\nPhÇn th­ëng nhiÖm vô:\n§iÓm kinh nghiÖm: %d, ®é n¨ng ®éng: %d", tCell[1], Str, "Dïng Thiªn Kiªu LÖnh ®Ó më r­¬ng sÏ nhËn ®­îc phÇn th­ëng phong phó", tCell[3][1], tCell[3][2]);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if ck_GetCostIB() < tCell[2] then
		Say(CK_NPC_NAME..format("ë ¶i hiÖn t¹i, sè l­îng Thiªn Kiªu LÖnh do %s tiªu phÝ kh«ng ®ñ <color=red>%d<color> c¸i", gf_GetPlayerSexName(), tCell[2]), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, CK_TASK_IB_COST_BEGIN + nTaskIndex - 1, 1);
	--½±Àø
	gf_ModifyExp(tCell[3][1]);
	ck_AddCkScore(tCell[3][2]);
	Msg2Player("NhiÖm vô hoµn thµnh!")
	ck_ZiloTask_2();
end

--¹Ø¿¨Ïû·ÑÌì½¾ÁîTask5
function ck_GetCostIB()
	return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Task5);
end

--¹Ø¿¨Ïû·Ñ¶ÔÍâ½Ó¿ÚTask5
function _ck_SetCostIB(nNum)
	if ck_IsOpen() ~= 1 then
		--print("SetCostIB",nNum,"not open")
		return 0;
	end
	if ck_GetTitleType() == 0 then
		--print("SetCostIB",nNum,"no titile")
		return 0;
	end
	nNum = nNum or 1;
	--print("GetCostIB",ck_GetCostIB(),CK_TASK_GROUP.Task5)
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task5, ck_GetCostIB() + tonumber(nNum));
end

function ck_QueryScore()
	Say(CK_NPC_NAME..format("%s b©y giê ®iÓm n¨ng ®éng lµ <color=gold>%d<color>!", gf_GetPlayerSexName(), ck_GetCkScore()), 0);	
end

function ck_ScoreAward()
	cd_tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}
	local nRoute = GetPlayerRoute()
	if cd_tbRoute [nRoute] ~= 1 then
		Talk(1, "", CK_NPC_NAME.." Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return 0
	end
	local nScore = ck_GetCkScore();
	local tMsg = {
		[0] = "Ch­a hoµn thµnh",
		[1] = "§· hoµn thµnh",
	}
	local tSay = {};
	for i = 1, getn(CK_SCROE_AWARD_TABLE) do
		local nType = CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, i);
		tinsert(tSay, format("%d gi¶i th­ëng ®iÓm n¨ng ®éng (%s)/#ck_ScoreAward_func_%d(%d, %d)", CK_SCROE_AWARD_TABLE[i], tMsg[nType], i, nScore, CK_SCROE_AWARD_TABLE[i]));
	end
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say(CK_NPC_NAME..format("%s b©y giê ®iÓm n¨ng ®éng lµ <color=gold>%d<color>,h·y nhËn gi¶i th­ëng!", gf_GetPlayerSexName(), nScore), getn(tSay), tSay);
end

function ck_ScoreAward_func_1(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_1(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 1000000, 100, 100, 1000, 10000)..",".."§¶ th«ng c¶nh giíi Vâ HiÒn"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 1) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if GetLevel() < 90 then
		Say(CK_NPC_NAME..format("§¼ng cÊp ng­¬i kh«ng ®ñ %d cÊp, kh«ng ®­îc nhËn th­ëng!", 90), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 1, 1);
	gf_Modify("Exp", 1000000);
	gf_Modify("Rep", 100);
	gf_Modify("ShiMen", 100);
	gf_Modify("JunGong", 1000);
	local nLevel = MeridianGetLevel()
	if nLevel < 1 then
		for i = nLevel + 1, 1 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 1000000);
	end
	gf_Modify("ZhenQi", 10000);
end

function ck_ScoreAward_func_2(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_2(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 2000000, 160, 160, 1400, 0)..",".."Nãn DiÖu D­¬ng (Theo kiÓu h×nh, l­u ph¸i)"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 2) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 2, 1);
	gf_Modify("Exp", 2000000);
	gf_Modify("Rep", 160);
	gf_Modify("ShiMen", 160);
	gf_Modify("JunGong", 1400);
--==============
--	if gf_GetPlayerRebornCount() < 1 then
--		gf_SetTaskByte(1538, 1, 1); 			--1×ª
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 2000000);
--	end
--===============
	ahf_GetYaoYangByRouteBody(VET_YAOYANG_CAP);
end

function ck_ScoreAward_func_3(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_3(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 3000000, 220, 220, 1800, 15000)..",".."§¶ th«ng c¶nh giíi Vâ T­íng"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 3) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if GetLevel() < 90 then
		Say(CK_NPC_NAME..format("§¼ng cÊp ng­¬i kh«ng ®ñ %d cÊp, kh«ng ®­îc nhËn th­ëng!", 90), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 3, 1);
	gf_Modify("Exp", 3000000);
	gf_Modify("Rep", 220);
	gf_Modify("ShiMen", 220);
	gf_Modify("JunGong", 1800);
	local nLevel = MeridianGetLevel()
	if nLevel < 2 then
		for i = nLevel + 1, 2 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 3000000);
	end	
	gf_Modify("ZhenQi", 15000);
end

function ck_ScoreAward_func_4(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_4(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 4000000, 280, 280, 2200, 0)..",".."¸o DiÖu D­¬ng (Theo kiÓu h×nh, l­u ph¸i)"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 4) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 4, 1);
	gf_Modify("Exp", 4000000);
	gf_Modify("Rep", 280);
	gf_Modify("ShiMen", 280);
	gf_Modify("JunGong", 2200);
--	if gf_GetPlayerRebornCount() < 2 then
--		gf_SetTaskByte(1538, 1, 2); 			--1×ª
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 4000000);
--	end
	ahf_GetYaoYangByRouteBody(VET_YAOYANG_CLOTH);
end

function ck_ScoreAward_func_5(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_5(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 5000000, 340, 340, 2600, 25000)..",".."§¶ th«ng c¶nh giíi Vâ V­¬ng"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 5) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if GetLevel() < 90 then
		Say(CK_NPC_NAME..format("§¼ng cÊp ng­¬i kh«ng ®ñ %d cÊp, kh«ng ®­îc nhËn th­ëng!", 90), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 5, 1);
	gf_Modify("Exp", 5000000);
	gf_Modify("Rep", 340);
	gf_Modify("ShiMen", 340);
	gf_Modify("JunGong", 2600);
	local nLevel = MeridianGetLevel()
	if nLevel < 3 then
		for i = nLevel + 1, 3 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 5000000);
	end	
	gf_Modify("ZhenQi", 25000);
end

function ck_ScoreAward_func_6(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_6(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 6000000, 400, 400, 3000, 0)..",".."QuÇn DiÖu D­¬ng (Theo kiÓu h×nh, l­u ph¸i)"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 6) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 6, 1);
	gf_Modify("Exp", 6000000);
	gf_Modify("Rep", 400);
	gf_Modify("ShiMen", 400);
	gf_Modify("JunGong", 3000);
--	if gf_GetPlayerRebornCount() < 3 then
--		gf_SetTaskByte(1538, 1, 3); 			--1×ª
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 6000000);
--	end
	ahf_GetYaoYangByRouteBody(VET_YAOYANG_SHOE);
end

function ck_ScoreAward_func_7(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_7(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 7000000, 460, 460, 3400, 30000)..",".."Huy Ch­¬ng Ngò Hµnh (Tù chän)"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 7) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	local tDialog = {}
	for i = 1, getn(CK_JS_HUIZHANG) do
		DebugOutput(CK_JS_HUIZHANG[i][1], i)
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_7_Do(%d)", CK_JS_HUIZHANG[i][1], i));
	end
	tinsert(tDialog, "\nT«i chØ xem xem th«i/nothing");
	Say(CK_NPC_NAME.."H·y chän lo¹i cÇn:", getn(tDialog), tDialog);	
end

function  ck_ScoreAward_func_7_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 7, 1);
	gf_Modify("Exp", 7000000);
	gf_Modify("Rep", 460);
	gf_Modify("ShiMen", 460);
	gf_Modify("JunGong", 3400);
	gf_Modify("ZhenQi", 30000);
	gf_AddItemEx2(CK_JS_HUIZHANG[nIndex][2], CK_JS_HUIZHANG[nIndex][1], "CDKEY", "CDKEY", 0, 1);
end

function ck_ScoreAward_func_8(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_8(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 8000000, 520, 520, 3800, 0)..",".."UÈn Linh CÊp 4"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 8) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	ck_ScoreAward_func_8_Do()
--	local tDialog = {}
--	for i = 1, getn(CK_YAOYANG_JIEZI_1) do
--		tinsert(tDialog, format("%s/#ck_ScoreAward_func_8_Do(%d)", CK_YAOYANG_JIEZI_1[i][1], i));
--	end
--	tinsert(tDialog, "\nÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing");
--	Say(CK_NPC_NAME.."ÇëÑ¡ÔñÄãÐèÒªµÄÀàÐÍ£º", getn(tDialog), tDialog);		
end

function ck_ScoreAward_func_8_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 8, 1);
	gf_Modify("Exp", 8000000);
	gf_Modify("Rep", 520);
	gf_Modify("ShiMen", 520);
	gf_Modify("JunGong", 3800);
--	if gf_GetPlayerRebornCount() < 4 then
--		gf_SetTaskByte(1538, 1, 4); 			--1×ª
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 10000000);
--	end
	gf_AddItemEx2({2, 1, 30614, 1, 1}, "L«i Hæ Tinh Ph¸ch", "CDKEY", "CDKEY", 0, 1);
	--gf_AddItemEx2(CK_YAOYANG_JIEZI_1[nIndex][2], CK_YAOYANG_JIEZI_1[nIndex][1], "CDKEY", "CDKEY", 0, 1);
	--4¼¶ÔÌÁé
	local nRandIndex = random(getn(CK_4_LEVEL_YUNLING));
	gf_AddItemEx2(CK_4_LEVEL_YUNLING[nRandIndex][2], CK_4_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
end

function ck_ScoreAward_func_9(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_9(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 9000000, 580, 580, 4200, 0)..",".."ChuyÓn sinh 5 cÊp 90"..",".."Vò KhÝ DiÖu D­¬ng (Theo kiÓu h×nh, l­u ph¸i)"..",".."L«i Hæ Tinh Ph¸ch*1"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 9) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if GetPlayerRoute() == 0 then
		Talk(1, "", CK_NPC_NAME.." Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return 0
	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 9, 1);
--	gf_Modify("Exp", 9000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
	if gf_GetPlayerRebornCount() < 5 or (gf_GetPlayerRebornCount() == 5 and GetLevel() < 90) then
--		gf_SetTaskByte(1538, 1, 5); 			--1×ª
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		ck_chuyensinh()
	else
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 9, 1);
		gf_Modify("Exp", 13000000); --exp bonus nÕu ®· CS råi
		gf_Modify("Exp", 9000000);
		gf_Modify("Rep", 580);
		gf_Modify("ShiMen", 580);
		gf_Modify("JunGong", 4200);		
		ahf_GetYaoYangWeaponRand(1);
		gf_AddItemEx2({2, 1, 30614, 1}, "L«i Hæ Tinh Ph¸ch", "CDKEY", "CDKEY", 0, 1);
	end
--	ahf_GetYaoYangWeaponRand(1);
--	gf_AddItemEx2({2, 1, 30614, 1}, "L«i Hæ Tinh Ph¸ch", "CDKEY", "CDKEY", 0, 1);
end

function ck_ScoreAward_func_10(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_10(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 10000000, 580, 580, 4200, 0)..",".."Nãn ChiÕn Cuång (Theo kiÓu h×nh, l­u ph¸i)"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 10) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 10, 1);
	gf_Modify("Exp", 10000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	--Õ½¿ñÍ·²¿
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_CAP);
end

function ck_ScoreAward_func_11(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_11(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 11000000, 580, 580, 4200, 0)..",".."¸o Kho¸c Ngò Hµnh (Tù chän)"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 11) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	local tDialog = {}
	for i = 1, getn(CK_JS_GUAIYI) do
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_11_Do(%d)", CK_JS_GUAIYI[i][1], i));
	end
	tinsert(tDialog, "\nT«i chØ xem xem th«i/nothing");
	Say(CK_NPC_NAME.."H·y chän lo¹i cÇn:", getn(tDialog), tDialog);	
end

function ck_ScoreAward_func_11_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 11, 1);
	gf_Modify("Exp", 11000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	gf_AddItemEx2(CK_JS_GUAIYI[nIndex][2], CK_JS_GUAIYI[nIndex][1], "CDKEY", "CDKEY", 0, 1);
end

function ck_ScoreAward_func_12(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_12(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 12000000, 580, 580, 4200, 0)..",".."ChiÕn Hµi Ngò Hµnh (Tù chän)"..",".."Tù chän ®å trang søc cÊp 2 DiÖu D­¬ng"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 12) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	local tDialog = {}
	for i = 1, getn(CK_JS_SHOE) do
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_12_Do(%d)", CK_JS_SHOE[i][1], i));
	end
	tinsert(tDialog, "\nT«i chØ xem xem th«i/nothing");
	Say(CK_NPC_NAME.."H·y chän lo¹i cÇn:", getn(tDialog), tDialog);	
end

function ck_ScoreAward_func_12_Do(nIndex)
	local tDialog = {}
	for i = 1, getn(CK_YAOYANG_JIEZI_2) do
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_12_Do2(%d,%d)", CK_YAOYANG_JIEZI_2[i][1], nIndex,i));
	end
	tinsert(tDialog, "\nT«i chØ xem xem th«i/nothing");
	Say(CK_NPC_NAME.."H·y chän lo¹i cÇn:", getn(tDialog), tDialog);
end

function ck_ScoreAward_func_12_Do2(nIndex1,nIndex2)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 12, 1);
	gf_Modify("Exp", 12000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	gf_AddItemEx2(CK_JS_SHOE[nIndex1][2], CK_JS_SHOE[nIndex1][1], "CDKEY", "CDKEY", 0, 1)
	gf_AddItemEx2(CK_YAOYANG_JIEZI_2[nIndex2][2], CK_YAOYANG_JIEZI_2[nIndex2][1], "CDKEY", "CDKEY", 0, 1)
end

function ck_ScoreAward_func_13(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_13(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 18000000, 580, 580, 4200, 0)..",".."UÈn Linh CÊp 5"..",".."¸o ChiÕn Cuång (Theo kiÓu h×nh, l­u ph¸i)"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 13) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	
    if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 13, 1);
	gf_Modify("Exp", 18000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	--5¼¶ÔÌÁé
	local nRandIndex = random(getn(CK_5_LEVEL_YUNLING));
	gf_AddItemEx2(CK_5_LEVEL_YUNLING[nRandIndex][2], CK_5_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
	
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_CLOTH);
end

--function ck_ScoreAward_func_13_Do(nIndex)

--end

function ck_ScoreAward_func_14(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_14(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 28000000, 580, 580, 4200, 0)..",".."Tù chän ®å trang søc cÊp 2 DiÖu D­¬ng"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 14) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	local tDialog = {}
	for i = 1, getn(CK_YAOYANG_JIEZI_2) do
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_14_Do(%d)", CK_YAOYANG_JIEZI_2[i][1], i));
	end
	tinsert(tDialog, "\nT«i chØ xem xem th«i/nothing");
	Say(CK_NPC_NAME.."H·y chän lo¹i cÇn:", getn(tDialog), tDialog);	
	
end

function ck_ScoreAward_func_14_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 14, 1);
	gf_Modify("Exp", 28000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	
	gf_AddItemEx2(CK_YAOYANG_JIEZI_2[nIndex][2], CK_YAOYANG_JIEZI_2[nIndex][1], "CDKEY", "CDKEY", 0, 1)
	
end

function ck_ScoreAward_func_15(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_15(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 32000000, 580, 580, 4200, 0)..",".."QuÇn ChiÕn Cuång  (Theo kiÓu h×nh, l­u ph¸i)"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 15) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 15, 1);
	gf_Modify("Exp", 32000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	--Õ½¿ñ¿ã×Ó
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_SHOE);
end

function ck_ScoreAward_func_16(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_16(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 36000000, 580, 580, 4200, 0)..",".."6 chuyÓn 90 cÊp"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 16) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	-----------------
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 16, 1);
--	gf_Modify("Exp", 36000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()			
	if nChuyenSinh < 690 then
--		gf_SetTaskByte(1538, 1, 5); 			--1×ª
--		PlayerReborn(1,random(1,4))
--		SetLevel(90, 1);								  --90¼¶
--		Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		ck_phucsinh1()
	else
		gf_Modify("Exp", 30000000);
		gf_Modify("Exp", 36000000);
		gf_Modify("Rep", 580);
		gf_Modify("ShiMen", 580);
		gf_Modify("JunGong", 4200);
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 16, 1);
	end
end

function ck_ScoreAward_func_17(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_17(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 40000000, 580, 580, 4200, 0)..",".."Vò khÝ ChiÕn Cuång(theo d¸ng ng­êi l­u ph¸i)"..",".."Trøng Linh Thó-Trung"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 17) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 17, 1);
	gf_Modify("Exp", 40000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	gf_AddItemEx2({2, 1, 30727, 1, 4}, "Trøng Linh Thó-Trung", "CDKEY", "CDKEY", 0, 1)
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_WEAPON)
end

function ck_ScoreAward_func_18(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_18(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 44000000, 580, 580, 4200, 0)..",".."NgÉu nhiªn ®¸ quý cÊp 4~6"..",".."Trøng Linh Thó-Trung"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 18) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 200, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 18, 1);
	gf_Modify("Exp", 44000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	gf_AddItemEx2({2, 1, 30727, 1, 4}, "Trøng Linh Thó-Trung", "CDKEY", "CDKEY", 0, 1)
	ck_GiveRandGem456()
end

function ck_ScoreAward_func_19(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n NhËn phÇn th­ëng/#ck_ScoreAward_func_19(%d,%d,1)", nCurScore, nNeedScore),
			"\nT«i chØ xem xem th«i/nothing",
		}
		local Msg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khÝ %d", 48000000, 580, 580, 4200, 0)..",".."Danh hiÖu [NhiÖm Vô §¹t Nh©n]"
		Say(CK_NPC_NAME..format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 19) ~= 0 then
		Say(CK_NPC_NAME.."§· nhËn phÇn th­ëng nµy råi!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 19, 1);
	gf_Modify("Exp", 48000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	AddTitle(68, 4);
	SetTitleTime(68, 4, GetTime() + 60 * 24 * 3600);
	Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "NhiÖm Vô §¹t Nh©n"))
end


function ck_chuyensinh()
	local tSay = 	{
							"Tu luyÖn theo h­íng Long Tö!/#ck_select_translife(1)",
							"Tu luyÖn theo h­íng Hæ Tö!/#ck_select_translife(2)",
							"Tu luyÖn theo h­íng Phông Tö!/#ck_select_translife(4)",
							"Tu luyÖn theo h­íng ¦ng Tö!/#ck_select_translife(3)",
							"Ta suy nghÜ l¹i ®·/nothing",
						}
	Say("Hçn Nguyªn C«ng thùc chÊt cã 4 h­íng tu luyÖn, ng­¬i muèn theo h­íng nµo?",getn(tSay),tSay)
end

function ck_select_translife(nType)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc chuyÓn sinh")
		return
	end	
	local nRoute = GetPlayerRoute()
	if gf_GetPlayerRebornCount() < 5 and gf_GetPlayerRebornCount() > 0 then
		local nTransCount_1 = GetTranslifeCount()	
		RemoveTitle(ck_tb_translife_tittle[nTransCount_1][nRoute][2], ck_tb_translife_tittle[nTransCount_1][nRoute][3])
	end
	-- Set sè lÇn chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, 5) --5 lÇn chuyÓn sinh
	-- Set h­íng chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	local nTransCount = GetTranslifeCount()	
--	for i=1,4 do	
--		RemoveTitle(ck_tb_translife_tittle[i][nRoute][2], ck_tb_translife_tittle[i][nRoute][3])
--	end
	AddTitle(ck_tb_translife_tittle[nTransCount][nRoute][2], ck_tb_translife_tittle[nTransCount][nRoute][3])	
--	SetTaskTrans()
	SetTask(TRANSLIFE_MISSION_ID,36)
	ResetProperty()
	SetLevel(90,0)
	Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø nhÊt...")
	AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 2 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
	WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
	--====phÇn th­ëng cña cÊp ®æi th­ëng ë trªn
	gf_Modify("Exp", 9000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	ahf_GetYaoYangWeaponRand(1);
	gf_AddItemEx2({2, 1, 30614, 1}, "L«i Hæ Tinh Ph¸ch", "CDKEY", "CDKEY", 0, 1);	
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 9, 1);
	--========
	DoWait(15,15,10)		
end

function CDKEY_SetExtBit(nExtPoint, nBit, nBitValue)
	if nBit < 1 or nBit > 15 then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "Out of range")
		return 0
	end
	local nValue = GetExtPoint(nExtPoint)
	local nNewValue = SetBit(nValue, nBit, nBitValue)
	PayExtPoint(nExtPoint, GetExtPoint(nExtPoint))
	AddExtPoint(nExtPoint, nNewValue)
	if GetExtPoint(nExtPoint) == nNewValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nValue.." to "..GetExtPoint(nExtPoint))
		return 0
	end
end

function ck_phucsinh1()
	local tSay = 	{
							"Tu luyÖn theo h­íng Long Tö!/#ck_select_translife_ps(1)",
							"Tu luyÖn theo h­íng Hæ Tö!/#ck_select_translife_ps(2)",
							"Tu luyÖn theo h­íng Phông Tö!/#ck_select_translife_ps(4)",
							"Tu luyÖn theo h­íng ¦ng Tö!/#ck_select_translife_ps(3)",
							"Ta suy nghÜ l¹i ®·/nothing",
						}
	Say("Hçn Nguyªn C«ng thùc chÊt cã 4 h­íng tu luyÖn, ng­¬i muèn theo h­íng nµo?",getn(tSay),tSay)
end

function ck_select_translife_ps(nType)
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long Tö", "Hæ Tö", "¦ng Tö", "Phông Tö"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
--	if nChuyenSinh < 599 then -- b¾t chuyÓn sinh 7
--		Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp kh«ng ®ñ, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
--		return 0	
--	end	
	if nChuyenSinh >= 690 then -- b¾t chuyÓn sinh 7
		Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp qu¸ cao, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
		return 0	
	end
--	if MeridianGetLevel() < 2 then	
--		Talk(1,"","Kinh m¹ch cña ®¹i hiÖp ch­a ®¹t cÊp ®é Vâ T­íng !!!!")
--		return 0			
--	end
	DelItem(2,0,1083,2)
	DelItem(2,1,30345,2)

	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs5 = GetTranslifeFaction()	
	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 30000 + GetBody()
			Pnew1 = 561 + GetBody()			
			Pnew2 = 565 + GetBody()		
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			BigDelItem(G,D,Pnew1,BigGetItemCount(G,D,Pnew1))			
			BigDelItem(G,D,Pnew2,BigGetItemCount(G,D,Pnew2))					
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end

	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V¨n Sö ngo¹i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- ChuyÓn Sinh 6 thµnh c«ng		
	SetLevel(90,0)
	AddTitle(61,05)
--	SetTask(TSK_CS6_TULINH,5)		--hoµn thµnh nhÖm vô chuyÓn sinh
--	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 2, 1, 1)
 	gf_WriteLogEx("CD KEY", "chuyÓn sinh thµnh c«ng", 1, "CD KEY phan thuong 16")	
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())
	--====phÇn th­ëng cña cÊp ®æi th­ëng ë trªn
	gf_Modify("Exp", 36000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);	
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 16, 1);
	--
	Msg2Player("Chóc mõng ®¹i hiÖp ®· Phôc Sinh thµnh c«ng theo h­íng "..tbType[nType])
	Say("Chóc mõng ®¹i hiÖp ®· lÜnh ngé thµnh c«ng bÝ kÝp gia truyÒn Tø Linh Phôc Tinh! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/nothing")
end