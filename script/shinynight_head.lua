GAMESVRGLB_SYSTEM		= 151	-- GameServerÈ«¾Ö±äÁ¿£ºÏµÍ³
GAMESVRGLB_MULTIPLE		= 152	-- GameServerÈ«¾Ö±äÁ¿£º±¶ÂÊ

SYS_BATTLE				= 1		-- Õ½³¡µÄÕ½¹¦
SYS_COC			 	 	= 2		-- ÉÌ»áµÄ½±Àø
SYS_MASTER_RANDOMTASK	= 3		-- Ê¦ÃÅËæ»úÈÎÎñ½±Àø
SYS_MASTER_REPEATTASK	= 4		-- Ê¦ÃÅÖØ¸´ÈÎÎñ½±Àø
SYS_KILLER_TASK			= 5		-- É±ÊÖÈÎÎñ½±Àø
SYS_DRAGONBOAT			= 6		-- ÁúÖÛ»ı·Ö½±Àø

MIN_MULTIPLE			= 1		-- ±¶ÂÊ×îĞ¡Öµ
MAX_MULTIPLE			= 3		-- ±¶ÂÊ×î´óÖµ

-- ½±Àø·­±¶µÄÏµÍ³
map_sysnames = {
	"ChiÕn tr­êng",
	"Th­¬ng héi",
	"NhiÖm vô s­ m«n - ngÉu nhiªn",
	"NhiÖm vô s­ m«n tuÇn hoµn",
	"NhiÖm vô s¸t thñ",
	"ThuyÒn rång"
}

-- »ñÈ¡½±ÀøµÄ±¶ÂÊ
function get_reward_multiple(system)
	local multiple_sys = GetGlbValue(GAMESVRGLB_SYSTEM) -- ½±Àø·­±¶µÄÏµÍ³
	local multiple_val = 1
	if (multiple_sys ~= 0 and multiple_sys == system) then
		multiple_val = GetGlbValue(GAMESVRGLB_MULTIPLE) / 100
		if (multiple_val == 0) then
			multiple_val = 1
		end
	end
	if (multiple_val < MIN_MULTIPLE) then
		multiple_val = MIN_MULTIPLE
	end
	if (multiple_val > MAX_MULTIPLE) then
		multiple_val = MAX_MULTIPLE
	end
	return multiple_val
end

-- ½±Àø·­±¶
function multiple_reward(system, reward)
	local multiple = get_reward_multiple(system)
	if (multiple == 1) then
		return reward
	else
		return reward * multiple
	end
end
