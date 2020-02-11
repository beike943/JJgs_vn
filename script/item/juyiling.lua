--½Å±¾Ãû³Æ£º¾ÛÒåÁî
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃÓÃºó¿ÉÔö¼Ó¡°ÑªºŞ¡±Ğ§¹û¡£<enter><color=yellow>(ÓÒ¼üµã»÷Ê¹ÓÃ)
--¹¦ÄÜ²ß»®£ºĞ»Ğì´º
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2009-12-07
--´úÂëĞŞ¸Ä¼ÇÂ¼
----20100118	¡¶½£ÏÀ·¡Íâ´«_ÁºÉ½ÈºĞÛ»á_µ÷Õû·½°¸¡· Ğ»Ğì´º
----Ôö¼Ó¾ÛÒåÁîÎïÆ·Ğ§¹û£¬Ê¹ÓÃºó£¬30sÎŞµĞ£¬¡°ÌìÉñÏÂ·²¡±¹¥»÷Á¦ÓÉ2.5±¶µ÷Õûµ½8±¶¡£

Include("\\script\\lib\\globalfunctions.lua");

g_tItem = {
	tInfo	= {"Tô NghÜa LÖnh", 2, 95, 208},
	tAward	= {
		tInfo	= {"Thiªn thÇn h¹ phµm", 2, "Duy tr× %d phót"},
		tState	= {
			[1] = {9908, "state_p_attack_percent_add",	700,	"Ngo¹i c«ng t¨ng %d%%"},
			[2] = {9909, "state_m_attack_percent_add",	700,	"Néi c«ng t¨ng %d%%"},
			[3] = {9910, "state_life_max_percent_add",	300,	"Giíi h¹n m¸u t¨ng %d%%"},
			[4] = {9911, "state_buff_resist",			14,		"MiÔn dŞch tr¹ng th¸i bŞ h¹i %d"},
			[5] = {9912, "state_dispear",				100,	"", 30, "V« ®Şch trong %s gi©y"},
			},
		},
	tString = {
		[1] = "VËt phÈm kh«ng thÓ sö dông trong b¶n ®å nµy!",
		[2] = "[%s]: sö dông cã thÓ nhËn ®­îc <color=yellow>“°%s”±<color>HIÖu qu¶: \n          <color=green>%s<color>",
		[3] = "Ta muèn nhËn hiÖu qu¶“°%s”± ",
		[4] = "T¹m thêi kh«ng cÇn",
		[5] = "C¸#c h¹ ®· nhËn ®­îc <color=yellow> hiÖu qu¶ “°%s”±<color>:",
	},
};

function OnUse()
	--µØÍ¼¼ì²é
	if 6007 ~= GetMapTemplate(SubWorld) then
		Talk(1, "", "["..g_tItem.tInfo[1].."]:"..g_tItem.tString[1]);
		return 0;
	end
	--¶Ò»»²Ëµ¥
	local strTitle	= format(g_tItem.tString[2],g_tItem.tInfo[1],g_tItem.tAward.tInfo[1],GetInfo())
	local strMenu	= {
		format("\n"..g_tItem.tString[3].."/Award",g_tItem.tAward.tInfo[1]),
			"\n"..g_tItem.tString[4].."/nothing",
	};
	Say(strTitle, getn(strMenu), strMenu);
end

function Award()
	--É¾³ıÎïÆ·
	if 1 ~= DelItem(g_tItem.tInfo[2], g_tItem.tInfo[3], g_tItem.tInfo[4], 1) then
		return 0;
	end
	--Ìí¼Ó¶Ò»»
	local tState	= g_tItem.tAward.tState;
	if 0 >= getn(tState) then
		return 0;
	end
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
	for i = 1, getn(tState) do
		local nTime = g_tItem.tAward.tInfo[2] * 60 * 18;
		if tState[i][5] then
			nTime = tState[i][5] * 18;
		end
		CastState(tState[i][2], tState[i][3], nTime, 1, tState[i][1], 1);
	end
	SyncCustomState(1, tState[1][1], 1, g_tItem.tAward.tInfo[1]);
	Talk(1, "", format(g_tItem.tString[5],g_tItem.tAward.tInfo[1]).."\n<color=green>"..GetInfo().."<color>");
end

function GetInfo()
	local strInfo	= "";
	local tState	= g_tItem.tAward.tState;
	for i = 1, getn(tState) do
		strInfo = strInfo..format(tState[i][4], tState[i][3]);
		if tState[i][6] then
			strInfo = strInfo..format(tState[i][6], tState[i][5]);
		end
		strInfo = strInfo..", ";
	end
	strInfo = strInfo..format(g_tItem.tAward.tInfo[3], g_tItem.tAward.tInfo[2])..".";
	return strInfo;
end

