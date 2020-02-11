--½Å±¾Ãû³Æ£ºRandomTaskTipEx»Øµ÷½Å±¾
--½Å±¾¹¦ÄÜ£ºRandomTaskTipEx£¨("xxxxxx", "yyyyyy")£©:xxxxxxxxxÎª¶Ô»°ÄÚÈİ£¬yyyyyyyyÎª±¾½Å±¾ÖĞ¶ÔÓ¦µÄº¯Êı
--			¾ßÌåÄÚÈİÇë×ÉÑ¯´å³¤»òÀîÖ¾
--²ß»®ÈË£º´å³¤
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-05-23
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--=====================================½á»é¼¼ÄÜ»Øµ÷Ïà¹Ø========================================
random_tasktip_taskID = 1226
--************************»Øµ÷Ö÷º¯Êı**********************

Include("\\script\\master_prentice\\some_op.lua")

function ma_trans_dia()
	local task_diff = GetTask(random_tasktip_taskID)
	--²ÎÊı´«Èë´íÎó¼´·µ»Ø
	if task_diff ~= 2 and task_diff ~= 4 then
		return
	end
	--Èç¹ûËÀÍöÔò·µ»Ø
	if IsPlayerDeath() == 1 then
		return
	end
	local ma_trans_dia = ""
	if task_diff == 2 then
		ma_trans_dia = "Khu vùc hiÖn t¹i "
	else
		ma_trans_dia = "{c¹nh}"
	end	
	local mate_sex = ""
	if GetSex() == 1 then
		mate_sex = "Ng­êi ch¬i"
	else
		mate_sex = "Tha"
	end
	SetTask(random_tasktip_taskID,0)
	Say("<color=yellow>chØ dÉn<color>: §ång ®éi yªu cÇu b¹n chuyÓn ®Õn "..mate_sex..ma_trans_dia..", ®ång ı kh«ng?",
	2,
	"§ång ı/#ma_trans_callback("..task_diff..")",
	"Kh«ng ®ång ı/Main_Exit"
	)
end
--·òÆŞ´«ËÍ»Øµ÷
function ma_trans_callback(task_diff)
	--Ê×ÏÈÒªµÃµ½ÅäÅ¼×ø±ê£¬ËùÒÔÒª½øÈëÅäÅ¼
	if GetMateOnlineStatus() ~= 1 then
		Msg2Player("§ång ®éi kh«ng lªn m¹ng!")
		return
	end
	--°ÚÌ¯×´Ì¬ÎŞ·¨´«ËÍ
	if IsStalling() == 1 then
		Msg2Player("Tr¹ng th¸i bµy b¸n kh«ng thÓ truyÒn tèng!")
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "§ång ®éi ë tr¹ng th¸i bµy b¸n!")
		return
	end	
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ask_mate_callback", tostring(task_diff))
end

function momentumtip()
	Say("Nh×n thÊy ch÷ sè trªn khung kü n¨ng s¸ng lªn ch­a? §ã lµ trŞ s¸t khİ, cho b¹n biÕt trŞ s¸t khİ hiÖn thêi, tïy ı di chuyÓn vŞ trİ.", 0)
end

-- Ê¦Í½
function _prentice_see_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	Say("S­ phô gäi b¹n k×a, sao h¶?", 2, "§ång ı/prentice_yes_la", "Kh«ng ®ång ı/prentice_no_la")
end

function prentice_yes_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		Say("Khu vùc hiÖn t¹i kh«ng thÓ h« ho¸n", 0)
		DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_accept_lalala_err", GetName())
		return
	end
	
	if IsPlayerDeath() == 1 then
		Msg2Player("ë tr¹ng th¸i tö vong kh«ng thÓ triÖu gäi.")
		return
	end
	if IsStalling() == 1 then
		Msg2Player("§ang bµy b¸n kh«ng thÓ triÖu gäi.")
		return
	end
	if IsReading() == 1 then
		Msg2Player("§ang tu luyÖn mËt tŞch kh«ng thÓ triÖu gäi.")
		return
	end
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--Õ½¶·×´Ì¬ÏÂPKÄ£Ê½²»¿ÉÒÔÊ¹ÓÃ
		Msg2Player("ChÕ ®é PK bªn ngoµi kh«ng thÓ triÖu gäi.")
		return
	end
	DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_accept_lalala", GetName())
end

function prentice_no_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_refuse_la", GetName())
end
