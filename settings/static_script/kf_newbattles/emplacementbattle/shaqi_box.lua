--…±∆¯±¶œ‰
Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function main()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local npcIndex = GetTargetNpc();
	if GetNpcName(npcIndex) ~= "R≠¨ng s∏t kh›" then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 0);
	SetMomentum(10);
	Msg2Player(format("Ng≠Íi nhÀn Æ≠Óc %d Æi”m s∏t kh›", 10));
end