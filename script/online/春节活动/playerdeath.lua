Include("\\script\\online\\´º½Ú»î¶¯\\snowwar\\snowwar_head.lua");
function OnDeath(Launcher)
	local KillerIndex = NpcIdx2PIdx(Launcher);
	local EntryNo = random(1,getn(tBORN_POS))
	local MapID = GetWorldPos()
	SetTempRevPos(MapID,tBORN_POS[EntryNo][1]*32,tBORN_POS[EntryNo][2]*32)	--Ëæ»úÖØÉúµã
	SetDeathScript("\\script\\online\\´º½Ú»î¶¯\\playerdeath.lua")
	if GetMissionV(MV_FIELD_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	SetTask(PT_POINT,GetTask(PT_POINT,KillerIndex)+1, 0, KillerIndex);
	SetTask(PT_KILL_COUNT,GetTask(PT_KILL_COUNT,KillerIndex)+1, 0, KillerIndex);
	if GetTask(PT_POINT,KillerIndex) > LIMIT_POINT then
		SetTask(PT_POINT,LIMIT_POINT, 0, KillerIndex);
		Msg2SomeOne(KillerIndex,"§iÓm tÝch lòy cña b¹n ®¹t møc tèi ®a:"..LIMIT_POINT.." Phót ");
	end;
	Msg2SomeOne(KillerIndex,"B¹n dïng TuyÕt cÇu ®¸nh ng·"..GetName(PlayerIndex)..", nhËn ®­îc mét ®iÓm tÝch lòy nÐm tuyÕt. HiÖn sè ®iÓm tÝch lòy cña b¹n lµ:"..GetTask(PT_POINT,KillerIndex));
	if GetTask(PT_POINT,KillerIndex) > LIMIT_POINT then
		SetTask(PT_POINT,LIMIT_POINT, 0, KillerIndex);
	end;
	SetTask(PT_POINT,GetTask(PT_POINT,PlayerIndex)-1, 0, PlayerIndex);
	SetTask(PT_DEATH_COUNT,GetTask(PT_DEATH_COUNT)+1, 0, PlayerIndex);
	if GetTask(PT_POINT,PlayerIndex) < 0 then
		SetTask(PT_POINT,0, 0, PlayerIndex);
	end;
	RestoreAll()
	CastState("state_dispear",0, 5*18)
	Msg2Player("B¹n bÞ "..GetName(KillerIndex).." dïng TuyÕt cÇu ®¸nh ng·, mÊt mét ®iÓm tÝch lòy, hiÖn sè ®iÓm tÝch lòy cña b¹n lµ:"..GetTask(PT_POINT,PlayerIndex))
end