Include("\\settings\\static_script\\meridian\\npc_meridian_level_update.lua")

if MeridianGetLevel() == 1 then
	MeridianUpdateLevel();
	SetCurrentNpcSFX(PIdx2NpcIdx(), 901, 1, 0, 5);
elseif MeridianGetLevel() < 1 then
	Msg2Player("C¸c h¹ vÉn ch­a ®· th«ng c¶nh giíi kinh m¹ch Vâ Gi¶, kh«ng thÓ ®¶ th«ng c¶nh giíi Vâ T­íng.");
else
	--do_nothing
end