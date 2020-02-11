Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\string.lua");
Include("\\script\\Ω·ªÈ\\mission\\mission_head.lua");
Include("\\script\\global\\mate_head.lua");
DEBUG_VERSION = 0;	-- «∑Òµ˜ ‘∞Ê±æ

GLB_CLOSE_MARRIAGE = 153;	--πÿ±’√Ω∆≈∫Õ‘¬¿œ
GLB_CLOSE_FIELD	= 154;		--πÿ±’¥´ÀÕ»À∫ÕΩ·ªÈ≥°µÿ

SetGlbValue(GLB_CLOSE_MARRIAGE,0);	--»Á–Ëπÿ±’√Ω∆≈∫Õ‘¬¿œ£¨’‚¿Ô…Ë÷√Œ™1
SetGlbValue(GLB_CLOSE_FIELD,0);	--»Á–Ëπÿ±’≥°µÿ∫Õ¥´ÀÕ»À£¨’‚¿Ô…Ë÷√Œ™1

MARRIAGE_CHANNEL = "Khu v˘c k’t h´n"

KEY_WEDDING				= "WEDDING_FIELD"	-- π≤œÌ ˝æ›º«¬ºµƒ÷˜º¸

ITEM_COIN				= {2,1,549}		-- ¿ÒΩ
ITEM_INVITATION			= {2,1,506}		-- «ÎÃ˚
ITEM_DOOLY				= {0,105,32}	-- ΩŒ◊”
ITEM_LIHUA				= {2,1,546}		-- ¿Òª®
ITEM_XITANG				= {2,1,507}		-- œ≤Ã«
ITEM_MTCXB				= {2,1,548}		-- ¬˛ÃÏ≤ –º∞¸
ITEM_QINGTIE_PACKET		= {2,1,547}		-- «ÎÃ˘∞¸
ITEM_NOTEBOOK 			= {2,1,550}		-- ≥°µÿÀµ√˜ ÷æÌ
ITEM_JINGBIAOBOOK		= {2,1,540}		-- ≥°µÿæ∫±Í ÷æÌ
ITEM_HONGBAO = {
			[1] = {2,1,539,"ßπi hÂng bao hoµng kim"},
			[2] = {2,1,537,"ßπi hÂng bao tˆ kim"},
			[3] = {2,1,508,"HÂng bao"},
			}
			
ITEM_MARRIAGE_PACKET = {
			[1] = {2,1,541,"V‹nh K’t ßÂng T©m bao"},
			[2] = {2,1,542,"C m Sæt Hﬂa Minh bao"},
			[3] = {2,1,543,"Chu Li™n B›ch HÓp bao"},
			[4] = {2,1,544,"V®n ßﬁnh C∏t T≠Íng bao"},
			}
--=====================================================================================================
TASK_WEDDING_COST		= 2000				-- »ŒŒÒ±‰¡ø£∫ªÈ¿ÒÕ∂±Íº€∏Ò
TASK_WEDDING_DATE		= 2001				-- »ŒŒÒ±‰¡ø£∫ªÈ¿ÒÕ∂±Í»’∆⁄
TASK_WEDDING_FIELD		= 2002				-- »ŒŒÒ±‰¡ø£∫ªÈ¿ÒÕ∂±Í ±∂Œ∫Õ≥°µÿ
TASK_WEDDING 			= 2003				-- »ŒŒÒ±‰¡ø£∫ªÈ¿Ò≤Ω÷Ë + ªÈ¿Ò◊¥Ã¨ * 1000
TASK_WEDDING_LOVER		= 2004				-- »ŒŒÒ±‰¡ø£∫¡µ»À√˚◊÷µƒ±‡¬Î
TASK_EAT_XITANG_COUNT	= 2005				-- µ±»’≥‘œ≤Ã« ˝¡ø
TASK_EAT_XITANG_DATE	= 2006				-- ≥‘œ≤Ã«µƒ»’∆⁄
TASK_TAKE_FOOD_TIME		= 2007				-- …œ¥Œ»°◊ﬂ ≥ŒÔµƒ ±º‰
TASK_KOTOW				= 2008				--  «∑Ò‘⁄Ω·ªÈ≥°µÿ◊ˆπ˝∞›µƒ∂Ø◊˜
TASK_GOT_INVITATION		= 2009				--  «∑Ò¡Ï»°¡À«ÎÃ˘

TASK_FACTION_OUT		= 2011				-- »ŒŒÒ±‰¡ø£∫ «∑Ò≥ˆ ¶
TASK_SEPERATION_DATE	= 2018				-- »ŒŒÒ±‰¡ø£∫∑÷æ”»’∆⁄£®ƒÍ∑› * 600 + ‘¬∑› * 40 + »’∆⁄£©
TASK_MARRIAGE_HINT		= 2019				-- »ŒŒÒ±‰¡ø£∫Ω·ªÈ≤Ω÷ËÃ· æ

TASK_WEDDING1_ID		= 2024				-- º«¬ºÕÊº“Ω¯»Îµƒ£±∫≈≥°µÿªÈ¿ÒID
TASK_WEDDING2_ID		= 2025				-- º«¬ºÕÊº“Ω¯»Îµƒ£≤∫≈≥°µÿªÈ¿ÒID
TASK_WEDDING3_ID		= 2026				-- º«¬ºÕÊº“Ω¯»Îµƒ£≥∫≈≥°µÿªÈ¿ÒID
TASK_WEDDING4_ID		= 2027				-- º«¬ºÕÊº“Ω¯»Îµƒ£¥∫≈≥°µÿªÈ¿ÒID

TASK_BUY_RING			= 2028				-- º«¬º¬ÚΩ‰÷∏µƒ«Èøˆ°£∏ˆŒª±Ì æ «∑Ò¬Ú¡Àƒ–Ω‰£¨ ÆŒª±Ì æ «∑Ò¬Ú¡À≈ÆΩ‰

INTERVAL_SEPERATION		= 7					-- ∑÷æ”µƒÃÏ ˝

--ƒ≥ÃÏƒ≥ ±∂Œƒ≥≥°µÿµƒ‘§∂©◊¥Ã¨Ω·ππµƒœÓ
ITEMKEY_STAT			= "stat"			-- ‘§∂©◊¥Ã¨
ITEMKEY_ROLE			= "role"			-- ‘§∂©»À
ITEMKEY_WIFE			= "wife"			-- ≈‰≈º
ITEMKEY_COST			= "cost"			-- ‘§∂©Ω∂Ó
ITEMKEY_CLOSEDATE		= "close_date"		-- Ωÿ÷¡»’∆⁄
ITEMKEY_CLOSETIME		= "close_time"		-- Ωÿ÷¡ ±º‰

-- ≤ªÕ¨¿‡–ÕªÈ¿Ò≥°µÿ∂‘”¶µƒµÿÕºID, TODO: here
map_field2type = {
	[851] = 1,	--ÎŸ÷¨–°÷˛
	[852] = 2,	--ÃÏ—ƒ∫£Ω«
	[853] = 3,	--∂¥∑øª®÷Ú
	[854] = 4,	--‘∆…Ω÷Æ·€
}

field_lihua_limit = {10,20,30,50}	--≥°µÿƒ⁄¿Òª® ˝¡øœﬁ÷∆

-- ªÈ¿Ò‘§∂© ±∂Œ
map_period = {
	{12,0,13,30,"12:00-13:30","12:30-13:30"},	
	{18,0,19,30,"18:00-19:30","18:30-19:30"},
	{21,0,22,30,"21:00-22:30","21:30-22:30"},
}

map_RevPos	= {
	{851,1521,3181},
	{852,1602,3167},
	{853,1506,3175},
	{854,1609,3222},
	}

-- ≥°µÿ¿‡–Õ
map_fieldinfo = {
	-- √˚≥∆			∆±Íº€	¬Ú∂œº€	∏Ω«ÎÃ˚ ˝  ◊Ó¥Û»À ˝   º”º€
	{"Y’t chi ti”u trÛc",	20,		250,	3,			50,        10},
	{"C´ Æ∂o",	40,		500,	5,			100,       20},
	{"ßÈng phﬂng hoa chÛc",	200,	2500,	5,			100,       100},
	{"V©n S¨n Æÿnh",	800,	10000,	8,			100,       400}
}

-- ≥°µÿ◊¯±Í
map_fieldpos 	= {		-- ªÈ¿Ò≥°µÿµÿÕºID∫Õ◊¯±Í
	{851, 1543, 3220},
	{852, 1603, 3276},
	{853, 1544, 3213},
	{854, 1603, 3326},
}

map_leavefieldpos = {
	{150, 1711, 3051},
	{150, 1711, 3051},
	{150, 1711, 3051},
	{150, 1711, 3051},
}
-- ≥ŒÔ
tFoods = 
{
	[1] = {1,1,2," C¨m næm"},
	[2] = {1,1,3," Mµn th«u"},
	[3] = {1,1,4," B∏nh x’p"},
	[4] = {1,1,5," B∏nh bao thﬁt"},
	[5] = {1,1,6,"ß‹a m®ng xµo"},
	[6] = {1,1,7," T¯Qu˝ ÆÀu"},
	[7] = {1,1,8," ßÀu xµo"},
	[8] = {1,1,9,"C∂i xµo t·i"},
	[9] = {1,1,10,"Thi™u ßao Tˆ"},
	[10] = {1,1,11,"N˜ Nhi HÂng"},
	[11] = {1,1,12,"ßπo Hoa H≠¨ng"},
	[12] = {1,1,13,"TÛy MÈng Tˆu"},
	[13] = {1,1,14," C¨m chi™n tr¯ng"},
	[14] = {1,1,15," B∏nh BÈt vµng"},
	[15] = {1,1,16,"Lπc Mai"},
	[16] = {1,1,17,"Nhﬁ thÀp t¯ ki“u Minh Nguy÷t Dπ"},
	[17] = {1,1,18,"MÈc Lan H≠¨ng"},
	[18] = {1,1,19,"T©y Bæc V‰ng"},
}

ITEM_COMPERE	= {					-- ÷˜ªÈ»ÀÕ‚“¬
	{0, 109, 177},	--◊‚µƒ
	{0, 109, 178},
	{0, 109, 179},
	{0, 109, 180},
	{0, 109, 241},	--¬Úµƒ
	{0, 109, 242},
	{0, 109, 243},
	{0, 109, 244},
}

SKILL_CANDY		= 870		-- ººƒ‹ID£∫»ˆœ≤Ã«
--============================================================================================
function cancel()
	-- Do nothing
end

-- …Ë÷√ªÈ¿Òµƒ≤Ω÷Ë:1±Ì æø…“‘Ã·«◊¡À£¨2±Ì æƒ…≤ £®Ωª√ΩΩ∫Õ¿Ò∆∑£©≥…π¶£¨
--3±Ì æŒ √˚£®Ωªª•«ÎÃ˘£¨…Ë÷√¡µ»À¬Î£©≥…π¶£¨4±Ì æ¥Û∆∏≥…π¶£¨5±Ì æ∂©≥°µÿ≥…π¶¡À
function set_wedding_step(step)
	local stat = floor(GetTask(TASK_WEDDING) / 1000)
	SetTask(TASK_WEDDING, stat*1000 + mod(step, 1000))
end

-- ªÒ»°ªÈ¿Òµƒ≤Ω÷Ë
function get_wedding_step()
	return mod(GetTask(TASK_WEDDING), 1000)
end

-- …Ë÷√ªÈ¿Òµƒ◊¥Ã¨£¨1±Ì æÕ∂±Í≥…π¶ªÚ’ﬂ—°‘Ò¡À≤ª–Ë“™Ω·ªÈ≥°µÿ
function set_wedding_stat(stat)
	local step = mod(GetTask(TASK_WEDDING), 1000)
	SetTask(TASK_WEDDING, step + stat * 1000)
end

-- ªÒ»°ªÈ¿Òµƒ◊¥Ã¨
function get_wedding_stat()
	return floor(GetTask(TASK_WEDDING) / 1000)
end

--  «∑Ò“—æ≠Ω·ªÈ
function is_married(player)
	local old_idx = PlayerIndex
	local result = 0
	PlayerIndex = player
	if (GetMateName() ~= "") then
		result = 1
	end
	PlayerIndex = old_idx
	return result
end

-- ªÒ»°∂”ŒÈ÷–µƒ“‚÷–»ÀµƒÕÊº“À˜“˝
function get_team_lover(myself)
	for i = 1, 2 do
		local index = GetTeamMember(i)
		if (index ~= myself) then
			return index
		end
	end
	return 0
end

-- ªÒ»°“‚÷–»À‘⁄∂”ŒÈ÷–µƒÀ˜“˝
function get_love_team_index(myself)
	for i = 1, 2 do
		local index = GetTeamMember(i)
		if (index ~= myself) then
			return i
		end
	end
	return 0
end

-- ªÒ»°¡µ»Àµƒ√˚◊÷±‡¬Î
function get_lover_code(index)
	return GetTask(TASK_WEDDING_LOVER, index)
end

-- …Ë÷√¡µ»Àµƒ√˚◊÷±‡¬Î
function set_lover_code(index, code)
	SetTask(TASK_WEDDING_LOVER, code, 0, index)
end

function encode_date(year, mon, day)
	return year * 600 + mon * 40 + day
end

function decode_date(date)
	local year = floor(date / 600)
	local rest = mod(date, 600)
	local mon = floor(rest / 40)
	local day = mod(rest, 40)
	return year, mon, day
end

function encode_param2(period, type)
	return period * 100 + type
end

function decode_param2(param2)
	local type = mod(param2, 100)
	local period = floor(param2 / 100)
	return period, type
end

-- ΩÒÃÏ
function curr_date()
	local year = tonumber(date("%Y"))
	local mon = tonumber(date("%m"))
	local day = tonumber(date("%d"))
	return encode_date(year, mon, day)
end

function cmp_time(hour1, min1, hour2, min2)
	if (hour1 > hour2) then
		return 1
	elseif (hour1 < hour2) then
		return -1
	elseif (min1 > min2) then
		return 1
	elseif (min1 < min2) then
		return -1
	else
		return 0
	end
end

function cmp_datetime(date1, time1, date2, time2)
	-- DEBUG
	-- print(format("cmp_datetime(%d, %d, %d, %d)", date1, time1, date2, time2))
	if (date1 > date2) then
		return 1
	elseif (date1 < date2) then
		return -1
	elseif (time1 > time2) then
		return 1
	elseif (time1 == time2) then
		return 0
	else
		return -1
	end
end

-- ªÒ»°µ±«∞ ±∂Œ
function curr_period()
	local hour = tonumber(date("%H"))
	local min = tonumber(date("%M"))
	for i = 1, getn(map_period) do
		local period_info = map_period[i]
		if (cmp_time(hour, min, period_info[1], period_info[2]) >= 0 and
			cmp_time(hour, min, period_info[3], period_info[4]) <= 0) then
			return i
		end
	end
	return -1
end

-- ∑«»ÚƒÍ
map_days = {
	[1] = 31,
	[2] = 28,
	[3] = 31,
	[4] = 30,
	[5] = 31,
	[6] = 30,
	[7] = 31,
	[8] = 31,
	[9] = 30,
	[10] = 31,
	[11] = 30,
	[12] = 31
}

-- »ÚƒÍ
map_days_leapyear = {
	[1] = 31,
	[2] = 29,
	[3] = 31,
	[4] = 30,
	[5] = 31,
	[6] = 30,
	[7] = 31,
	[8] = 31,
	[9] = 30,
	[10] = 31,
	[11] = 30,
	[12] = 31
}

function encode_time(hour, min, sec)
	return hour * 3600 + min * 60 + sec
end


function decode_time(time)
	local hour = floor(time / 3600)
	local rest = mod(time, 3600)
	local min = floor(rest / 60)
	local sec = mod(rest, 60)
	return hour, min, sec
end

-- «∞“ªÃÏ
function prev_date(date)
	local days = map_days
	local year, mon, day = decode_date(date)
	if (mod(year, 4) == 0) then
		days = map_days_leapyear
	end
	if (day > 1) then
		return encode_date(year, mon, day - 1)
	elseif (mon > 1) then
		return encode_date(year, mon - 1, days[mon - 1])
	else
		return encode_date(year - 1, 12, 31)
	end
end

-- œ¬“ªÃÏ
function next_date(date)
	local days = map_days
	local year, mon, day = decode_date(date)
	if (mod(year, 4) == 0) then
		days = map_days_leapyear
	end

	if (day < days[mon]) then
		return encode_date(year, mon, day + 1)
	elseif (mon < 12) then
		return encode_date(year, mon + 1, 1)
	else
		return encode_date(year + 1, 1, 1)
	end
end

function curr_time()
	local hour = tonumber(date("%H"))
	local min = tonumber(date("%M"))
	local sec = tonumber(date("%S"))
	return encode_time(hour, min, sec)
end

-- ªÒ»°ΩÒÃÏø™ ºµƒº∏ÃÏµƒ»’∆⁄
function future_days(from, count)
	local date = curr_date()
	for i = 1, from do
		date = next_date(date)
	end
	local days = {}
	for i = 1, count do
		days[i] = date
		date = next_date(date)
	end
	return days
end

-- œ¬“ª∏ˆΩ·ªÈ≤Ω÷ËÃ· æ
function hint_step(step)
	SetTask(TASK_MARRIAGE_HINT, step)
end

-- √≈≈…
map_faction = {
	[1] = {"Thi’u L©m","Tha"},
	[2] = {"V‚ ßang","Tha"},
	[3] = {"Nga My","Ng≠Íi ch¨i"},
	[4] = {"C∏i Bang","Tha"},
	[5] = {"ß≠Íng M´n","Ng≠Íi ch¨i"},
	[6] = {"D≠¨ng M´n","Ng≠Íi ch¨i"},
	[7] = {"NgÚ ßÈc","Ng≠Íi ch¨i"},
	[8] = {"C´n L´n", "Tha"},
	[9] = {"Minh gi∏o", "Tha"},
	[10] = {"ThÛy Y™n", "Ng≠Íi ch¨i"},
}

-- ≥ˆ ¶
function faction_graduate(faction)
	if (GetPlayerFaction() ~= faction) then
		Talk(1, "",
			"Ng≠¨i kh´ng ph∂i lµ Æ÷ tˆ " .. map_faction[faction][1] .. ", muËn xu t s≠ ph∂i Æ’n g∆p ch≠Îng m´n tr˘c ti’p cÒa m◊nh!")
	elseif (GetTask(TASK_FACTION_OUT) ~= 0) then
		Talk(1, "", "Ng≠¨i Æ∑ lµ Æ÷ tˆ xu t s≠")
	else
		SetTask(TASK_FACTION_OUT, 1)
		Talk(1, "", "Nam n˜ y™u nhau lµ chuy÷n Æ≠¨ng nhi™n. Ng≠¨i Æ∑ t◊m Æ≠Óc ˝ trung nh©n, ta ÆÂng ˝ cho ng≠¨i xu t s≠. ChÛc ng≠¨i b∏ch ni™n giai l∑o!")
	end
end

--  «∑Ò÷˜ªÈ»À
function is_compere()
	local t1, t2, t3 = GetPlayerEquipInfo(7)
	for i = 1, getn(ITEM_COMPERE) do
		local cloth = ITEM_COMPERE[i]
		if (t1 == cloth[1] and
			t2 == cloth[2] and
			t3 == cloth[3]) then
			return 1
		end
	end
	return 0
end
-- «∑Ò‘⁄≥°µÿƒ⁄
function in_fields()
	local nMapID = GetWorldPos();
	for i=1,getn(map_fieldpos) do
		if nMapID == map_fieldpos[i][1] then
			return 1;
		end;
	end;
	return 0;
end;

function add_invitation(count, date, para)
	for i = 1, count do
		local res, item = AddItem(ITEM_INVITATION[1], ITEM_INVITATION[2], ITEM_INVITATION[3], 1)
		if (res ~= 0) then
			SetItemParam(item, 0, date)	-- ªÈ¿Ò»’∆⁄
			SetItemParam(item, 1, para)	-- ªÈ¿Ò ±∂Œ∫Õ¿‡–Õ
		end
	end
	Msg2Player(format("Bπn nhÀn Æ≠Óc %d thi÷p mÍi h´n l‘", count))
end

function marriage_check_kotow()
	local tScale = { 
			[1] = {1605,3156,8},
			[2] = {1670,3203,12},
			[3] = {1612,3143,12},
			[4] = {1658,3262,12},
			}
	local nMapID = GetWorldPos();
	local nFieldID = 0;
	for i=1,getn(map_fieldpos) do
		if nMapID == map_fieldpos[i][1] then
			nFieldID = i;
		end;
	end;
	if nFieldID == 0 then
		return 0;	--≤ª‘⁄µÿÕºƒ⁄£¨≤ª◊˜Ã· æ
	end;
	if GetName() ~= GetMissionS(MS_BRIDEGROOM) and GetName() ~= GetMissionS(MS_BRIDE) then
		return 0;	--»Áπ˚≤ª «±æ≥°µÿµƒ–¬¿…–¬ƒÔ
	end;
	if GetMateName() ~= "" then
		Msg2Player("Ng≠¨i Æ∑ k’t h´n");
		return 0;
	end;
	if GetTeamSize() ~= 2 then
		Msg2Player("Hai ng≠Íi tÊ ÆÈi vÌi nhau")
		return 0;
	end;
	if GetMissionV(MV_CAN_MARRY) ~= 1 then
		Msg2Player("B∏i thi™n Æﬁa");
		return 0;
	end;
	if gf_GetDistance(tScale[nFieldID][1],tScale[nFieldID][2]) > tScale[nFieldID][3] then
		Msg2Player("Ng≠¨i kh´ng r‚ rµng");
		return 0;
	end;
	local lover = get_team_lover(PlayerIndex)
	if GetTask(TASK_WEDDING_LOVER) ~= Hash(GetName(lover)) then
		Msg2Player("ÆËi ph≠¨ng kh´ng h“ c„ h´n ≠Ìc vÌi ng≠¨i"); 
		return 0;
	end;
	SetTask(TASK_KOTOW,1);
	if GetTask(TASK_KOTOW) == 1 and GetTask(TASK_KOTOW,lover) == 1 then
		marriage_setting();
		Msg2Player("B©y giÍ hai ng≠¨i ch›nh th¯c lµ phu th™");
		Msg2SomeOne("B©y giÍ hai ng≠¨i ch›nh th¯c lµ phu th™",lover);
		return 1;
	else
		return 0;
	end;
end;

function marriage_setting()
	local nOldPlayerIndex = PlayerIndex;
	local lover = get_team_lover(PlayerIndex)
	-- ∏˘æ›∫√∏–∂»…Ë÷√≥ı ºÕ¨–ƒ÷µ
	local lover_idx = get_love_team_index(PlayerIndex)
	local friend_grade = GetMemberFriendliness(lover_idx)
	local love_grade = 0
	if (friend_grade >= 1801) then
		love_grade = 300
	elseif (friend_grade >= 1401) then
		love_grade = 260
	elseif (friend_grade >= 1001) then
		love_grade = 220
	elseif (friend_grade >= 601) then
		love_grade = 180
	elseif (friend_grade >= 201) then
		love_grade = 140
	else
		love_grade = 100
	end
	-- …Ë÷√Õ¨–ƒ÷µ
	SetTask(TASK_LOVEGRADE, love_grade)
	SetTask(TASK_LOVEGRADE, love_grade, 0, lover)
	-- …Ë÷√Ω·ªÈ»’∆⁄
	local day = curr_date()
	SetTask(TASK_MARRYDATE, day) 
	SetTask(TASK_MARRYDATE, day, 0, lover) 
	-- …Ë÷√≈‰≈ºÃÂ–Õ
	SetTask(TASK_MATESTYLE, GetBody(lover))
	SetTask(TASK_MATESTYLE, GetBody(), 0, lover)
	-- Ω·ªÈ
	DoMarry(lover)
	WriteLog("[K’t h´n]:"..GetName().."k’t h´n, bπn ÆÍi lµ"..GetName(lover)..", ÆÈ h∂o h˜u:"..friend_grade..", trﬁ sË t◊nh c∂m ban Æ«u lµ:"..love_grade)
	SaveNow();
	PlayerIndex = lover;
	SaveNow();
	PlayerIndex = nOldPlayerIndex;
end;

function add_qingtie_packet(nCount)
	if nCount == 0 then
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	for i=1,nCount do
		nRetCode,nItemIdx = AddItem(ITEM_QINGTIE_PACKET[1],ITEM_QINGTIE_PACKET[2],ITEM_QINGTIE_PACKET[3],1);
		if nRetCode ~= 0 then
			SetItemParam(nItemIdx,0,2);
		end;
		WriteLog("[K’t h´n]:"..GetName().." ß∑ mua 1 thi÷p mÍi ");
	end;
end;
-- «Â≥˝‘§∂©–≈œ¢
function clear_subs()
	SetTask(TASK_WEDDING_COST, 0)
	SetTask(TASK_WEDDING_DATE, 0)
	SetTask(TASK_WEDDING_FIELD, 0)
	SetTask(TASK_GOT_INVITATION,0)
end

--	«Â≥˝À˘”–Ω·ªÈ–≈œ¢£∫»°œ˚ªÈ‘º°¢¿ÎªÈ
function clear_task()
	clear_subs()
	SetTask(TASK_WEDDING, 0)
	SetTask(TASK_WEDDING_LOVER, 0)
	SetTask(TASK_MARRYDATE,0);
	SetTask(TASK_BUY_RING);
end