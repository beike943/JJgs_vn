Include("\\script\\½á»é\\marriage_head.lua");
CALLBACK_FILE		= "\\script\\½á»é\\npc\\»éÇì´«ËÍÈË.lua"		-- »Øµ÷ÎÄ¼şÃû

g_date 		= 0		-- ÈÕÆÚ
g_period 	= 0		-- Ê±¶Î
g_couples 	= {}	-- ²»Í¬ÀàĞÍ³¡µØµÄĞÂÈËÃû×Ö
g_recvcount = 0		-- ÊÕµ½µÄ¹²ÏíÊı¾İ¿â¼ÇÂ¼ÊıÄ¿

g_InfoHeader = "<color=green>Ng­êi dÉn ch­¬ng tr×nh<color>:";

-- ÊÇ·ñÔÚ»éÀñ³¡µØ
function in_wedding_field()
	local mapid, x, y = GetWorldPos()
	for i = 1, getn(map_fieldpos) do
		if (map_fieldpos[i][1] == mapid) then
			return 1
		end
	end
	return 0
end

function main()
	if GetGlbValue(GLB_CLOSE_FIELD) == 1 then
		Talk(1,"",g_InfoHeader.."Xin lçi, s©n khÊu h«n lÔ t¹m thêi ®ãng cöa. Cô thÓ thÕ nµo xin hái ng­êi phôc vô.");
		return 0;
	end;
	if (in_wedding_field() == 1) then
		Say(g_InfoHeader.."Chóc mõng. Cã muèn rêi khái s©n khÊu h«n lÔ kh«ng?", 2,
			"§ång ı/ask_reason",
			"Hñy bá/cancel")
		return
	end
	
	local this_date = curr_date()
	local this_period = curr_period()
	if (g_date ~= this_date or g_period ~= this_period) then
		init(this_date, this_period)
	else
		Say(g_InfoHeader.."Cã ph¶i c¸c h¹ muèn ®Õn s©n khÊu h«n lÔ?",
			3,
			"Ta cÇn ®Õn s©n khÊu h«n lÔ/enter",
			"Xem t©n lang, t©n n­¬ng lµ ai?/show",
			"§Ó ta suy nghÜ l¹i/cancel")
	end
end

function show()
	local sInfor = "";
	for type = 1, getn(map_fieldinfo) do
		if (g_couples[type][1] ~= "") then
			sInfor = sInfor..format("%s: T©n lang <color=yellow>%s<color> vµ t©n n­¬ng <color=yellow>%s<color>", map_fieldinfo[type][1], g_couples[type][1], g_couples[type][2]).."<enter>";
		else
			sInfor = sInfor..format("%s: trèng", map_fieldinfo[type][1]).."<enter>";
		end
	end
	Talk(1,"main",g_InfoHeader.."T×nh h×nh hiÖn t¹i ë c¸c s©n khÊu h«n lÔ: <enter>"..sInfor)
end

function show_more_info()
	--ĞèÒªµÄÊ±ºòÔÙÌí¼ÓÄÚÈİ°É
end;

function ask_reason()
	AskClientForString("leave","§i tr­íc ®©y!......",1,32,"Sao ph¶i rêi khái?");
end;	
-- Àë¿ª»éÀñ³¡µØ
function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"Rêi khái ®Ó l¹i tin nh¾n:"..sLeaveMsg);
end
--³õÊ¼»¯³¡µØĞÅÏ¢£¬Ö÷ÒªÊÇ³õÊ¼»¯g_couplesÕâ¸öÊı×é£¬½«±¾Ê±¶Î³¡µØËù¶ÔÓ¦µÄĞÂÈËÃû×ÖÌî½øÈ¥
function init(date, period)
	-- DEBUG
	gf_ShowDebugInfor(format("init(%d,%d)", date, period))
	for i = 1, getn(map_fieldpos) do
		g_couples[i] = {"", ""}
	end
	
	g_recvcount = 0
	for i = 1, getn(map_fieldpos) do
		local param2 = encode_param2(period, i)
		ApplyRelayShareData(KEY_WEDDING, date, param2, CALLBACK_FILE, "hook_recvsubs")
	end
end

-- »Øµ÷º¯Êı£º¶ÁÈ¡³¡µØÔ¤¶©ĞÅÏ¢
function hook_recvsubs(key, param1, param2, count)
	-- DEBUG
	gf_ShowDebugInfor(format("hook_recvsubs(%s,%d,%d,%d)", key, param1, param2, count))
	
	if (count ~= 0) then
		local period, type = decode_param2(param2)	
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		
		g_couples[type] = {role,wife}
	end
	
	g_recvcount = g_recvcount + 1
	if (g_recvcount == getn(map_fieldpos)) then
		g_date = curr_date()
		g_period = curr_period()
		main()
	end
end

-- ½øÈë»éÀñ³¡µØ¶Ô»°
function enter()
	-- DEBUG
	gf_ShowDebugInfor("enter()")
	local name = GetName()
	local sex = GetSex()
	for i = 1, getn(g_couples) do
		if (g_couples[i][sex] == name) then
			-- DEBUG
			gf_ShowDebugInfor("Cã ng­êi míi vµo")
			local nDesMapID = map_fieldpos[i][1];
			local nFieldState = mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID);
			if nFieldState == MS_STATE_IDEL then	--Ä¿±ê³¡µØ¿ÕÏĞ
				Talk(1,"main",g_InfoHeader.."HiÖn t¹i c¸c s©n khÊu h«n lÔ ®Òu ch­a më, xin ®îi mét chót!");
			else	--ĞÂÈËËæÊ±¶¼¿ÉÒÔ½ø³¡
				mf_JoinMission(MISSION_ID,CAMP_COUPLE,nDesMapID);
				WriteLog("[KÕt h«n]: Ng­êi th©n"..GetName().."vµo s©n khÊu kÕt h«n, lo¹i s©n khÊu:"..i);
			end;
			return
		end
	end
	
	local this_date = curr_date()
	local this_period = curr_period()
	local types = get_invitaion(this_date, this_period)
	if (getn(types) == 0) then	--³ö´íÊ±²ÅÓĞ¿ÉÄÜÎª£°
		Talk(1, "enter",g_InfoHeader.."Cã thiÖp mêi míi ®­îc vµo s©n khÊu kÕt h«n")
	else
		local talk = {}
		local nSelCount = 0;
		for i = 1, getn(types) do
			nSelCount = nSelCount + 1;
			talk[nSelCount] = format("%s/#enter_field(%d,%d,%d)",
				map_fieldinfo[i][1],
				this_date,
				this_period,
				i)
		end
		talk[nSelCount+1] = "Ta ch­a tõng ®Õn/cancel"
		Say(g_InfoHeader.."Xin chän s©n khÊu cÇn ®Õn", getn(talk), talk)
	end
end

-- ½øÈë»éÀñ³¡µØ
function enter_field(date, period, type)
	local nDesMapID = map_fieldpos[type][1];
	local nDesWeddingID = mf_GetMissionV(MISSION_ID,MV_WEDDING_ID,nDesMapID);
	local nPlayerWeddingID = GetTask(TASK_WEDDING1_ID+type-1);
	local nFieldState = mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID);
	if nFieldState == MS_STATE_IDEL then
		Talk(1,"main",g_InfoHeader.."HiÖn s©n khÊu h«n lÔ vÉn ch­a më cöa, xin ®îi mét chót!");
	elseif mf_GetPlayerCount(MISSION_ID,CAMP_FRIEND,nDesMapID) >= map_fieldinfo[type][5] then
		Talk(1,"main",g_InfoHeader.."Trong s©n khÊu h«n lÔ kh«ng khİ rÊt n¸o nhiÖt. T©n lang vµ t©n n­¬ng vÉn ch­a ®Õn, ng­¬i ®îi ë ®©y tõ tõ vµo nhĞ!");
	elseif nFieldState == MS_STATE_READY then	--Èç¹ûÊÇ×¼±¸½×¶Î
		if is_compere() == 1 then	--Èç¹ûÊÇÖ÷»éÈË
			if nPlayerWeddingID == nDesWeddingID then	--Èç¹ûÖ®Ç°½øÈ¥¹ı
				mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);	--¿ÉÒÔ½ø³¡
				return
			end;
			if del_invitaion(date, period, type) == 1 then
				mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);	--¿ÉÒÔ½ø³¡
			else
				Talk(1,"enter",g_InfoHeader.."Cã thiÖp mêi míi ®­îc vµo s©n khÊu kÕt h«n");
			end;
			return
		end;
		Talk(1,"main",g_InfoHeader.."T©n nh©n ®ang chuÈn bŞ h«n lÔ, xin ®îi mét l¸t h·y vµo.");
		return
	else	--ÆäËüÊ±¼ä´ó¼Ò¶¼¿ÉÒÔ½ø³¡
		if nPlayerWeddingID == nDesWeddingID then	--Èç¹ûÖ®Ç°½øÈ¥¹ı
			mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);	--¿ÉÒÔ½ø³¡
			return
		end;
		if del_invitaion(date, period, type) == 1 then
			mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);
		else
			Talk(1,"enter",g_InfoHeader.."Cã thiÖp mêi míi ®­îc vµo s©n khÊu kÕt h«n");
		end;
	end;
end
--·µ»ØÒ»¸ötable£¬Ö»ÓĞËÄ¸öÔªËØ£¬¶ÔÓ¦ÊÇ·ñÓĞÏàÓ¦ÀàĞÍ³¡µØµÄÇëÌû£¬0±íÊ¾Ã»ÓĞ£¬1±íÊ¾ÓĞ
function get_invitaion(date, period)
	local types = {};
	for i=1,getn(map_fieldinfo) do
		types[i] = 0;	--¸ù¾İ³¡µØÊıÁ¿³õÊ¼»¯typesÊı×é
	end;
	local obj_index, item_index = GetFirstItem()
	while (obj_index ~= 0 and item_index ~= 0) do
		local genre = GetItemGenre(item_index)
		local detail = GetItemDetail(item_index)
		local particular = GetItemParticular(item_index)
		if (genre == ITEM_INVITATION[1] and detail == ITEM_INVITATION[2] and particular == ITEM_INVITATION[3]) then
			local item_date = GetItemParam(item_index, 0)
			local item_period, type = decode_param2(GetItemParam(item_index, 1))
			if (date == item_date and period == item_period) then
				types[type] = 1;
			end
		end
		obj_index, item_index = GetNextItem(obj_index, item_index)
		-- DEBUG
		gf_ShowDebugInfor(format("GetNextItem(%d,%d)", obj_index, item_index))
	end
	-- DEBUG
	gf_ShowDebugInfor("get_invitaion return")
	return types
end

function del_invitaion(date,period,type)
	local obj_index, item_index = GetFirstItem()
	while (obj_index ~= 0 and item_index ~= 0) do
		local genre = GetItemGenre(item_index)
		local detail = GetItemDetail(item_index)
		local particular = GetItemParticular(item_index)
		if (genre == ITEM_INVITATION[1] and detail == ITEM_INVITATION[2] and particular == ITEM_INVITATION[3]) then
			local item_date = GetItemParam(item_index, 0)
			local item_period, item_type = decode_param2(GetItemParam(item_index, 1))
			if (date == item_date and period == item_period and type == item_type) then
				if DelItemByIndex(item_index,1) == 1 then
					return 1;
				end;
			end
		end
		obj_index, item_index = GetNextItem(obj_index, item_index)
	end
	return 0;
end;
