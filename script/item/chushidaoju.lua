-- ³öÊ¦µÀ¾ß

Include("\\script\\online\\zgc_public_fun.lua")

GRADUATE_TASK_ID = 1292	-- ´ËÈÎÎñ±äÁ¿ÔÚ \script\master_prentice\some_op.lua ÖĞÒ²¶¨Òå¹ı

t_can_use_map = 
{
	101,	--½­ÄÏÇø\º£Íâ¹Âµº
	102,	--½­ÄÏÇø\ÌÒ»¨µº
	103,	--½­ÄÏÇø\¶«º£º£±õÒ»
	104,	--½­ÄÏÇø\¶«º£º£±õ¶ş
	105,	--½­ÄÏÇø\ÈªÖİ¸®Î÷
	106,	--½­ÄÏÇø\ÁúÈª´å
	107,	--½­ÄÏÇø\ÎäÒÄÉ½
	108,	--½­ÄÏÇø\ÈªÖİ¸®±±
	109,	--½­ÄÏÇø\ÇåÒô¶´Ò»²ã
	110,	--½­ÄÏÇø\ÇåÒô¶´¶ş²ã
	111,	--½­ÄÏÇø\ÇåÏª¶´
	112,	--½­ÄÏÇø\Á½Ë®¶´Ò»²ã
	113,	--½­ÄÏÇø\Á½Ë®¶´¶ş²ã
	114,	--½­ÄÏÇø\ÍõÄ¸¶´Ò»²ã
	115,	--½­ÄÏÇø\ÍõÄ¸¶´¶ş²ã
	116,	--½­ÄÏÇø\ÍõÄ¸¶´Èı²ã
	151,	--½­ÄÏÇø\ÔÆÃÎÔó
	201,	--ÖĞÔ­Ò»Çø\ãê¾©¸®ÄÏ
	202,	--ÖĞÔ­Ò»Çø\ĞÓ»¨´å
	203,	--ÖĞÔ­Ò»Çø\ãê¾©¸®Î÷
	205,	--ÖĞÔ­Ò»Çø\ãê¾©¸®¶«
	206,	--ÖĞÔ­Ò»Çø\ÑãÃÅ¹Ø·Ï
	207,	--ÖĞÔ­Ò»Çø\¶şÁúÉ½
	208,	--ÖĞÔ­Ò»Çø\ÁºÉ½²´
	210,	--ÖĞÔ­Ò»Çø\ÑôÖĞ¶´Ò»²ã
	211,	--ÖĞÔ­Ò»Çø\ÑôÖĞ¶´¶ş²ã
	212,	--ÖĞÔ­Ò»Çø\ÑôÖĞ¶´Èı²ã
	213,	--ÖĞÔ­Ò»Çø\ÉÙÁÖÃÜÊÒÒ»²ã
	214,	--ÖĞÔ­Ò»Çø\ÉÙÁÖÃÜÊÒ¶ş²ã
	215,	--ÖĞÔ­Ò»Çø\ºÚ·ç¶´
	216,	--ÖĞÔ­Ò»Çø\ÏéÔÆ¶´
	217,	--ÖĞÔ­Ò»Çø\Ò°ÖíÁÖ
	218,	--ÖĞÔ­Ò»Çø\Áé±¦É½
	301,	--ÖĞÔ­¶şÇø\³É¶¼¸®Î÷
	302,	--ÖĞÔ­¶şÇø\Çà³ÇÉ½
	304,	--ÖĞÔ­¶şÇø\³É¶¼¸®ÄÏ
	306,	--ÖĞÔ­¶şÇø\½­½ò´å
	307,	--ÖĞÔ­¶şÇø\·á¶¼
	308,	--ÖĞÔ­¶şÇø\³É¶¼¸®±±
	309,	--ÖĞÔ­¶şÇø\½£¸óÊñµÀ
	310,	--ÖĞÔ­¶şÇø\½£ÃÅ¹Ø
	311,	--ÖĞÔ­¶şÇø\·üÅ£É½
	313,	--ÖĞÔ­¶şÇø\ÌìÊ¦¶´Ò»²ã
	314,	--ÖĞÔ­¶şÇø\ÌìÊ¦¶´¶ş²ã
	315,	--ÖĞÔ­¶şÇø\±ùĞÄ¶´Ò»²ã
	316,	--ÖĞÔ­¶şÇø\±ùĞÄ¶´¶ş²ã
	317,	--ÖĞÔ­¶şÇø\ÖñË¿¶´Ò»²ã
	318,	--ÖĞÔ­¶şÇø\ÖñË¿¶´¶ş²ã
	319,	--ÖĞÔ­¶şÇø\·âÄ§¶´Ò»²ã
	320,	--ÖĞÔ­¶şÇø\·âÄ§¶´¶ş²ã
	321,	--ÖĞÔ­¶şÇø\½ğ¹â¶´
	322,	--ÖĞÔ­¶şÇø\Áú»¢¶´Ò»²ã
	323,	--ÖĞÔ­¶şÇø\Áú»¢¶´¶ş²ã
	324,	--ÖĞÔ­¶şÇø\ÆßĞÇ¶´Ò»²ã
	325,	--ÖĞÔ­¶şÇø\ÆßĞÇ¶´¶ş²ã
	326,	--ÖĞÔ­¶şÇø\ÄºÑ©É½×¯
	327,	--ÖĞÔ­¶şÇø\ÎÚÃÉ²¿
	328,	--ÖĞÔ­¶şÇø\¹íÃÅ»ØÀÈ
	401,	--Î÷ÄÏÇø\µã²ÔÉ½
	402,	--Î÷ÄÏÇø\Î÷Ë«°æÄÉ±±²¿
	403,	--Î÷ÄÏÇø\Î÷Ë«°æÄÉÄÏ²¿
	405,	--Î÷ÄÏÇø\ÎäÁêÉ½½Å
	406,	--Î÷ÄÏÇø\ÎäÁêÉ½
	407,	--Î÷ÄÏÇø\Îå¶¾½Ì
	408,	--Î÷ÄÏÇø\ÃçÁë
	409,	--Î÷ÄÏÇø\Ç§Ñ°ËşÒ»²ã
	410,	--Î÷ÄÏÇø\Ç§Ñ°Ëş¶ş²ã
	411,	--Î÷ÄÏÇø\Ç§Ñ°ËşÈı²ã
	412,	--Î÷ÄÏÇø\ÁúÑÛ¶´Ò»²ã
	413,	--Î÷ÄÏÇø\ÁúÑÛ¶´¶ş²ã
	414,	--Î÷ÄÏÇø\·ïÑÛ¶´
	415,	--Î÷ÄÏÇø\·ïÑÛ¶´¶ş²ã
	416,	--Î÷ÄÏÇø\°×Ë®¶´Ò»²ã
	417,	--Î÷ÄÏÇø\°×Ë®¶´¶ş²ã
	418,	--Î÷ÄÏÇø\ÈëÃÅÃÔ¹¬Ò»
	419,	--Î÷ÄÏÇø\ÈëÃÅÃÔ¹¬¶ş
	420,	--Î÷ÄÏÇø\Ñà×Ó¶´Ò»²ã
	421,	--Î÷ÄÏÇø\Ñà×Ó¶´¶ş²ã
	422,	--Î÷ÄÏÇø\Íò¶¾Õ¯
	501,	--Î÷±±Çø\·ïÏè¸®ÄÏ
	502,	--Î÷±±Çø\»ªÉ½
	503,	--Î÷±±Çø\ÇØÊ¼»ÊÁê
	504,	--Î÷±±Çø\·ïÏè¸®±±
	505,	--Î÷±±Çø\Ò©Íõ¹È
	506,	--Î÷±±Çø\É³Ä®ÃÔ¹¬
	507,	--Î÷±±Çø\ÁúÃÅÕò
	508,	--Î÷±±Çø\¹âÃ÷¶¥
	510,	--Î÷±±Çø\Ò©Íõ¶´
	511,	--Î÷±±Çø\¹ÅÑô¶´Ò»²ã
	512,	--Î÷±±Çø\¹ÅÑô¶´¶ş²ã
	513,	--Î÷±±Çø\»ÊÁêÄ¹ÊÒÒ»²ã
	514,	--Î÷±±Çø\»ÊÁêÄ¹ÊÒ¶ş²ã
	600,	--±±Çø\ÍõÆì²¿Âä
	601,	--±±Çø\´ó²İÔ­Ò»
	602,	--±±Çø\´ó²İÔ­¶ş
	603,	--±±Çø\ÑãÃÅ¹ØÍâ·Ï
	604,	--±±Çø\ÑãÃÅ¹Ø
}

function OnUse(idx)
	Say("Sö dông XuÊt S­ Tiªu ®Ó gäi ra s¸t h¹ch viªn cña Quèc Tö Gi¸m, S­ ®å hîp søc ®Ó tiªu diÖt. Chó ı ®å ®Ö ph¶i tÊn c«ng cuèi cïng. B¹n quyÕt ®Şnh dïng chø? \n<color=red>Xin x¸c nhËn b¹n ®· nhËn ®­îc toµn bé bæng léc, ®å ®Ö mét khi xuÊt s­, nh÷ng bæng léc ch­a nhËn th× kh«ng thÓ nhËn n÷a.<color>", 2, "§óng/yes_use", "Sai/no_say")
end

function yes_use()
	if use_check() > 0 and DelItem(2,1,590,1) == 1 then
		local nMapID, nX, nY = GetWorldPos()
		local n = CreateNpc("Quèc Tö Gi¸m tuÇn kh¶o","Quèc Tö Gi¸m tuÇn kh¶o",nMapID, nX + random(-5,5), nY + random(-5,5))
		SetNpcScript(n, "\\script\\item\\chushidaoju.lua")
		SetNpcLifeTime(n, 1800)
	end
end

function OnDeath(idx)
	local nNpcIdx = tonumber(idx)
	SetNpcLifeTime(nNpcIdx, 0)
	if death_check() > 0 then
		SetTask(GRADUATE_TASK_ID, 1)
		Say("Chóc mõng b¹n ®· hoµn thµnh nhiÖm vô! Mêi s­ phô b¹n ®øng ®èi diÖn råi thùc hiÖn ®éng t¸c \'B¸i\' lµ cã thÓ xuÊt s­",0)
	end
end

function use_check()		-- Ê¦¸µPlayerIndex
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- ²»ÊÇÊ¦Í½2ÈË×é¶Ó
		Say("Tæ ®éi chØ cã 2 s­ ®å míi cã thÓ sö dông vËt nµy",0)
		return 0
	end
	local nMMapID, nMX, nMY = GetWorldPos()
	local szMasterName = GetName()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- Ñ¾µÄ¸ù±¾Ã»ÓĞÍ½µÜ
		Say("B¹n kh«ng cã ®Ö tö, kh«ng thÓ sö dông vËt phÈm nµy!", 0)
		return 0
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	
	if tInfo["master"] ~= szMasterName then	-- Ñ¾µÄ¸ù±¾²»ÊÇÕâ¸öÈËµÄÊ¦¸µ
		PlayerIndex = nOldPlayer
		Say("Tæ ®éi chØ cã 2 s­ ®å míi cã thÓ sö dông vËt nµy", 0)
		return 0
	end
	local isExist = 0
	for index, value in tMasterInfo["prentice"] do
		if value == szName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- ²»ÔÚÊ¦¸µµÄÍ½µÜÁĞ±íÀïÄó
		PlayerIndex = nOldPlayer
		Say("Tæ ®éi chØ cã 2 s­ ®å míi cã thÓ sö dông vËt nµy", 0)
		return 0
	end
	if GetLevel() < 73 then
		PlayerIndex = nOldPlayer
		Say("§Ö tö cña b¹n ch­a ®¹t cÊp 73, ch­a thÓ xuÊt s­", 0)
		return 0
	end
	
	if tInfo["istemp"] == 0 then			-- ÁÙÊ±µÜ×Ó
		PlayerIndex = nOldPlayer
		Say("§Ö tö t¹m thêi kh«ng ®­îc xuÊt s­", 0)
		return 0
	end
	
	-- ¾àÀëÅĞ¶Ï
	local nPMapID, nPX, nPY = GetWorldPos()
	local fDistance = distance_between_points(nMMapID, nMX, nMY, nPMapID, nPX, nPY)
	if fDistance > 10 or fDistance < 0 then
		PlayerIndex = nOldPlayer
		Say("§Ö tö cña b¹n c¸ch b¹n qu¸ xa, kh«ng thÓ sö dông vËt nµy.", 0)
		return 0
	end
	
	-- µØÅÌÅĞ¶Ï
	local nMapID = GetWorldPos()
	isExist = 0
	for index, value in t_can_use_map do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	PlayerIndex = nOldPlayer
	if isExist == 0 then
		Msg2Player("Khu vùc hiÖn t¹i kh«ng thÓ sö dông ®¹o cô xuÊt s­.")
		return 0
	end
	return 1
end

function death_check()		-- Ä¬ÈÏÎªÍ½µÜPlayerIndex
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- ²»ÊÇÊ¦Í½2ÈË×é¶Ó
		return 0
	end
	
	if GetLevel() < 73 then
		return 0
	end
	
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local nMasterIndex = PlayerIndex
	local szMasterName = GetName()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- Ñ¾µÄ¸ù±¾Ã»ÓĞÍ½µÜ
		return 0
	end

	PlayerIndex = nOldPlayer
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szMasterName then	-- Ñ¾µÄ¸ù±¾²»ÊÇÕâ¸öÈËµÄÊ¦¸µ
		return 0
	end

	local isExist = 0
	for index, value in tMasterInfo["prentice"] do
		if value == szName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- ²»ÔÚÊ¦¸µµÄÍ½µÜÁĞ±íÀïÄó
		return 0
	end
	if tInfo["istemp"] == 0 then			-- ÁÙÊ±µÜ×Ó
		return 0
	end
	return 1
end

function msg_2_team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    local OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

function no_say()
end