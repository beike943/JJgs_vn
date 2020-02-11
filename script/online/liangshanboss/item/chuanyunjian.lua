--¡∫…Ω–≈ŒÔ
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online_activites\\task_values.lua")

MAP_TABLE = {507,504,501};
Item_Table = {2,1,30391,"Xuy™n V©n Ti‘n"};
ITEM_NEED_NUM = 1;

function OnUse(nItem)
	if GetTime() - GetTaskTemp(Pre_Click_Time3) < Used_Space_Time then
		--Msg2Player(format("µ¿æﬂ π”√µƒCD ±º‰Œ™%d√Î",Used_Space_Time));
		return 0;
	end
	--ºÏ≤ÈªÓ∂Ø ±º‰
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"","VÀt ph»m Æ∑ qu∏ hπn sˆ dÙng");
		return 0;
	end
	if LSB_Check_LR() == 0 then
			return 0;
	end
	--µ±ÃÏµÿÕº «∑Ò∫œ  
	local nMap,nX,nY = GetWorldPos();
	if LSB_IsAllowMap(MAP_TABLE,nMap) == 0 then
		Talk(1,"","B∂n ÆÂ hi÷n tπi kh´ng th” sˆ dÙng vÀt ph»m nµy");
		return 0;
	end
	--ŒÔ∆∑ ˝¡øºÏ≤È
	if GetItemCount(Item_Table[1],Item_Table[2],Item_Table[3]) < ITEM_NEED_NUM then
		Talk(1,"",format("SË l≠Óng Xuy™n V©n Ti‘n kh´ng ÆÒ %d c∏i",ITEM_NEED_NUM));
	end
	--boss ˝¡øºÏ≤È
	if LSB_GetCurrMapBossNum(nMap) >= MAX_BOSS_NUM then
		Talk(1,"",format("SË l≠Óng Boss trong b∂n ÆÂ kh´ng th” v≠Ót qu∏ %d ",MAX_BOSS_NUM));
		return 0;
	end
	--ºÏ≤È «∑Òboss√ªÀ¿ªÚ’ﬂœ‰◊”√ªµ„
	if LSB_Check_NpcName() == 0 then
		Talk(1,"","L≠¨ng S¨n hµo ki÷t g‰i ra tr≠Ìc khi ch’t ho∆c sau khi nh∆t B∂o R≠¨ng mÌi c„ th” sˆ dÙng Æπo cÙ nµy")
		return 0;
	end
	--…æ≥˝ŒÔ∆∑
	if DelItem(Item_Table[1],Item_Table[2],Item_Table[3],1) ~= 1 then
		return 0;
	end
	SetCurrentNpcSFX(PIdx2NpcIdx(),936,1,0,18*5);
	--…Ë÷√CD ±º‰
	SetItemUseLapse(18 * 60 * 2);
	--øÁÃÏ«Â¿Ì
	LSB_Check_Day_Seq()
	--’–boss
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_Is_Allow_BOSS");
	SetTaskTemp(Pre_Click_Time3,GetTime());
	--»ŒŒÒ
	if tGtTask:check_cur_task(90) == 1 and GetTask(VET_LSB_CALLBOSS) < 5 then
		SetTask(VET_LSB_CALLBOSS,GetTask(VET_LSB_CALLBOSS) + 1);
		if GetTask(VET_LSB_CALLBOSS) ~= 5 then
			Msg2Player(format("Tri÷u g‰i %d/5 l«n L≠¨ng S¨n hµo ki÷t ",GetTask(VET_LSB_CALLBOSS)));
		else
			Msg2Player(format("Tri÷u g‰i %d/5 l«n L≠¨ng S¨n hµo ki÷t (hoµn thµnh)",GetTask(VET_LSB_CALLBOSS)));
		end
	end
	--µÿÕºboss ˝¡ø+1
	SetMapTaskTemp(nMap,1,GetMapTaskTemp(nMap,1) + 1);
--	local nKind,nMapId,nNpcIndex = LSB_CreateBoss();
--	if nKind == 1 and LSB_Get_Map_Name(nMapId) ~= nil then
--		--¥¥Ω®±¶œ‰
--		local nNpcIdx = CreateNpc("◊ ‘¥±¶œ‰", format("%sµƒª∆Ω±¶œ‰",GetName()), nMap, nX + 1, nY + 1);
--		SetNpcLifeTime(nNpcIdx,3 * 60);
--		--º«¬ºindex
--		SetTaskTemp(Gld_Boss_Index,nNpcIdx);
--		SetNpcScript(nNpcIdx,Box_E_Script);
--		Msg2Global(format("%sÕÊº“√˚∑«≥£–“‘Àµƒ’–≥ˆ¡À%sª∆Ω¥ÛBOSS “ª≤ª–°–ƒ±ªÀ˚Ã”µΩ%sµÿÕº£¨¥Ûº“øÏ«∞ÃÙ’Ω«¿±¶°£",GetName(),GetNpcName(nNpcIndex), LSB_Get_Map_Name(nMapId)));
--	else
--		Msg2Player(format("%s∑«≥£–“‘Àµƒ’–≥ˆ¡À%sBOSS",GetName(),GetNpcName(nNpcIndex)));
--	end
end