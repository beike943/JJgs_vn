--Create Date:2007-3-22 23:06
--Author:yanjun(yim)
--Describe:ÆæÃÅÕó·û£¬¿É´«ËÍµ½Õ½³¡Ö¸¶¨Î»ÖÃ£¬¿ÉÊ¹ÓÃÊı´Î(ÀàËÆÉñĞĞÃØ±¾,ÄÍ¾Ã99µã,Ã¿Ê¹ÓÃÒ»´ÎÒªµôÏà
--Ó¦µÄÄÍ¾ÃµãÊı,Ö»ÄÜÔÚÌØ¶¨Õ½³¡ÄÚ,ÇÒÕ½³¡¿ªÊ¼ºó²Å¿ÉÊ¹ÓÃ)¡£
Include("\\script\\newbattles\\functions.lua");

g_nUseCoolDown = 60;	--Ê¹ÓÃCDÊ±¼ä

tbPosEmplacement = 
{
	[1] = {"TuyÕn ®Çu ph¸o ®µi (t¶) (trõ 3 ®iÓm ®é bÒn)",3,1650,2965},
	[2] = {"TuyÕn ®Çu ph¸o ®µi (trung) (trõ 4 ®iÓm ®é bÒn)",4,1733,2990},
	[3] = {"TuyÕn ®Çu ph¸o ®µi (ph¶i) (trõ 3 ®iÓm ®é bÒn)",3,1795,2963},
	[4] = {"Trung qu©n tiÓu kİnh (trung) (trõ 2 ®iÓm ®é bÒn)",2,1718,3192,},
}

tbPosVillage = 
{
	[1] = {"Tïy qu©n h­íng ®¹o (trõ 3 ®iÓm ®é bÒn)",3,1627,3331},
	[2] = {"Trung t©m b¶n bå (trõ 2 ®iÓm ®é bÒn)",2,1671,3370},
	[3] = {"Gãc trªn b¶n ®å (trõ 2 ®iÓm ®é bÒn)",2,1673,3200},
	[4] = {"Gãc d­íi b¶n ®å (trõ 2 ®iÓm ®é bÒn)",2,1682,3548},
}

tbPosMain = 
{
	[1] = {"TiÒn doanh (trõ 5 ®iÓm ®é bÒn)",5,1761,3354},
	[2] = {"Khu tŞ n¹n phe Tèng (trõ 5 ®iÓm ®é bÒn)",5,1690,3291},
	[3] = {"Khu tŞ n¹n phe Liªu (trõ 5 ®iÓm ®é bÒn)",5,1836,3305},
	[4] = {"TiÒn tuyÕn phe Tèng (trõ 4 ®iÓm ®é bÒn)",4,1676,3409},
	[5] = {"TiÒn tuyÕn phe Liªu (trõ 4 ®iÓm ®é bÒn)",4,1842,3410},
	[6] = {"Khu thæ d©n (trõ 4 ®iÓm ®é bÒn)",4,1754,3500},
}

tbPos = {tbPosVillage,nil,tbPosEmplacement,tbPosMain,tbPosMain};	--²İ¹È³¡Ã»ÓĞ´«ËÍµã

function OnUse(nItemIdx)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	if nBattleType == 0 or nBattleType == RESOURCE_ID then
		Talk(1,"","Kú M«n TrËn Phï chØ sö dông trong chiÕn tr­êng Th«n L¹c, Ph¸o ®µi, Nh¹n M«n quan, Ngäc M«n quan. ");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Khi chiÕn trËn chİnh thøc b¾t ®Çu míi cã thÓ sö dông Kú M«n TrËn phï");
		return 0;
	end;
	if judge_use_state() == 0 then
		Talk(1,"","Tr¹ng th¸i hiÖn t¹i kh«ng thÓ sö dông Kú M«n TrËn Phï. <color=red>ChØ ®­îc sö dông ë hËu doanh<color>. ");
		return 0;
	end;
	nItemIdx = tonumber(nItemIdx);
	local nleft = AbradeItem(nItemIdx, 0)
	if (nleft == 0) then
		Say("§é bÒn hiÖn t¹i Kú M«n TrËn phï cña b¹n b»ng 0", 0)
		DelItemByIndex(nItemIdx, 0)					-- ÄÍ¾ÃÎª0ÒªÉ¾³ıµôÎïÆ·
	end
	local nTimeElapse = GetTime() - BT_GetData(PT_QIMENZHENFU_USE_TIME);
	if nTimeElapse <= g_nUseCoolDown then
		Talk(1,"","Sau <color=yellow>"..(g_nUseCoolDown-nTimeElapse).."<color> gi©y míi cã thÓ dïng l¹i Kú M«n TrËn phï.");
		return 0;
	end;
	local selTab = {};
	for i=1,getn(tbPos[nBattleType]) do
		tinsert(selTab,format(tbPos[nBattleType][i][1].."/#go_to(%d,%d,%d)",i,nBattleType,nItemIdx));
	end;
	tinsert(selTab,"Kh«ng sö dông/nothing");
	Say("B¹n hiÖn tham gia <color=yellow>"..tBattleName[nBattleType].."<color>, cã muèn sö dông Kú M«n TrËn phï kh«ng?",getn(selTab),selTab);
end;

function go_to(nIdx,nBattleType,nItemIdx)
	if BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--Èç¹ûÔÚµ¥Ìô³¡µØÖĞ
		return 0;
	end;
	local nMapX,nMapY = tbPos[nBattleType][nIdx][3],tbPos[nBattleType][nIdx][4];
	local nCurMapID = GetWorldPos();
	if nCurMapID == 880+nBattleType or nCurMapID == PRIMARY_MAIN_MAP_ID then	--ÀûÓÃµØÍ¼IDÔÙ×÷Ò»´ÎÅĞ¶Ï£¬Ö÷ÒªÊÇµ£ĞÄÈÎÎñ±äÁ¿³öÏÖÎÊÌâ
		local nShouldCost = tbPos[nBattleType][nIdx][2];
		AbradeItem(nItemIdx, nShouldCost)
		SetPos(nMapX,nMapY);
		BT_SetData(PT_QIMENZHENFU_USE_TIME,GetTime());
		set_player_state();
	else
		Talk(1,"","HiÖn t¹i kh«ng thÓ sö dông Kú M«n TrËn phï");
	end;
end;

function judge_use_state()
	if BT_GetTempData(PTT_LOCK) ~= 0 then	--µ¥ÌôËø¶¨»òµ¥ÌôÖĞ
		return 0;
	end;
	if GetFightState() == 1 then
		return 0;
	end;
	return 1;
end;

function set_player_state()
	if GetFightState() == 0 then
		BT_RestoreAll();
	end;
	BT_SetTempData(PTT_DIE_LOOP,0);
	SetFightState(1);
end;

function nothing()

end;