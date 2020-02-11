
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÃÅÅÉÈÎÎñÍ·ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================
Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- Ê¦ÃÅÈÎÎñÁ´µÄÍ·ÎÄ¼ş
--Ô½ÄÏ09Äê11ÔÂ»î¶¯
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

--¸÷ÃÅÅÉµÄÈÎÎñ±äÁ¿

FN_SL 	= 1001; --ÉÙÁÖ
FN_WD 	= 1002; --Îäµ±
FN_EM 	= 1003; --¶ëÃ¼
FN_GB 	= 1004; --Ø¤°ï
FN_TM 	= 1005; --ÌÆÃÅ
FN_YM 	= 1031; --ÑîÃÅÄĞ
FN_YMM  = 1032; --ÑîÃÅÅ®
FN_WP   = 1033; --Îå¶¾

-- ×Óº¯Êı£¬ÓÃÒÔ»ñÈ¡ÃÅÅÉÈÎÎñµÄ½øÕ¹³Ì¶È
function FN_GetTaskState(fn)

	return GetTask(fn)

end

-- ×Óº¯Êı£¬ÓÃÒÔÉèÖÃÃÅÅÉÈÎÎñµÄ½øÕ¹³Ì¶È
function FN_SetTaskState(fn, nValue)

	SetTask(fn, nValue)

end


-- ×Óº¯Êı£¬Ê¹ÃÅÅÉÈÎÎñ½øÕ¹µ½ÏÂÒ»²½
function FN_SetTaskAdd(fn)
	SetTask(fn, GetTask(fn) + 1)
	return
end


-- ×Óº¯Êı£¬ÓÃÓÚÀ©Õ¹¶Ô»° TALK º¯ÊıµÄ¹¦ÄÜ
function TE_Talk(num,fun,szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	

--Ô½ÄÏ09Äê11ÔÂ»î¶¯¸øÕÆÃÅ¶«Î÷
function GiveItemToMaster(szHeader, nPlayerRoute)
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091113 and nDate < 091130 then
		if GetPlayerFaction() ~= nPlayerRoute then
			Talk(1, "", szHeader.."C¸c h¹ kh«ng ph¶i lµ ®Ö tö cña bæn m«n.");
			return 0;
		end
		if GetItemCount(2, 1, 30119) < 20 or GetItemCount(2, 1, 30120) < 20 then
			Talk(1, "", szHeader.."C¸c h¹ ®ang ®ïa ta ph¶i kh«ng?  Kh«ng ph¶i tÆng ta trµ víi b¸nh hay sao?")
			return 0;
		end
		if GetTask(VIET_0911_TASK_ZHANGMEN_DATE) >= nDate then
			if GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) >= 2 then
				Talk(1, "", szHeader.."C¸c h¹ h«m nay tÆng ta b¸nh vµ trµ 2 lÇn råi, h·y ®îi ngµy mai råi tiÕp tôc.");
				return 0;
			else
				if GetTime() - GetTask(VIET_0911_TASK_ZHANGMEN_TIME) < 3600 then
					Talk(1, "", szHeader.."Gi·n c¸ch tÆng trµ vµ b¸nh cÇn 60 phót, h·y ®îi thªm chót xİu n÷a nhĞ.");
					return 0;
				else
					if DelItem(2, 1, 30119, 20) == 1 and DelItem(2, 1, 30120, 20) == 1 then
						ModifyExp(3000000);
						SetTask(336, GetTask(336) + 20);
						SetTask(VIET_0911_TASK_ZHANGMEN_TIME, GetTime());
						SetTask(VIET_0911_TASK_ZHANGMEN_DATE, nDate);
						SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) + 1);
					end
				end
			end
		else
			SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, 0);
			if DelItem(2, 1, 30119, 20) == 1 and DelItem(2, 1, 30120, 20) == 1 then
				ModifyExp(3000000);
				SetTask(336, GetTask(336) + 20);
				SetTask(VIET_0911_TASK_ZHANGMEN_TIME, GetTime());
				SetTask(VIET_0911_TASK_ZHANGMEN_DATE, nDate);
				SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) + 1);
			end
		end
	end
end
--½Å±¾¹¦ÄÜ£ºÁ÷ÅÉ¼ÓÈëNPCÏà¹Ø¹¦ÄÜÍ³Ò»´¦Àí
--¹¦ÄÜÉè¼Æ£º´å³¤
--´úÂë¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2009-3-14
--ÎÒÎÊ·ğ×æ£ºbugÎªÊ²Ã´¸Ä²»Íê£¿·ğ×æÔ»£º²ß»®ÄËbugÖ®Ä¸¡£ÎÒÎÊ£ºbugÖ®¸¸ÄØ£¿·ğ×æÔ»£º·ÇÄãÄªÊô£¡
--ÃÅÅÉÃû³Æ
--====================ÃÅÅÉ´«ËÍÈË===============
g_szInfoHead = "<color=green>TiÕp dÉn m«n ph¸i<color>:";
MAX_SEL_PER_PAGE = 5;	--Ã¿Ò³ÃÅÅÉÊıÁ¿

TB_FACTION_PLACE =
{	--{ÃÅÅÉÃû×Ö,{×ø±êµãĞÅÏ¢},Õ½¶·×´Ì¬,ÃÅÅÉ±àºÅ}
	{"ThiÕu L©m",{204,1501,3328},1,1},
	{"Vâ §ang",{312,1713,3469},1,2},
	{"Nga My",{303,1603,3240},1,3},
	{"C¸i Bang",{209,1528,3246},1,4},
	{"§­êng M«n",{305,1532,2915},1,5},
	{"Thiªn Ba D­¬ng phñ",{219,1630,3274},1,6},
	{"Ngò §éc Gi¸o",{407,1555,3282},1,7},
	{"C«n L«n",{509,1513,3285},0,8},
--	{"Ã÷½Ì",{152,1518,3078},0,9},
	{"Thóy Yªn",{404,1507,2788},0,10},
}
TB_FACTION_PLACE_INDEX = nil
function _init_TB_FACTION_PLACE_INDEX()
	if not TB_FACTION_PLACE_INDEX then
		TB_FACTION_PLACE_INDEX = {}
		for i=1,getn(TB_FACTION_PLACE) do
			local t = TB_FACTION_PLACE[i]
			TB_FACTION_PLACE_INDEX[t[4]] = t;
		end
		return 1
	end
end
--»ñµÃÑ¡Ïîtable
function get_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};
	local tbFactionTb = get_faction_list();
	local szFactionName = "";
	local nFactionIdx = 0;
	_init_TB_FACTION_PLACE_INDEX()
	for i=1,getn(tbFactionTb) do
		nFactionIdx = tbFactionTb[i];
		szFactionName = TB_FACTION_PLACE_INDEX[nFactionIdx][1];
		if i == 1 and nFaction ~= 0 then
			tinsert(tbRetTb,"VÒ s­ m«n ("..szFactionName..")/#go_to_faction("..nFactionIdx..")");
		else
			tinsert(tbRetTb,szFactionName.."/#go_to_faction("..nFactionIdx..")");
		end;
	end;
	return tbRetTb;
end;
--»ñµÃÃÅÅÉ¶ÔÓ¦µÄ¶Ô»°Ë³Ğòtable
function get_faction_list()
	local nFaction = GetPlayerFaction();
	local tbRetTb = {};	--·µ»Øtable
	local tbInitTb = {};	--»ù´¡table£¬ÓÃ×÷ÖĞ¼ä´¦Àí
	for i=1,getn(TB_FACTION_PLACE) do
		tbInitTb[i] = TB_FACTION_PLACE[i][4];
	end;
	if nFaction == 0 then
		tbRetTb = tbInitTb;
	else
		tinsert(tbRetTb,nFaction);	--ÏÈ°Ñ¶ÔÓ¦µÄÃÅÅÉ·ÅµÚÒ»Î»
		--tbInitTb[nFaction] = 0;	--±ê¼Ç¶ÔÓ¦µÄÃÅÅÉÒÑ·Å½øtbRetTb
		for i=1,getn(tbInitTb) do
			if tbInitTb[i] ~= nFaction then
				tinsert(tbRetTb,tbInitTb[i])	--°ÑÊ£ÏÂÎ´·Å½øtbRetTbµÄÃÅÅÉ°´Ë³Ğò·Å½øtbRetTb
			end;
		end;
	end;
	return tbRetTb;
end;
--ÁĞ³ö¶Ô»°Ñ¡Ïî
function list_content(nPageNum)
	local tbList = get_list();
	local nRecordCount = getn(tbList);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊıÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊıµÄ×î´óÏÔÊ¾ÏîÄ¿ÊıµÄ
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\n Trang tr­íc/#list_content(%d)",nPageNum-1));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n Trang sau/#list_content(%d)",nPageNum+1));
	end;
	tinsert(selTab,"Ta muèn hñy bá nhiÖm vô nhËp m«n hiÖn t¹i./cancel_faction");
	tinsert(selTab,"Kh«ng ®i ®©u c¶./no");
	Say(g_szInfoHead.."Ta lµ Sø Gi¶ M«n Ph¸i, cã thÓ ®­a ng­¬i ®Õn c¸c ®¹i m«n ph¸i trªn giang hå, ng­¬i muèn ®Õn m«n ph¸i nµo?",getn(selTab),selTab);
end
function moneygo()
	--if GetLevel()<70 then
		--return 1
	--elseif GetCash()>=500 then
		--PrePay(500)
		--return 1
	--else
		--return 0
	--end
	
	return 1
end;
--È¥Ä¿µÄµØ
function go_to_faction(nFaction)
	if moneygo() == 1 then
		CleanInteractive();
		local nMapID,nMapX,nMapY = 0,0,0;
		local nFightState = 0;
		_init_TB_FACTION_PLACE_INDEX()
		nMapID = TB_FACTION_PLACE_INDEX[nFaction][2][1];
		nMapX = TB_FACTION_PLACE_INDEX[nFaction][2][2];
		nMapY = TB_FACTION_PLACE_INDEX[nFaction][2][3];
		nFightState = TB_FACTION_PLACE_INDEX[nFaction][3];
		NewWorld(nMapID,nMapX,nMapY);
		SetFightState(nFightState);
	else
		Talk(1,"",g_szInfoHead.."Ng©n l­îng cña ng­¬i kh«ng ®ñ, t×m ®ñ råi h·y quay l¹i nhĞ!")
	end;
end;

function no()
end;

--È¡ÏûÄ¿Ç°ËùÓĞÈëÃÅÈÎÎñ½ø¶È
function cancel_faction()
	if GetPlayerFaction()~=0 then
		Say("C¸c h¹ ®· gia nhËp m«n ph¸i, muèn hñy bá m«n ph¸i sao?",0);
	else
		Say("HiÖn c¸c h¹ cã thÓ chän l¹i m«n ph¸i kh¸c!",0);
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			SetTask(TB_FACTION_TASKID_LIST[i],0)
		end
		if GetNpcName(GetFollower())  == "TiÓu §iªu" then
			KillFollower()
		end
	end
end
--====================ĞÂÃÅÅÉÆäËü¹¦ÄÜ===========
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018,1019}
TB_FACTION_INFO = {
	"ThiÕu L©m","Vâ §ang","Nga My","C¸i Bang","§­êng M«n","D­¬ng M«n","Ngò §éc","C«n L«n","Minh gi¸o","Thóy Yªn",
}
--Á÷ÅÉÃû³Æ
TB_ROUTE_INFO = {
	"ThiÕu L©m","ThiÕu Tôc","ThiÒn t¨ng","Vâ t¨ng","§­êng M«n","§­êng M«n","Nga My","PhËt Gia","Tôc gia","C¸i Bang",
	"TŞnh Y","¤ Y","Vâ §ang","§¹o Gia","Tôc gia","D­¬ng M«n","Th­¬ng Kş","Cung Kş","Ngò §éc","Tµ hiÖp",
	"Cæ s­","C«n L«n","Thiªn S­","Minh gi¸o","Th¸nh ChiÕn","TrËn Binh","HuyÕt Nh©n","Thóy Yªn","Vò Tiªn","Linh N÷",
	"NhËm HiÖp","KiÕm T«n"
}
--ÃÅÅÉ¶ÔÓ¦µÄÁ÷ÅÉ
TB_FACTION_ROUTE = {
	[8] = 22,
	[9] = 24,
	[10] = 28,
}
--ÕÆÃÅÈËNPC
TB_FACTION_MASTER_NAME = {
	[8] = "Chu BÊt HoÆc",
	[9] = "Ph­¬ng L¹p",
	[10] = "Sµi Hoµng Nhi",
}
--Ê¦ÃÅÖØ¸´ÈÎÎñµÄ¶ÔÓ¦ÄÑ¶È
TB_FACTION_TASK_DIFF = {
	[23] = TASK_ID_KUNLUN_TIANSHI,
	[25] = TASK_ID_MINGJIAO_SHENGZHAN,
	[26] = TASK_ID_MINGJIAO_ZHENBING,
	[27] = TASK_ID_MINGJIAO_XUEREN,
	[29] = TASK_ID_CUIYAN_WUXIAN,
	[30] = TASK_ID_CUIYAN_LINGNV,
}
--Ê¦ÃÅÃÜÊÒNPC
TB_FACTION_BACK_NAME = {
	[8] = "TrÇn BÊt Vi",
	[9] = "L­u Thanh Mi",
	[10] = "Th¹ch B¶o",
}
--Á÷ÅÉÈëÃÅÏà¹Ø
TB_ROUTE_IN_INFO = {
	[23] = {
		npc_name = "TÇn BÊt Tri",
		bewrite = "C«n L«n phong c¶nh h÷u t×nh! Vâ c«ng bæn ph¸i chØ truyÒn cho ®Ö tö Thiªn S­, kü n¨ng hÖ Phong chñ yÕu lµ khèng chÕ vµ phßng thñ, kü n¨ng tÊn c«ng s¸t th­¬ng thÊp, kü n¨ng hÖ L«i chñ yÕu g©y s¸t th­¬ng, ®a sè lµ tÊn c«ng quÇn c«ng. Vâ c«ng hÖ ph¸i xem träng <color=yellow>néi c«ng<color>, dïng <color=yellow>kiÕm<color> ®Ó t¨ng kh¶ n¨ng tÊn c«ng.",
		in_route_talk = "Giê chİnh thøc thu nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i tiÒm n¨ng<color>. Vâ c«ng hÖ ph¸i xem träng <color=yellow>néi c«ng<color>, sau nµy ng­¬i h·y cè g¾ng. Giê ng­¬i cã thÓ ®Õn gÆp Ch­ëng M«n nhËn <color=yellow>nhiÖm vô s­ m«n<color> råi.",
		skill = {{4,"KiÕm tÊn c«ng b×nh th­êng"},{1017,"Th¸i Êt T©m Ph¸p"},{1018,"L«i TÕ"},{1020,"Thiªn L«i Phï"}},
		book={0,112,192,"Phong L«i Ch©u"},
		book_chip = {
			{2,95,1 ,"Phong L«i Ch©u Tµn QuyÓn-Th­îng"},
			{2,95,2 ,"Phong L«i Ch©u Tµn QuyÓn-Trung"},
			{2,95,3 ,"Phong L«i Ch©u Tµn QuyÓn-H¹"},
		},
		equip = 2,
	},
	[25] = {
		npc_name = "LÖ Thiªn NhuËn",
		bewrite = "§Ö tö Minh gi¸o lu«n sôc s«i nhiÖt huyÕt! Vâ c«ng bæn ph¸i chØ truyÒn cho Th¸nh ChiÕn ®Ö tö, tİch lòy né khİ tÊn c«ng kÎ thï. Vâ c«ng hÖ ph¸i xem träng <color=yellow>søc m¹nh<color>, dïng <color=yellow>®ao<color> ®Ó t¨ng kh¶ n¨ng tÊn c«ng.",
		in_route_talk = "Giê chİnh thøc thu nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i tiÒm n¨ng<color>. Vâ c«ng hÖ ph¸i xem träng <color=yellow>søc m¹nh<color>, sau nµy ng­¬i h·y cè g¾ng. Giê ng­¬i cã thÓ ®Õn gÆp Ch­ëng M«n nhËn <color=yellow>nhiÖm vô s­ m«n<color> råi.",
		skill = {{3,"§ao tÊn c«ng b×nh th­êng"},{1053,"Th¸nh Háa Kim L­ C«ng"},{1054,"Th¸nh Háa §ao Ph¸p"}},
		book={0,112,193,"Cµn Kh«n §¹i Na Di T©m Ph¸p"},
		book_chip = {
			{2,95,4 ,"Cµn Kh«n §¹i Na Di T©m Ph¸p Tµn QuyÓn-Th­îng"},
			{2,95,5 ,"Cµn Kh«n §¹i Na Di T©m Ph¸p Tµn QuyÓn-Trung"},
			{2,95,6 ,"Cµn Kh«n §¹i Na Di T©m Ph¸p Tµn QuyÓn-H¹"},
		},
		equip = 3,
	},
	[26] = {
		npc_name = "V­¬ng DÇn",
		bewrite = "Minh Gi¸o trËn binh tinh nhuÖ, ®¸nh ®©u th¾ng ®ã! Vâ c«ng bæn ph¸i chØ truyÒn cho TrËn Binh ®Ö tö, th«ng hiÓu ngò hµnh t­¬ng kh¾c, uy hiÕp kÎ thï. Vâ c«ng hÖ ph¸i xem träng <color=yellow>linh ho¹t<color>, dïng <color=yellow>bót<color> ®Ó t¨ng kh¶ n¨ng tÊn c«ng.",
		in_route_talk = "Giê chİnh thøc thu nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i tiÒm n¨ng<color>. Vâ c«ng hÖ ph¸i xem träng <color=yellow>linh ho¹t<color>, sau nµy ng­¬i h·y cè g¾ng. Giê ng­¬i cã thÓ ®Õn gÆp Ch­ëng M«n nhËn <color=yellow>nhiÖm vô s­ m«n<color> råi.",
		skill = {{8,"Bót tÊn c«ng b×nh th­êng"},{1083,"Quang Minh Tiªu Dao C«ng"},{1084,"Quang Minh Bót Ph¸p"}},
		book = {0,112,194,"Quang Minh Ngò Hµnh LÖnh"},
		book_chip = {
			{2,95,7 ,"Quang Minh Ngò Hµnh LÖnh Tµn QuyÓn-Th­îng"},
			{2,95,8 ,"Quang Minh Ngò Hµnh LÖnh Tµn QuyÓn-Trung"},
			{2,95,9 ,"Quang Minh Ngò Hµnh LÖnh Tµn QuyÓn-H¹"},
			},
		equip = 9,
	},
	[27] = {
		npc_name = "T­ Hµnh Ph­¬ng",
		bewrite = "Gi¸o chóng Minh Gi¸o t×nh nh­ thñ tóc, quyÕt kh«ng n­¬ng tay víi kÎ thï! Vâ c«ng bæn ph¸i chØ truyÒn cho ®Ö tö HuyÕt Nh©n, dïng lîi tr¶o uy hiÕp kÎ thï, xuÊt chiªu chİ m¹ng. Vâ c«ng hÖ ph¸i xem träng <color=yellow>th©n ph¸p<color>, dïng <color=yellow>tr¶o<color> ®Ó t¨ng kh¶ n¨ng tÊn c«ng.",
		in_route_talk = "Giê chİnh thøc thu nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i tiÒm n¨ng<color>. Vâ c«ng hÖ ph¸i xem träng <color=yellow>th©n ph¸p<color>, sau nµy ng­¬i h·y cè g¾ng. Giê ng­¬i cã thÓ ®Õn gÆp Ch­ëng M«n nhËn <color=yellow>nhiÖm vô s­ m«n<color> råi.",
		skill = {{14,"Tr¶o tÊn c«ng b×nh th­êng"},{1131,"Hµn B¨ng T©m Ph¸p"},{1132,"§o¹n Cèt Tr¶o"}},
		book={0,112,195,"Hµn B¨ng Ng­ng HuyÕt Chó"},
		book_chip = {
			{2,95,10,"Hµn B¨ng Ng­ng HuyÕt Chó Tµn QuyÓn-Th­îng"},
			{2,95,11,"Hµn B¨ng Ng­ng HuyÕt Chó Tµn QuyÓn-Trung"},
			{2,95,12,"Hµn B¨ng Ng­ng HuyÕt Chó Tµn QuyÓn-H¹"},
		},
		equip = 11,
	},
	[29] = {
		npc_name = "Chu Tö V¨n",
		bewrite = "Thóy Yªn tr¨m hoa ®ua në, ®óng lµ n¬i tuyÖt mü luyÖn tËp nh¶y móa! Vâ c«ng ph¸i ta chØ truyÒn cho Vò Tiªn ®Ö tö, khi xuÊt chiªu uyÓn chuyÓn nh­ móa lµm suy yÕu kÎ thï vµ t¨ng thuéc tİnh cho ®ång ®éi. Vâ c«ng hÖ ph¸i xem träng <color=yellow>th©n ph¸p<color>, vò khİ lµ <color=yellow>Linh Chi<color> ®Ó t¨ng kh¶ n¨ng tÊn c«ng.",
		in_route_talk = "Giê chİnh thøc thu nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i tiÒm n¨ng<color>. Vâ c«ng hÖ ph¸i xem träng <color=yellow>th©n ph¸p<color>, sau nµy ng­¬i h·y cè g¾ng. Giê ng­¬i cã thÓ ®Õn gÆp Ch­ëng M«n nhËn <color=yellow>nhiÖm vô s­ m«n<color> råi.",
		skill = {{15,"Linh Chi c«ng kİch"},{1165,"Phong Vò T©m Ph¸p"},{1166,"Khëi Vò"},{1167,"Linh Miªu VËn"}},
		book={0,112,196,"Phông Minh Phæ"},
		book_chip = {
			{2,95,13,"Phông Minh Phæ Tµn QuyÓn-Th­îng"},
			{2,95,14,"Phông Minh Phæ Tµn QuyÓn-Trung"},
			{2,95,15,"Phông Minh Phæ Tµn QuyÓn-H¹"},
		},
		equip = 13,
	},
	[30] = {
		npc_name = "Hå Man Thµnh",
		bewrite = "T©m kh«ng t¹p niÖm míi cã thÓ dung hßa víi TiÓu §iªu! Vâ c«ng m«n ph¸i chØ truyÒn cho Linh N÷ ®Ö tö, th­êng häc nu«i TiÓu §iªu, khi chiÕn ®Êu dïng Tiªu triÖu gäi TiÓu §iªu tÊn c«ng kÎ thï. Vâ c«ng hÖ ph¸i xem träng <color=yellow>linh ho¹t<color>, dïng <color=yellow>tiªu<color> ®Ó t¨ng kh¶ n¨ng tÊn c«ng.",
		in_route_talk = "Giê chİnh thøc thu nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i tiÒm n¨ng<color>. Vâ c«ng hÖ ph¸i xem träng <color=yellow>linh ho¹t<color>, sau nµy ng­¬i h·y cè g¾ng. Giê ng­¬i cã thÓ ®Õn gÆp Ch­ëng M«n nhËn <color=yellow>nhiÖm vô s­ m«n<color>råi.",
		skill = {{16,"S¸o c«ng kİch b×nh th­êng"},{1217,"B¸ch Hoa Ngäc Lé C«ng"},{1218,"Nu«i TiÓu §iªu"},{1219,"L¹c Hoa QuyÕt"}},
		book={0,112,197,"Hoa Tiªn T©m Kinh"},
		book_chip = {
			{2,95,16,"Hoa Tiªn T©m Kinh Tµn QuyÓn-Th­îng"},
			{2,95,17,"Hoa Tiªn T©m Kinh Tµn QuyÓn-Trung"},
			{2,95,18,"Hoa Tiªn T©m Kinh Tµn QuyÓn-H¹"},
		},
		equip = 12,
	},
	[31] = {
		npc_name = "§­êng Léng NguyÖt",
		bewrite = "§· vµo hÖ ph¸i ta th× ®õng c©u nÖ lÖ cò nhµ §­êng, cø tïy ı hµnh tÈu giang hå. Chñy thñ lµ vò khİ së tr­êng cña ph¸i ta.",
	},
	[32] = {
		npc_name = "V©n Hi Hßa",
		bewrite = "§· vµo hÖ ph¸i ta ph¶i thÒ c¶ ®êi mang kiÕm tu hµnh, thùc thi chİnh nghÜa. KiÕm lµ vò khİ së tr­êng cña ph¸i ta.",
	},
}
--Ê¦ÃÅÍâ×°
TB_FACTION_SUIT_INFO = {
	[8] = 530,
	[9] = 534,
	[10] = 532,
}
--ÕòÅÉÃØ¼®¶Ò»»¼¸ÂÊ
TB_BOOK_CHG_ODD = {
	{1,5,50},
	{5,3,60},
	{50,60,40},
}
--Ê¦ÃÅÊÛÂô
TB_FACTION_SALE = {
	[1]={44,66,67},
	[2]={46,78,79},
	[3]={45,72,73},
	[4]={47,75,76},
	[5]={48,69,70},
	[6]={51,81,82},
	[7]={55,84,85},
	[8]={112,113,114},
	[9]={116,117,118},
	[10]={120,121,122},
}
--Ê¦ÃÅÊÛÂôNPC
TB_FACTION_SALE_NPC = {
	[1] = "Tæ V¨n §¹t",
	[2] = "Yªn Nh­",
	[3] = "DiÖp Tö Hinh",
	[4] = "V­u Tri VŞ",
	[5] = "§­êng Thiªn H¶i",
	[6] = "D­¬ng Bµi Phong",
	[7] = "Th¸i Quang",
	[8] = "Mai BÊt Dung",
	[9] = "Ph­¬ng ThÊt PhËt",
	[10] = "Hµ Hµi",
}
--Ê¦ÃÅ´«ËÍ
TB_TRANSPORT_INFO = {
	[8] = {"<color=green>V­¬ng BÊt Phµm<color>: §©y lµ nói C«n L«n, gi¸o ph¸i ta tuy ch­a thu nhËn ®Ö tö nh­ng ®· cã nhiÒu vâ l©m trung nh©n ®©y tham quan, ng­¬i cã thÓ vµo ®©y th¨m thó. §­êng nói hiÓm trë, nÕu muèn xuèng nói ta sÏ dÉn ®­êng.",
		{
			{300,1793,3544},
			{300,1755,3518},
			{300,1718,3534},
			{300,1744,3562},
		}
	},
	[9] = {"<color=green>Ph­¬ng B¸ch Hoa<color>: N¬i nµy nguy hiÓm, ®Ó ta ®­a ng­¬i mét ®o¹n.",
		{
			{100,1460,2967},
			{100,1429,3005},
			{100,1398,2979},
			{100,1433,2947},
		}
	},
	[10] = {"<color=green>X¶o X¶o<color>: Thóy Yªn phong c¶nh h÷u t×nh nh­ng dÔ l¹c ®­êng, ®Ó ta ®­a ng­¬i ra",
		{
			{400,1549,2968},
			{400,1512,2980},
			{400,1533,2993},
			{400,1541,2935},
		}
	}
}

--=============Á÷ÅÉÊ¦¸¸Ïà¹Ø=================
function master_main(faction_seq,route_seq)
	local t_dia_sel = {
--		"µÜ×Ó²Î°İÊ¦¸µ/#get_in_route("..faction_seq..","..route_seq..")",
		"Häc"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."Vâ c«ng/#learn_skill("..route_seq..")",
--		"ÎÒµÃµ½ÁË±¾ÃÅÕòÅÉÃØ¼®µÄ²Ğ¾í/#book_chg("..route_seq..")",
		"Chµo hái/end_dialog",
	}
	local t_dia_show = {}
	local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: "..TB_ROUTE_IN_INFO[route_seq].bewrite
	if GetPlayerFaction() == faction_seq then
		--if GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq] then
			--tinsert(t_dia_show,t_dia_sel[1])
		--elseif GetPlayerRoute()  == route_seq then
		if GetPlayerRoute()  == route_seq then
			tinsert(t_dia_show,t_dia_sel[1])
--			tinsert(t_dia_show,t_dia_sel[3])
			if route_seq == 30 then
				tinsert(t_dia_show,"H·y ®­a ta 1 <D­ìng §iªu ChØ Nam>/give_yangdiao_book"); --ÑøõõÖ¸ÄÏ
			end
			if route_seq == 32 then
				tinsert(t_dia_show,"NhËn ®­îc nguyªn liÖu luyÖn kiÕm/#show_equip_shop(80)"); --Á¶½£²ÄÁÏ
			end
		end
	end
	tinsert(t_dia_show,t_dia_sel[2])
	if getn(t_dia_show) == 1 then
		Talk(1,"",s_dia_main)
	else
		Say(s_dia_main,
			getn(t_dia_show),
			t_dia_show
		)
	end
end
--°İÊ¦
function get_in_route(faction_seq,route_seq)
	Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: §· hoµn thµnh <color=yellow>nhiÖm vô nhËp m«n<color>, ng­¬i ®· lµ ng­êi cña <color=yellow>"..TB_FACTION_INFO[faction_seq].."<color> ta, mét khi ®· vµo sÏ thÓ thay ®æi, suy nghÜ kü ch­a?",
		2,
		"Ta ®· nghÜ kü, quyÕt ®Şnh vµo"..TB_ROUTE_INFO[route_seq].."/#in_route_dtm("..faction_seq..","..route_seq..")",
		"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
function in_route_dtm(faction_seq,route_seq)
	if GetFreeItemRoom() < 8 then
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: NÕu ®· quyÕt vµo m«n ph¸i ta, bæn s­ sÏ tÆng ng­¬i mét vµi trang bŞ t©n thñ xem nh­ lµ quµ nhËp m«n, h·y s¾p xÕp l¹i hµnh trang råi quay l¹i nhËn (CÇn <color=yellow>8<color> « tói trèng!)")
		return
	end
	if GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq] and GetPlayerFaction() == faction_seq then
		SetPlayerRoute(route_seq)
		ResetProperty()        --Ï´Ç±ÄÜµã
		--¼¼ÄÜÑ§Ï°
		for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].skill) do
			LearnSkill(TB_ROUTE_IN_INFO[route_seq].skill[i][1])
			Msg2Player("C¸c h¹ ®· lÜnh héi"..TB_ROUTE_IN_INFO[route_seq].skill[i][2])
		end
		--Ê¦ÃÅµÚÒ»Ì×
		local particular_id = route_seq*1000+100+GetBody()
		local suit_id = TB_FACTION_SUIT_INFO[faction_seq] - 1+GetBody()
		if faction_seq == 10 then
			particular_id = particular_id - 2
			suit_id = suit_id - 2
		end
			--Ê¦ÃÅÍâ×°Ôö¼Ó
			AddItem(0,108,suit_id,1)
			AddItem(0,109,suit_id,1)
			--Í·
			AddItem(0,103,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--ÒÂ·ş
			AddItem(0,100,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--ÏÂ×°
			AddItem(0,101,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--ÎäÆ÷
			AddItem(0,TB_ROUTE_IN_INFO[route_seq].equip,particular_id,1,1,-1,-1,-1,-1,-1,-1)
			--Ôö¼Óõõ
			if route_seq == 30 then
				AddItem(2,20,1,1)
			end
		--¶Ô»°
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: ".. TB_ROUTE_IN_INFO[route_seq].in_route_talk)
	else
		return
	end
end
--Ñ§Ï°¼¼ÄÜ
function learn_skill(route_seq)
	if GetPlayerRoute() ~= route_seq then	--Á÷ÅÉ¼ì²â
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ng­¬i kh«ng ph¶i ®Ö tö cña ta, kh«ng thÓ häc vâ c«ng Vâ §ang ®¹o gia.")
	else
		Say(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Gãc ph¶i biÓu t­îng vâ c«ng hiÖn # lµ vâ c«ng cã thÓ häc, hiÖn # lµ cã thÓ t¨ng cÊp, nhÊp chuét tr¸i vµo lµ ®­îc.")
		AllowLearnSkill()
	end
end
--===============ÕòÅÉÃØ¼®Ïà¹Ø===========
function book_chg(route_seq)
	if GetPlayerRoute() ~= route_seq then	--Á÷ÅÉ¼ì²â
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Kh«ng ph¶i ®Ö tö cña ta, MËt TŞch TrÊn Ph¸i nµy kh«ng thÓ giao cho ng­¬i!")
		return
	end
	--²Ğ¾íÓµÓĞ¼ì²â
	for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].book_chip) do
		if GetItemCount(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3]) > 0 then
			Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: ThËt kh«ng ngê th«ng qua thİ luyÖn ng­¬i l¹i cã thÓ nhËn ®­îc MËt TŞch TrÊn Ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Ta sÏ gióp ng­¬i ®ãng l¹i thµnh mét quyÓn hoµn chØnh nh­ng thµnh c«ng hay kh«ng cßn xem ng­¬i cã may m¾n kh«ng.",
				2,
				"§­a c¸c trang s¸ch cho s­ phô/#hand_up("..route_seq..")",
				"Kh«ng cÇn ®©u/no"
				)
			return
		end
	end
	Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ng­¬i ch­a tõng nhËn ®­îc MËt TŞch Vâ C«ng Tµn QuyÓn nµo.")
end
function hand_up(route_seq)
	Say("<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: NÕu nh­ ng­¬i cã ®ñ 3 tËp th­îng, trung, h¹, ta nhÊt ®Şnh sÏ ®ãng l¹i thµnh mét quyÓn hoµn chØnh.",
		2,
		"§ång ı ®ãng s¸ch/#hand_up_dtm("..route_seq..")",
		"Kh«ng cÇn ®©u/no"
	)
end
function hand_up_dtm(route_seq)
	--Ğ¯´ø¡¢É¾³ıÅĞ¶Ï
	local s_del_log = "[S­ M«n MËt TŞch]  ng­êi ch¬i"..GetNpcName()
	local t_del_num = {}
	for i = 1,getn(TB_ROUTE_IN_INFO[route_seq].book_chip) do
		if GetItemCount(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3]) > 0 then
			if DelItem(TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][3],1) == 1 then
				s_del_log = s_del_log.."Hñy 1 quyÓn"..TB_ROUTE_IN_INFO[route_seq].book_chip[i][1],TB_ROUTE_IN_INFO[route_seq].book_chip[i][2], TB_ROUTE_IN_INFO[route_seq].book_chip[i][4].." thµnh c«ng "
				tinsert(t_del_num,i)
			end
		end
	end
	-- É¶Ò²Ã»ÓĞ
	if getn(t_del_num) == 0  then
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ng­¬i ch­a tõng nhËn ®­îc MËt TŞch Vâ C«ng Tµn QuyÓn nµo.")
		return
	end
	--¼¸ÂÊÅĞ¶Ï
	local ran_num = random(100)
	local add_odds = 0
	if getn(t_del_num) == 3 then
		add_odds = 100
	else
		if getn(t_del_num) == 1 then
			tinsert(t_del_num,t_del_num[1])
		end
		add_odds = TB_BOOK_CHG_ODD[t_del_num[1]][t_del_num[2]]
	end
	-- ¿ÉÒÔ¸øÃØ¼®
	if (add_odds >= ran_num) then
		local add_flag = AddItem(TB_ROUTE_IN_INFO[route_seq].book[1],TB_ROUTE_IN_INFO[route_seq].book[2],TB_ROUTE_IN_INFO[route_seq].book[3], 1)
		if add_flag == 1 then
			Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: Ng­¬i thËt may m¾n, MËt TŞch TrÊn Ph¸i S­ M«n xin giao cho ng­¬i!")
			Msg2Player("NhËn ®­îc MËt TŞch TrÊn Ph¸i S­ M«n: "..TB_ROUTE_IN_INFO[route_seq].book[4].."1 quyÓn!")
		else
			WriteLog(s_del_log.."	Thªm MËt TŞch S­ M«n thÊt b¹i, ®¸nh dÊu thÊt b¹i: "..add_flag)
		end
	else
		Talk(1,"","<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: §æi MËt TŞch TrÊn Ph¸i thÊt b¹i!")
	end;
end
--¶Ô»°½áÊø
function end_dialog()
end
TB_FACTION_WEAPON_ROUTE = {
	[2] = {3,5},
	[3] = {8},
	[4] = {0},
	[6] = {1},
	[8] = {2},
	[9] = {10},
	[11] = {0},
	[12] = {5},
	[14] = {2},
	[15] = {9},
	[17] = {6},
	[18] = {4},
	[20] = {7},
	[21] = {11},
	[23] = {2},
	[29] = {13},
	[30] = {12},
}
--ÀÏÃÅÅÉÊ¦ÃÅµÚÒ»Ì×Ôö¼Ó
function old_route_equip_add(route_seq)
	--ÅĞ¶ÏÊäÈëÕıÈ·ĞÔ
	if TB_FACTION_WEAPON_ROUTE[route_seq] == nil then
		return 0
	end
	--Ôö¼Ó¿Õ¼ä¸ºÖØ¼ì²â
	if GetFreeItemRoom() <  8 then
		Talk(1,"","<color=green>"..GetTargetNpcName().."<color>: NÕu ®· quyÕt vµo m«n ph¸i ta, bæn s­ sÏ tÆng ng­¬i mét vµi trang bŞ t©n thñ xem nh­ lµ quµ nhËp m«n, h·y s¾p xÕp l¹i hµnh trang råi quay l¹i nhËn (CÇn <color=yellow>8<color> « tói trèng!)")
		return 0
	end
	--Ôö¼Ó×°±¸
		--Ê¦ÃÅµÚÒ»Ì×
	local particular_id = route_seq*100+GetBody()
	if route_seq == 8 or route_seq == 9 then
		particular_id = particular_id - 2
	end
	--Í·
	AddItem(0,103,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--ÒÂ·ş
	AddItem(0,100,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--ÏÂ×°
	AddItem(0,101,particular_id,1,1,-1,-1,-1,-1,-1,-1)
	--ÎäÆ÷
	for i = 1,getn(TB_FACTION_WEAPON_ROUTE[route_seq]) do
		AddItem(0,TB_FACTION_WEAPON_ROUTE[route_seq][i],particular_id,1,1,-1,-1,-1,-1,-1,-1)
	end
	return 1
end
--=============Ê¦ÃÅÖØ¸´ÈÎÎñÏà¹Ø==========
function ftask_repeat_main(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Trõ gian lµ nhiÖm vô cña chİnh ph¸i chóng ta, ®õng lµm mÊt thanh danh s­ m«n!",
		4,
		"Ta muèn cèng hiÕn cho s­ m«n (nhiÖm vô s­ m«n)/#start_faction("..faction_seq..")",
		"Ta muèn tra xem ®é cèng hiÕn./#check_query("..faction_seq..")",
		"Ta muèn t×m hiÓu ®é cèng hiÕn s­ m«n./shimenshuoming",
		"   /#repair_faction("..faction_seq..")",
		"Rêi khái/end_dialog"
		)
end
function start_faction(faction_seq)
	if (GetPlayerFaction() ~= faction_seq) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: ChØ cã"..TB_FACTION_INFO[faction_seq].."®Ö tö ta míi ®­îc cèng hiÕn bæn m«n!")
		return
	elseif (GetPlayerRoute() == TB_FACTION_ROUTE[faction_seq]) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: H·y b¸i s­ häc nghÖ tr­íc, råi h·y gãp søc cho s­ m«n!")
		return
	else
		task_main_entrance(TB_FACTION_TASK_DIFF[GetPlayerRoute()])
	end
end
function check_query(faction_seq)
	if (GetPlayerFaction() == 0) then	-- Ã»ÓĞ¼ÓÈëÃÅÅÉ
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Muèn cèng hiÕn cho bæn m«n th× ph¶i gia nhËp bæn m«n tr­íc. Gia nhËp ph¸i bÊt kú cã thÓ tíi ®©y nhËn nhiÖm vô. Hoµn thµnh nhiÖm vô s­ m«n sÏ nhËn ®­îc ®iÓm s­ m«n, tİch lòy ®Ó mua vËt phÈm bİ truyÒn cña bæn m«n.")
		return
	end

	if (GetPlayerFaction() ~= faction_seq) then
		Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Kh«ng ph¶i ®Ö tö bæn m«n, h·y tíi m«n ph¸i cña m×nh xem ®iÓm s­ m«n. F3 më giao diÖn xem ®iÓm s­ m«n.")
		return
	end
	query_faction_contribute()
end
function shimenshuoming()
	Talk(1,"shuoming2","<color=green>ThuyÕt minh ®é cèng hiÕn s­ m«n<color>: \n <color=yellow>§é cèng hiÕn s­ m«n<color>: Th«ng qua viÖc hoµn thµnh nhiÖm vô S­ M«n ®¹t ®Õn mét ®¼ng cÊp nhÊt ®Şnh, b¹n cã thÓ nhËn ®­îc trang phôc hoÆc vò khİ cña S­ M«n. \n <color=yellow>Giíi h¹n ®é cèng hiÕn s­ m«n<color>: HiÖn nay ®é cèng hiÕn S­ M«n kh«ng bŞ h¹n chÕ, chØ cÇn hoµn thµnh nhiÖm vô th× cã thÓ n©ng cao ®é cèng hiÕn. \n <color=yellow>Sù kiÖn Vâ L©m<color>: Lµm xong nhiÖm vô cè ®Şnh sÏ nhËn thªm mét nhiÖm vô ngÉu nhiªn, hoµn thµnh sÏ nhËn ®­îc 50 ®iÓm cèng hiÕn S­ m«n vµ cã kh¶ n¨ng nhËn ®­îc mËt tŞch s­ m«n.")
end
function shuoming2()
	Talk(1,"","<color=green>ThuyÕt minh ®é cèng hiÕn s­ m«n<color>: \n <color=yellow>Giíi h¹n ®¼ng cÊp ®é cèng hiÕn S­ M«n<color>: §¼ng cÊp kh¸c nhau th× ®iÓm tİch lòy ®é cèng hiÕn còng kh«ng gièng nhau. §é cèng hiÕn S­ M«n cµng cao cµng n©ng cao ®¼ng cÊp cña m×nh, tõ sau cÊp 75 th× kh«ng cßn giíi h¹n ®é cèng hiÕn n÷a. \n <color=yellow>§iÓm kinh nghiÖm ngÉu nhiªn<color>. Lµm nhiÒu nhiÖm vô s­ m«n ®é cèng hiÕn cµng cao ®iÓm kinh nghiÖm cµng nhiÒu. §iÓm cèng hiÕn <3000 <color=yellow>§iÓm kinh nghiÖm t­¬ng ®èi<color>, >3000 <color=yellow>®iÓm kinh nghiÖm cµng nhiÒu<color>.")
end
-- ĞŞ¸´É±¹ÖÈÎÎñÎŞ·¨Íê³ÉµÄbug
function repair_faction(faction_seq)
	Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Do bËn rén c«ng vô nªn quªn chuyÖn ng­¬i lµm nhiÖm vô. §©y còng lµ ®Ó ng­¬i rÌn luyÖn! Giê ta sÏ gióp ng­¬i hñy nhiÖm vô tr­íc, nh­ng ph¶i trõ 5 ®iÓm s­ m«n, ®ång ı kh«ng?",
		2,
		"§­îc, ta ®ång ı/#cfm_repair_bug("..faction_seq..")",
		"§Ó ta nghÜ c¸ch kh¸c/no")
end;

function cfm_repair_bug(faction_seq)
	RepairAllChainTask()
	Talk(1,"","<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: §­îc, ta ®· hñy gióp ng­¬i råi!")
end;
--==============±Õ¹ØĞŞÁ¶=================
cards_table = {
    {2, 0, 205},
    {2, 0, 206},
    {2, 0, 207},
    {2, 0, 208},
    {2, 0, 209},
    {2, 0, 350},
    {2, 0, 390},
    {2, 0, 787},
    {2, 0, 788},
    {2, 0, 789},
}
function practice_main(faction_seq)
		if GetPlayerFaction() == 0 then return 0; end
    if GetPlayerFaction() ~= faction_seq then
       Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Thİ chñ kh«ng ph¶i"..TB_FACTION_INFO[faction_seq].."®Ö tö cña ta, kh«ng thÓ tu luyÖn ë bæn ph¸i.");
    else
        if GetItemCount(cards_table[faction_seq][1],cards_table[faction_seq][2],cards_table[faction_seq][3]) >= 1 then  --Ê¦ÃÅÁîÅÆ
            Say("<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Vµo tu luyÖn kh«ng?",
            	2,
            	"§óng/practice_start",
            	"Sai/no_practice");
        else
            Talk(1, "", "<color=green>"..TB_FACTION_MASTER_NAME[faction_seq].."<color>: Ng­¬i kh«ng cã<color=yellow>"..TB_FACTION_INFO[faction_seq].."LÖnh Bµi S­ M«n<color>, kh«ng thÓ bÕ quan tu luyÖn.");
        end;
    end;
end
--=============Ê¦ÃÅÃÜÊÒNPC¶Ô»°==========
function backdoor_main(faction_seq)

end
--=============Ê¦ÃÅÊÛÂô=================
function sale_main(faction_seq)
	local player_sex_name = "§¹i hiÖp"
	if GetSex() == 2 then
		player_sex_name = "N÷ hiÖp "
	end
	if GetPlayerFaction() == faction_seq  then
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>: <color=yellow>"..player_sex_name.."<color>, cã thÓ gióp ®­îc g× cho ng­¬i?",
		4,
		"Ta muèn mua mét sè vËt dông./#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"Ta nghe nãi s­ m«n cã 1 thÇn binh b¶o gi¸p thİch hîp víi giang hå t©n thñ? Ta muèn xem xem nh­ thÕ nµo./#Sale("..TB_FACTION_SALE[faction_seq][2]..")",
		"Ta nghe nãi s­ m«n cã 1 bé thÇn binh b¶o gi¸p giµnh cho vâ l©m cao thñ? H·y cho ta xem!/#Sale("..TB_FACTION_SALE[faction_seq][3]..")",
		"Ta chØ tiÖn ®­êng ghĞ ngang/end_dialog"
		)
	else
		Say("<color=green>"..TB_FACTION_SALE_NPC[faction_seq].."<color>: Cã thÓ gióp ®­îc g× cho ng­¬i?",
		2,
		"Ta muèn mua mét sè vËt dông./#Sale("..TB_FACTION_SALE[faction_seq][1]..")",
		"Ta chØ tiÖn ®­êng ghĞ ngang/end_dialog"
		)
	end
end
--==============Ê¦ÃÅ´«ËÍ==================
function transport_main(faction_seq)
	Say(TB_TRANSPORT_INFO[faction_seq][1],
		2,
		"H·y tiÔn ta mét ®o¹n/#trans_2_city("..faction_seq..")",
		"Ta muèn ng¾m c¶nh/end_dialog"
	)
end
--´«ËÍ×ß
function trans_2_city(faction_seq)
	if(GetPKValue() >3 ) then
		Msg2Player("Ng­êi lµm viÖc ¸c cÊm ra vµo th«n trÊn.")
	end
    SetFightState(0)
	local n_ran_att = random(getn(TB_TRANSPORT_INFO[faction_seq][2]))
	NewWorld(TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][1],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][2],TB_TRANSPORT_INFO[faction_seq][2][n_ran_att][3])
end

function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say(NPC_NAME.."ÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say(NPC_NAME.."CÊp kh«ng ®ñ ®Ó häc vâ c«ng míi, h·y th¨ng cÊp tr­íc?",0)
	elseif n==3 then
		Say(NPC_NAME.."Kinh nghiÖm kh«ng ®ñ häc vâ c«ng míi, h·y luyÖn tËp tr­íc?",0)
	elseif n==4 then
		Say(NPC_NAME.."§iÓm s­ m«n kh«ng ®ñ ®Ó häc vâ c«ng míi, h·y lµm nhiÖm vô ®Ó tİch lòy!",0)
	elseif n==5 then
		Say(NPC_NAME.."Vâ c«ng tr­íc vÉn ch­a häc xong, kh«ng thÓ häc vâ c«ng míi!",0)
	elseif n==6 then
		Say(NPC_NAME.."Ng©n l­îng cña ng­¬i kh«ng ®ñ, t×m ®ñ råi h·y quay l¹i nhĞ!",0)
	else
	end
end;
function beforelearnskill(id)
end

function afterlearnskill(id)
	if id == 1032 or id == 1196 or id == 1066 or id == 1230 or id == 1213 or id == 1096 or id == 1883 or id == 1897 then
		if GetSkillLevel(id) == 1 then
			SetMomentum(10)
			RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
		end
	end
end

function give_yangdiao_book()
	if BigGetItemCount(2,100,33) >= 1 then
		Talk(1,"","<color=green>Hå Man Thµnh<color>: Ng­¬i ®· cã 1 cuèn trong r­¬ng råi th× ph¶i?");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>Hå Man Thµnh<color>: H·y s¾p xÕp l¹i « tói.");
		return 0;
	end
	AddItem(2,100,33,1);
	Talk(1,"","<color=green>Hå Man Thµnh<color>: §©y lµ <D­ìng §iªu ChØ Nam>, h·y gi÷ kü");
end
