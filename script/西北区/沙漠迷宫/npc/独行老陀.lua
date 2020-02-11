-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII É³Ä®ÃÔ¹¬NPC¶ÀĞĞÀÏÍÓScript
-- By StarryNight
-- 2007/08/07 AM 11:58

-- ²»ÒªÆÛ¸ºÈËÍÕ±³°¡£¡

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local t = 0;
local strTalk = {
	"<sex> chóng ta l¹i gÆp nhau råi. Ta truy b¾t tªn §éc Hµnh L·o §µ mÊy ngµy nay, kh«ng ngê r»ng h¾n trèn ®Õn sa m¹c vÉn bŞ b¾t bëi <sex>, thËt ®a t¹.",
	"§õng kh¸ch s¸o, v× ta cã chuyÖn muèn thØnh gi¸o Viªn Bé kho¸i mµ nha m«n cho biÕt «ng ®Õn sa m¹c b¾t tªn §éc Hµnh L·o §µ, võa may ta gÆp ®­îc nªn ra tay tr­íc, kh«ng biÕt cã lµm lì kÕ ho¹ch cña «ng kh«ng?",
	"Tªn nµy rÊt gian manh, nhÊt thêi ta vÉn ch­a t×m ®­îc kÕ hay, tãm l¹i b¾t ®­îc ng­êi vÒ quy ¸n lµ ®­îc. <sex> t×m ta cã chuyÖn g×?",
	}

	--SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 53 then
			TalkEx("talk_01",strTalk);
			nNpcIndex = CreateNpc("Viªn Phi V©n ","Viªn Phi V©n ",nMapId,nX,nY,-1,1,1,30);
			SetNpcLifeTime(nNpcIndex,180);
			SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\Ô¬·ÉÔÆ.lua");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 53 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				SetPlayerScript("\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\¶ÀĞĞÀÏÍÓ.lua");
				TalkEx("talk_01",strTalk);
				if t==0 then
					nNpcIndex = CreateNpc("Viªn Phi V©n ","Viªn Phi V©n ",nMapId,nX,nY,-1,1,1,30);
					SetNpcLifeTime(nNpcIndex,180);
					SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\Ô¬·ÉÔÆ.lua");
					t=1;
				end
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end

--Ğø¶Ô»°
function talk_01()

local strTalk = {
	"Tr­íc ®©y chóng ta ®· diÔn mét mµn kŞch hay, giê ta ®ang muèn tiªu diÖt S¸t Thñ Oa Oa. Dï g× tªn ®ã còng lµ ThËp §¹i Kim Cang rÊt khã ®¸nh b¹i, nªn ta ®Õn hái «ng xem cã c¸ch g× kh«ng.",
	"ChuyÖn <sex> ®¶o lo¹n NhÊt PhÈm ®­êng còng cã chót thµnh tİch, giê ph¶i trùc tiÕp ®èi ®Êu víi ThËp §¹i Kim Cang råi. S¸t Thñ Oa Oa nham hiÓm ®éc ¸c, nh­ng nh­îc ®iÓm cña h¾n chİnh lµ KÑo Hå L«.",
	"KÑo Hå L«? Ta nhí h¾n tõng nãi kÑo hå l« cña h¾n bŞ «ng c­íp mÊt, sau nµy sÏ míi ta ¨n kÑo hå l«.",
	}

	TalkEx("talk_02",strTalk);

end

--Ğø¶Ô»°
function talk_02()

local strTalk = {
	"Khi nhËn thÊy S¸t Thñ Oa Oa thİch nhÊt kÑo hå l« nªn ta ®· bá lo¹i Thuèc mª kh«ng mµu kh«ng mïi vµo KÑo Hå L« vµ gi¶ lµm ng­êi b¸n kÑo ®Ó b¸n cho h¾n, nh©n lóc h¾n h«n mª b¾t vÒ quy ¸n. Ng­êi cã thÓ tiÕn hµnh theo c¸ch nµy, v× ng­¬i ®· tõng cøu h¾n nªn dÔ hµnh ®éng h¬n.",
	"Th× ra lµ vËy, Viªn Bé kho¸i qu¶ lµ cao minh.",
	"ViÖc g× còng ®éng vò lùc thİ qu¶ lµ h¹ s¸ch. Chç ta cßn İt Thuèc mª ng­¬i h·y lÊy dïng, S¸t Thñ Oa Oa thİch nhÊt KÑo Hå L« cña §­êng Hå L« ë Phông T­êng phñ ng­¬i cã thÓ ®i mua. Ta ph¶i ¸p gi¶i §éc Hµnh L·o §µ vÒ nha m«n, sau khi xong chuyÖn chóng ta sÏ n©ng ly chóc mõng vµ ng­¬i ph¶i kÓ cho ta diÔn biÕn sù viÖc. B¶o träng vµ hÑn gÆp l¹i.",
	"Ta nhÊt ®Şnh sÏ gi÷ m¹ng sèng ®Ó t¸i nhé cïng Viªn Bé kho¸i, hÑn gÆp l¹i.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,54);
	AddItem(2,0,753,1,1);--µÃµ½ÃÔÒ©
	TaskTip("§Õn Phông T­êng phñ t×m mua KÑo Hå L« cña §­êng Hå L« ®Ó dô S¸t Thñ Oa Oa.");
	Msg2Player("§Õn Phông T­êng phñ t×m mua KÑo Hå L« cña §­êng Hå L« ®Ó dô S¸t Thñ Oa Oa.");
	GivePlayerAward("Award_XB_47","Easy");

end

