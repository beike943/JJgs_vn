-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÈÎÎñ´¥·¢Æ÷´¦Àí
-- By StarryNight
-- 2007/06/06 PM 3:49

-- Ê²Ã´Ê±ºò¿ÉÒÔ×ö¸öµ¥´¿µÄ²ß»®£¬²»ÓÃĞ´½Å±¾ÄØ£¬ÓôÃÆing

-- ======================================================
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\g_random_head.lua");
Include("\\script\\task\\world\\task_award.lua");

---------------------------------------------------É±¹Ö´¥·¢Æ÷-----------------------------------------------

--É±ËÀ²¨Ë¹Ñı¼§È¡µÃÒÂ·ş
function bosihanfu_killed_1()

	if g_probability(5,100) then
   	AddItem(2,0,686,1,1);--µÃµ½²¨Ë¹Ñı¼§ÒÂ·şÒ»Ì×
  	if GetItemCount(2,0,686) >= 1 and GetItemCount(2,0,687) >= 1 then
   		TaskTip("§· nhËn ®­îc Yªu C¬ Ba T­ vµ trang phôc phô n÷ T©y Vùc, mçi thø mét bé, mau ®­a cho ¢u D­¬ng Häa. ");
   		Msg2Player("§· nhËn ®­îc Yªu C¬ Ba T­ vµ trang phôc phô n÷ T©y Vùc, mçi thø mét bé, mau ®­a cho ¢u D­¬ng Häa. ");
  	end;
	end;
end;

--É±ËÀÎ÷Óòº·¸¾È¡µÃÒÂ·ş
function xiyuhanfu_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,687,1,1);--µÃµ½Î÷Óòº·¸¾ÒÂ·şÒ»Ì×
  	if GetItemCount(2,0,686) >= 1 and GetItemCount(2,0,687) >= 1 then
    	TaskTip("§· nhËn ®­îc Yªu C¬ Ba T­ vµ trang phôc phô n÷ T©y Vùc, mçi thø mét bé, mau ®­a cho ¢u D­¬ng Häa. ");
    	Msg2Player("§· nhËn ®­îc Yªu C¬ Ba T­ vµ trang phôc phô n÷ T©y Vùc, mçi thø mét bé, mau ®­a cho ¢u D­¬ng Häa. ");
  	end;
	end;
end;

--É±ËÀÒ»Æ·ÌÃÃÜÊ¹È¡µÃÒ»Æ·ÌÃÁîÅÆ
function yipintangmishi_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,688,1,1);--µÃµ½Ò»Æ·ÌÃÁîÅÆ
  	if GetItemCount(2,0,688) >= 1 then
  		TaskTip("§· nhËn ®­îc chøng cø cña mËt sø NhÊt phÈm ®­êng, mau ®­a cho ¢u D­¬ng Häa. ");
  		Msg2Player("§· nhËn ®­îc chøng cø cña mËt sø NhÊt phÈm ®­êng, mau ®­a cho ¢u D­¬ng Häa. ");
  	end;
	end;
end


--É±ËÀÎ÷±±×³ººÈ¡µÃĞÑ¾ÆÒ©
function xibeizhuanghan_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,689,1,1);--µÃµ½ĞÑ¾ÆÒ©
  	if GetItemCount(2,0,689) >= 10 then
  		TaskTip("§· nhËn ®­îc 10 lä thuèc gi¶i r­îu, mau ®­a cho TiÓu NhŞ tÆng T«n NhŞ LiÔn. ");
  		Msg2Player("§· nhËn ®­îc 10 lä thuèc gi¶i r­îu, mau ®­a cho TiÓu NhŞ tÆng T«n NhŞ LiÔn. ");
  	end;
	end;

end

--É±ËÀ¹ØÍâ¸ßÊÖÈ¡µÃÒ»Æ·ÌÃÑûÇëº¯
function guanwaigaoshou_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,691,1,1);--µÃµ½Ò»Æ·ÌÃÑûÇëº¯
  	if GetItemCount(2,0,691) >= 1 then
  		TaskTip("LÊy ®­îc 1 th­ mêi cña NhÊt phÈm ®­êng trªn ng­êi cao thñ quan ngo¹i, mau chãng quay vÒ Long M«n trÊn b¸o cho T«n NhŞ LiÔn. ");
  		Msg2Player("LÊy ®­îc 1 th­ mêi cña NhÊt phÈm ®­êng trªn ng­êi cao thñ quan ngo¹i, mau chãng quay vÒ Long M«n trÊn b¸o cho T«n NhŞ LiÔn. ");
  	end;
	end;

end

--Ë¢³öÔ¬·ÉÔÆ½ÙÇô
function yuanfeiyun_talk()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName = Map_Data[nMapDataID][1];
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = Map_Data[nMapDataID][2],Map_Data[nMapDataID][3],Map_Data[nMapDataID][4],Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local nNpcIndex = 0;
local	strTalk = {
	"Theo b¶n ®å chØ ®­êng cña Viªn Bé ®Çu, ch¾c ch¾n thiªn lao ë vïng "..nXpos..", "..nYpos.." nµy. "
	}

	nNpcIndex = CreateNpc("","Danh bæ Viªn Phi V©n ",nMapID,nXworldpos,nYworldpos);
	SetNpcLifeTime(nNpcIndex,1200);
	SetNpcScript(nNpcIndex,"§­íng dÉn file");
	SetTask(YUANFEIYUN_NPCINDEX,nNpcIndex);--¼ÇÂ¼Ô¬·ÉÔÆNpcIndex
	TalkEx("",strTalk);
	RemoveTrigger(GetRunningTrigger());--É¾È¥¸Ã´¥·¢Æ÷

end

--É±ËÀ°µÈÕÊ¹È¡µÃÁò»Ç
function anrishi_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,695,1,1);--µÃµ½Áò»Ç
  	if GetItemCount(2,0,695) >= 10 then
  		TaskTip("§· thu thËp 10 viªn L­u huúnh, mau ®­a cho TriÖu Tö B×nh. ");
  		Msg2Player("§· thu thËp 10 viªn L­u huúnh, mau ®­a cho TriÖu Tö B×nh. ");
  	end;
	end;

end

--É±ËÀÃ÷ÔÂÊ¹È¡µÃÏõÊ¯
function mingyueshi_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,696,1,1);--µÃµ½ÏõÊ¯
  	if GetItemCount(2,0,696) >= 10 then
  		TaskTip("§· thu thËp 10 viªn Tiªu Th¹ch, mau ®­a cho TriÖu Tö B×nh. ");
  		Msg2Player("§· thu thËp 10 viªn Tiªu Th¹ch, mau ®­a cho TriÖu Tö B×nh. ");
  	end;
	end;

end

--Ë¢³öÔ¬·ÉÔÆ
function CreateYuanFeiYun()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName = Map_Data[nMapDataID][1];
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = Map_Data[nMapDataID][2],Map_Data[nMapDataID][3],Map_Data[nMapDataID][4],Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local nNpcIndex = CreateNpc("Viªn Phi V©n ","Danh bæ Viªn Phi V©n ",nMapID,nXworldpos,nYworldpos);

	SetNpcLifeTime(nNpcIndex,1200);
	SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\Ô¬·ÉÔÆ.lua");
	SetTask(YUANFEIYUN_NPCINDEX,nNpcIndex);--¼ÇÂ¼Ô¬·ÉÔÆNpcIndex
	RemoveTrigger(GetRunningTrigger());

end

--É±ËÀÎ÷±±ÑÌººÈ¡µÃÆÏÌÑ¾Æ
function xibeiyanhan_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,708,1,1);--µÃµ½ÆÏÌÑ¾Æ
  	if GetItemCount(2,0,708) >= 10 then
  		TaskTip("§· thu thËp 10 hñ r­îu nho, mau ®­a cho ¢n Minh gi¶i r­îu ®i. ");
  		Msg2Player("§· thu thËp 10 hñ r­îu nho, mau ®­a cho ¢n Minh gi¶i r­îu ®i. ");
  	end;
	end;

end

--É±ËÀÃ÷½Ì¼éÏ¸È¡µÃò¿»ğ½ÌÁîÅÆ
function mingjiaojianxi_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,709,1,1);--µÃµ½ò¿»ğ½ÌÁîÅÆ
  	if GetItemCount(2,0,709) >= 1 then
  		TaskTip("§· nhËn ®­îc chøng cø cña Xi Háa Gi¸o, ®­a cho ¢n T¶ Sø xem cã gióp ®­îc g× kh«ng. ");
  		Msg2Player("§· nhËn ®­îc chøng cø cña Xi Háa Gi¸o, ®­a cho ¢n T¶ Sø xem cã gióp ®­îc g× kh«ng. ");
  	end;
	end;

end

--É±ËÀ30Ã÷½ÌÅÑÍ½
function mingjiaopantu_killed_30()

	SetTask(TASK_XB_ID_01,6);
	RemoveTrigger(GetRunningTrigger());
	TaskTip("§· giÕt chÕt 30 tªn ph¶n ®å Minh Gi¸o. ");
	Msg2Player("§· giÕt chÕt 30 tªn ph¶n ®å Minh Gi¸o. ");

end

--É±ËÀ30Ò»Æ·ÌÃ°µÉ±Ê¹
function yipintanganshashi_killed_30()

	AddItem(2,0,711,1,1);--µÃµ½´óËÎÃÜÌ½Êéº¯
	SetTask(TASK_XB_ID_01,11);
	RemoveTrigger(GetRunningTrigger());
	TaskTip("§· giÕt chÕt 30 tªn ¸m s¸t sø cña NhÊt phÈm ®­êng, nhËn ®­îc c«ng hµm §¹i Tèng. ");
	Msg2Player("§· giÕt chÕt 30 tªn ¸m s¸t sø cña NhÊt phÈm ®­êng, nhËn ®­îc c«ng hµm §¹i Tèng. ");

end

--É±ËÀµÁÄ¹ÈËÈ¡µÃ½ğË¿ÃæÕÖ
function daomuren_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,710,1,1);--µÃµ½½ğË¿ÃæÕÖ
  	if GetItemCount(2,0,710) >= 10 then
  		TaskTip("§· thu thËp 10 tÊm mÆt n¹ kim lo¹i, ®­a cho Xa Lu©n B¸ V­¬ng. ");
  		Msg2Player("§· thu thËp 10 tÊm mÆt n¹ kim lo¹i, ®­a cho Xa Lu©n B¸ V­¬ng. ");
  	end;
	end;

end

--É±ËÀ25¿ÕÊÖ±øÂíÙ¸
function kongshoubingmayong_killed_25()

	SetTask(KONGSHOU25_STATE,1);
	
	if GetTask(CHINU25_STATE) == 1 then
		CreateBingMaYongTongLing();
	end
	
	RemoveTrigger(GetRunningTrigger());

end

--É±ËÀ25³Öåó±øÂíÙ¸
function chinubingmayong_killed_25()

	SetTask(CHINU25_STATE,1);
	
	if GetTask(KONGSHOU25_STATE) == 1 then
		CreateBingMaYongTongLing();
	end
	
	RemoveTrigger(GetRunningTrigger());

end

--É±ËÀÎ÷ÏÄÎäÊ¿»ñµÃ¶ÏË®èÆ
function xixiawushi_killed_1()

	if g_probability(10,100) then
  	AddItem(2,0,713,1,1);--µÃµ½¶ÏË®èÆ
  	if GetItemCount(2,0,713) >= 4 then
  		TaskTip("§· nhËn ®­îc 4 §o¶n Thuû Chö. ");
  		Msg2Player("§· nhËn ®­îc 4 §o¶n Thuû Chö. ");
  	end;
	end;

end 

--É±ËÀÎ÷ÏÄÓÂÊ¿»ñµÃ¶ÏÂŞ¸ı
function xixiayongshi_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,714,1,1);--µÃµ½ÂŞ¸ı
  	if GetItemCount(2,0,714) >= 1 then
  		TaskTip("§· nhËn ®­îc 1 La Canh. ");
  		Msg2Player("§· nhËn ®­îc 1 La Canh. ");
  	end;
	end;

end

--É±ËÀ30Ò©ÈËµÄ´¥·¢Æ÷
function yaoren_killed_30()

local strTalk = {
	"(Qu¸i l¹, ta ®· tiªu diÖt 30 tªn D­îc Nh©n, t¹i sao sè l­îng d­îc nh©n trong ®éng nµy d­êng nh­ ch¼ng hÒ gi¶m?)",
	"(CÊp tèc ®em tin nµy b¸o cho ¢u D­¬ng Häa tiÒn bèi qu¶ lµ cao kiÕn. )"
	}

	SetTask(TASK_XB_ID_01,33);
	RemoveTrigger(GetRunningTrigger());
	TaskTip("Håi b¸o ¢u D­¬ng Häa, vÒ t×nh h×nh D­îc Nh©n trong D­îc V­¬ng ®éng. ");
	Msg2Player("Håi b¸o ¢u D­¬ng Häa, vÒ t×nh h×nh D­îc Nh©n trong D­îc V­¬ng ®éng. ");

end

--É±ËÀÇ§ÄêÊ÷ÈË´¥·¢Æ÷
function qiannianshuren_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,720,1,1);--µÃµ½Ç§ÄêÎÚÄ¾
  	if GetItemCount(2,0,720) >= 20 then
  		TaskTip("§· thu thËp ®­îc 20 m¶nh ¤ Méc ngµn n¨m. ");
  		Msg2Player("§· thu thËp ®­îc 20 m¶nh ¤ Méc ngµn n¨m. ");
  	end;
	end;

end

--É±ËÀÉ³Ä®ĞĞÕß´¥·¢Æ÷
function shamoxingzhe_killed_1()

	if g_probability(10,100) then
  	AddItem(2,0,722,1,1);--µÃµ½¡¶Ç§½ğÒí·½¡·²Ğ¾í
  	if GetItemCount(2,0,722) >= 10 then
  		TaskTip("§· thu thËp ®­îc 10 m¶nh \'Thiªn Kim Dùc Ph­¬ng\'. ");
  		Msg2Player("§· thu thËp ®­îc 10 m¶nh \'Thiªn Kim Dùc Ph­¬ng\'. ");
  	end;
	end;

end

--É±ËÀÑ°±¦ÈËÈ¡ÌÇºùÂ«´¥·¢Æ÷
function xunbaoren_killed_1()

local strTalk = {
	"§· nhËn ®­îc kÑo hå l«, Viªn bé ®Çu nãi lÊy mª d­îc trén vµo kÑo hå l« sÏ thµnh kÑo hå l« (mª). ",
	"ChØ cÇn ®Õn Cæ D­¬ng ®éng sö dông kÑo hå l« (mª) nµy, S¸t Thñ Oa Oa lµm sao kh«ng m¾c bÉy cho ®­îc, ha ha. "
	}

	if g_probability(15,100) then
  	AddItem(2,0,729,1,1);--µÃµ½±ùÌÇºùÂ«
  	if GetItemCount(2,0,729) >= 10 and GetItemCount(2,0,730) < 1 then
  		TalkEx("",strTalk);
  		DelItem(2,0,729,10);--É¾È¥ÌÇºùÂ«
  		AddItem(2,0,730,1,1);--µÃµ½ÕÙ»½É±ÊÖÍŞÍŞÓÃµÄÃÔ»ê±ùÌÇºùÂ«
  		TaskTip("§· nhËn ®­îc kÑo hå l« (mª), mau ®Õn Cæ D­¬ng ®éng diÖt S¸t Thñ Oa Oa. ");
  		Msg2Player("§· nhËn ®­îc kÑo hå l« (mª), mau ®Õn Cæ D­¬ng ®éng diÖt S¸t Thñ Oa Oa. ");
  	end;
	end;

end


------------------------------------·ÖÖ§2´¥·¢Æ÷º¯Êı--------------------------------------

--Ëø»êé×Ê±¼ä´¥·¢Æ÷
function Suohunzun_OnTimer()

	TaskTip("HÕt thêi gian nhiÖm vô thÊt b¹i, trë vÒ nhËn l¹i nhiÖm vô")
	DelItem(2,0,699,1);--É¾È¥Ëø»êé×
	SetTask(TASK_XB_ID_02,1);--ÖØÖÃÈÎÎñ²½Öè
	RemoveTrigger(GetRunningTrigger());

end

--Å·Ñô»­¶Ô»°´¥·¢Æ÷
function ouyanghua_talk()

	--Ñ¯ÎÊÅ·Ñô»­Ë¾ÂíÃù·çµÄ±³¾°
	if GetTask(TASK_XB_ID_02) == 0 then
		task_024_01_0();
	elseif GetTask(TASK_XB_ID_02) == 11 then
		task_026_01_0();
	end
	
	RemoveTrigger(GetRunningTrigger());

end

--ÁÑÑÒó¤ÁúËÀÍö´¥·¢Æ÷
function lieyanchilong_killed_1()
	
	if g_probability(10,100) then
  	AddItem(2,0,703,1,1);--µÃµ½ó¤ÁúĞë
  	if GetItemCount(2,0,703) >= 10 then
  		TaskTip("§· thu thËp ®­îc 10 m¶nh Li Long Tu. ");
  		Msg2Player("§· thu thËp ®­îc 10 m¶nh Li Long Tu. ");
  	end;
	end;
	
end

--³àÁ¶»ğºüËÀÍö´¥·¢Æ÷
function chilianhuohu_killed_1()
	
	if g_probability(10,100) then
  	AddItem(2,0,702,1,1);--µÃµ½»ğºüÎ²
  	if GetItemCount(2,0,702) >= 10 then
  		TaskTip("§· thu thËp ®­îc 10 m¶nh Háa Hå VÜ. ");
  		Msg2Player("§· thu thËp ®­îc 10 m¶nh Háa Hå VÜ. ");
  	end;
	end;
	
end