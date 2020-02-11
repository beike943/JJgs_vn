--task 153
function datong_meridian_wuwan()
	local nMeridianLevel = MeridianGetLevel();
	if nMeridianLevel == 2 then
		MeridianUpdateLevel();
	end
end


dostring("datong_meridian_wuwan()")