--File name:dragonboat_head.lua ¶ËÎç½ÚÓ¢ÎÄÔ­À´½Ðdragon boat festival°¡
--Describe:¶ËÎç½Ú»î¶¯½Å±¾Í·ÎÄ¼þ
--Create Date:2006-4-18
--Author:yanjun
--==================È«¾Ö³£Á¿======================================
MULTIPLE = 2;	--ÉèÖÃ¸ã¶à±¶»î¶¯Ê±µÄ±¶Êý£¬»î¶¯Ê±¼äÔÚGet_Multiple_Status¶¨Òå£¬·Ç»î¶¯Ê±¼ä±¶ÊýÎª£±
FALSE = 0;
TRUE = 1;

POSITION = 1710; --ÓÃÀ´¼ÇÂ¼Íæ¼ÒÔÚÈüµÀÉÏµÄÎ»ÖÃ
RANK = 1711;	--¼ÇÂ¼Íæ¼Ò¾­¹ýTRAPµãÊ±µÄÃû´Î
ENTERORDER = 1712; --¼ÇÂ¼Íæ¼Ò½øÈë³¡µØµÄ´ÎÐò
BONUSPOINT = 1713; --¼ÇÂ¼Íæ¼Ò»ý·Ö
ATTENDCOUNT = 1714; --¼ÇÂ¼Íæ¼ÒÍê³É±ÈÈüµÄ´ÎÊý
STATUS = 1715;	--¼ÇÂ¼Íæ¼ÒÊÇ¹ÛÖÚ»¹ÊÇ²ÎÈüÑ¡ÊÖ¡£0Ê²Ã´¶¼²»ÊÇ£¬1Îª¹ÛÖÚ£¬2Îª²ÎÈüÑ¡ÊÖ
CURMAP = 1716;	--¼ÇÂ¼Íæ¼ÒËùÔÚ³¡µØID
--================================================================
FINISHTIME = 1717	--¼ÇÂ¼Íê³É±ÈÈüËùÓÃµÄÊ±¼ä£¬µ¥Î»ÎªÖ¡Êý
--======================´©Ô½Æì×ÓËùÐè±äÁ¿==========================
FLAG_COLOR = 1718;	--ÓÃÀ´¼ÇÂ¼Ö®Ç°´©¹ýÊ²Ã´Æì×Ó£¬1±íÊ¾ºìÆì£¬2±íÊ¾»ÆÆì£¬3±íÊ¾À¶Æì
--¼ÇÂ¼Æì×ÓÊÇ·ñ±»´©¹ý£¬Ò»È¦Ò»¹²ÓÐ49ÃæÆì×Ó£¬ËùÒÔÒªÓÃÁ½¸ö32Î»µÄÈÎÎñ±äÁ¿¡£
FLAG_BEGIN = 1719;
FLAG_END = 1720;
ATTENDCOUNTPERDAY1 = 1721	--ÓÃÀ´¼ÇÂ¼Íæ¼Òµ±ÌìÍê³É±ÈÈüµÄ´ÎÊý
ATTENDCOUNTPERDAY2 = 1727	--¼ÇÂ¼²Î¼Ó±ÈÈüµÄÈÕÆÚ
ATTENDCOUNTPERDAY3 = 1728	--¼ÇÂ¼µ±ÌìÓÐÃ»ÓÐÁìÈ¡¹ýôÕ×Ó
GETXDZZCOUNT = 1722	--ÓÃÀ´¼ÇÂ¼Íæ¼ÒÁìÈ¡ÏÌµ°ôÕ×ÓµÄ´ÎÊý

AWARD_YT1 = 1704	--ÔÉÌú	¼ÇÂ¼ÁìÈ¡´ÎÊý£¬
AWARD_YT2 = 1729	--¼ÇÂ¼ÁìÈ¡Ê±¼ä
AWARD_SLGZ1 = 1705	--ÊÔÁ¶¹û×Ó	¼ÇÂ¼ÁìÈ¡´ÎÊý
AWARD_SLGZ2 = 1611	--¼ÇÂ¼ÁìÈ¡Ê±¼ä
AWARD_JXZZ1 = 1706	--¼ÎÐËôÕ×Ó	¼ÇÂ¼ÁìÈ¡´ÎÊý
AWARD_JXZZ2 = 1612	--¼ÇÂ¼ÁìÈ¡Ê±¼ä
AWARD_TXDMHG1 = 1707	--Ì«Ðé¶àÃÛ»¨¹û	¼ÇÂ¼ÁìÈ¡´ÎÊý
AWARD_TXDMHG2 = 1613	--¼ÇÂ¼ÁìÈ¡Ê±¼ä
AWARD_HWJS1 = 1708	--ºÚÎÙ¾«Ê¯µÈ	¼ÇÂ¼×Ü¹²ÁìÈ¡´ÎÊý
AWARD_HWJS2 = 1614	--¼ÇÂ¼µ±ÌìÁìÈ¡´ÎÊý
AWARD_HWJS3 = 1615	--¼ÇÂ¼ÁìÈ¡Ê±¼ä
AWARD_ZZDLB1 = 1709	--ôÕ×Ó´óÀñ°ü	¼ÇÂ¼×Ü¹²ÁìÈ¡´ÎÊý
AWARD_ZZDLB2 = 1616	--¼ÇÂ¼µ±ÌìÁìÈ¡´ÎÊý
AWARD_ZZDLB3 = 1617	--¼ÇÂ¼ÁìÈ¡Ê±¼ä
AWARD_HLB1 = 1723	--ºöÀ×²µ	¼ÇÂ¼×Ü¹²ÁìÈ¡´ÎÊý
AWARD_HLB2 = 1618	--¼ÇÂ¼µ±ÌìÁìÈ¡´ÎÊý
AWARD_HLB3 = 1619	--¼ÇÂ¼ÁìÈ¡Ê±¼ä
AWARD_DJSWQZZSC1 = 1724	--´ó½³Ê¦ÎäÆ÷ÖÆ×÷ÊÖÊé	¼ÇÂ¼×Ü¹²ÁìÈ¡´ÎÊý
AWARD_DJSWQZZSC2 = 1620	--¼ÇÂ¼µ±ÌìÁìÈ¡´ÎÊý
AWARD_DJSWQZZSC3 = 1621	--¼ÇÂ¼ÁìÈ¡Ê±¼ä
AWARD_QYZP = 1725	--ÇüÔ­Ö®Åå	ÊÇ·ñÁìÈ¡¹ýÇüÔ­Ö®Åå
AWARD_REPUTATION = 1726	--»»È¡ÉùÍûµãÊý
BEST_TIME = 1622	--¼ÇÂ¼Íæ¼ÒµÄ×î¿ìÊ±¼ä(Ö¡Êý)
AWARD_ZZLB = 1624	--¼ÇÂ¼Íæ¼ÒÁìÈ¡ôÕ×ÓÀñ°üµÄÈÕÆÚ
AWARD_CSZZ1 = 1625	--¼ÇÂ¼µ±ÌìÁìÈ¡²æÉÕôÕ×ÓµÄ´ÎÊý
AWARD_CSZZ2 = 1626	--¼ÇÂ¼ÁìÈ¡²æÉÕôÕ×ÓµÄÊ±¼ä
AWARD_DIARY1 = 1627	--¼ÇÂ¼µ±ÌìÁìÈ¡±ÈÈüÈÕ¼ÇµÄ´ÎÊý
AWARD_DIARY2 = 1628	--¼ÇÂ¼ÁìÈ¡±ÈÈüÈÕ¼ÇµÄÈÕÆÚ
--================================================================
NumTab = {"mét","hai","ba","bèn","Ngò ","s¸u","b¶y","t¸m","chÝn","ThËp"};
--================================================================
RoomName = {
		"M©n Giang  ",
		"Cöu Long Giang",
		"TÊn Giang  ",
		"Thinh Giang  ",
		"Giao Khª  ",
		"MÞch La Giang",
		"Méc Lan Khª",
		"Ch©u Giang  ",---------------------------------------		
		"Hoµng Hµ  ",
		"Hång Y Gi¶n",
		"L¹c Hµ  ",
		"Y Hµ  ",
		"M·ng Hµ  ",
		"TÈm Hµ  ",
		"§an Hµ  ",
		"MÉu §¬n Giang",----------------------------------------	
		"Tr­êng Giang  ",
		"Phñ Hµ  ",
		"Nam Hµ  ",
		"Sa Hµ  ",
		"Thanh Thñy Hµ",
		"Giang An Hµ",
		"Kim Sa Hµ",
		"D­¬ng Tö Giang",
		};
--=================================================================================================
BoatInfo = {
		{"ThuyÒn Rång phæ th«ng","ThuyÒn Rång phæ th«ng kh«ng cã mµu s¾c vµ tÝnh n¨ng ®Æc biÖt."},
		{"ThuyÒn Rång Thñy Ph¸o","Cã kh¶ n¨ng b¾n thñy ®¹n rÊt m¹nh vµ tÊn c«ng ®èi thñ tõ xa."},
		{"ThuyÒn Rång Thñy L«i","Cã kh¶ n¨ng ch«n thñy l«i d­íi n­íc, ®èi thñ ®i qua sÏ bÞ chÊn ®éng."},
		{"ThuyÒn Rång Thñy L·ng","Cã kh¶ n¨ng t¹o ra mét bøc t­êng sãng ng¨n c¶n ®èi ph­¬ng ®i qua."},
		{"ThuyÒn rång §o¶n Binh","TuyÓn thñ bªn c¹nh t¹m thêi kh«ng thÓ tiÕn lªn"},
		{"ThuyÒn Rång Liªn X¹","Cã kh¶ n¨ng b¾n thñy ®¹n khiÕn ®èi thñ bÞ cho¸ng, ­u ®iÓm lµ mét lÇn cã thÓ b¸n nhiÒu ph¸t."},
		{"ThuyÒn rång TiÒm Hµnh","Khi bÞ t­êng sãng cña ®èi thñ tÊn c«ng kh«ng nh÷ng kh«ng bÞ cho¸ng mµ cßn m­în søc m¹nh cña t­êng sãng lÆn xuèng n­íc tr¸nh ®èi thñ trong mét kho¶ng thêi gian."},
		};
--=================================================================================================
BoxPos = {
	{2007,3266},
	{1981,3259},
	{1969,3229},
	{1944,3279},
	{1935,3307},
	{1909,3303},
	{1893,3316},
	{1893,3353},
	{1882,3305},
	{1845,3252},
	{1836,3285},
	{1817,3309},
	{1791,3344},
	{1774,3323},
	{1752,3314},
	{1739,3272},
	{1712,3228},
	{1700,3286},
	{1678,3286},
	{1653,3309},
	{1645,3341},
	{1634,3301},
	{1611,3291},
	{1596,3350},
	{1604,3384},
	{1619,3406},
	{1647,3450},
	{1677,3469},
	{1693,3427},
	{1699,3391},
	{1701,3344},
	{1717,3357},
	{1730,3377},
	{1755,3404},
	{1765,3449},
	{1782,3467},
	{1808,3523},
	{1827,3600},
	{1857,3561},
	{1852,3491},
	{1888,3467},
	{1907,3478},
	{1935,3460},
	{1914,3414},
	{1929,3368},
	{1955,3396},
	{1987,3427},
	{2008,3383},
	{2056,3415},
	{2057,3375},
	{2042,3314},
		};
BOXCOUNT = 10;
--=================================================================================================
g_TotalRoomNum = 8;	--Ò»¸ö³ÇÊÐÓÐ¶àÉÙ¸ö±ÈÈü³¡µØ
LeavePoint = {
		{100,1462,2803},	--ÈªÖÝ
		{200,1167,2839},	--ãê¾©
		{300,1645,3534},	--³É¶¼
		}
--Æì×ÓÑÕÉ«ID   FlagColor
FC_RED = 1;	
FC_YELLOW = 2;
FC_BLUE = 3;
--Æì×Ó×éºÏÀàÐÍ
MAGIC_RR = 11;	--Õ¨ÔÎÆäËûËùÓÐÑ¡ÊÖ
MAGIC_RY = 12;	--Õ¨ÔÎ×Ô¼ºÉíÇ°µÄÑ¡ÊÖ
MAGIC_RB = 13;	--Õ¨ÔÎµÚÒ»Ãû
MAGIC_YR = 21;	--Ëæ»úÊ¹Ò»ÃûÑ¡ÊÖÀ´µ½×Ô¼ºÉí±ß
MAGIC_YY = 22;	--Ëæ»ú½«×Ô¼º×ªÒÆµ½ÁíÒ»ÃûÑ¡ÊÖµÄÉí±ß
MAGIC_YB = 23;	--È«Ìå»ìÂÒ£¨°üº¬×Ô¼º£©
MAGIC_BR = 31;	--Ç°ÈýÃû¶¨Éí
MAGIC_BY = 32;	--×ÔÉí¼ÓËÙ
MAGIC_BB = 33;	--È«Ìå·âÕÐ
--================================================================
--Modify:È¥µô½ØÖ¹Ê±¼äÏÞÖÆ£¬ÈÃ»î¶¯¼ÌÐø¿ªÏÂÈ¥¡£
function Get_DragonBoatDay_State()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20060530 then
		return 0;	--»î¶¯¿ªÊ¼Ç°
	elseif nDate > 20060710 then
		return 3;	--Áì½±½ØÖ¹		ÐèÒªÍ£Ö¹µÄÊ±ºò·µ»Ø1
	elseif nDate > 20060630 then
		return 3;	--»î¶¯½áÊøºó	ÐèÒª½áÊøµÄÊ±ºò·µ»Ø2
	else
		return 3;	--»î¶¯½øÐÐÖÐ
	end;
end;

function nothing()

end;
--×Ô¶¨ÒåÐ´ÈÕÖ¾º¯Êý¡£µÚÒ»¸ö²ÎÊýÎªÊÂ¼þÃû£¬µÚ¶þ¸ö²ÎÊýÎªÊÂ¼þÄÚÈÝ
function Write_Log(Event,Content)	
	WriteLog("["..Event.."]:"..Content);
end;

function Create_Box(nCount)
	local nRandomNum;
	local MapID = GetWorldPos();
	if nCount >= 1 or nCount <= getn(BoxPos) then
		for i=1,nCount do
			nRandomNum = random(1,getn(BoxPos));
			local npcBox = CreateNpc("R­¬ng tiÒn","B¶o r­¬ng",MapID,BoxPos[nRandomNum][1]+random(-3,3),BoxPos[nRandomNum][2]+random(-3,3))
			SetNpcScript(npcBox,"\\script\\online\\dragonboat06\\box.lua")			
		end;
	else
		Write_Log("Ho¹t ®éng tÕt §oan Ngä sai sãt","Khi më r­¬ng, lçi sè r­¬ng, trÞ b¸o lçi lµ:"..nCount);
	end;
end;

function Get_Multiple_Status()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 070614 and nDate <= 070624 then
		return 1;
	else
		return 0;
	end;
end;