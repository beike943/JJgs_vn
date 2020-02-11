--½Å±¾Ãû³Æ£ºÁéÆÇ¿ªÆô½Å±¾
--½Å±¾¹¦ÄÜ£ºµã»÷ÁéÆÇ¿ªÆôµÄ»Øµ÷½Å±¾£¬Ö÷ÒªÓÃÓÚ¿ªÆôÌõ¼şµÄÅĞ¶Ï
--²ß»®ÈË£ºÇ¿¸ç
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2008-1-12
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\weaponeffect\\ling_add_main.lua")
function main(aptitude_name)
	--ÁéÆÇµÈ¼¶µÄ»ñÈ¡ºÍÅĞ¶Ï
	local aptitude_level = 0
	for i = 1,getn(Tb_aptitude_info) do
		if Tb_aptitude_info[i][7] == aptitude_name then
			aptitude_level = i
			break
		end
	end
	if aptitude_level == 0 and aptitude_name ~= "H¸m Thiªn" then
		return 0
	end
	--ÁéÆÇ¿ªÆôÌõ¼şÅĞ¶Ï
	local lin_remian_sec_num  = GetTime() -  GetTask(Break_sky_get_sec_seq_TaskID) - (30 * 86400)
	if lin_remian_sec_num >= 0 then
		Talk(1,"","<color=green>Nh¾c nhë<color>: Linh ph¸ch ®· qu¸ h¹n, kh«ng thÓ më!")
		return
	else
		if aptitude_name == "H¸m Thiªn" or aptitude_level == getn(Tb_aptitude_info) then
			return 1
		end
		local chk_flag = dostring(Tb_aptitude_info[aptitude_level][2]) 
		if chk_flag == 0 then
			Talk(1,"","<color=green>Nh¾c nhë<color>: HiÖn kh«ng thÓ ®¸p øng ®iÒu kiÖn kİch ho¹t Linh ph¸ch <color=yellow>"..aptitude_name.."<color>:"..Tb_aptitude_info[aptitude_level][6]..", t¹m thêi kh«ng thÓ triÖu gäi Linh hån.")
		end
		return chk_flag
	end
end
