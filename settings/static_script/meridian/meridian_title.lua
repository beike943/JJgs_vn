--¾­Âö³ÆºÅÏà¹Ø´¦Àí½Å±¾
Include ("\\script\\system_switch_config.lua")

t_tile_cfg =
{
	--byTitleGenre, wTitleDetailType, szTitleName
	{64, 1, "Vâ HiÒn"},
	{64, 2, "Vâ T­íng"},
	{64, 3, "Vâ V­¬ng"},
	{64, 4, "Vâ T«n"},
	{64, 5, "Vâ Hoµng"},
	{64, 6, "Vâ Th¸nh"},
}

--¼ì²é²¢¸øÓèÏàÓ¦µÄ¾³½ç³ÆºÅ
function merdiantitle_check_add_title(bNotify)
	if 1 ~= IsMeridianSystemOpen() then
		if 1 == bNotify then
			Talk(1,"",format("HÖ thèng kinh m¹ch vÉn ch­a khai th«ng"))
		end
		return 0
	end
	local nAdd = 0
	local nCurLevel = MeridianGetLevel()
	for i = 1, nCurLevel do
		local t = t_tile_cfg[i]
		if t then
			if 1 ~= IsTitleExist(t[1], t[2]) then
				AddTitle(t[1], t[2])
				SetCurTitle(t[1], t[2])
				nAdd = nAdd + 1
				Msg2Player(format("C¸c h¹ nhËn ®­îc danh hiÖu [%s]", t[3]))
			end
		else
			break
		end
	end
	if bNotify then
		if 0 == nAdd then
			Talk(1,"",format("C¸c h¹ ®· hÕt danh hiÖu cã thÓ nhËn!"))
		else
			Talk(1,"",format("C¸c h¹ ®· nhËn thµnh c«ng %d danh hiÖu", nAdd))
		end
	end
	return nAdd
end