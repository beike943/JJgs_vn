--create date:07-04-19
--author:yanjun
--describe:ÊØ³ÇÁîÎïÆ·½Å±¾
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","ChØ trong khu vùc C«ng thµnh chiÕn míi cã thÓ sö dông Thñ VÖ lÖnh.");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_READY then
		Talk(1,"","HiÖn ch­a phµi thêi gian nhËn chøc Thñ vÖ. ChØ trong giai ®o¹n chuÈn bÞ míi cã thÓ nhËn chøc Thñ vÖ");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	if nPlayerCamp ~= SHOU_ID then
		Talk(1,"","ChØ cã phe thñ míi cã thÓ sö dông Thñ VÖ lÖnh.");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nDoorIdx ~= 0 then
		Talk(1,"","B¹n ®· lµ Thñ vÖ cña "..tDoorName[nDoorIdx].."!");
		return 0;
	end;
	local selTab = {
				format(" trë thµnh "..tDoorName[1].."Thñ vÖ/#use(%d,%d)",nItemIdx,1),
				format(" trë thµnh "..tDoorName[2].."Thñ vÖ/#use(%d,%d)",nItemIdx,2),
				format(" trë thµnh "..tDoorName[3].."Thñ vÖ/#use(%d,%d)",nItemIdx,3),
				"Hñy bá/nothing",
				}
	local nEnemyCamp = GONGSHOU_ID - nPlayerCamp;
	local szSEGuardName,szSSGuardName,szSWGuardName = GCZ_GetGuardName(SHOU_ID,0);
	Say(gf_FormatStringLength(tDoorName[1],12,0)..":"..gf_FormatStringLength(szSEGuardName,20).."\n"..gf_FormatStringLength(tDoorName[2],12,0)..":"..gf_FormatStringLength(szSSGuardName,20).."\n"..gf_FormatStringLength(tDoorName[3],12,0)..":"..gf_FormatStringLength(szSWGuardName,20).."\n\nC¸c thµnh trªn ®©y, c¸c h¹ muèn thµnh Thñ vÖ cña thµnh nµo?",getn(selTab),selTab);
end;

function use(nItemIdx,nDoorIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","ChØ trong khu vùc C«ng thµnh chiÕn míi cã thÓ sö dông Thñ VÖ lÖnh.");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_READY then
		Talk(1,"","HiÖn ch­a phµi thêi gian nhËn chøc Thñ vÖ. ChØ trong giai ®o¹n chuÈn bÞ míi cã thÓ nhËn chøc Thñ vÖ");
		return 0;
	end;
	local szGuardName = GCZ_GetGuardName(SHOU_ID,nDoorIdx);
	if szGuardName ~= "Ch­a" then
		Talk(1,"","Thµnh m«n nµy ®· s¾p xÕp Thñ vÖ. Xin h·y chän thµnh m«n kh¸c!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
		SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),PlayerIndex);
		SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,SHOU_ID);
		GCZ_Msg2Camp(GetName().."Sö dông Thñ Thµnh lÖnh trë thµnh "..tDoorName[nDoorIdx].."Thñ vÖ",SHOU_ID);		
		Talk(1,"","B¹n ®· trë thµnh Thñ vÖ cña <color=yellow>"..tDoorName[nDoorIdx].."<color>. Träng tr¸ch rÊt nÆng nÒ!");
	end;
end;