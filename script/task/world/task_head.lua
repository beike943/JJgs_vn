
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÊÀ½çÈÎÎñ½Å±¾Í·ÎÄ¼ş
-- Edited by peres
-- 2005/07/19 PM 19:29

-- Ö»ÓĞËûºÍËıÁ½¸öÈË
-- ËûÃÇÏà°®
-- Ëı¼ÇµÃ
-- ËûµÄÊÖ¸§Ä¦ÔÚËıµÄÆ¤·ôÉÏµÄÎÂÇé
-- ËûµÄÇ×ÎÇÏñÄñÈºÔÚÌì¿ÕÂÓ¹ı
-- ËûÔÚËıÉíÌåÀïÃæµÄ±©ìåºÍ·Å×İ
-- ËûÈëË¯Ê±ºòµÄÑù×Ó³äÂú´¿Õæ
-- Ëı¼ÇµÃ£¬Çå³¿ËıĞÑ¹ıÀ´µÄÒ»¿Ì£¬ËûÔÚËıµÄÉí±ß
-- ËıÕö×ÅÑÛ¾¦£¬¿´Êï¹âÍ¸¹ı´°Á±Ò»µãÒ»µãµØÕÕÉä½øÀ´
-- ËıµÄĞÄÀïÒòÎªĞÒ¸£¶øÌÛÍ´

-- ======================================================

-- ×Ö·û´®´¦Àí¹¦ÄÜ¿â
Include("\\script\\lib\\string.lua");

function SetTaskSayColor(str)

	local strKey = ":";
	local strKeyLeft = "{";
	local strKeyRight = "}";
	local strKeySex = "<sex>";
	local strPoint = strfind(str,strKey,1)
	local strName = "";
	local strColorText = str;
	
	local strSexChange = GetPlayerSex();
	
	if strPoint~=nil and strPoint>=1 then 
		strName = strsub(str, 1, strPoint-1);
		-- ´¦ÀíÈËÎïÃû³ÆÑÕÉ«
		strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
	end;
			
	-- ´¦ÀíÖØµã±êÊ¶ÑÕÉ«
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- ´¦ÀíĞÔ±ğ±êÊ¶
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	str = strColorText;
	return str;
	
end;


-- ÓÃÓÚ´¦ÀíÒ»¶ÑÑ¡ÏîµÄ¶Ô»°º¯Êı Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- ×Óº¯Êı£¬ÓÃÓÚÀ©Õ¹¶Ô»° TALK º¯ÊıµÄ¹¦ÄÜ
function TalkEx(fun,szMsg)

	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[i]))..","
	end
	szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[num]))
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"

	dostring(szmsg)
	
end	


-- ×Óº¯Êı£¬ÓÃÒÔ»ñÈ¡Íæ¼ÒµÄ³ÆÎ½£¬Ö±½Ó·µ»Ø×Ö·û´®
function GetPlayerSex()

local myTitel -- ÓÃÒÔÏÔÊ¾ÈËÎï³ÆÎ½
local nFactionID = GetPlayerFaction();

	if (GetSex() == 1) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][1];
		else
			myTitel = "ThiÕu hiÖp";
		end;
	end;
	
	if (GetSex() == 2) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][2];
		else
			myTitel = "C« n­¬ng"
		end;
	end;
	
	return myTitel
	
end


-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êı
function Task_Exit()

end;

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end;
end;

--Íæ¼Ò³ÆÎ½
PlayerFactionTitle = {
	
	-- ÉÙÁÖ
	[1]={"§¹i s­",""},
	
	-- Îäµ±
	[2]={"§¹o tr­ëng","§¹o tr­ëng"},

	-- ¶ëÃ¼
	[3]={"","C« n­¬ng"},

	-- Ø¤°ï
	[4]={"ThiÕu hiÖp","C« n­¬ng"},
	
	-- ÌÆÃÅ
	[5]={"ThiÕu hiÖp","C« n­¬ng"},
	
	-- ÑîÃÅ
	[6]={"T­íng qu©n","T­íng qu©n"},
	
	-- Îå¶¾
	[7]={"ThiÕu hiÖp","C« n­¬ng"},
	-- À¥ÂØ
	[8]={"§¹o tr­ëng",""},
	-- Ã÷½Ì
	[9]={"ThiÕu hiÖp","C« n­¬ng"},
	-- ´äÑÌ
	[10]={"","C« n­¬ng"},

}