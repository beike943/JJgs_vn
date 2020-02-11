--*************************
-- Cay bat nha lon / nho --
--*************************

Include("\\script\\lib\\lingshi_head.lua");
TREELIFETIME = 5*60;	--Ê÷µÄÉúÃü£º5·ÖÖÓ
PLANT_SMALL_TREE_LIMIT = 16;	--Ã¿ÌìÖÖÐ¡Ê÷µÄÊýÁ¿ÏÞÖÆ -- 20101122
PLANT_BIG_TREE_LIMIT = 16;	--Ã¿ÌìÖÖ´óÊ÷µÄÊýÁ¿ÏÞÖÆ

TASK_GET_AWARD_DATE = 418;	--¼ÇÂ¼ÁìÈ¡½±ÀøµÄÈÕÆÚ
TASK_GET_AWARD_COUNT = 419;	--¼ÇÂ¼µ±ÌìÁìÈ¡½±ÀøµÄ´ÎÊý
TASK_TREEINDEX = 420;	--¼ÇÂ¼Íæ¼ÒÖÖµÄÊ÷µÄNPCË÷Òý
TASK_TREEGROW = 421;	--¼ÇÂ¼Ê÷µÄÉú³É³Ì¶È
TASK_PLANTTIME = 422;	--¼ÇÂ¼ÖÖÏÂÊ÷µÄÊ±¼ä£¬µ¥Î»ÎªÃë
TASK_GETSEEDCOUNT = 423;	--¼ÇÂ¼Íæ¼Òµ±ÌìµÃÖÖ×ÓµÄ´ÎÊý
TASK_GETSEEDDATE = 424;	--¼ÇÂ¼Íæ¼ÒÉÏ´ÎµÃÖÖ×ÓµÄÈÕÆÚ
TASK_GETSEEDHOUR = 425;	--¼ÇÂ¼Íæ¼ÒÉÏ´ÎµÃÖÖ×ÓµÄ¾ßÌåÊ±¼ä£¨Ð¡Ê±£©
TASK_TREEINDEX_SMALL = 426;	--¼ÇÂ¼Íæ¼ÒÖÖµÄÐ¡Ê÷µÄNPCË÷Òý
TASK_TREEGROW_SMALL = 427;	--¼ÇÂ¼Ð¡Ê÷µÄÉú³É³Ì¶È
TASK_PLANTTIME_SMALL = 428;	--¼ÇÂ¼ÖÖÏÂÐ¡Ê÷µÄÊ±¼ä£¬µ¥Î»ÎªÃë
TASK_PLAN_SMALLTREE_COUNT = 429	--¼ÇÂ¼Íæ¼Òµ±ÌìÖÖÐ¡Ê÷µÄ´ÎÊý
TASK_PLAN_SMALLTREE_DATE = 430	--¼ÇÂ¼Íæ¼ÒÖÖÏÂÐ¡Ê÷µÄÈÕÆÚ
TASK_PLAN_BIGTREE_COUNT = 431	--¼ÇÂ¼Íæ¼Òµ±ÌìÖÖ´óÊ÷µÄ´ÎÊý
TASK_PLAN_BIGTREE_DATE = 432	--¼ÇÂ¼Íæ¼ÒÖÖÏÂ´óÊ÷µÄÈÕÆÚ

TREETYPE = {	--Ä£°åÃû£¬NPCÃû×Ö£¬¼ä¸ôÊ±¼ä£¬ËùÐèÂ¶Ë®
		{"MÇm hoa hång","MÇm c©y Th¸i H­ B¸t Nh· ",45,1},
		{"MÇm Hoa hång","MÇm c©y Th¸i H­ B¸t Nh· ",45,1},
		{" nh¸nh hoa hång","C©y Th¸i H­ B¸t Nh· nhá ",45,1},
		{"c©y §a MËt Hoa Qu¶ nhá","C©y Th¸i H­ B¸t Nh· lín ",45,1},
		{"c©y §a MËt Hoa Qu¶ trung","C©y hoa Th¸i H­ B¸t Nh· ",45,2},
		{"c©y §a MËt Hoa Qu¶ lín","C©y Th¸i H­ B¸t Nh· ",45,2},
		};
SMALLTREETYPE = {	--Ä£°åÃû£¬NPCÃû×Ö£¬¼ä¸ôÊ±¼ä£¬ËùÐèÂ¶Ë®
		{"MÇm hoa hång","MÇm c©y Th¸i H­ nhá ",120,1},
		{"MÇm Hoa hång","MÇm c©y Th¸i H­ nhá ",120,1},
		{" nh¸nh hoa hång","C©y Th¸i H­ nhá ",120,1},
		}

function Create_Map_Trigger()
	local bCreateFailed = 0;	
	for i=1,5 do	
		Tid = 1107 + i
		Tidx = 3113 + i
		if GetTrigger(Tidx) == 0 then
			if CreateTrigger(2,Tid,Tidx) == 0 then	--´´½¨½øÈëÀë¿ªÖÖÊ÷µØÍ¼´¥·¢Æ÷
				bCreateFailed = 1	--Ä³Ò»¸ö´¥·¢Æ÷´´½¨Ê§°ÜÁË
			end
		end;
	end;
	if bCreateFailed == 1 then
		WriteLog("[Ho¹t ®éng Th¸i H­ Qu¶ Thô (KÕt nèi thÊt b¹i)]:"..GetName().."KÕt nèi server (3113~3118) thÊt b¹i.")
	end
end;

function checktime()
	local nHour = tonumber(date("%H"));
	if nHour == 13 or nHour == 17 or nHour == 21 then	--Ö»ÔÚ13µã17µãºÍ21µãÕâÁ½¸öÐ¡Ê±ÄÚ¿ª·Å
		return 1;
	else
		return 1;	--07Äê2ÔÂ9ÈÕ£¬IB·þÎñÆ÷¸ÄÎªÈÎºÎÊ±¼ä¶¼¿ÉÖÖ
	end;
end;

function checkplace()	--ÊÇ·ñÔÚÖ¸¶¨µØµã¡£³É¶¼¸®Î÷
	local nMapID = GetWorldPos();
	local nValidMapID = 0;
	local nValidMapID1 = 108;--Ìí¼ÓÖÖÊ÷µØÍ¼£¬ÈªÖÝ¸©±±
	if Check_YuanXiao08_Date() == 1 then
		nValidMapID = 504;
	else
		nValidMapID = 301;
	end;
	if nMapID == nValidMapID or nMapID == nValidMapID1 then
		return 1;
	else
		return 0;
	end;
end;

function checkplace_maincity()	--ÖÖÐ¡Ê÷¡£ÊÇ·ñÔÚÖ¸¶¨µØµã£ºËÄ´óÖ÷³Ç
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 200 or nMapID == 300 or (Check_YuanXiao08_Date() == 1 and nMapID == 500) then
		return 1;
	else
		return 0;
	end;
end;

function Get_Time_String(nSecond)
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	nDay = floor(nSecond/(60*60*24));
	if nDay > 0 then
		sTime = sTime..nDay.."Thiªn";
	end;
	nHour = floor(mod(nSecond/(60*60),24));
	if nHour > 0 then
		sTime = sTime..nHour.."h ";
	end;
	nMin = floor(mod(nSecond/60,60));
	if nMin > 0 then
		sTime = sTime..nMin.." phót ";
	end;
	nSec = mod(nSecond,60);
	if nSec >= 0 then
		sTime = sTime..nSec.." Gi©y ";
	end;
	return sTime;
end;
--ÅÐ¶ÏÊÇ²»ÊÇÔÚ£°£¸ÄêÔªÏü½Ú»î¶¯ÆÚ¼ä
function Check_YuanXiao08_Date()
	local nTime = tonumber(date("%Y%m%d%H"));
	if nTime >= 2008031200 and nTime <= 2008031623 then
		return 1;
	else
		return 0;
	end;
end;
--¸ø¶îÍâ½±Àø£¬nTypeÎª1Ê±ÊÇÐ¡Ê÷£¬Îª2Ê±ÊÇ´óÊ÷
function Give_YuanXiao_Award(nType)
	if Check_YuanXiao08_Date() ~= 1 then
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > GetTask(TASK_GET_AWARD_DATE) then
		SetTask(TASK_GET_AWARD_COUNT,0);
	end;
	local nTimes = GetTask(TASK_GET_AWARD_COUNT)+1;
	if nTimes <= 0 or nTimes > 4 then
		return 0;
	end;
	SetTask(TASK_GET_AWARD_COUNT,nTimes);
	SetTask(TASK_GET_AWARD_DATE,nDate);
	local tbPercent = {100,50,30,20};
	local tbLSCount = {};
	local nLevel = GetLevel();
	local nExpBase = 0;
	local nRand = 0;
	if nType == 1 then
		nExpBase = 200;
		tbLSCount = {4,3,2,1};
	elseif nType == 2 then
		nExpBase = 400;
		tbLSCount = {5,4,3,2};
	end;
	if nLevel >= 10 and nLevel <= 98 then
		local nExp = ((nExpBase*10000*nLevel^3)/(80^3))*(tbPercent[nTimes]/100);
		nRand = random(1,100);
		if nRand <= 5 then
			nExp = nExp*2;
			Msg2Global("Chóc mõng "..GetName().."Trong dÞp TÕt trång c©y tham gia ho¹t ®éng trång c©y nhËn ®­îc phÇn th­ëng gÊp 2 lÇn!");
		elseif nRand <= 7 then
			nExp = nExp*3;
			Msg2Global("Chóc mõng "..GetName().."Trong dÞp TÕt trång c©y tham gia ho¹t ®éng trång c©y nhËn ®­îc phÇn th­ëng gÊp 3 lÇn!");
		end;
		nExp = floor(nExp*0.8);	--Ãâ·ÑÇø¡Á0.8
		ModifyExp(nExp);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm, ®©y lµ lÇn ®æi ®iÓm kinh nghiÖm thø "..nTimes.." (lÇn) nhËn thªm phÇn th­ëng,mçi ng­êi mét ngµy ®­îc nhËn thªm phÇn th­ëng 4 lÇn");
		WriteLog("[08TÕt trång c©y]:"..GetName().."thø"..nTimes.." (lÇn) nhËn thªm phÇn th­ëng, trÞ kinh nghiÖm:"..nExp..". §¼ng cÊp ng­êi ch¬i:"..nLevel);
	elseif nLevel == 99 then	--99¼¶»ñµÃ5¿Å1ÖÁ6¼¶µÄËæ»úÁéÊ¯
		local nLSLevel = 0;
		for i=1,tbLSCount[nTimes] do
			nLSLevel = random(1,6);
			lspf_AddLingShiInBottle(nLSLevel,1);
			Msg2Player("B¹n nhËn ®­îc 1 "..nLSLevel.." (cÊp) Linh th¹ch, ®· cho vµo Tô Linh ®Ønh");
		end;
		Msg2Player("H«m nay b¹n ®øng thø"..nTimes.." (lÇn) nhËn thªm phÇn th­ëng,mçi ng­êi mét ngµy ®­îc nhËn thªm phÇn th­ëng 4 lÇn")
		WriteLog("[08TÕt trång c©y]:"..GetName().."thø"..nTimes.." (lÇn) nhËn thªm phÇn th­ëng, ®­îc"..tbLSCount[nTimes].." Linh th¹ch");
	end;
end;

function nothing()

end;