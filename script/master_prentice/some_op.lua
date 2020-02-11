-- Ê¦Í½ÏµÍ³µÄÒ»Ğ©²Ù×÷

Include("\\script\\lib\\string.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\global\\battlefield_callback.lua")

tItem = {2,1,588}
GRADUATE_TASK_ID = 1292			-- ´ËÈÎÎñ±äÁ¿ÔÚ \script\item\chushi.lua ÖĞÒ²¶¨Òå¹ı
TASK_SEED = 1290				-- ´ËÈÎÎñ±äÁ¿ÔÚ \script\master_prentice\task_content.lua ÖĞÓĞ¶¨Òå¹ı
TASK_CONTENT = 1291				-- ´ËÈÎÎñ±äÁ¿ÔÚ \script\master_prentice\task_content.lua ÖĞÓĞ¶¨Òå¹ı

MAX_FUND_COUNT = 10

t_can_use_map = 
{
	100,	--½­ÄÏÇø\ÈªÖİ
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
	117,	--½­ÄÏÇø\ÌìÑÄº£½Ç
	150,	--½­ÄÏÇø\ÑïÖİ
	151,	--½­ÄÏÇø\ÔÆÃÎÔó
	200,	--ÖĞÔ­Ò»Çø\ãê¾©
	201,	--ÖĞÔ­Ò»Çø\ãê¾©¸®ÄÏ
	202,	--ÖĞÔ­Ò»Çø\ĞÓ»¨´å
	203,	--ÖĞÔ­Ò»Çø\ãê¾©¸®Î÷
	204,	--ÖĞÔ­Ò»Çø\ÉÙÁÖ
	205,	--ÖĞÔ­Ò»Çø\ãê¾©¸®¶«
	206,	--ÖĞÔ­Ò»Çø\ÑãÃÅ¹Ø·Ï
	207,	--ÖĞÔ­Ò»Çø\¶şÁúÉ½
	208,	--ÖĞÔ­Ò»Çø\ÁºÉ½²´
	209,	--ÖĞÔ­Ò»Çø\Ø¤°ï
	210,	--ÖĞÔ­Ò»Çø\ÑôÖĞ¶´Ò»²ã
	211,	--ÖĞÔ­Ò»Çø\ÑôÖĞ¶´¶ş²ã
	212,	--ÖĞÔ­Ò»Çø\ÑôÖĞ¶´Èı²ã
	213,	--ÖĞÔ­Ò»Çø\ÉÙÁÖÃÜÊÒÒ»²ã
	214,	--ÖĞÔ­Ò»Çø\ÉÙÁÖÃÜÊÒ¶ş²ã
	215,	--ÖĞÔ­Ò»Çø\ºÚ·ç¶´
	216,	--ÖĞÔ­Ò»Çø\ÏéÔÆ¶´
	217,	--ÖĞÔ­Ò»Çø\Ò°ÖíÁÖ
	218,	--ÖĞÔ­Ò»Çø\Áé±¦É½
	219,	--ÖĞÔ­Ò»Çø\Ìì²¨Ñî¸®
	300,	--ÖĞÔ­¶şÇø\³É¶¼
	301,	--ÖĞÔ­¶şÇø\³É¶¼¸®Î÷
	302,	--ÖĞÔ­¶şÇø\Çà³ÇÉ½
	303,	--ÖĞÔ­¶şÇø\¶ëáÒ
	304,	--ÖĞÔ­¶şÇø\³É¶¼¸®ÄÏ
	305,	--ÖĞÔ­¶şÇø\ÌÆÃÅ
	306,	--ÖĞÔ­¶şÇø\½­½ò´å
	307,	--ÖĞÔ­¶şÇø\·á¶¼
	308,	--ÖĞÔ­¶şÇø\³É¶¼¸®±±
	309,	--ÖĞÔ­¶şÇø\½£¸óÊñµÀ
	310,	--ÖĞÔ­¶şÇø\½£ÃÅ¹Ø
	311,	--ÖĞÔ­¶şÇø\·üÅ£É½
	312,	--ÖĞÔ­¶şÇø\Îäµ±
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
	350,	--ÖĞÔ­¶şÇø\ÏåÑô
	326,	--ÖĞÔ­¶şÇø\ÄºÑ©É½×¯
	327,	--ÖĞÔ­¶şÇø\ÎÚÃÉ²¿
	328,	--ÖĞÔ­¶şÇø\¹íÃÅ»ØÀÈ
	329,	--ÖĞÔ­¶şÇø\ÌìÊ¦ÃØ¾³
	400,	--Î÷ÄÏÇø\´óÀí¸®
	401,	--Î÷ÄÏÇø\µã²ÔÉ½
	402,	--Î÷ÄÏÇø\Î÷Ë«°æÄÉ±±²¿
	403,	--Î÷ÄÏÇø\Î÷Ë«°æÄÉÄÏ²¿
	404,	--Î÷ÄÏÇø\´äÑÌ
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
	500,	--Î÷±±Çø\·ïÏè
	501,	--Î÷±±Çø\·ïÏè¸®ÄÏ
	502,	--Î÷±±Çø\»ªÉ½
	503,	--Î÷±±Çø\ÇØÊ¼»ÊÁê
	504,	--Î÷±±Çø\·ïÏè¸®±±
	505,	--Î÷±±Çø\Ò©Íõ¹È
	506,	--Î÷±±Çø\É³Ä®ÃÔ¹¬
	507,	--Î÷±±Çø\ÁúÃÅÕò
	508,	--Î÷±±Çø\¹âÃ÷¶¥
	509,	--Î÷±±Çø\À¥ÂØ
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

function _CheckInvite(nTargetIndex, nPrenticeCount, nMaxPrenticeCount)
	if nPrenticeCount >= nMaxPrenticeCount then
		Say("B¹n kh«ng thÓ th©u n¹p ®å ®Ö n÷a. ", 0)
		return 0
	end
	
	local nLevel = GetLevel()
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	local nOldPlayer = PlayerIndex
	PlayerIndex = nTargetIndex
	if PlayerIndex <= 0 then
		return
	end
	local nTarLevel = GetLevel()
	local szTarName = GetName()
	local tTarInfo = GetMPBaseInfo()
	local nIsSleeping = IsSleeping()
	
	PlayerIndex = nOldPlayer
	if nTarLevel >= nLevel then		-- µÈ¼¶±È×Ô¼º¸ß,²»ÄÜÊÕ
		Say(szTarName.." ®¼ng cÊp b»ng hoÆc h¬n b¹n, nªn kh«ng thÓ thu lµm ®å ®Ö", 0)
		return 0
	end
	if nIsSleeping > 0 then
		Say(szTarName.."®ang trong tr¹ng th¸i ngñ, kh«ng thÓ håi ©m cña b¹n.", 0)
		return 0
	end
	
	local nMTime = tInfo["mtime"] - GetTime()		-- ÊÕÍ½µÄCDµ½ÁËÃ»
	if nMTime > 0 then
		local nHour = floor(nMTime / 3600)
		nMTime = mod(nMTime, 3600)
		local nMin = floor(nMTime / 60)
		local nSec = mod(nMTime, 60)
		Say("B¹n cßn <color=red>"..nHour.."h "..nMin.." Phót "..nSec.." gi©y <color>míi cã thÓ th©u n¹p 1 ®å ®Ö .", 0)
		return 0
	end
	
	if tTarInfo["master"] == szName then
		Say(szTarName.."®· lµ ®å ®Ö cña b¹n råi.", 0)
		return 0
	end
	
	if tInfo["prentice"] ~= nil then
		for index, value in tInfo["prentice"] do
			if value == szTarName then
				Say(szTarName.."®· lµ ®å ®Ö cña b¹n råi.", 0)
				return 0
			end
		end
	end
	
	if tInfo["evermaster"] ~= nil then
		for index, value in tInfo["evermaster"] do
			print("1"..value)
			if value == szTarName then
				Say(szTarName.."B¹n ®· tõng S­ §å quan hÖ, kh«ng thÓ th©u n¹p.", 0)
				return 0
			end
		end
	end
	
	if tTarInfo["evermaster"] ~= nil then
		for index, value in tTarInfo["evermaster"] do
			if value == szName then
				print("2"..value)
				Say(szTarName.."B¹n ®· tõng S­ §å quan hÖ, kh«ng thÓ th©u n¹p.", 0)
				return 0
			end
		end
	end

	if tTarInfo["master"] ~= "" then
		Say(szTarName.."®· lµ ®å ®Ö cña "..tTarInfo["master"]..", kh«ng thÓ th©u n¹p.", 0)
		return 0
	end
	
	if tTarInfo["ismaster"] ~= 0 then
		Say(szTarName.."®· lµ s­ phôc, kh«ng thÓ th©u n¹p.", 0)
		return 0
	end
	
	local nPTime = tTarInfo["ptime"] - GetTime()
	if nPTime > 0 then
		local nHour = floor(nPTime / 3600)
		nPTime = mod(nPTime, 3600)
		local nMin = floor(nPTime / 60)
		local nSec = mod(nPTime, 60)
		Say(szTarName.."cßn ph¶i <color=red>"..nHour.."h "..nMin.." Phót "..nSec.."gi©y <color>míi cã thÓ b¸i s­ ", 0)
		return 0
	end
	
	Talk(1, "", "B¹n ®· göi tin mêi "..szTarName.." lµm ®å ®Ö")
	return 1
end

function _to_be_master(nRet)
	if nRet == 0 or nRet == 10 then
		Say("Tªn cña c¸c h¹ ®· ®­îc ®¨ng kı, b©y giê ®· cã thÓ th©u n¹p ®Ö tö. H·y Ên F3 ®Ó më \'trang Thuéc tİnh\' th× sÏ thÊy giao diÖn S­ ®å. NÕu muèn tham gia vµ n©ng cao kü n¨ng S­ ®å, h·y ®Õn t×m ta!",0)
	end
end

function _add_temp_member(nRet, nParam1, nParam2, szParam)
	if nRet == 22 then
		if nParam1 > 0 and szParam == "m" then
			local nHour = floor(nParam1 / 3600)
			nParam1 = mod(nParam1, 3600)
			local nMin = floor(nParam1 / 60)
			local nSec = mod(nParam1, 60)
			Say("B¹n cßn "..nHour.."h "..nMin.." Phót "..nSec.." gi©y míi cã thÓ th©u n¹p 1 ®å ®Ö.", 0)
		elseif nParam2 > 0 and szParam == "p" then
			local nHour = floor(nParam2 / 3600)
			nParam2 = mod(nParam2, 3600)
			local nMin = floor(nParam2 / 60)
			local nSec = mod(nParam2, 60)
			Say("B¹n cßn "..nHour.."h "..nMin.." Phót "..nSec.." gi©y míi cã thÓ b¸i s­. ", 0)
		end
	elseif nRet == 12 or nRet == 13 then
		if szParam == "m" then
			Say("§¼ng cÊp thô nghiÖp cña b¹n b©y giê kh«ng thÓ th©u n¹p thªm ®å ®Ö.", 0)
		end
	elseif nRet == 0 then
		if szParam == "p" then
			Say("B¹n ®· ®­îc thu nhËn lµm ®Ö tö t¹m thêi cña s­ phô b¹n. \n§Õn khi ®¼ng cÊp cña b¹n ®¹t cÊp 10. Xin h·y tæ ®éi víi s­ phô, trong kho¶ng c¸ch gÇn sö dông ®éng t¸c \'B¸i\', sÏ trë thµnh ®Ö tö chİnh thøc.", 0)
		end
	end
end

function _ture_join(nRet, nParam)
	if nRet == 0 and nParam == 0 then		-- ÕıÊÇ°İÊ¦ÒÔºó°ÑÒÔÇ°µÄ³öÊ¦ÈÎÎñ±äÁ¿Çå¿Õ
		SetTask(GRADUATE_TASK_ID, 0)
		SetTask(TASK_SEED, 0)
		SetTask(TASK_CONTENT, 0)
		Msg2Player("B¹n ®· thµnh chİnh ®Ö tö chİnh thøc. H·y ®Õn Quèc Tö Gi¸m nhËn trang bŞ.")
	end
	if nRet == 12 or nRet == 13 then
		if nParam == 1 then
			Say("§¼ng cÊp thô nghiÖp cña b¹n b©y giê kh«ng thÓ cã thªm ®å ®Ö chİnh thøc.", 0)
		end
	end
end

function _pre_chk_betray()
	if DelItem(tItem[1], tItem[2], tItem[3], 99) == 1 then
		return 1
	end
	Say("Muèn rêi khái S­ M«n cÇn ph¶i tiªu hao 99 S­ §å phï chØ, b¹n kh«ng ®ñ S­ §å phï chØ ", 0)
	return 0
end

function _betray(nRet)
	if nRet ~= 0 then	-- Ê§°ÜÁË£¬°ÑÊ¦Í½·ûÖ½»¹¸øÍ½µÜ
		AddItem(tItem[1], tItem[2], tItem[3], 99, 1)
	end
end

function _pre_chk_kickout()
	print("_pre_chk_kickout()")
	if DelItem(tItem[1], tItem[2], tItem[3], 99) == 1 then
		return 1
	end
	Say("Khi ®Ö tö rót ra khái S­ M«n cÇn ph¶i tiªu hao 99 S­ §å phï chØ, b¹n kh«ng ®ñ S­ §å phï chØ ", 0)
	return 0
end

function _kickout(nRet)
	if nRet ~= 0 then	-- Ê§°ÜÁË£¬°ÑÊ¦Í½·ûÖ½»¹¸øÍæ¼Ò
		AddItem(tItem[1], tItem[2], tItem[3], 99, 1)
	end
end

function _graduate(nRet, nParam, szParam)
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szOtherName = GetName()
	PlayerIndex = nOldPlayer
	if nRet == 0 then
		if szParam == "p" then
			SetTask(GRADUATE_TASK_ID, 0)
			SetTask(TASK_SEED, 0)
			SetTask(TASK_CONTENT, 0)
			local n = CustomDataRead("mp_p_award_final")
			if n == nil then
				AddItem(2, 1, 593, 1, 1)
				CustomDataSave("mp_p_award_final", "d", 1)
				WriteLog("[S­ §å - XuÊt S­]:"..GetName().."NhËn ®­îc 1 tói S­ ¢n Khã quªn")
				SaveNow()
			end
			Say("B¹n ®· ®ñ n¨ng lùc ®Ó tù hoµnh tÈu giang hå, s­ phô <color=yellow>"..szOtherName.."<color> tuy kh«ng nì xa b¹n, nh­ng ®µnh chia tay ®Ó b¹n rÌn luyÖn mét phen. B¹n ®· XuÊt S­.", 0)
		elseif szParam == "m" then
			Say("§å ®Ö <color=yellow>"..szOtherName.."<color> ®· XuÊt S­, ©n ®øc d­ìng dôc c¶ ®êi khã quªn. ", 0)
			if nParam > 0 then
				AddItem(2, 1, 589, nParam, 1)
				Msg2Player("B¹n nhËn ®­îc "..nParam.." bæng léc Quèc Tö Gi¸m")
				WriteLog("[S­ §å - XuÊt S­]:"..GetName().."NhËn ®­îc"..nParam.." bæng léc Quèc Tö Gi¸m")
				SaveNow()
			end
		end
	end
end

function _buyfund(nRet, nParam, szParam)
	if nRet == 0 and szParam ~= "" then		-- Ê¦¸¸
		Say("C¸c h¹ ®· mua cho <color=yellow>"..szParam.."<color> <color=yellow>"..nParam.."<color> Hoa Hång. Xin h·y chó ı tin tøc trªn b¶ng, nhËn bæng léc còng tiÕn hµnh trªn giao diÖn S­ ®å, cã chç nµo kh«ng hiÓu th× t×m ta",0)
		WriteLog("[HÖ thèng S­ ®å]: Mua Hoa Hång thµnh c«ng (m) m="..GetName().." p="..szParam.." n="..nParam)
	elseif nRet == 0 and szParam == "" then	-- Í½µÜ
		Say("LÖnh s­ ®· mua cho b¹n <color=yellow>"..nParam.."<color> Hoa Hång.",0)
		WriteLog("[HÖ thèng S­ ®å]: Mua Hoa Hång thµnh c«ng (p) m="..GetName().." p="..szParam.." n="..nParam)
	elseif nRet ~= 0 and szParam ~= "" then	-- Ê¦¸¸£¬¶øÇÒ¹ºÂòÊ§°ÜÁË
		AddItem(2,1,594,nParam*10,1)
		WriteLog("[HÖ thèng S­ ®å]: Mua Hoa Hång thÊt b¹i m="..GetName().." p="..szParam.." n="..nParam)
	end
end

function _p_getfund(nRet, nParam1, nParam2)
	Msg2Player(nRet, nParam1, nParam2)
end

function _m_getfund(nRet, nParam1, nParam2, szParam)
	if nParam1 > 0 then
		local i = 1
		for n=1, 21 do
			i = i * 2
			if i == nParam1 then
				nParam1 = n + 1
				break
			end
		end
	end
	if nRet == 0 and nParam2 > 0 then
		if nParam1 == 1 or nParam1 == 5 or nParam1 == 6 or nParam1 == 9 or nParam1 == 11 or nParam1 == 13 then
			nParam2 = nParam2 * 2
		elseif nParam1 == 2 or nParam1 == 3 or nParam1 == 4 or nParam1 == 8 or nParam1 == 10 or nParam1 == 12 or (nParam1 >= 14 and nParam1 <= 22) then
			nParam2 = nParam2
		elseif nParam1 == 7 then
			nParam2 = nParam2 * 3
		end
			
		AddItem(2,1,589,nParam2)
		Msg2Player("B¹n ®· nhËn "..nParam2.." bæng léc Quèc Tö Gi¸m. ")
		SaveNow()
		WriteLog("[S­ §å - bæng léc s­ phô]"..GetName().."§· nhËn "..nParam2.." bæng léc Quèc Tö Gi¸m")
	end
end

function _finnalfund(nRet, nParam)
	if nRet == 0 then
		AddItem(2,1,589,nParam)
		Say("B¹n ®· nhËn "..nParam.." bæng léc Quèc Tö Gi¸m. ", 0)
		SaveNow()
		WriteLog("[S­ §å - Thu nhËp cuèi cïng cña s­ phô]"..GetName().."§· nhËn "..nParam.." bæng léc Quèc Tö Gi¸m")
	elseif nRet == 17 then
		local nDiffTime = nParam
		local nDay = floor(nDiffTime / 86400)
		nDiffTime = mod(nDiffTime, 86400)
		local nHour = floor(nDiffTime / 3600)
		nDiffTime = mod(nDiffTime, 3600)
		local nMin = floor(nDiffTime / 60)
		Say("Cßn cÇn "..nDay.."Thiªn"..nHour.."h "..nMin.." míi cã thÓ nhËn kho¶n bæng léc nµy", 0)
	elseif nRet == 18 then
		Say("B¹n ®· nhËn bæng léc nµy råi.", 0)
	end
end

function _free_change_point(nRet, nType, nPoint)
	WriteLog("[S­ §å free_change_point] : "..GetName()..";"..nRet..";"..nType..";"..nPoint)
	if nRet == 20 then
		Msg2Player("B¹n kh«ng ®ñ ®iÓm S­ §å")
	elseif nRet == 21 then
		Msg2Player("TriÒu §×nh kh«ng thÓ gióp b¹n cã thªm ®iÓm S­ §å")
	elseif nRet == 0 then
		if nType == 1 then				-- ½ğÇ®
			local nMoney = 38000 * nPoint
			Earn(nMoney)
		elseif nType == 2 then			-- ÉùÍû
			Msg2Player("Danh väng")
		elseif nType == 3 then			-- Ê¦ÃÅ¹±Ï×¶È
			Msg2Player("§iÓm s­ m«n")
		elseif nType == 4 then			-- ¾ü¹¦
			SetRankPoint(5, 701, 1)	-- Ë¥¼õ²Ù×÷ÔÚSetRankPointµÄÊ±ºò²Å½øĞĞ,ËùÒÔÒªÏÈË¥¼õ,ÔÙ¿Û
			CalcBattleRank()
			local n = GetTask(701)
			if n >= 0 then
				SetTask(701, n + 20 * nPoint)
			else
				SetTask(701, n - 20 * nPoint)
			end
			Msg2Player("B¹n nhËn ®­îc "..(20*nPoint).." ®iÓm c«ng tr¹ng")
		elseif nType == 5 then			-- ½¡¿µ¾­Ñé
			Msg2Player("K. nghiÖm (Søc kháe)")
		elseif nType == 6 then			-- ¾­Ñé
			local nLevel = GetLevel()
			local nAddExp = nLevel * nLevel * 10 * nPoint
			ModifyExp(nAddExp)
			Msg2Player("B¹n nhËn ®­îc "..nAddExp.." ®iÓm kinh nghiÖm")
		elseif nType == 7 then			-- ½¡¿µ¾­Ñé×ª¾­Ñé
			Msg2Player("Søc khoÎ chuyÓn thµnh kinh nghiÖm")
		end
	end
end

function _change_point(nRet, nType, nPoint)
	WriteLog("[S­ §å change_point] : "..GetName()..";"..nRet..";"..nType..";"..nPoint)
	if nRet == 20 then
		Msg2Player("B¹n kh«ng ®ñ ®iÓm S­ §å")
		AddItem(tItem[1],tItem[2],tItem[3],nPoint)	-- °ÑÃ»ÓĞ³É¹¦¶Ò»»µÄÊ¦Í½·ûÖ½»¹¸øÍæ¼Ò
	elseif nRet == 0 then
		if nType == 0 then				-- Ê¦µÂ
			Msg2Player("B¹n dïng "..nPoint.." ®iÓm S­ ®å chuyÓn thµnh ®iÓm S­ ®øc")
		elseif nType == 1 then			-- ½ğÇ®
			local nMoney = 38000 * nPoint
			Earn(nMoney)
		elseif nType == 2 then			-- ÉùÍû
			Msg2Player("Danh väng")
		elseif nType == 3 then			-- Ê¦ÃÅ¹±Ï×¶È
			Msg2Player("§iÓm s­ m«n")
		elseif nType == 4 then			-- ¾ü¹¦¹¦
			SetRankPoint(5, 701, 1)	-- Ë¥¼õ²Ù×÷ÔÚSetRankPointµÄÊ±ºò²Å½øĞĞ,ËùÒÔÒªÏÈË¥¼õ,ÔÙ¿Û
			CalcBattleRank()
			local n = GetTask(701)
			if n >= 0 then
				SetTask(701, n + 20 * nPoint)
			else
				SetTask(701, n - 20 * nPoint)
			end
			Msg2Player("B¹n nhËn ®­îc "..(20*nPoint).." ®iÓm c«ng tr¹ng")
		elseif nType == 5 then			-- ½¡¿µ¾­Ñé
			Msg2Player("K. nghiÖm (Søc kháe)")
		elseif nType == 6 then			-- ¾­Ñé
			local nLevel = GetLevel()
			local nAddExp = nLevel * nLevel * 10 * nPoint
			ModifyExp(nAddExp)
			Msg2Player("B¹n nhËn ®­îc "..nAddExp.." ®iÓm kinh nghiÖm")
		elseif nType == 7 then			-- ½¡¿µ¾­Ñé×ª¾­Ñé
			Msg2Player("Søc khoÎ chuyÓn thµnh kinh nghiÖm")
		end
	end
end

function _disband(nRet)
	if nRet == 9 then
		Msg2Player("Lóc m«n h¹ vÉn cßn ®Ö tö th× kh«ng thÓ huû ®¨ng kı")
	elseif nRet == 0 then
		Msg2Player("c¸c h¹ t¹i Quèc Tö Gi¸m ®· huû ®¨ng kı ThÇn Vò ViÖn, cã thÓ tù ®i b¸i s­. NÕu thay ®æi ı ®Şnh muèn th©u n¹p l¹i ®Ö tö, h·y t×m ta ®Ó ®¨ng kı l¹i.")
	end
end

function _want_take_on_a_master(nRet)
	if nRet == 1 then
		Say("T¹m thêi ng­êi ®Õn b¸i s­ qu¸ nhiÒu, tin nh¾n yªu cÇu v¸i s­ cña b¹n ch­a thÓ göi ®i. Xin h·y ®îi vµ thö l¹i.", 0)
	end
end

function _tansfer_map_chk(nMapID)
	-- µØÅÌÅĞ¶Ï
	local isExist = 0
	for index, value in t_can_use_map do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		return 0
	end
	return 1
end

function _master_transfer(szRoleName)
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] == nil then
		Say(szRoleName.." kh«ng ph¶i ®Ö tö b¹n, kh«ng thÓ truyÒn tèng", 0)
		return
	end
	local isExist = 0
	for index, value in tInfo["prentice"] do
		if value == szRoleName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Say(szRoleName.." kh«ng ph¶i ®Ö tö b¹n, kh«ng thÓ truyÒn tèng", 0)
		return
	end
	
	if IsStalling() ~= 0 then
		Say("Trong lóc bµy b¸n kh«ng thÓ truyÒn tèng", 0)
		return
	end
	
	if IsReading() ~= 0 then
		Say("Trong qu¸ tr×nh MËt TŞch kh«ng thÓ truyÒn tèng", 0)
		return
	end
	
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--Õ½¶·×´Ì¬ÏÂPKÄ£Ê½²»¿ÉÒÔÊ¹ÓÃ
		Say("ë d¹ng PK ngoµi thµnh kh«ng thÓ ®­a ®i.", 0)
		return
	end

	GetPlayerPosition(szRoleName, "\\script\\master_prentice\\some_op.lua", "_tansfer_yes", 0)
end

function _prentice_transfer(szRoleName)
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szRoleName then
		Msg2Player(szRoleName.." kh«ng ph¶i s­ phô cña b¹n, kh«ng thÓ truyÒn tèng")
		return
	end
	if IsStalling() ~= 0 then
		Say("Trong lóc bµy b¸n kh«ng thÓ truyÒn tèng", 0)
		return
	end
	
	if IsReading() ~= 0 then
		Say("Khi luyÖn mËt tŞch kh«ng thÓ ®­a ®i.", 0)
		return
	end

	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--Õ½¶·×´Ì¬ÏÂPKÄ£Ê½²»¿ÉÒÔÊ¹ÓÃ
		Say("ë d¹ng PK ngoµi thµnh kh«ng thÓ ®­a ®i.", 0)
		return
	end
	GetPlayerPosition(szRoleName, "\\script\\master_prentice\\some_op.lua", "_tansfer_yes", 0)
end

function _master_lalala(szRoleName)
	-- µØÍ¼¼ì²â
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < 1 then
		Say("CÇn cã <color=green>1 S­ §å phï chØ<color> míi cã thÓ h« ho¸n ®Ö tö. <color>", 0)
		return
	end
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		Say("Khu vùc hiÖn t¹i kh«ng thÓ h« ho¸n ®Ö tö ", 0)
		return
	end
	
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] == nil then
		Msg2Player(szRoleName.." kh«ng ph¶i ®Ö tö cña b¹n, kh«ng thÓ kªu gäi")
		return
	end
	local isExist = 0
	for index, value in tInfo["prentice"] do
		if value == szRoleName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Msg2Player(szRoleName.." kh«ng ph¶i ®Ö tö cña b¹n, kh«ng thÓ kªu gäi")
		return
	end
	DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la", GetName())
	Talk(1,"","B¹n ®· göi tin mêi "..szRoleName.."§· göi yªu cÇu h« ho¸n.")
end

function _tansfer_yes(nMapID, nX, nY, nFightState, nParam)
	-- µØÍ¼¼ì²â
	if _tansfer_map_chk(nMapID) == 0 then
		Say("B¹n kh«ng thÓ chuyÓn ®Õn khu vùc môc tiªu", 0)
		return
	end

	if IsPlayerDeath() == 1 then
		return
	end
	if IsStalling() == 1 then
		return
	end
	if IsReading() == 1 then
		return
	end

	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--Õ½¶·×´Ì¬ÏÂPKÄ£Ê½²»¿ÉÒÔÊ¹ÓÃ
		return
	end

	if DelItem(tItem[1], tItem[2], tItem[3], 1) == 1 then
		CleanInteractive()
		if NewWorld(nMapID, nX, nY) ~= 0 then
			SetFightState(nFightState)
		end
	else
		Say("CÇn ph¶i <color=green>1 S­ §å phï chØ <color>míi cã thÓ sö dông chøc n¨ng S­ ®å truyÒn tèng. <color>", 0)
	end
end

function _master_want_la(szRoleName)
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szRoleName then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.." kh«ng ph¶i ®Ö tö cña b¹n,")
		return
	end
	if tInfo["istemp"] == 0 then			-- ÁÙÊ±Í½µÜ²»ÄÜÓÃ´Ë¹¦ÄÜ
		return
	end
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."Khu vùc hiÖn t¹i ")
		return
	end
	if IsPlayerDeath() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."®· tö vong")
		return
	end
	if IsStalling() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."®ang bµy b¸n")
		return
	end
	if IsReading() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."®ang tu luyÖn MËt TŞch")
		return
	end
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--Õ½¶·×´Ì¬ÏÂPKÄ£Ê½²»¿ÉÒÔÊ¹ÓÃ
		DoScriptByName(szRoleName, "\\script\\master_prentice\\some_op.lua", "_master_want_la_err", szName.."ë tr¹ng th¸i PK ngoµi thµnh, ")
		return
	end

	RandomTaskTipEx("S­ phô cña b¹n muèn kªu gäi b¹n ®Õn bªn c¹ch. ", "_prentice_see_la")
end

function _master_want_la_err(szMsg)
	Talk(1, "", szMsg.."Kh«ng cã c¸ch nµo håi ©m lêi kªu gäi cña b¹n!")
end

function _accept_lalala(szMsg)
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice_err", "Khu vùc s­ phô b¹n ®ang ë kh«ng thÓ h« ho¸n b¹n.")
		return
	end

	if DelItem(tItem[1], tItem[2], tItem[3], 1) == 1 then
		local nMapID, nX, nY = GetWorldPos()
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice", nMapID..","..nX..","..nY..","..GetFightState())
	else
		Msg2Player("CÇn ph¶i <color=green>1 S­ §å phï chØ<color> míi cã thÓ kªu gäi ®Ö tö.")
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice_err", "S­ phô cña b¹n kh«ng ®ñ S­ §å phï chØ, kh«ng thÓ kªu gäi b¹n.")
	end
end

function _lalala_prentice(szMsg)
	if IsPlayerDeath() == 1 then
		return
	end
	if IsStalling() == 1 then
		return
	end
	if IsReading() == 1 then
		return
	end
	
	local tPos = split(szMsg, ",")
	CleanInteractive()
	if NewWorld(tPos[1], tPos[2], tPos[3]) ~= 0 then
		SetFightState(tPos[4])
	end
end

function _refuse_la(szMsg)
	Msg2Player(szMsg.."Tõ chèi lêi kªu gäi cña b¹n!")
end

function _lalala_prentice_err(szMsg)
	Say(szMsg, 0)
end

-- ÕıÊ½°İÊ¦ and ³öÊ¦
-- Âú×ãÌõ¼şÔò·µ»Ø1
-- ²»Âú×ãÔò·µ»Ø0
function master_prentice()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- ²»ÊÇÊ¦Í½2ÈË×é¶Ó
		return 0
	end
	local nMap1, nX1, nY1 = GetWorldPos()
	
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local nMasterIndex = PlayerIndex
	local szMasterName = GetName()
	local szMasterLevel = GetLevel()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- Ñ¾µÄ¸ù±¾Ã»ÓĞÍ½µÜ
		PlayerIndex = nOldPlayer
		return 0
	end
	
	local nMap2, nX2, nY2 = GetWorldPos()
	local fDistance = distance_between_points(nMap1, nX1, nY1, nMap2, nX2, nY2)
	if fDistance >= 6 or fDistance < 0 then
		PlayerIndex = nOldPlayer
		local t = GetMPBaseInfo()
		if t["master"] == szMasterName then
			if t["istemp"] == 0 then
				Msg2Player("B¹n c¸ch s­ phô qu¸ xa, kh«ng ®ñ thµnh t©m, kh«ng thÓ trë thµnh ®å ®Ö chİnh thøc.")
			elseif t["istemp"] == 1 then
				Msg2Player("B¹n c¸ch s­ phô qu¸ xa, kh«ng ®ñ thµnh t©m, kh«ng thÓ XuÊt S­.")
			end
		end
		return 0
	end

	PlayerIndex = nOldPlayer
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szMasterName then	-- Ñ¾µÄ¸ù±¾²»ÊÇÕâ¸öÈËµÄÊ¦¸¸
		return 0
	end

	local isExist = 0
	for index, value in tMasterInfo["prentice"] do
		print(value)
		if value == szName then
			isExist = 1
			break
		end
	end
	
	if isExist == 0 then					-- ²»ÔÚÊ¦¸¸µÄÍ½µÜÁĞ±íÀïÄó
		return 0
	end
	
	-- Èç¹ûÊÇ³öÊ¦
	if GetTask(GRADUATE_TASK_ID) == 1 then
		local isAlright = 1
		if mp_goods_add_chk(1,1) == 0 then
			isAlright = 0
		end
		PlayerIndex = nMasterIndex
		if mp_goods_add_chk(1,1) == 0 then
			isAlright = 0
		end
		if isAlright == 0 then
			return 0
		end
		PlayerIndex = nOldPlayer
		PrecticeGraduate(szMasterName)
		return 1
	end
	
	-- ÊÇ×ªÕı
	if tInfo["istemp"] == 1 then			-- ÒÑ¾­×ªÕıÁË»¹°İ¸öÃ«°¡
		return 0
	end
	
	if GetLevel() < 10 then					-- Ğ¡ÓÚ¸ø¸öÌáÊ¾(²»ÄÜÊÇTalk, SayÖ®Á÷£¬·ñÔòºóÃæ°İµÄÄÚÈİ¿ÉÄÜÍæÍêÁË)
		Msg2Player("§¼ng cÊp cña b¹n ch­a ®Õn cÊp 10, kh«ng thÓ trë thµnh ®Ö tö chİnh thøc.")
		return 0
	end
	if GetLevel() >= szMasterLevel then
		Msg2Player("§¼ng cÊp cña b¹n ph¶i nhá h¬n s­ phô cña b¹n, míi cã thÓ trë thµnh ®Ö tö chİnh thøc.")
		PlayerIndex = nMasterIndex
		Msg2Player(szName.." (®¼ng cÊp) ph¶i nhá h¬n b¹n, míi cã thÓ thµnh cña b¹n ®Ö tö chİnh thøc.")
		return 0
	end
	
	Msg2Player("B¹n ®· göi yªu cÇu xin ®­îc lµ ®Ö tö chİnh thøc. Xin h·y ®îi håi ©m cña s­ phô b¹n.")
	-- ×ªÕı
	PlayerIndex = nMasterIndex
	SetPlayerScript("\\script\\master_prentice\\some_op.lua")
	Say(szName.."Muèn chİnh thøc b¸i b¹n lµm s­, quy nhËp m«n h¹ cña ban, cã ph¶i thu n¹p ®Ö tö chİnh thøc kh«ng?", 2 , "§ång ı/yes_add_true", "§Ó ta suy nghÜ!/refuse_add_true")
	return 1
end

function refuse_add_true()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- ²»ÊÇÊ¦Í½2ÈË×é¶Ó
		return 0
	end
	local szName = GetName()
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	if PlayerIndex > 0 then
		Say(szName.."Tõ chèi lêi xin trë thµnh ®Ö tö chİnh thøc cña b¹n.", 0)
	end
end

function yes_add_true()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		return
	end
	local szMasterName = GetName()
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			TakeOnAMaster(1, szMasterName)	-- ÕıÊ½°İÊ¦
			break
		end
	end
	PlayerIndex = nOldPlayer
end

-------  npc ²Ù×÷	-------------------------------------------------------------------------

function yes_make_master()
	if GetLevel() < 75 then
		Say("muèn ®­îc truyÒn thô vâ c«ng, b¶n th©n İt nhÊt còng ph¶i cã thùc lùc ®Çy ®ñ. §îi ®Õn cÊp 75 råi ®Õn ®¨ng kı l¹i nhĞ.",0)
		return
	end
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= "" then
		Say("B¹n ®· b¸i lµm s­ phô råi, t¹m thêi kh«ng thÓ ®¨ng kı th©u n¹p ®Ö tö.",0)
		return
	end
	ToBeMaster()
end

function yes_be_prentice()
	Say("NÕu nh­ b¹n muèn lµm ®å ®Ö. Xin nhÊp ph¶i vµo “B¸i s­ thiÕp” ®Ó thao t¸c. \nNÕu nh­ B¸i s­ thiÕp bŞ mÊt cã thÓ t×m ta nhËn l¹i!", 0)
end

function buy_fund()
	if GetTeamSize() ~= 2 then
		Say("NÕu nh­ c¸c h¹ muèn mua Hoa Hång Quèc tö gi¸m cho cao ®å ®Ö tö. Xin h·y tæ ®éi hai ng­êi råi ®Õn ®©y",0)
		return
	end
	local szMasterName = GetName()
	local tMInfo = GetMPBaseInfo()
	if tMInfo["prentice"] == nil then
		Say("NÕu nh­ c¸c h¹ muèn mua Hoa Hång Quèc tö gi¸m cho cao ®å ®Ö tö. Xin h·y tæ ®éi hai ng­êi råi ®Õn ®©y",0)
		return
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szPrenticeName = GetName()
	local tPInfo = GetMPBaseInfo()
	if tPInfo["master"] ~= szMasterName then	-- ×é¶ÓµÄÃ»ÓĞÊ¦Í½¹ØÏµ
		PlayerIndex = nOldPlayer
		Say("NÕu nh­ c¸c h¹ muèn mua Hoa Hång cho cao ®å ®Ö tö. Xin h·y tæ ®éi hai ng­êi råi ®Õn ®©y",0)
		return
	end
	
	if tPInfo["istemp"] == 0 then			-- ²»ÄÜ°ïÁÙÊ±µÜ×Ó¹ºÂò»ù½ğ
		PlayerIndex = nOldPlayer
		Say("C¸c h¹ kh«ng thÓ mua Hoa Hång Quèc Tö Gi¸m giïm ®Ö tö t¹m thêi.",0)
		return
	end
	
	PlayerIndex = nOldPlayer
	local isExist = 0
	for index, value in tMInfo["prentice"] do
		if value == szPrenticeName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- ²»ÔÚÊ¦¸¸µÄÍ½µÜÁĞ±íÀïÄó
		Say("NÕu nh­ c¸c h¹ muèn mua Hoa Hång Quèc tö gi¸m cho cao ®å ®Ö tö. Xin h·y tæ ®éi hai ng­êi råi ®Õn ®©y",0)
		return
	end
	
	local nAlreadyBuy = tPInfo["lovefund"]
	if tPInfo["lovefund"] >= 10 then
		Say("C¸c h¹ ®· mua cho "..szPrenticeName.." 10 Hoa Hång. ",0)
		return
	end
	if nAlreadyBuy < 0 then
		nAlreadyBuy = 0
	end
	local nMaxBuy = MAX_FUND_COUNT - nAlreadyBuy
	
	Say(" C¸c h¹ muèn mua hoa cho <color=yellow>"..szPrenticeName.."<color> ph¶i kh«ng? Tr­íc ®©y c¸c h¹ ®· mua cho"..szPrenticeName.."<color=red>"..nAlreadyBuy.."<color> råi. Tèi ®a cßn cã thÓ mua thªm <color=red>"..nMaxBuy.."<color> n÷a, mçi phÇn 10 Tèng Nguyªn Th«ng B¶o. Tèng Nguyªn Th«ng B¶o do Th¸i tæ ®óc khi ®¨ng c¬, hiÖn nay trong d©n gian hiÕm thÊy, c¸c h¹ cã thÓ vµo Ngù c¸c ®Ó mua",
		2,
		"X¸c nhËn mua/#yes_buy_fund("..nMaxBuy..")",
		"§Ó ta suy nghÜ!/no_say")
end

function yes_buy_fund(nMaxBuy)
	local nCount = GetItemCount(2,1,594)
	if nCount < 10 then
		Say("Tèng Nguyªn th«ng b¶o cña c¸c h¹ kh«ng ®ñ mua mét phÇn hoa hång",0)
		return
	end
	local nMaxCanBuy = tonumber(floor(nCount / 10))
	local nMax = nMaxBuy
	if nMaxCanBuy < nMaxBuy then
		nMax = nMaxCanBuy
	end
	SetTaskTemp(26, nMax)
	AskClientForNumber("yes_buy_fund_cb", 1, nMax, "Mua bao nhiªu hoa hång?")
end

function yes_buy_fund_cb(nN)
	local nCount = nN * 10
	if nN > GetTaskTemp(26) then
		SetTaskTemp(26, 0)
		return
	end
	SetTaskTemp(26, 0)
	if GetTeamSize() ~= 2 then
		return
	end
	local szMasterName = GetName()
	local tMInfo = GetMPBaseInfo()
	if tMInfo["prentice"] == nil then
		return
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szPrenticeName = GetName()
	local tPInfo = GetMPBaseInfo()
	if tPInfo["master"] ~= szMasterName then	-- ×é¶ÓµÄÃ»ÓĞÊ¦Í½¹ØÏµ
		return
	end	
	if tPInfo["istemp"] == 0 then			-- ²»ÄÜ°ïÁÙÊ±µÜ×Ó¹ºÂò»ù½ğ
		return
	end
	PlayerIndex = nOldPlayer
	local isExist = 0
	for index, value in tMInfo["prentice"] do
		if value == szPrenticeName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- ²»ÔÚÊ¦¸¸µÄÍ½µÜÁĞ±íÀïÄó
		return
	end
	if DelItem(2,1,594,nCount) == 1 then
		BuyLovefund(szPrenticeName, nN)
		WriteLog("[HÖ thèng S­ ®å]: mua hoa hång m="..szMasterName.." p="..szPrenticeName.." n="..nN)
	end
end

function get_graduate_item()
	if BigGetItemCount(2,1,590) > 0 then
		Say("<color=green>Quèc Tö gi¸m <color>: Ng­¬i ®· cã mét 'XuÊt s­ tiªu' råi.",0)
		return
	end
	local nTime = CustomDataRead("mp_m_get_graduate_item_time")
	local nNow = GetTime()
	if nTime == nil then
		CustomDataSave("mp_m_get_graduate_item_time", "d", nNow)
	else
		local nDiffTime = 3600 - (nNow - nTime)
		if nDiffTime > 0 then		-- 60·ÖÖÓ²ÅÄÜÁìÈ¡Ò»´Î
			local nMin = floor(nDiffTime / 60)
			local nSec = mod(nDiffTime, 60)
			Say("B¹n cßn cÇn "..nMin.." Phót "..nSec.."(gi©y) míi ®­îc l·nh 1 'XuÊt s­ tiªu'.", 0)
			return
		end
		CustomDataSave("mp_m_get_graduate_item_time", "d", nNow)
	end
		
	
	if AddItem(2,1,590,1,1) == 1 then
		Say("Qu¶ nhiªn Danh s­ xuÊt cao ®å, lÖnh ®å tiÕn bé rÊt nhanh. Cã ®­îc 'XuÊt s­ tiªu', thÇy trß cïng nhau sö dông, cã thÓ kªu gäi Quèc Tö gi¸m tuÇn kh¶o, triÒu ®×nh chØ dïng XuÊt s­ tiªu ®Ó s¸t h¹ch, tæ ®éi ®¸nh b¹i tuÇn kh¶o cã thÓ xuÊt s­. Xin chó ı, chiªu sau cïng ph¶i do lÖnh ®å hoµn thµnh.", 0)
	end
end

function use_point()
	if MPUpdate("\\script\\master_prentice\\some_op.lua", "use_point_r2s", 1) == 0 then				-- ÏÈË¢ĞÂÒ»ÏÂÊı¾İ
		use_point_r2s()
	end
end

function use_point_r2s()
	Say("Ta muèn chuyÓn ®iÓm S­ ®å ",
		4,
		"Ta muèn l·nh phÇn th­ëng triÒu ®×nh/use_point_award",
		"Ta muèn dïng S­ ®å phï chØ chuyÓn ®iÓm s­ ®å thµnh phÇn th­ëng/use_point_award1",
		"Ta muèn ghi l¹i §iÓm S­ ®å thµnh §iÓm s­ ®øc/use_point_point",
		"Rêi khái/no_say")
end

function use_point_award()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	if nPoint <= 0 then
		Say("C¸c h¹ hiÖn kh«ng cã §iÓm S­ ®å, kh«ng thÓ l·nh th­ëng", 0)
		return
	end
	
	if nCanChangePoint - nChangePoint <= 0 then
		Say("c¨n cø theo ®¼ng cÊp thô nghiÖp , triÒu ®×nh miÔn phİ cho b¹n<color=yellow>"..nCanChangePoint.."<color>§iÓm S­ ®å lµm phÇn th­ëng. LÇn nµy b¹n ®· chuyÓn ®iÓm miÔn phİ qu¸ <color=yellow>"..nChangePoint.."<color> ®iÓm S­ ®å, kh«ng ®­îc chuyÓn nhiÒu qu¸.", 0)
		return
	end
	
	Say("C¸c h¹ cã <color=yellow>"..nPoint.."<color> §iÓm S­ ®å, c¨n cø theo ®¼ng cÊp thô nghiÖp, triÒu ®×nh sÏ chuyÓn miÔn phİ <color=yellow>"..nCanChangePoint.."<color> §iÓm S­ ®å lµm phÇn th­ëng. LÇn nµy ng­¬i ®· chuyÓn qu¸ <color=yellow>"..nChangePoint.."<color> §iÓm S­ ®å, cã thÓ miÔn phİ chuyÓn <color=yellow>"..(nCanChangePoint - nChangePoint).."<color> §iÓm S­ ®å. Cã muèn triÒu ®×nh chuyÓn §iÓm S­ ®å miÔn phİ kh«ng?",
		2,
		"§Ó xem cã thÓ chän phÇn th­ëng nµo?/see_award_type",
		"§Ó ta suy nghÜ!/no_say"
		)
end

function see_award_type()
	Say("C¸c h¹ cã thÓ chän c¸cphÇn th­ëng bªn d­íi",
		2,
		--"½ğÇ®¡£Ã¿1µãÊ¦Í½µãÊı¿É»»3.8½ğ/#yes_use_point(1)",
		--"ÉùÍû/#yes_use_point(2)",
		--"Ê¦ÃÅ¹±Ï×¶È/#yes_use_point(3)",
		--"¾ü¹¦¡£Ã¿1µãÊ¦Í½µãÊı¿É»»20µã¾ü¹¦/#yes_use_point(4)",
		--"½¡¿µ¾­Ñé/#yes_use_point(5)",
		"Kinh nghiÖm. Mçi 1 ®iÓm S­ ®å cã thÓ ®æi ®¼ng cÊp*®¼ng cÊp*10 kinh nghiÖm/#yes_use_point(6)",
		--"½¡¿µ¾­Ñé×ª¾­Ñé/#yes_use_point(7)",
		"§Ó ta suy nghÜ!/no_say")
end

function yes_use_point(nType)
	if nType == 4 and GetPlayerRoute() == 0 then	-- ¾ü¹¦
		Say("C¸c h¹ v« m«n v« ph¸i, kh«ng thÓ ®æi lÊy chiÕn c«ng.", 0)
		return
	end

	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	local nDiffPoint = nCanChangePoint - nChangePoint
	if nDiffPoint > nPoint then
		nDiffPoint = nPoint
	end
	AskClientForNumber("yes_use_point_award_cb", 1, nDiffPoint, "ChuyÓn bao nhiªu §iÓm S­ ®å?")
	SetTaskTemp(10, nType)
end

function yes_use_point_award_cb(nCount)
	local nType = GetTaskTemp(10)
	if not (nType == 1 or nType == 4 or nType == 6) then
		return
	end
	SetTaskTemp(10, 0)
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	local nDiffPoint = nCanChangePoint - nChangePoint
	if nDiffPoint < nCount then
		return
	end
	if nPoint < nCount then
		return
	end
	local nRet = FreeChangeTaskPoint(nCount, nType)
	if nRet == -1 then
		Msg2Player("B¹n kh«ng ®ñ §iÓm S­ ®å")
	elseif nRet == -2 then
		Msg2Player("TriÒu §×nh kh«ng thÓ gióp b¹n cã thªm ®iÓm S­ §å")
	end
end

function use_point_award1()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint <= 0 then
		Say("C¸c h¹ ch­a cã ®iÓm S­ ®å, kh«ng thÓ ®æi lÊy gi¶i th­ëng.", 0)
		return
	end
	
	Say("C¸c h¹ cã <color=yellow>"..nPoint.."<color>®iÓm, mçi lÇn ®æi 1 ®iÓm S­ ®å ph¶i mÊt 1 S­ ®å phï chØ. Muèn ®æi kh«ng?",
		2,
		"Ta muèn xem phÇn th­ëng/see_award_type1",
		"§Ó ta suy nghÜ!/no_say"
		)
end

function see_award_type1()
	Say("C¸c h¹ cã thÓ chän c¸cphÇn th­ëng bªn d­íi",
		4,
		"Kim tiÒn. 1 ®iÓm S­ ®å ®æi ®­îc 3.8 l­îng/#yes_use_point1(1)",
		--"ÉùÍû/#yes_use_point(2)",
		--"Ê¦ÃÅ¹±Ï×¶È/#yes_use_point(3)",
		"ChiÕn c«ng. 1 ®iÓm S­ ®å ®æi ®­îc 20 ®iÓm chiÕn c«ng/#yes_use_point1(4)",
		--"½¡¿µ¾­Ñé/#yes_use_point(5)",
		"Kinh nghiÖm. Mçi 1 ®iÓm S­ ®å cã thÓ ®æi ®¼ng cÊp*®¼ng cÊp*10 kinh nghiÖm/#yes_use_point1(6)",
		--"½¡¿µ¾­Ñé×ª¾­Ñé/#yes_use_point(7)",
		"§Ó ta suy nghÜ!/no_say")
end

function yes_use_point1(nType)
	if nType == 4 and GetPlayerRoute() == 0 then	-- ¾ü¹¦
		Say("C¸c h¹ v« m«n v« ph¸i, kh«ng thÓ ®æi lÊy chiÕn c«ng.", 0)
		return
	end
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	AskClientForNumber("yes_use_point_award1_cb", 1, nPoint, "§æi bao nhiªu §iÓm S­ ®å?")
	SetTaskTemp(10, nType)
end

function yes_use_point_award1_cb(nCount)
	local nType = GetTaskTemp(10)
	if not (nType == 1 or nType == 4 or nType == 6) then
		return
	end
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint < nCount then
		return
	end
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < nCount then
		Say("S­ ®å phï chØ kh«ng ®ñ ®Ó ®æi nhiÒu phÇn th­ëng nh­ thÕ, chuÈn bŞ S­ ®å phï chØ kh¸c, cã thÓ mua ë Ngù c¸c.",0)
		return
	end
	if DelItem(tItem[1],tItem[2],tItem[3],nCount) == 1 then
		local nRet = ChangeTaskPoint(nCount, nType)
		if nRet == -1 then
			Msg2Player("B¹n kh«ng ®ñ §iÓm S­ ®å")
			AddItem(tItem[1],tItem[2],tItem[3],nCount,1)	-- °ÑÃ»ÓĞ³É¹¦¶Ò»»µÄÊ¦Í½·ûÖ½»¹¸øÍæ¼Ò
		end
	end
end

function use_point_point()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint <= 0 then
		Say("C¸c h¹ ch­a cã ®iÓm S­ ®å, kh«ng thÓ ghi l¹i §iÓm S­ ®øc", 0)
		return
	end
	
	Say("Ghi §iÓm s­ ®øc thµnh §iÓm S­ ®å ph¶i mÊt S­ ®å phï chØ, mçi <color=yellow>1<color> §iÓm s­ ®øc cÇn <color=yellow>1<color> S­ ®å phï chØ. §iÓm S­ ®å hiÖn t¹i lµ <color=yellow>"..nPoint.."<color> ®iÓm, muèn ghi §iÓm s­ ®øc kh«ng?",
		2,
		"Muèn chø/#yes_use_point_point("..nPoint..")",
		"§Ó ta suy nghÜ!/no_say")
end

function yes_use_point_point(nPoint)
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < 1 then
		Say("C¸c h¹ ch­a cã S­ ®å phï chØ, chuÈn bŞ mét sè S­ ®å phï chØ ®em ®Õn, cã thÓ mua ë Ngù c¸c.",0)
		return
	end
	AskClientForNumber("yes_use_point_point_cb", 1, nPoint, "Ghi bao nhiªu §iÓm s­ ®øc?")
end

function yes_use_point_point_cb(nCount)
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < nCount then
		Say("S­ ®å phï chØ kh«ng ®ñ ®Ó ghi nhiÒu ®iÓm s­ ®øc nh­ thÕ, chuÈn bŞ mét sè S­ ®å phï chØ ®em ®Õn, cã thÓ mua ë Ngù c¸c.",0)
		return
	end
	if DelItem(tItem[1],tItem[2],tItem[3],nCount) == 1 then
		ChangeTaskPoint(nCount, 0)
	end
end

t_specail_item =
{
	{2,1,2000,"L­u Tinh lÖ"," T¨ng 100 ®iÓm khi Linh th¹ch hîp thµnh",1},
	{2,1,2001,"Ngäc Tóy"," T¨ng 200 ®iÓm khi Linh th¹ch hîp thµnh",10},
	{2,0,554,"Tu Ch©n YÕu QuyÕt"," T¨ng 1000 ®iÓm tu luyÖn",1},
	{2,0,141,"Tiªu KiÕp t¸n"," TÈy 1 ®iÓm PK",3},
	{2,1,1091,"Cñ c¶i Vµng"," chuyÓn vËn",3},
	{2,1,9995,"Gi¸n §iÖp trang"," §æi phe tham gia chiÕn tr­êng",3},
	{2,1,1157,"§Êu hån"," T¨ng TrŞ s¸t khİ",15},
	{2,1,1103,"Thùc chiÕn kinh nghiÖm tËp"," VËt phÈm cÇn cho ho¹t ®éng thi luyÖn s­ m«n",4},
	{2,0,553,"§¹i Nh©n s©m"," Tèc ®é söa MËt tŞch t¨ng gÊp 4 ",5},
	{2,1,1014,"Lôc L©m Lang Yªn"," Kªu gäi B¾c Lôc L©m Minh chñ",15},
	{2,1,1047,"Thñy Hoµng Bİ ChiÕu"," Kªu gäi Th­¬ng ThÇn Doanh Thiªn",15},
	{2,1,1024,"Ngù dông b¹ch ngäc th¹ch"," Kªu gäi Bé Phi Yªn",15},
	{2,1,1048,"Uyªn ¦¬ng Kim Ti B¹c"," Kªu gäi L·nh H­¬ng L¨ng",20},
	{2,1,1015,"Vâ L©m bİ lÖnh"," Kªu gäi BOSS S­ m«n bÊt kú",30},
	{2,1,504,"N÷ Oa Tinh Th¹ch"," Gì 1 yÕu quyÕt trªn trang bŞ MËt tŞch",120},
	{2,1,540,"LÔ r­¬ng"," 50 lÔ kim kÕt h«n",60},
	{2,0,125,"Héi Minh LÖnh Bµi"," LËp bang",150},
	{2,1,1003,"Kú L©n hoµn"," _Trªn cÊp 31 Danh väng ch­a ®¹t 3000 trùc tiÕp th¨ng 3000 Danh väng",600},
	{2,1,1002,"Long HuyÕt hoµn"," Ng­êi thÊp h¬n cÊp 73 trùc tiÕp t¨ng ®Õn cÊp 73",1000},
	{2,1,1004,"Phông HuyÕt hoµn"," §¼ng cÊp 72 trë lªn trùc tiÕp ®¹t 4000 ®iÓm cèng hiÕn s­ m«n",1200},
	{2,1,1005,"ChiÕn ThÇn hoµn"," Trùc tiÕp th¨ng ChiÕn c«ng §« thèng",1500},
	{0,105,19,"Siªu Quang"," VÜnh cöu - 100 con H¾c M·",5000},
	{2,21,2016,"Phèi th¹ch cÊp 5 (ngo¹i c«ng)"," _15% Vò khİ ngo¹i c«ng",2000},
	{2,21,2021,"Phèi th¹ch cÊp 5 (néi c«ng)"," _15% Vò khİ néi c«ng",2000},
	{2,21,2117,"Phèi th¹ch cÊp 5 (tèc ®é xuÊt chiªu)"," _25% tèc ®é",3000},
	{2,21,2240,"Phèi th¹ch cÊp 7 (gi¶m ngo¹i phßng)"," _Gi¶m 15% vò khİ ngo¹i phßng",1000},
	{2,21,2247,"Phèi th¹ch cÊp 7 (gi¶m néi phßng)"," _Gi¶m 15% vò khİ néi phßng",1000},
}

function use_fenglu(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "Trang tr­íc/#use_fenglu("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(t_specail_item) then
		nEnd = getn(t_specail_item)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = format("%-20s%s? (cÇn %d Bæng léc)/#buy_specail_item(%d)", t_specail_item[i][4],t_specail_item[i][5],t_specail_item[i][6],i)
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(t_specail_item) then
		tSay[nTabIndex] = "Trang kÕ/#use_fenglu("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "Rêi khái/no_say"
	
	Say("VËt phÈm hiÖn b¸n: <color>", getn(tSay), tSay)
end

function buy_specail_item(nIndex)
	local nMaxCount = GetItemCount(2,1,589)
	if nMaxCount < t_specail_item[nIndex][6] then
		Say("B¹n kh«ng ®ñ bæng léc ®Ó mua <color=yellow>"..t_specail_item[nIndex][4].."<color>.", 0)
		return
	end
	SetTaskTemp(1, nIndex)
	AskClientForNumber("buy_specail_item_cb", 1, floor(nMaxCount/t_specail_item[nIndex][6]), "Muèn mua bao nhiªu?")
end

function buy_specail_item_cb(nCount)
	if Zgc_pub_goods_add_chk(nCount, nCount) == 0 then
		return
	end
	local nIndex = GetTaskTemp(1)
	if DelItem(2,1,589,nCount * t_specail_item[nIndex][6]) == 1 then
		if nIndex == 22 then
			AddItem(t_specail_item[nIndex][1], t_specail_item[nIndex][2], t_specail_item[nIndex][3], nCount,1,-1,-1,-1,-1,-1,-1)
		else
			AddItem(t_specail_item[nIndex][1], t_specail_item[nIndex][2], t_specail_item[nIndex][3], nCount)
		end
		Msg2Player("B¹n ®· mua "..nCount.."c¸i"..t_specail_item[nIndex][4])
		WriteLog("[S­ ®å-Bæng léc]:"..GetName().."§· mua "..nCount.."c¸i"..t_specail_item[nIndex][4])
	end
end

function disband_master()
	Say("Hñy bá ®¨ng kı b¹n sÏ mÊt th©n phËn s­ phô, tù bá ®i bæng léc ch­a nhËn, mÊt ®iÓm s­ ®øc, ®¼ng cÊp thô nghiÖp. C¸c h¹ muèn hñy bá kh«ng?",
		2,
		"§ång ı/yes_disband_master",
		"Hñy bá/no_say")
end

function yes_disband_master()
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] ~= nil then
		Say("Cã ®Ö tö kh«ng ®­îc hñy bá ®¨ng kı.",0)
		return
	end
	DisbandMaster()
end

function create_task()
	if MPUpdate("\\script\\master_prentice\\some_op.lua", "create_task_r2s", 1)	== 0 then			-- ÏÈË¢ĞÂÒ»ÏÂÊı¾İ
		create_task_r2s()
	end
end

function create_task_r2s()
	local tInfo = GetMPBaseInfo()
	if tInfo["ismaster"] == 0 then
		return
	end
	
	local ltime = tInfo["taskinterval"]
	if ltime > 0 then
		local nHour = floor(ltime / 3600)
		ltime = mod(ltime, 3600)
		local nMin = floor(ltime / 60)
		local nSec = mod(ltime, 60)
		Say("B¹n ®· c«ng bè NhiÖm vô S­ ®å 1 lÇn råi, kho¶ng c¸ch thêi gian c«ng bè NhiÖm vô S­ ®å lÇn sau lµ: <color=yellow>"..nHour..":"..nMin..":"..nSec, 0)
	else
		Say("B¹n cã thÓ chän NhiÖm vô S­ ®å bªn d­íi ®Ó c«ng bè",
			8,
			"Hoµn thµnh nhiÖm vô s­ m«n s¬ cÊp 2 lÇn hoÆc hoµn thµnh nhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: 15 ®iÓm cèng hiÕn s­ m«n/#ask_create_task(1)",
			"Hoµn thµnh NhiÖm vô s¸t thñ 5 lÇn hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: 50 ®iÓm Danh väng/#ask_create_task(2)",
			"§¸nh xong 1 trËn hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: 150 ®iÓm chiÕn c«ng/#ask_create_task(3)",
			"Qua ®­îc 2 ¶i cña Tµng KiÕm hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*110)/#ask_create_task(4)",
			"Th¸i H­ qua 4 qu¸i hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*120)/#ask_create_task(5)",
			"Thùc hiÖn Long chu 4 lÇn hoÆc hoµn thµnhNhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*110)/#ask_create_task(6)",
			"Tham gia L«i ®µi ®¬n ®Êu 5 lÇn hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*100)/#ask_create_task(7)",
			"Giê ch­a muèn c«ng bè nhiÖm vô/no_say")
	end
end

function ask_create_task(nType)
	local strConfirm
	if nType == 1 then
		strConfirm = "NhiÖm vô S­ ®å s¾p c«ng bè lÇn nµy lµ: hoµn thµnh nhiÖm vô s­ m«n s¬ cÊp 2 lÇn hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: 15 ®iÓm cèng hiÕn s­ m«n."
	elseif nType == 2 then
		strConfirm = "NhiÖm vô s­ ®å s¾p c«ng bè lÇn nµy lµ: hoµn thµnh NhiÖm vô s¸t thñ 5 lÇn hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: 50 ®iÓm Danh väng."
	elseif nType == 3 then
		strConfirm = "NhiÖm vô s­ ®å s¾p c«ng bè lÇn nµy lµ: ®¸nh xong 1 trËn hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: 150 diÓm chiÕn c«ng."
	elseif nType == 4 then
		strConfirm = "NhiÖm vô s­ ®å s¾p c«ng bè lÇn nµy lµ: qua ®­îc 2 ¶i Tµng KiÕm hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*110)"
	elseif nType == 5 then
		strConfirm = "NhiÖm vô s­ ®å s¾p c«ng bè lÇn nµy lµ: qua ®­îc 4 ¶i Th¸i H­ hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*120)."
	elseif nType == 6 then
		strConfirm = "NhiÖm vô s­ ®å s¾p c«ng bè lÇn nµy lµ: ®ua 4 cuéc thuyÒn Rång hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*110)."
	elseif nType == 7 then
		strConfirm = "NhiÖm vô s­ ®å s¾p c«ng bè lÇn nµy lµ: thi 5 lÇn L«i ®µi ®¬n ®Êu hoÆc hoµn thµnh NhiÖm vô th­¬ng héi 20 lÇn, phÇn th­ëng ®å ®Ö: kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*100)."
	end
	Say(strConfirm.."X¸c nhËn c«ng bè?",2, "§ång ı/#yes_create_task("..nType..")", "Giê ch­a muèn c«ng bè nhiÖm vô/no_say")
end

function yes_create_task(nType)
	MasterCreateTask(nType)
	Say("c«ng bè nhiÖm vô thµnh c«ng, th«ng b¸o cho ®Ö tö biÕt, nhÊp vµo nót 'nhËn nhiÖm vô' trªn b¶ng s­ ®å ®Ó tiÕp nhËn NhiÖm vô S­ ®å nµy.", 0)
end

function no_say()
end
