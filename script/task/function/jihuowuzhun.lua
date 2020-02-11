function ActivteWZ()
	local nMeridianLevel = MeridianGetLevel();
	if nMeridianLevel == 3 then
		MeridianUpdateLevel();
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),901,0,0);
	end
end