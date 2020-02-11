
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_tsdl.lua");
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\tmp_task_id_def.lua")
----------------------------------------------------------------------------
--ÌØÊâËµ»°
--¸ÅÂÊ±í {10, 20, 30}
--¶Ô»° {{...}, {...}, {...}}
--·µ»ØÖµ{0,1,1}
function DoTSTalkTask(tRand, tTalk, tRet)
	--if type(tRand) ~= "table" and type(tTalk) ~= "table" and type(tRet) ~= "table" then
		local nMax = 0
		for i = 1, getn(tRand) do
			nMax = nMax + tRand[i]
		end
		
		local nRand = random(1, nMax);
		local nTemp = 0;
		for i = 1, getn(tRand) do
			nTemp = nTemp + tRand[i]
			if nRand <= nTemp then
				nTemp = i
				break
			end
		end
		
		if tTalk[nTemp] ~= nil then
			--local strDiag = tGtNpcMain:dialog_string_deal(tTalk[nTemp]);
			TalkEx("", tTalk[nTemp]);
		end
		
		return tRet[nTemp];
	--else
		--return -1
	--end
end

----------------------------------------------------------------------------
--ÌØÊâµôÂä Íæ¼ÒÉíÉÏËùÓĞµÄÌØÊâµôÂäÈÎÎñÁĞ±í
--·µ»ØÖµ ÁĞ±í [1] TaskID [2] TSDLIdx
function tGTaskTSDL:GetPlayerTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractTSDLList(tTaskID);
end

--ÌØÊâµôÂä Íæ¼ÒÉíÉÏÎ´Íê³ÉµÄÌØÊâµôÂäÁĞ±í
function tGTaskTSDL:GetPlayerLiveTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractLiveTSDLList(tTaskID)
end

--ÌØÊâµôÂä Íæ¼ÒÉíÉÏÊÇ·ñ´æÔÚÎ´Íê³ÉµÄÌØÊâµôÂä
--·µ»ØÖµ
	--1¡¢ÓĞ
	--0¡¢ÎŞ
function tGTaskTSDL:IsPlayerHaveLiveTSDL()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return 0
	end
	return tGTaskTSDL:IsLiveTSDL(tTaskID)
end

--ÌØÊâµôÂäµÄ¹Ö
--1¡¢Íæ¼ÒÉíÉÏËùÓĞµÄÈÎÎñ
--2¡¢ÏÖÔÚ´òËÀµÄ¹ÖµÄÃû×Ö
--3¡¢µØÍ¼
--·µ»ØÖµ
	--1¡¢³É¹¦µôÂä£¬²»ĞèÒª´¦Àí´¥·¢Æ÷
	--2¡¢ÎŞĞèÒªÌØÊâµôÂäµÄÈÎÎñ£¬ÒÆ³ı´¥·¢Æ÷
	--3¡¢³É¹¦µôÂä£¬ĞèÒª´¦Àí´¥·¢Æ÷
	--4¡¢ÌØÊâµôÂä²»³É¹¦
function DoTSDLTask(szNpcName, nMapID)
	local tTaskID = tGtTask:GetAllTask();
	local nRet = 2;
	if tTaskID == nil or getn(tTaskID) == 0 then
		return nRet;
	end
	
	local tTaskIDList = {};
	local tTSDLList = {};
	tTaskIDList, tTSDLList = tGTaskTSDL:GetPlayerLiveTSDLList(tTaskID);
	
	for i = 1, getn(tTSDLList) do
		nRet = 4
		if tGTaskTSDL:IsMatch(tTSDLList[i], szNpcName, nMapID) == 1 then
			--print("TSDL:"..tTaskIDList[i]..tTSDLList[i]..szNpcName..nMapID);
			local nRand = random(1, 100);
			if nRand <= tonumber(TABLE_GT_TSDL:getCell(tTSDLList[i], 6)) then	--Ëæ»ú³É¹¦
				--¸øÓèÎïÆ·
				dostring("gf_AddItemEx({"..TABLE_GT_TSDL:getCell(tTSDLList[i], 5).."},\""..TABLE_GT_TSDL:getCell(tTSDLList[i], 4).."\")");
				
				--ÊÇ·ñÍê³ÉµôÂä
				if tGTaskTSDL:IsTSDLEnd(tTSDLList[i]) == 1 and tGTaskTSDL:IsPlayerHaveLiveTSDL() == 0 then
					return 3
				end
				return 1
			end
		end
	end
	
	return nRet
end

KILL_JZJZ_TSDL = 4001
function TSDL_Trigger()	--ÌØÊâµôÂä	
	local nNpcIdx, szNpc, szNpcName = GetTriggeringUnit();	
	local nMapID, nMapX, nMapY = GetWorldPos();
	
	local nCreateTrigger = 1;
	if nNpcIdx ~= 0 then
		local nRet = DoTSDLTask(szNpcName, nMapID);
		if nRet == 3 or nRet == 2 then	--ĞèÒª´¦Àí´¥·¢Æ÷
			nCreateTrigger = 0
		end
	end
	
	RemoveTrigger(GetRunningTrigger());
	
	if nCreateTrigger == 1 and GetTrigger(KILL_JZJZ_TSDL) == 0 then
		CreateTrigger(0, 1245, KILL_JZJZ_TSDL, 1);
	end
end

--2É±¹Ö´¥·¢Æ÷
function xiaotulang()
	local nNpcIdx = CreateNpc("Thæ Lang V­¬ng", "Thæ Lang V­¬ng", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
	gt_trigger_callback();
end

--2É±¹Ö´¥·¢Æ÷
function xiaoqinglang()
	local nNpcIdx = CreateNpc("Thanh Lang V­¬ng", "Thanh Lang V­¬ng", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
	gt_trigger_callback();	
end


--9É±¹Ö´¥·¢Æ÷
function baozhanglao()
	gt_trigger_callback();
end

--19É±¹Ö´¥·¢Æ÷
function jiaotu()
	gt_trigger_callback();
end

--24 É±¹Ö´¥·¢Æ÷
function heiyezhu()
	gt_trigger_callback();
end

--43 É±¹Ö´¥·¢Æ÷
function heixingxing()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function dushe()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function yanjingshe()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function danianshou()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

--48É±¹Ö´¥·¢Æ÷
function yinjian()
	gt_trigger_callback();
end

--53É±¹Ö´¥·¢Æ÷
function huangzhonggong()
	gt_trigger_callback();
end

--109É±¹Ö´¥·¢Æ÷
function jiaotu_30109()
	gt_trigger_callback();
end

--114É±¹Ö´¥·¢Æ÷
function huangqicike()
	gt_trigger_callback();
end

function huangyouwei()
	gt_trigger_callback();
end

--115É±¹Ö´¥·¢Æ÷
function malidao()
	gt_trigger_callback();
end

function xiaolihong()
	gt_trigger_callback();
end

--116É±¹Ö´¥·¢Æ÷
function feitianmao()
	gt_trigger_callback();
end

function lanqicike()
	gt_trigger_callback();
end

--117É±¹Ö´¥·¢Æ÷
function bailingling()
	gt_trigger_callback();
end

function baiqicike()
	gt_trigger_callback();
end

--121
function youhun_121()
	gt_trigger_callback();
	local tbTask = {
		"§©y chİnh lµ d­¬ng lôc cña <Quú Hoa B¶o §iÓn> sao?! Haha, cuèi cïng ®· t×m ®­îc råi.",
		"Qu¶ nhiªn lµ mét quyÓn mËt tŞch vâ c«ng thÇn bİ, luyÖn xong cã thÓ ®¶ th«ng kú kinh b¸t m¹ch trªn ng­êi, æn vËn ch©n khİ. Ta ph¶i luyÖn thö míi ®­îc. \n<color=green>(®äc mËt tŞch...)<color>",
		"MËt tŞch nµy qu¶ nhiªn kú diÖu \n<color=green>(luyÖn c«ng…………)<color>",
		"å!!! trong ng­êi nh­ cã mét luån ch©n khİ d©ng trµo\n<color=green>(luyÖn c«ng…………)<color> (®ét nhiªn sau l­ng næi giã)",
		"Lµ ai?!!! \n ( C¶m gi¸c mét luång nhiÖt khİ tõ phİa sau Ëp tíi, ngÊt ®i,  trong lóc m¬ hå nh×n thÊy mét g· mÆc ¸o mµu ®en ®o¹t lÊy << Quú Hoa B¶o §iÓn>>  trong tay m×nh, ng­êi nµy lµ ai? nh×n th©n h×nh cã vÎ h¬i quen.)",
	}
	Talk(getn(tbTask),"youhun_121_deal",tbTask[1],tbTask[2],tbTask[3],tbTask[4],tbTask[5]);
end

function youhun_121_deal()
	NewWorld(6018,1618,2901);
	SetFightState(0);
end

function hanshandawan()
	gt_trigger_callback();
end

function shenmigongjianshou()
	gt_trigger_callback();
end

function chunyizhang()
	gt_trigger_callback();
end

function yemaoxiang()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("yunbangzhu", "V©n Bang Chñ", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function heixingxing_101()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("yunbangzhu", "V©n Bang Chñ", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function huoqilin()
	gt_trigger_callback();
	local npcIndex = CreateNpc("lubangzhu", "Lôc bang chñ", GetWorldPos());
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\lubangzhu.lua");
	SetNpcLifeTime(npcIndex, 10*60);
end

function tiezhangyinsi()
	gt_trigger_callback();
end

function liruofei()
	gt_trigger_callback();
end

function mohuasongbing()
	gt_trigger_callback();
end

function mohualiaoxianfeng()
	gt_trigger_callback();
end

function mohualiaobing()
	gt_trigger_callback();
end

function mohuasongxianfeng()
	gt_trigger_callback();
end

function yugaui()
	gt_trigger_callback();
end

function xiaolandaogui()
	gt_trigger_callback();
end

function yaohu()
	gt_trigger_callback();
end

function xiaohongdaogui()
	gt_trigger_callback();
end

function youhui()
	gt_trigger_callback();
end

function xieseng()
	gt_trigger_callback();
end

function huilang()
	gt_trigger_callback();
end

function liaodaobing()
	gt_trigger_callback();
end
function feizei()
	gt_trigger_callback();
end

function dianlang()
	gt_trigger_callback();
end

function muren()
	gt_trigger_callback();
end

function laohu()
	gt_trigger_callback();
end

function daoxia()
	gt_trigger_callback();
end

function mingjianke()
	gt_trigger_callback();
end

function duwugong()
	gt_trigger_callback();
end

function judushirencao()
	gt_trigger_callback();
end

function miaolinhuyin()
	gt_trigger_callback();
end

function chihuoheijiaotu()
	gt_trigger_callback();
end

function yanjingshe2()
	gt_trigger_callback();
end

function wumengyongshi()
	gt_trigger_callback();
end

function weiguodaoke()
	gt_trigger_callback();
end

function waizhushashou()
	gt_trigger_callback();
end

function waizhugongshou()
	gt_trigger_callback();
end

function yizhuwushi()
	gt_trigger_callback();
end

function yizhujianshou()
	gt_trigger_callback();
end

function chongguai()
	gt_trigger_callback();
end

function shiren()
	gt_trigger_callback();
end

function chihuobaijiaotu()
	gt_trigger_callback();
end

function chihuojiaotu()
	gt_trigger_callback();
end

function yipingtangmishi()
	gt_trigger_callback();
end

function chilianhuohu()
	gt_trigger_callback();
end

function songdaobing()
	gt_trigger_callback();
end

function songjunsishi()
	gt_trigger_callback();
end

function dahuangfeng()
	gt_trigger_callback();
end

function bosiyaoji()
	gt_trigger_callback();
end

function chihuodaoke()
	gt_trigger_callback();
end

function shamoxingren()
	gt_trigger_callback();
end

function liaoqiangbing()
	gt_trigger_callback();
end

function wulai()
	gt_trigger_callback();
end

function cangyuan()
	gt_trigger_callback();
end

function bingmayongshiwei()
	gt_trigger_callback();
end

function ck_huli()
	gt_trigger_callback();
end

function ck_cihuojiaotu()
	gt_trigger_callback()
end

function ck_cangyuan()
	gt_trigger_callback()
end

function ck_miaolingtushi()
	gt_trigger_callback()
end

function ck_boshiyaoji()
	gt_trigger_callback()
end

function ck_weiguodaoke()
	gt_trigger_callback()
end

function ck_pipaxianzi()
	gt_trigger_callback()
end

function ck_zhangweigang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_shangguhuoqiling()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_yuguaitoumu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_lili()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_funiushandawang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_xixiajianglin()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuoyaofu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_boduyingji()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuosengwu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuozhanglao()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_axiuluo()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_mohuluojia()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_duanchengen()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chunshisanniang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_zaxusahan()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function chihuodaoke2()
	gt_trigger_callback()
	Msg2Player("Xi Háa §ao Kh¸ch: Cøu t«i víi, xin ®¹i hiÖp h·y tha cho tiÓu nh©n, Th­¬ng ¦ng ®ang bŞ giam ë nhµ lao cña Long Nh·n §éng 1!")
end

function heiyizhuangshi()
	gt_trigger_callback();
end

function world_boss()
	gt_trigger_callback();
end

