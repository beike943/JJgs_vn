-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII 76ÎäÆ÷Åä·½Ñ§Ï°ÈÎÎñheadÎÄ¼ş
-- By StarryNight
-- 2006/04/27 PM 15:59

-- Ôµµ½À´Ê±ÈËÄÑ¾Ü£¬ÔµÒª×ßÊ±ÈËÄÑ×·¡­¡­

-- ======================================================

-- ×Ö·û´®´¦Àí¹¦ÄÜ¿â
Include("\\script\\lib\\string.lua");

--76¼¶ÎäÆ÷Åä·½Óë²ÄÁÏÅä·½Ñ§Ï°ÈÎÎñ±äÁ¿
TASK_76WEAPON 			= 	1600		--76¼¶ÎäÆ÷Åä·½ÈÎÎñ±äÁ¿
TASK_76WEAPON_TALK 		= 	1601		--76¼¶ÎäÆ÷Åä·½ÈÎÎñ¶Ô»°±ê¼Ç
TASK_76WEAPON_TALK_01 	= 	1 			--ÉÙÁÖ¶Ô»°±ê¼Ç
TASK_76WEAPON_TALK_02 	= 	2			--Îäµ±¶Ô»°±ê¼Ç
TASK_76WEAPON_TALK_03 	= 	3 			--¶ëáÒ¶Ô»°±ê¼Ç
TASK_76WEAPON_TALK_04 	= 	4 			--ÌÆÃÅ¶Ô»°±ê¼Ç
TASK_76WEAPON_TALK_05 	= 	5 			--Ø¤°ï¶Ô»°±ê¼Ç
TASK_MEDICINE_HEIWU 	= 	1602		--ÖÆÒ©ÏµºÚÎÙ¾«Ê¯Åä·½ÈÎÎñ±äÁ¿
TASK_COOKING_TIESHAN	=   1603		--Åëâ¿ÏµÌúÏß¾«Ä¾Åä·½ÈÎÎñ±äÁ¿
TASK_WEAVE_SHANSHI		=   1604		--Ö¯ÔìÏµÉ½Ê¨¾«Æ¤Åä·½ÈÎÎñ±äÁ¿
TASK_JUJU_CHIWU		  	=   1605		--ÖÆ·ûÏµ³àÎÙÁé·ûÅä·½ÈÎÎñ±äÁ¿
TASK_JUJU_TALK			= 	1601		--ÖÆ·ûÏµ³àÎÙÁé·ûÅä·½ÈÎÎñ¶Ô»°±ê¼Ç 
TASK_JUJU_TALK_01		=   1			--ÁõÒ»¸«¶Ô»°±ê¼Ç
TASK_JUJU_TALK_02		=	2			--´ú¿ó¹¤¶Ô»°±ê¼Ç

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
	[8]={"ThiÕu hiÖp","C« n­¬ng"},
	[9]={"ThiÕu hiÖp","C« n­¬ng"},
	[10]={"C« n­¬ng","C« n­¬ng"},
}

--ËùĞèÉÏ½»ÎäÆ÷
HANDIN_ITEM_DATA = {
	[1] = {},
	[2] = {{},--½­ºş¼¼ÒÕ
				 {{0,5,39,1,"Thanh Long c«n"},{0,8,96,1,"Thiªn PhËt tr­îng"},{0,6,107,1,"Ph¸ Thiªn kİch"}},--³¤±øÆ÷
				 {{0,0,13,1,"Nª Lª ®Şa ngôc"},{0,2,26,1,"HuyÒn thiÕt Träng KiÕm"},{0,3,63,1,"B¸ V­¬ng"},{0,7,11,1,"§o¹n Tr­êng"}},--¶Ì±øÆ÷
				 {{0,1,52,1,"Thiªn ngo¹i phi tiªn"},{0,10,74,1,"Tiªu VÜ"},{0,9,85,1,"Thiªn C¬"},{0,4,118,1,"Long KhÈu"},{0,11,11,1,"Ngò T«n"}},--ÆæÃÅ±øÆ÷
				 {{0,100,35,1,"HuyÕt Hµ Quû V­¬ng gi¸p"},{0,100,17,1,"S¬n Quû huyÕt y"},{0,100,36,1,"Long B¸ ¤ kim y"},{0,100,18,1,"Thiªn Gi¸ng bµo"}},--ÄĞ×°ÒÂ·ş
				 {{1,0,6,10,"H¾c Ngäc §o¹n Tôc Cao"},{1,0,11,10,"V¹n VËt Quy Nguyªn §¬n"},{1,0,16,10,"Sinh Sinh Hãa T¸n"},{1,0,21,5,"B«n Tinh NguyÖt §¬n"},{1,0,26,5,"§¹i NhËt D­¬ng T¸n"}},--Ò©Æ·
				 {{1,1,15,5,"B¸nh Bét vµng"},{1,1,14,5,"C¬m chiªn trøng"},{1,1,9,5,"C¶i xµo tái"},{1,1,13,5,"Tóy Méng Töu"}},--Åëâ¿
				 {{0,100,53,1,"Thiªn y"},{0,100,54,1,"Phi Thiªn Th¸i Th­êng"},{0,100,71,1,"V« Song §Êu y"},{0,100,72,1,"Ngò S¾c Nghª Th­êng"}},--Å®×°ÒÂ·ş
				}
}

--NpcÃû×Ö
WEAPON_NPC_DATA = {
	[1] = {"M¹c §¹i","BiÖn Kinh"},
	[2] = {"M¹c NhŞ","Thµnh §«"},
	[3] = {"M¹c Tam","T­¬ng D­¬ng"},
	[4] = {"CÈm n­¬ng","Thµnh §«"},
	[5] = {"Du Ph­¬ng ®¹i phu","Thµnh §«"},
	[6] = {"Ngù Trï","BiÖn Kinh"},
	[7] = {"V©n Du §¹o Nh©n","BiÖn Kinh"},
}

--Åä·½±í
RECIPE_DATA = {
	[1]  = 	{800,"Tr­îng","A La H¸n Tr­îng"},
	[2]  = 	{795,"c«n bæng","LiÖt DiÖm"},
	[3]  = 	{801,"Th­¬ng","§¹i Hµo L«i Th­¬ng"},
	[4]  = 	{793,"Hé thñ","V¹n NhÉn"},
	[5]  = 	{797,"§ao","Cæ §İnh"},
	[6]  = 	{794,"KiÕm","Háa Tinh"},
	[7]  = 	{804,"Song ®ao","L¨ng Phong"},
	[8]  = 	{796,"¸m khİ","M·n Thiªn Hoa Vò"},
	[9]  = 	{799,"Bót","ThÇn Hµnh"},
	[10] = 	{798,"CÇm","Hi Nh©n CÇm"},
	[11] = 	{803,"Tr¶o","M·nh hæ"},
	[12] = 	{802,"Cung","ThÇn Cung"},
}

------------------------------------------76¼¶ÎäÆ÷Åä·½ÈÎÎñÌáÊ¾---------------------------------------
function weapon_76_recipe_tip(nSkill_ID)

local nNpcName = GetTargetNpcName();
	if nNpcName == nil or nNpcName == "" then
		return
	end
	nSkill_ID = nSkill_ID - 1;
	TalkEx("",{nNpcName..":nghe nãi{"..WEAPON_NPC_DATA[nSkill_ID][2].."} {"..WEAPON_NPC_DATA[nSkill_ID][1].."gÇn ®©y ®ang t×m ng­¬i, mau ®i xem coi cã chuyÖn g×."});

end

----------------------------------------------±øÆ÷Åä·½ÈÎÎñ-------------------------------------------

--nType 1£º³¤±øÆ÷£¬2£º¶Ì±øÆ÷£¬3£ºÆæÃÅ±øÆ÷
function weapon_76_001(nType)

local num = getn(HANDIN_ITEM_DATA[2][nType+1])
local str = "";
local strTalk = {};
local i = 0;

	for i=1,num do
		
		str = str..HANDIN_ITEM_DATA[2][nType+1][i][5]

		if i~=num then			
			str = str..","
		end
		
	end

	strTalk = {
		WEAPON_NPC_DATA[nType][1]..": Ng­¬i ®· häc hÕt kü n¨ng cña ta, ta kh«ng cßn g× ®Ó d¹y ng­¬i n÷a.",
		"§Ö tö cã ngµy h«m nay còng lµ nhê s­ phô hÕt lßng chØ b¶o.",
		WEAPON_NPC_DATA[nType][1]..": B¶n vÏ chÕ t¹o thÇn binh nµy lµ chi b¶o cña M¹c gia ta nh­ng ®Õn giê vÉn ch­a t×m ra c¸ch chÕ t¹o thİch hîp. B©y giê ®Şnh truyÒn l¹i cho ng­¬i, hy väng ng­¬i cã thÓ thµnh c«ng. Nh­ng tr­íc tiªn ph¶i kiÓm tra n¨ng lùc hiÖn t¹i cña ng­¬i.",
		"S­ phô cø nãi!",
		WEAPON_NPC_DATA[nType][1]..": ThÕ nµy vËy! Ng­¬i h·y lµm 1 "..str.."®Ó vi s­ xem tay nghÒ cña ng­¬i thÕ nµo.",
		"Xin S­ phô chê chót.",
		}
		TalkEx("",strTalk);
		SetTask(TASK_76WEAPON,1);
		TaskTip("Mçi lo¹i lµm 1 "..str.."Giao cho"..WEAPON_NPC_DATA[nType][1]);

end

--ÉÏ½»ÎäÆ÷
function weapon_76_002(nType)

local num = getn(HANDIN_ITEM_DATA[2][nType+1]);
local str = "";
local i = 0;
local strSay = "";

	for i=1,num do
	
		str = str..HANDIN_ITEM_DATA[2][nType+1][i][5]

		if i~=num then			
			str = str..","
		end
		
	end

  strSay = {
		WEAPON_NPC_DATA[nType][1]..": ThÕ nµy vËy! Ng­¬i h·y lµm 1 "..str.."®Ó vi s­ xem tay nghÒ cña ng­¬i thÕ nµo.(Tr­íc khi giao nép vò khi xin h·y cÊt vò khİ kh«ng muèn nép vµo r­¬ng chøa ®å)",
		"Xin s­ phô xem qua!/#weapon_76_003("..nType..")",
		"§Ö tö ch­a häc qua c¸ch lµm/#ReLearnRecipe("..nType..")",--²¹Ñ§Ö®Ç°Ã»ÓĞÑ§Ï°µÄÅä·½
		"Xin s­ phô chê chót!/nothing",
		}
		
	SelectSay(strSay);
end

--ÉÏ½»ÎäÆ÷
function weapon_76_003(nType)

local strTalk = {
	WEAPON_NPC_DATA[nType][1]..": Qu¶ nhiªn tay nghÒ rÊt kh¸! B¶n vÏ nµy ta cho ng­¬i m­în ®äc thö!",
	"(Sau khi ®äc b¶n vÏ chÕ t¹o binh khİ…)",
	"Vò khİ trong b¶n vÏ nµy rÊt tuyÖt! Víi tay nghÒ cña s­ phô kh«ng cã lı do g× kh«ng lµm ®­îc.",
	WEAPON_NPC_DATA[nType][1]..": Nãi th× dÔ l¾m! Vò khİ ta lµm ra cã mét kh«ng hai nh­ng nguyªn liÖu rÊt khã t×m. NÕu cã tø tinh trong truyÒn thuyÕt th× cã thÓ lµm ra thÇn binh trong b¶n vÏ.",
	"Tø tinh? Lµ nguyªn liÖu g× vËy?",
	WEAPON_NPC_DATA[nType][1]..": §ã lµ 4 lo¹i nguyªn liÖu H¾c ¤ Tinh Th¹ch, ThiÕt TuyÕn Tinh Méc, S¬n S­ Tinh B× vµ Xİch ¤ Linh Phï.",
	"§Ö tö quyÕt rÌn thµnh thÇn binh cói mong s­ phô chØ b¶o.",
	WEAPON_NPC_DATA[nType][1]..": Khi x­a ta tõng dùa theo b¶n vÏ cña ngò ®¹i ThiÕu L©m ph¸i, Vâ §ang, Nga My, §­êng M«n vµ C¸i Bang ®Ó rÌn 1 thanh binh khİ nh­ng kh«ng ai dïng ®­îc, h·y ®Õn hái hä cã thÓ sÏ cã chót thu ho¹ch.",
	}
		--³É¹¦ÉÏ½»ÎïÆ·
		if handin_item(1,nType+1) == 1 then
			TalkEx("",strTalk);
			SetTask(TASK_76WEAPON,2)
			TaskTip("§Õn gÆp Ch­ëng m«n c¸c ThiÕu L©m ph¸i, Vâ §ang, Nga My, §­êng M«n vµ C¸i Bang hái th¨m t×nh h×nh");
		else
			TalkEx("",{WEAPON_NPC_DATA[nType][1]..": Vò khİ cña ng­¬i lµm ®©u? Hay lµ bá quªn ®©u ®ã?"})
		end
end

--ÅĞ¶ÏÉÏ½»ÎïÆ·ÊÇ·ñ·ûºÏÒªÇó
function handin_item(nGenre,nDetail)

	nGenre = nGenre + 1;
	local i = 0;
		for i=1,getn(HANDIN_ITEM_DATA[nGenre][nDetail]) do
			if GetItemCount(HANDIN_ITEM_DATA[nGenre][nDetail][i][1],HANDIN_ITEM_DATA[nGenre][nDetail][i][2],HANDIN_ITEM_DATA[nGenre][nDetail][i][3]) < HANDIN_ITEM_DATA[nGenre][nDetail][i][4] then	
				return 0
			end
		end
		for i=1,getn(HANDIN_ITEM_DATA[nGenre][nDetail]) do
			DelItem(HANDIN_ITEM_DATA[nGenre][nDetail][i][1],HANDIN_ITEM_DATA[nGenre][nDetail][i][2],HANDIN_ITEM_DATA[nGenre][nDetail][i][3],HANDIN_ITEM_DATA[nGenre][nDetail][i][4])
		end
	return 1
end

--ÓëÎå´óÕÆÃÅ¶Ô»°
function weapon_76_talk(nFaction,nType)

local strTalk = {
	[1] = {
		"B¸i kiÕn Ph­¬ng tr­îng! N¨m x­a M¹c s­ phô ®· lµm cho ph­¬ng tr­îng mét mãn thÇn khİ, t¹i sau sau ®ã kh«ng thÊy ng­êi sö dông?",
		"µ! Th× ra thİ chñ lµ truyÒn nh©n cña M¹c s­ phô! Mãn vò khİ ®­îc lµm n¨m x­a qu¸ mÒm dÎo kh«ng thİch hîp víi ThiÕu L©m ta.",
		"Th× ra lµ vËy! T¹i h¹ ®· hiÓu råi.",
		},
	[2] = {                                                                                        	
		"B¸i kiÕn Ch©n nh©n! N¨m x­a M¹c s­ phô ®· lµm cho ch©n nh©n mét mãn thÇn khİ, t¹i sau sau ®ã kh«ng thÊy ng­êi sö dông?",              
		"Vò khİ n¨m x­a tuy bĞn nhän nh­ng kh«ng mÒm dÎo. Vâ §ang ta lÊy nhu chÕ c­¬ng, lo¹i vò khİ nµy kh«ng thİch hîp l¾m.",
		"Th× ra lµ vËy! T¹i h¹ ®· hiÓu råi.",                                                      
    },
  [3] = {
		"B¸i kiÕn S­ th¸i! N¨m x­a M¹c s­ phô ®· lµm cho ®¹o tr­ëng mét mãn thÇn khİ, t¹i sau sau ®ã kh«ng thÊy ng­êi sö dông?",
		"Vò khİ n¨m x­a M¹c s­ phô lµm qu¶ nhiªn bÊt phµm. Nh­ng Nga My ta lµ ®Ö tö PhËt m«n sao cã thÓ sö dông vò khİ nhiÒu s¸t khİ nh­ thÕ?",
		"Th× ra lµ vËy! T¹i h¹ ®· hiÓu råi.",
		},
	[4] = {
		"B¸i kiÕn L·o l·o! N¨m x­a M¹c s­ phô ®· lµm cho ng­êi mét mãn thÇn khİ, t¹i sau sau ®ã kh«ng thÊy ng­êi sö dông?",
		"Phãng ¸m khİ yªu cÇu ngo¹i lùc vµ chİnh x¸c. Kh«ng thÓ thiÕu 1 trong 2. ¸m khİ n¨m x­a M¹c s­ phô lµm kÕt cÊu rÊt tèt nh­ng kh«ng ®ñ ®é chİnh x¸c.",
		"Th× ra lµ vËy! T¹i h¹ ®· hiÓu råi.",
		},
	[5] = {
		"B¸i kiÕn Long bang chñ! N¨m x­a M¹c s­ phô ®· lµm cho Bang chñ ng­êi mét mãn thÇn khİ, t¹i sau sau ®ã kh«ng thÊy ng­êi sö dông?",
		"Binh khİ M¹c s­ phô lµm tuy oai lùc rÊt m¹nh nh­ng ta dïng c¶m thÊy kh«ng tho¶i m¸i.",
		"Th× ra lµ vËy! T¹i h¹ ®· hiÓu råi.",
		}
	}
	TalkEx("",strTalk[nFaction]);
	SetTask(TASK_76WEAPON_TALK, SetBit(GetTask(TASK_76WEAPON_TALK), nFaction, 1));
	for	i=1,5 do
		if GetBit(GetTask(TASK_76WEAPON_TALK),i) ~= 1 then
			return
		end
	end
	SetTask(TASK_76WEAPON,3);
	TaskTip("Nghe xong lêi kÓ cña 5 vŞ Ch­ëng m«n, b¹n c¶m thÊy nhiÒu khóc m¾c. Quay vÒ gÆp"..WEAPON_NPC_DATA[nType-1][1].."!");	                                                                                        
end

--Î´ÓëÎåÎ»ÕÆÃÅ¶Ô»°
function weapon_76_004(nType)

local strTalk = {WEAPON_NPC_DATA[nType][1]..": Khi x­a ta tõng dùa theo b¶n vÏ cña ngò ®¹i ThiÕu L©m ph¸i, Vâ §ang, Nga My, §­êng M«n vµ C¸i Bang ®Ó rÌn 1 thanh binh khİ nh­ng kh«ng ai dïng ®­îc, h·y ®Õn hái hä cã thÓ sÏ cã chót thu ho¹ch."}

	TalkEx("",strTalk)

end

--ÒÑ¾­ÓëÎåÎ»ÕÆÃÅ¶Ô»°ºóÓëÊ¦¸µ¶Ô»°
function weapon_76_005(nType)

local strTalk = {
	WEAPON_NPC_DATA[nType][1]..": Nghe xong lêi kÓ cña 5 vŞ Ch­ëng m«n, ®· hiÓu ®­îc chót İt?",
	"Ngò ®¹i ch­ëng m«n kh«ng dïng binh khİ nh­ trong b¶n vÏ bëi v× chóng kh«ng hîp víi vâ c«ng cña hä, vò khİ tèt kh«ng nhÊt thiÕt ph¶i bĞn nhän chØ cÇn chóng cã thÓ gióp ng­êi sö dông ph¸t huy hÕt vâ c«ng th× míi lµ vò khİ tèt.",
	WEAPON_NPC_DATA[nType][1]..": Hay l¾m! Qu¶ nhiªn kh«ng lµm ta thÊt väng! Ta cã İt Tø Tinh, ng­¬i vÒ nghÜ xem nªn chän chÕ t¹o lo¹i thÇn binh nµo, chØ cã thÓ chän chÕ t¹o mét trong c¸c lo¹i thÇn b×nh nªn ng­¬i suy nghÜ kü råi h·y ®Õn t×m ta.",
	}
	TalkEx("",strTalk);

	TaskTip("NghÜ kü muèn häc chÕ t¹o mãn vò khİ nµo råi h·y quay l¹i ®©y"..WEAPON_NPC_DATA[nType][1])
	if GetTask(TASK_76WEAPON) ~= 4 then
		SetTask(TASK_76WEAPON,4);
		AddItem(2,2,66,5,1);--ºÚÎÙ¾«Ê¯      
		AddItem(2,2,67,5,1);--ÌúÏß¾«Ä¾
		AddItem(2,2,68,5,1);--É½Ê¨¾«Æ¤
		AddItem(2,2,69,5,1);--³àÎÙÁé·û
	end
end

--Ñ¡ÔñÑ§Ï°ºÎÖÖÎäÆ÷ÖÆ×÷
function weapon_76_choice(nType)

local strSay = {
	[1] = {     
		WEAPON_NPC_DATA[nType][1]..": H·y chän lo¹i vò khİ b¹n muèn häc c¸ch chÕ t¹o (chän xong kh«ng thÓ thay ®æi lùa chän)",
		"Tr­îng/#learn_weapon_76("..nType..",1)",   
		"c«n bæng/#learn_weapon_76("..nType..",2)",  
		"Th­¬ng/#learn_weapon_76("..nType..",3)",    
		"Ta suy nghÜ l¹i/nothing",     
		},
	[2] = {     
		WEAPON_NPC_DATA[nType][1]..": H·y chän lo¹i vò khİ b¹n muèn häc c¸ch chÕ t¹o (chän xong kh«ng thÓ thay ®æi lùa chän)",
		"Hé thñ/#learn_weapon_76("..nType..",4)",   
		"§ao/#learn_weapon_76("..nType..",5)",  
		"KiÕm/#learn_weapon_76("..nType..",6)",    
		"Song ®ao/#learn_weapon_76("..nType..",7)",
		"Ta suy nghÜ l¹i/nothing",     
		},
	[3] = {     
		WEAPON_NPC_DATA[nType][1]..": H·y chän lo¹i vò khİ b¹n muèn häc c¸ch chÕ t¹o (chän xong kh«ng thÓ thay ®æi lùa chän)",
		"¸m khİ/#learn_weapon_76("..nType..",8)",
		"Bót/#learn_weapon_76("..nType..",9)",
		"CÇm/#learn_weapon_76("..nType..",10)",
		"Tr¶o/#learn_weapon_76("..nType..",11)",
		"Cung/#learn_weapon_76("..nType..",12)",
		"Ta suy nghÜ l¹i/nothing",
		}
	}	
	SelectSay(strSay[nType]);

end

--»ñµÃÏà¹ØÎäÆ÷µÄÑ§Ï°Åä·½
function learn_weapon_76(nType,recipe_id)

local strTalk = {
	WEAPON_NPC_DATA[nType][1]..": B¹n ®· chän "..RECIPE_DATA[recipe_id][2].." ph­¬ng h­íng chÕ t¹o vò khİ cao cÊp, sau nµy ph¶i cè g¾ng thªm",
	"§å nhi biÕt råi!",
	};

	AddRecipe(RECIPE_DATA[recipe_id][1])
	Msg2Player("B¹n häc ®­îc phèi chÕ:"..RECIPE_DATA[recipe_id][3])

	SetTask(TASK_76WEAPON,5);--76¼¶ÎäÆ÷Åä·½ÈÎÎñÍê³É
	TalkEx("",strTalk);
	
end

------------------------------------------ÖÆÒ©ÏµÎÙ¾«Ê¯Åä·½ÈÎÎñ-------------------------------------------
function medicine_heiwu_001()

local strTalk = {
	"GÇn ®©y ng­¬i kh«ng chó t©m luyÖn thuèc? Nªn biÕt linh ®¬n diÖu d­îc kh«ng ph¶i mét sím m«t chiÒu mµ luyÖn thµnh.",
	"GÇn ®©y §Ö tö ph¸t hiÖn ®¬n d­îc luyÖn ra kh«ng cã c«ng hiÖu l¾m. Tuy luyÖn ®óng ph­¬ng ph¸p nh­ng hiÖu qu¶ kh«ng tèt nªn c¶m thÊy h¬i buån.",
	"ThÕ nµy vËy! Ng­¬i h·y luyÖn H¾c Ngäc §o¹n Tôc Cao, V¹n VËt Quy Nguyªn §¬n, Sinh Sinh Hãa T¸n (mçi lo¹i 10 viªn), B«n Tinh NguyÖt §¬n, §¹i NhËt D­¬ng T¸n (mçi lo¹i 5 viªn) ®­a cho ta xem.",
	"Xin S­ phô chê chót.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_MEDICINE_HEIWU,1);
	TaskTip("ChÕ d­îc phÈm theo yªu cÇu cña s­ phô vµ giao cho s­ phô");
	
end

function medicine_heiwu_002()

local strSay = {
	"10 H¾c Ngäc §o¹n Tôc Cao, V¹n VËt Quy Nguyªn §¬n, Sinh Sinh Hãa T¸n, 5 B«n Tinh NguyÖt §¬n, §¹i NhËt D­¬ng T¸n ®· lµm xong ch­a?",
	"§· lµm xong råi!/medicine_heiwu_003",
	"§Ö tö ch­a häc qua c¸ch lµm/#ReLearnRecipe(5)",--²¹Ñ§Ö®Ç°Ã»ÓĞÑ§Ï°µÄÅä·½
	"Xin S­ phô chê chót!/nothing",
	}
	
	SelectSay(strSay);

end

function medicine_heiwu_003()

local strTalk = {
	"S­ phô! §©y lµ thuèc ®Ö tö ®· luyÖn. Xin s­ phô xem qua!",
	"Kh¸ l¾m!",
	"PhÊn mµu ®en ë bÒ mÆt kh«ng ph¶i lµ…",
	"ViÖc nµy...®Ö tö còng kh«ng râ! GÇn ®©y trong lóc luyÖn d­îc ph¸t hiÖn thø nµy, ®Ö tö kh«ng biÕt nªn míi hái s­ phô.",
	"§Ö tö h·y ®em bét phÊn ®en nµy ®Õn thµnh B¾c t×m {§¹i kho¸ng c«ng} hái thö, víi kinh nghiÖm ®µo kho¸ng nhiÒu n¨m kh«ng chõng «ng ta biÕt thø bét ®en nµy lµ g×.",
	"§Ö tö tu©n lÖnh!",
	}
	
	if handin_item(1,6) == 1 then
		AddItem(2,0,393,1);--µÃµ½ºÚÉ«·ÛÄ©
		TalkEx("",strTalk);
		SetTask(TASK_MEDICINE_HEIWU,2);
		TaskTip("§Õn Thµnh §« t×m §¹i kho¸ng c«ng hái nguån gèc cña bét phÊn mµu ®en");
	else
		TalkEx("",{"§¬n d­îc ®Ö tö luyÖn ®©u? Cã ph¶i ®· ®Ó quªn ®©u ®ã?"});
	end
	
end

function medicine_heiwu_004()

local strTalk = {
	"§Ö tö h·y ®em bét phÊn ®en nµy ®Õn thµnh B¾c t×m {§¹i kho¸ng c«ng} hái thö, víi kinh nghiÖm ®µo kho¸ng nhiÒu n¨m kh«ng chõng «ng ta biÕt thø bét ®en nµy lµ g×.",
	"§Ö tö tu©n lÖnh!",
	}
	TalkEx("",strTalk);
end

function medicine_heiwu_005()

local strTalk = {
	"C¸c h¹ lµ ®Ö tö cña Du Ph­¬ng ®¹i phu? H«m nay t×m ta cã viÖc g×?",
	"T¹i h¹ trong lóc chÕ d­îc v« t×nh ph¸t hiÖn sè bét phÊn mµu ®en nµy, s­ phô b¶o t¹i h¹ ®Õn hái «ng bét nµy lµ g×?",
	"§­a ta xem thö nµo?",
	"Bét phÊn nµy toµn th©n mµu ®en vµ s¸ng, gÇn gièng ¤ kim th¹ch nh­ng phÈm chÊt thuÇn khiÕt h¬n, ta ch­a thÊy qua thø nµy, tõ ®©u ng­¬i cã?",
	"T¹i h¹ v« t×nh ph¸t hiÖn trong lß luyÖn ®¬n.",
	"§©y kh«ng chõng lµ nguyªn liÖu ®Ó chÕ t¹o thÇn binh th­îng ®¼ng. Ng­¬i ®em nã ®Õn BiÖn Kinh t×m M¹c §¹i s­ phô hái thö xem!",
	"§a t¹ §¹i s­ phô chØ ®iÓm!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_MEDICINE_HEIWU,3);
	TaskTip("§Õn BiÖn Kinh t×m M¹c s­ phô hái t¸c dông cña bét phÊn mµu ®en");
	
end

function medicine_heiwu_006()

local strTalk = {
	"Ng­¬i ®em sè bét nµy ®Õn BiÖn Kinh t×m M¹c §¹i s­ phô hái thö, kh«ng chõng sÏ cã ®¸p ¸n.",
	"§a t¹ §¹i s­ phô chØ ®iÓm!",
	}
	TalkEx("",strTalk);
end

function medicine_heiwu_007()

local strTalk = {
	"M¹c §¹i: Ha ha! Cuèi cïng ng­¬i còng ®· luyÖn thµnh LiÖt DiÖm ThÇn C«n!",
	"B¸i kiÕn M¹c s­ phô!",
	"M¹c §¹i: Ng­¬i lµ ®Ö tö cña Du Lang Trung? T×m ta cã viÖc g×? H«m nay l·o phu rÊt vui, ®· luyÖn thµnh LiÖt DiÖm ThÇn C«n. Ng­¬i ®Õn ®©y xem thö ®i!",
	"V·n bèi tµi th« häc thiÓn, nhÊt thêi kh«ng thÊy ®­îc sù ®Æc biÖt cña binh khİ nµy.",
	"M¹c §¹i: Kh«ng ph¶i ng­¬i ®Õn xem thÇn binh ta luyÖn ­? VËy t×m ta cã chuyÖn g×?",
	"V·n bèi trong lóc luyÖn ®¬n ph¸t hiÖn sè {bét mµu ®en} nµy, Du Ph­¬ng s­ phô b¶o t¹i h¹ ®Õn hái §¹i kho¸ng c«ng, «ng ta nãi ®©y cã thÓ lµ nguyªn liÖu ®Ó chÕ t¹o binh khİ th­îng ®¼ng vµ b¶o t¹i h¹ ®Õn hái M¹c s­ phô ng­êi.",
	"M¹c §¹i: §Ó ta xem nµo……",
	"M¹c §¹i: §©y ch¼ng lÏ lµ bét cña H¾c ¤ Tinh Th¹ch? Ta tèn nhiÒu t©m huyÕt míi luyÖn thµnh LiÖt DiÖm ThÇn C«n, mçi lÇn luyÖn nguyªn liÖu dïng còng kh¸c nhau nh­ng khi lµm nguéi ®Òu ®Ó l¹i mét İt bét cña H¾c ¤ Tinh Th¹ch. ThÕ nµy vËy! Ta cã mét İt HuyÒn Th¹ch dïng ®Ó luyÖn, ng­¬i vÒ t×m s­ phô nghiªn cøu xem cã lÏ sÏ cã thu ho¹ch.",
	"§Ö tö tu©n lÖnh!",
	}
	--ÊÕ»ØºÚÉ«·ÛÄ©
	if GetItemCount(2,0,393,1) >= 1 then
		DelItem(2,0,393,1);
	end
	
	TalkEx("",strTalk);
	if GetTask(TASK_MEDICINE_HEIWU) ~= 4 then
		AddItem(2,8,7,5,1);--µÃµ½5¿ÅĞşÊ¯
		SetTask(TASK_MEDICINE_HEIWU,4);
	end
	TaskTip("§­a 5 viªn HuyÒn Th¹ch cña M¹c §¹i cho Du Ph­¬ng ®¹i phu");
	
end

function medicine_heiwu_008()

local strTalk = {
	"M¹c §¹i: H·y ®em HuyÒn Th¹ch nµy vÒ cïng s­ phô nghiªn cøu xem, kh«ng chõng sÏ cã thu ho¹ch.",
	"§Ö tö tu©n lÖnh!",
	}
	TalkEx("",strTalk);
end

function medicine_heiwu_009()

local strTalk = {
	"§· vÒ råi µ? Cã hái ®­îc g× kh«ng?",
	"§¹i s­ phô cho r»ng ®©y kh«ng ph¶i tinh th¹ch th­îng ®¼ng ®µo kho¸ng cã ®­îc, b¶o ®Ö tö ®i hái M¹c §¹i s­ phô. M¹c §¹i s­ phô nãi ®©y cã thÓ lµ nguyªn liÖu ®Ó chÕ t¹o thÇn binh th­îng ®¼ng, bëi v× mçi khi «ng ta luyÖn binh khİ còng ph¸t hiÖn trong lß luyÖn cã thø bét mµu ®en nµy, «ng ta cßn ®­a ®Ö tö mét İt HuyÒn Th¹ch, b¶o ®Ö tö ®em vÒ cho S­ phô.",
	"§­a ta xem thö!",
	"Ta hiÓu råi! Trong lóc ng­¬i luyÖn d­îc kh«ng ®Ó ı nªn nã s¶n sinh s¶n phÈm phô. §©y lµ ph­¬ng ph¸p chÕ H¾c ¤ Tinh Th¹ch, ng­¬i h·y nghiªn cøu kü.",
	"VËy lµm sao ®Ó n¨ng lùc luyÖn ®¬n cña ®Ö tö t¨ng thªm mét bËc?",
	"§õng hÊp tÊp! B©y giê ng­¬i ®ang ë giai ®o¹n b·o hßa mµ ta th­êng nãi. Nh÷ng lóc thÕ nµy th× khã mµ cã tiÕn triÓn míi.",
	"Giai ®o¹n b·o hßa? VËy ®Ö tö ph¶i lµm sao? Xin S­ phô chØ gi¸o!",
	"Dôc tèc bÊt ®¹t! Ng­¬i h·y nghiªn cøu ph­¬ng ph¸p chÕ H¾c ¤ Tinh Th¹ch, ta cßn mét İt HuyÒn Th¹ch, h·y cÇm lÊy!",
	"§Ö tö hiÓu râ!",
	}

	--¿Û³ı5¿ÅĞşÊ¯
	if DelItem(2,8,7,5) == 1 then
		TalkEx("",strTalk);
		AddRecipe(805)
		AddItem(2,8,7,100,1);
		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ¤ Tinh Th¹ch")
		SetTask(TASK_MEDICINE_HEIWU,5);
	else
		TalkEx("",{"{5 viªn HuyÒn Th¹ch} M¹c §¹i s­ phô nhê t¹i h¹ ®­a cho s­ phô cã ph¶i ®· lµm mÊt trªn ®­êng?"});
	end
end

------------------------------------------Åëâ¿ÏµÌúÏß¾«Ä¾Åä·½ÈÎÎñ-------------------------------------------
function cooking_tieshan_001()

local strTalk = {
	"LÇn tr­íc Hoµng Th­îng uèng canh §­¬ng Quy hÇm r¾n xong tÊm t¾c khen ngon, nh­ng khÈu vŞ cña Hoµng Th­îng lu«n thay ®æi. NÕu lÇn sau ng­êi l¹i muèn ¨n mãn l¹ th× ta cã 10 c¸i ®Çu còng kh«ng ®ñ.",
	"S­ phô l¹i hao t©m v× b÷a ¨n cña Hoµng Th­îng?",
	"Chao «i! §õng nh¾c n÷a! Ng­¬i ®Õn ®óng lóc l¾m! Hai s­ ®å ta l©u råi kh«ng gÆp nhau, mau lµm vµi mãn ®Ó nh©m nhi ®i!",
	"VËy……",
	"Ng­¬i thËt lµ! §Õn mãn {b¸nh Bét vµng}, {C¬m chiªn trøng }, {C¶i xµo tái}, {Tóy Méng Töu} s­ phô thİch ¨n còng quªn, thøc ¨n ngon kh«ng thÓ thiÕu r­îu! Ng­¬i mau lµm {5 phÇn} ®i!",
	"Xin s­ phô chê chót! (Kh«ng ngê søc ¨n cña s­ phô còng kh¸ qu¸)",
	}
	TalkEx("",strTalk);
	SetTask(TASK_COOKING_TIESHAN,1);
	TaskTip("Lµm 5 phÇn b¸nh Bét vµng, C¬m chiªn trøng, C¶i xµo tái vµ Tóy Méng Töu cho Ngù Trï");
	
end

function cooking_tieshan_002()

local strSay = {
	"Ng­¬i thËt lµ! §Õn mãn {b¸nh Bét vµng}, {C¬m chiªn trøng }, {C¶i xµo tái}, {Tóy Méng Töu} s­ phô thİch ¨n còng quªn, thøc ¨n ngon kh«ng thÓ thiÕu r­îu! Ng­¬i mau lµm {5 phÇn} ®i!",
	"R­îu thŞt tíi ®©y!/cooking_tieshan_003",
	"§Ö tö ch­a häc qua c¸ch lµm/#ReLearnRecipe(6)",--²¹Ñ§Ö®Ç°Ã»ÓĞÑ§Ï°µÄÅä·½
	"Xin S­ phô chê chót!/nothing",
	}
	
	SelectSay(strSay);

end

function cooking_tieshan_003()

local strTalk = {
	"S­ phô! R­îu thŞt c¶ ®©y!",
	"Hay l¾m! §Ó ta nÕm thö xem!",
	"å!!",
	"Ch¼ng lÏ kh«ng hîp khÈu vŞ?",
	"§­¬ng nhiªn råi! Ng­¬i dïng nguyªn liÖu g× vËy?",
	"§Ö tö lµm theo lêi cña s­ phô, dïng Diªn Tinh M¹ch, Hå Tiªu, Dung tr¹ch cèc. Mïi vŞ thÕ nµo vËy s­ phô?",
	"ThËt kú l¹! Ta ch­a tõng ¨n qua {C¬m chiªn trøng} ngon nh­ vÇy!",
	"……",
	}
	
	if handin_item(1,7) == 1 then
		TalkEx("cooking_tieshan_003_01",strTalk);
	else
		TalkEx("",{"R­îu thŞt ®©u? Mau ®em tíi ®i! S­ phô ®ãi l¾m råi!"});
	end	
end


function cooking_tieshan_003_01()

local strTalk = {	
	"VÊn ®Ò kh«ng ph¶i lµ nguyªn liÖu, ®Ó ta xem bÕp vµ ®Õ nåi.",
	"§©y lµ…?",
	"§©y chØ lµ lo¹i cñi th­êng, kh«ng thÊy cã g× ®Æc biÖt.",
	"Ng­¬i ®Ó ı xem, lo¹i {cñi} nµy sau khi cho vµo lß löa lín vÉn cã tİnh ®µn håi nhÊt ®Şnh kh«ng nh­ c¸c lo¹i cñi kh¸c. Xem ra ®©y kh«ng ph¶i lµ lo¹i gç th­êng. ThÕ nµy vËy! Ng­¬i ®em chóng ®Õn {thµnh Nam} t×m {L­u NhÊt Phñ} hái thö xem. Víi kinh nghiÖm l©u n¨m cña y kh«ng chõng sÏ biÕt ®­îc nhiÒu ®iÒu vÒ lo¹i cñi nµy. §èi víi viÖc nÊu n­íng sau nµy sÏ cã lîi İch nhÊt ®Şnh.",
	"{L­u s­ phô} ë {thµnh Nam} µ! §Ö tö xin ®i ngay!",
	"Nh­ng L­u NhÊt Phñ rÊt thİch uèng {r­îu}, ng­¬i nhí ®em theo 1 b×nh N÷ Nhi Hång th­îng h¹ng.",
	}

	AddItem(2,0,394,1);--µÃµ½²»Ñ°³£µÄÄ¾²ñ
	TalkEx("",strTalk);
	SetTask(TASK_COOKING_TIESHAN,2);
	TaskTip("§Õn BiÖn Kinh t×m L­u NhÊt Phñ hái nguån gèc cña lo¹i cñi nµy");

end

function cooking_tieshan_004()

local strTalk = {
	"Ng­¬i mau ®em sè {cñi} nµy ®Õn {thµnh Nam} t×m {L­u NhÊt Phñ}. Víi kinh nghiÖm l©u n¨m cña y kh«ng chõng sÏ biÕt huyÒn c¬ cña c©y cñi nµy, kh«ng chõng sÏ cã İch cho kü n¨ng nÊu n­íng sau nµy.",
	"§Ö tö tu©n lÖnh!",
	}
	TalkEx("",strTalk);
end

function cooking_tieshan_005()

local strTalk = {
	"L­u s­ phô!",
	"Trêi nãng bøc thÕ nµy mµ cã ®­îc vµi hò Tóy Méng Töu th× cßn g× b»ng.",
	"L­u s­ phô! T¹i h¹ cã mét chuyÖn muèn thØnh gi¸o ng­êi!",
	"Trêi nãng bøc thÕ nµy mµ cã ®­îc vµi hò Tóy Méng Töu th× kh«ng cßn g× b»ng.",
	"(Hay lµ ®i t×m {5 hò} {Tóy Méng Töu} vÒ……)",
	}
	TalkEx("",strTalk);
	SetTask(TASK_COOKING_TIESHAN,3);
	TaskTip("§i t×m 5 hò Tóy Méng Töu cho L­u NhÊt Phñ.");
end

function cooking_tieshan_006()

local strTalk = {
	"L­u s­ phô! Nh×n ng­êi må h«i nhÔ nh¹i, ®èn c©y ch¾c rÊt vÊt v¶. T¹i h¹ cã ®em mét hò Tóy Méng Töu ®Õn, s­ phô h·y lµm vµi chĞn lÊy l¹i tinh thÇn.",
	"Hay l¾m! Thanh niªn nh­ ng­¬i b©y giê hiÕm thÊy l¾m!",
	"S­ phô t¹i h¹ nãi L­u s­ phô rÊt thİch uèng r­îu, lÇn nµy ®Õn ®©y t¹i h¹ ®· ®İch th©n ñ mét b×nh Tóy Méng Töu, mêi S­ phô nÕm thö.",
	"Nhá tuæi vËy mµ ®· ñ ®­îc Tóy Méng Töu! Kh¸ l¾m!",
	}
	--ÉÏ½»5Æ¿×íÉúÃÎËÀ
	if GetItemCount(1,1,13) >= 5 then
		DelItem(1,1,13,5);
		if GetItemCount(2,0,394) >= 1 then
			DelItem(2,0,394,1);--ÊÕ»Ø²»Ñ°³£µÄÄ¾²ñ
		end 
		TalkEx("cooking_tieshan_006_01",strTalk);
	else
		TalkEx("",{"Mau ®i t×m {5 b×nh Tóy Méng Töu} vÒ."});
	end
end

function cooking_tieshan_006_01()

local strTalk = {	
	"V·n bèi trong lóc nÊu ¨n ph¸t hiÖn sè cñi nµy, s­ phô nãi sè cñi nµy kh«ng nh­ lo¹i cñi b×nh th­êng. Kh«ng biÕt nã cã g× ®Æc biÖt nªn sai t¹i h¹ ®Õn thØnh gi¸o L­u s­ phô.",
	"§Ó ta xem thö.",
	"Lo¹i cñi nµy gÇn gièng ThiÕt TuyÕn méc nh­ng dÎo h¬n. Nh×n bÒ mÆt xem ra ®· tõng nung trong löa nh­ng vÉn gi÷ ®­îc nguyªn tr¹ng, nÕu dïng chóng ®Ó luyÖn binh khİ kh«ng chõng sÏ luyÖn ®­îc thÇn binh. ThÕ nµy vËy! Ta tÆng ng­¬i mét İt SuÊt Nhiªn Nguyªn B× vµ ThiÕt TuyÕn méc xem nh­ c¶m ¬n b×nh r­îu ngon ng­¬i mang ®Õn.",
	"§a t¹ L­u s­ phô chØ ®iÓm!",
	}
	
	TalkEx("",strTalk);
	if GetTask(TASK_COOKING_TIESHAN) ~= 4 then
		SetTask(TASK_COOKING_TIESHAN,4);
		AddItem(2,2,11,5,1);--µÃµ½5ÌúÏßÄ¾
		AddItem(2,10,2,5,1);--µÃµ½5ÂÊÈ»Ô­Æ¤
	end
	TaskTip("Quay vÒ gÆp Ngù Trï b¸o c¸o t×nh h×nh");

end

function cooking_tieshan_007()

local strTalk = {
	"Hay lµ ®­a {SuÊt Nhiªn Nguyªn B×} vµ {ThiÕt TuyÕn Méc} cña L­u s­ phô cho S­ phô råi tİnh tiÕp!",
	}
	
	TalkEx("",strTalk);

end

function cooking_tieshan_008()

local strTalk = {
	"VÒ råi µ? Cã hái ®­îc g× kh«ng?",
	"L­u s­ phô nãi ThiÕt TuyÕn Tinh Méc nµy lµ th­îng phÈm chÕ t¹o binh khİ, «ng ta cßn ®­a ®Ö tö SuÊt Nhiªn Nguyªn B× vµ ThiÕt TuyÕt ®Ó c¶m ¬n ®· mang r­îu ®Õn.",
	"SuÊt Nhiªn Nguyªn B×? Da r¾n nµy rÊt hiÕm thÊy, 10 n¨m nã míi lét da mét lÇn, lµ mét trong nh÷ng mãn ¨n ngon. Ng­¬i chê chót! §îi vi s­ lµm mét chĞn ch¸o r¾n h¶o h¹ng! §¶m b¶o ng­¬i ¨n xong sÏ thİch ngay.",
	" 1 giê sau……",
	"S­ phô! Canh r¾n ®· nÊu xong?",
	"¡n chĞn canh lµm tõ SuÊt Nhiªn B× ta thËt kh«ng ®µnh lßng! Vi s­ ®· kiÓm tra cñi trong lß l¹i cã lo¹i cñi ®ã kh«ng nh÷ng kh«ng thÓ c¶i thiÖn chÊt l­îng nÊu ¨n mµ löa ch¸y còng cã vÊn ®Ò, xem ra ph¶i tiÕp tôc lo nghÜ chuyÖn ¨n uèng cña Hoµng th­îng.",
	"SuÊt Nhiªn Nguyªn B× nµy ng­¬i h·y lÊy ®i!"
	}
	
	--¿Û³ıÂÊÈ»Ô­Æ¤ºÍÌúÏßÄ¾¸÷5·İ
	if GetItemCount(2,2,11) >= 5 and GetItemCount(2,10,2) >= 5 then
		DelItem(2,2,11,5);
		DelItem(2,10,2,5);
		TalkEx("",strTalk);
		SetTask(TASK_COOKING_TIESHAN,5);
		AddRecipe(806)
		AddItem(2,10,2,100,1);
		Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt PhiÕn Tinh Méc")
	else
		TalkEx("",{"{5} phÇn {SuÊt Nhiªn Nguyªn B×} vµ {ThiÕt TuyÕn méc} L­u s­ phô nhê ta ®­a cho S­ phô ch¼ng lÏ lµm mÊt trªn ®­êng?"});
	end
end

-------------------------------------Ö¯ÔìÏµÉ½Ê¨¾«Æ¤Åä·½Ñ§Ï°ÈÎÎñ-----------------------------
function weave_shanshi_001()

local strTalk = {
	"Ng­¬i ®Õn ®óng lóc l¾m! LÇn tr­íc l¸i bu«n ë §¹i Lı cã ®em ®Õn cho ta İt trang phôc cña d©n téc thiÓu sè ë khu T©y Nam rÊt ®Ñp. Ta ®ang ®Şnh lµm vµi bé trang phôc míi, khæ nçi qu¸ İt trang phôc ®Ó tham kh¶o.ThÕ nµy vËy! Ng­¬i ®Õn §¹i Lı t×m Chñ tiÖm N÷ phôc lÊy vµi bé trang phôc vÒ ®Ó ta tham kh¶o.",
	"§å nhi lËp tøc ®i ngay!",
	"Chñ tiÖm N÷ phôc lµ ng­êi lµm ¨n, khã tr¸nh tİnh to¸n chi li. Ng­¬i h·y ®­a bµ ta vµi bé y phôc nÕu kh«ng bµ ta sÏ kh«ng chŞu ®­a ®å cho ng­¬i.",
	}
  
  TalkEx("",strTalk);
	SetTask(TASK_WEAVE_SHANSHI,1);
	TaskTip("§Õn §¹i Lı t×m chñ tiÖm N÷ phôc mua vµi bé y phôc cña khu vùc T©y Nam cho CÈm N­¬ng");
  	
end

function weave_shanshi_002()
				 
local strSay = {
	"Chñ tiÖm N÷ phôc lµ ng­êi lµm ¨n, khã tr¸nh tİnh to¸n chi li. Ng­¬i h·y ®­a bµ ta vµi bé y phôc nÕu kh«ng bµ ta sÏ kh«ng chŞu ®­a ®å cho ng­¬i.",
	"§Ö tö ch­a häc qua c¸ch lµm/#ReLearnRecipe(4)",--²¹Ñ§Ö®Ç°Ã»ÓĞÑ§Ï°µÄÅä·½
	"BiÕt råi!/nothing"
	}
  
  SelectSay(strSay);
  
end

function weave_shanshi_003()

local strTalk_1 = {
	"Chµo ng­êi! S­ phô sai t¹i h¹ ®Õn lÊy vµi bé y phôc cña d©n téc thiÓu sè ë khu T©y Nam vÒ tham kh¶o ®Ó may vµi bé trang phôc míi.",
	"Trang phôc ë ®©y c¸i nµo còng ph¶i tèn nhiÒu tiÒn míi mua ®­îc, ng­¬i nãi ®­a CÈm N­¬ng lµ ®­a sao? İt nhÊt còng ph¶i lÊy l¹i tiÒn vèn. Nãi ®Õn chuyÓn tiÒn b¹c dÔ mÊt lßng. Ng­¬i nãi xem……",
	"(Qu¶ ®óng nh­ lêi cña CÈm n­¬ng, hay lµ ®­a bµ ta {HuyÕt Hµ Quû V­¬ng Kh¶i}, {S¬n Quû HuyÕt Y}, {Long B¸ ¤ kim Y} vµ {Thiªn Gi¸ng Bµo}, nÕu kh«ng bµ ta sÏ kh«ng chŞu ®­a y phôc cho ta)",
	}	
local strTalk_2 = {
	"Chµo ng­êi! S­ phô sai t¹i h¹ ®Õn lÊy vµi bé y phôc cña d©n téc thiÓu sè ë khu T©y Nam vÒ tham kh¶o ®Ó may vµi bé trang phôc míi.",
	"Trang phôc ë ®©y c¸i nµo còng ph¶i tèn nhiÒu tiÒn míi mua ®­îc, ng­¬i nãi ®­a CÈm N­¬ng lµ ®­a sao? İt nhÊt còng ph¶i lÊy l¹i tiÒn vèn. Nãi ®Õn chuyÓn tiÒn b¹c dÔ mÊt lßng. Ng­¬i nãi xem……",
	"(Qu¶ ®óng nh­ lêi cña CÈm n­¬ng, hay lµ ®­a bµ ta {Thiªn Y}, {Phi Thiªn Th¸i Th­êng}, {V« Song §Êu Y}, {Ngò Th¸i Nghª Th­êng}, nÕu kh«ng bµ ta sÏ kh«ng chŞu ®­a y phôc cho ta)",
	}
  
  --ÅĞ¶ÏÒÂ·şÖ¯ÔìĞÔ±ğÂ·Ïß
  if GetTask(1935) == 1 then
  	TalkEx("",strTalk_1);
  	TaskTip("§­a HuyÕt Hµ Quû V­¬ng Kh¶i, S¬n Quû HuyÕt Y, Long B¸ ¤ kim Y vµ Thiªn Gi¸ng Bµo cho Chñ tiÖm N÷ phôc");
  else
		TalkEx("",strTalk_2);
		TaskTip("§­a Thiªn Y, Phi Thiªn Th¸i Th­êng, V« Song §Êu Y, Ngò Th¸i Nghª Th­êng cho Chñ tiÖm N÷ phôc");
	end
	SetTask(TASK_WEAVE_SHANSHI,2);
end

function weave_shanshi_004()

local strSay_1 = {
	"ThÕ nµo míi tèt ®©y?……(Tr­íc khi nhËn HuyÕt Hµ Quû V­¬ng Kh¶i, S¬n Quû HuyÕt Y, Long B¸ ¤ kim Y vµ Thiªn Gi¸ng Bµo xin t¹m thêi bá nh÷ng vËt phÈm kh«ng cÇn thiÕt vµo r­¬ng chøa ®å ®Ó tr¸nh thÊt tho¸t)",
	"ë ®©y cã vµi bé trang phôc xem nh­ lÔ vËt t¹i h¹ m¹o muéi ®Õn nhê ng­êi gióp./weave_shanshi_005",
	"Sau nµy h·y ®­a./nothing"
	}
	
local strSay_2 = {
	"ThÕ nµo míi tèt ®©y?……((Tr­íc khi nhËn Thiªn Y, Phi Thiªn Th¸i Th­êng, V« Song §Êu Y vµ Ngò Th¸i Nghª Th­êng xin t¹m thêi bá nh÷ng vËt phÈm kh«ng cÇn thiÕt vµo r­¬ng chøa ®å ®Ó tr¸nh thÊt tho¸t)",
	"ë ®©y cã vµi bé trang phôc xem nh­ lÔ vËt t¹i h¹ m¹o muéi ®Õn nhê ng­êi gióp./weave_shanshi_005",
	"Sau nµy h·y ®­a./nothing"
	}
	
  --ÅĞ¶ÏÒÂ·şÖ¯ÔìĞÔ±ğÂ·Ïß
  if GetTask(1935) == 1 then
  	SelectSay(strSay_1);
  else
  	SelectSay(strSay_2);
  end

end

function weave_shanshi_005()

local strTalk_1 = {
	"§©y lµ trang phôc s­ phô nhê t¹i h¹ ®em ®Õn!",
	"¥! CÈm N­¬ng lóc nµo còng vËy, mäi ng­êi cßn l¹ g× nhau mµ cßn kh¸ch khİ thÕ! ThÕ nµy vËy! §Ó ta nhê l¸i bu«n chuyÓn hµng ®Õn §¹i Tèng tiÖn ®­êng sÏ ghĞ ®­a cho S­ phô ng­¬i vµi bé trang phôc cña §¹i Lı, ng­¬i vÒ chê tin ®i!",
	"(Qu¶ nhiªn lµ ng­êi lµm ¨n! §· thÕ còng kh«ng cßn c¸ch nµo kh¸c, hay lµ quay vÒ phôc mÖnh CÈm N­¬ng).",
	"VËy xin lµm phiÒn ng­êi!",
	"§õng kh¸ch s¸o!",
	}
	
local strTalk_2 = {
	"Kh«ng ph¶i ng­¬i nãi CÈm N­¬ng ®­a trang phôc cho ta sao? Sao kh«ng thÊy g× hÕt vËy?",
	"(Qu¶ ®óng nh­ lêi cña CÈm n­¬ng, hay lµ ®­a bµ ta {HuyÕt Hµ Quû V­¬ng Kh¶i}, {S¬n Quû HuyÕt Y}, {Long B¸ ¤ kim Y} vµ {Thiªn Gi¸ng Bµo}, nÕu kh«ng bµ ta sÏ kh«ng chŞu ®­a y phôc cho ta)",
	}
	
local strTalk_3 = {
	"Kh«ng ph¶i ng­¬i nãi CÈm N­¬ng ®­a trang phôc cho ta sao? Sao kh«ng thÊy g× hÕt vËy?",
	"(Qu¶ ®óng nh­ lêi cña CÈm n­¬ng, hay lµ ®­a bµ ta {Thiªn Y}, {Phi Thiªn Th¸i Th­êng}, {V« Song §Êu Y}, {Ngò Th¸i Nghª Th­êng}, nÕu kh«ng bµ ta sÏ kh«ng chŞu ®­a y phôc cho ta)",
	}

  --ÉÏ½»ÒÂ·ş
  if GetTask(1935) == 1 then
  	if handin_item(1,5) == 1 then
			TalkEx("",strTalk_1);
			SetTask(TASK_WEAVE_SHANSHI,3);
			TaskTip("VÒ Thµnh §« phôc mÖnh CÈm N­¬ng");
  	else
  		TalkEx("",strTalk_2);
  	end
  else
  	if handin_item(1,8) == 1 then
			TalkEx("",strTalk_1);
			SetTask(TASK_WEAVE_SHANSHI,3);
			TaskTip("VÒ Thµnh §« phôc mÖnh CÈm N­¬ng");
		else
  		TalkEx("",strTalk_3);
  	end
  end
end

function weave_shanshi_006()

local strTalk = {
	"Yªn t©m ®i! §Ó ta nhê l¸i bu«n chuyÓn hµng ®Õn §¹i Tèng tiÖn ®­êng sÏ ghĞ ®­a cho s­ phô ng­¬i vµi bé trang phôc cña §¹i Lı, ng­¬i vÒ chê tin ®i!",
	"(Qu¶ nhiªn lµ ng­êi lµm ¨n! §· thÕ còng kh«ng cßn c¸ch nµo kh¸c, hay lµ quay vÒ phôc mÖnh CÈm N­¬ng).",
	}

	TalkEx("",strTalk);

end

function weave_shanshi_007()

local strTalk = {
	"§Ö tö vÒ råi! Chñ tiÖm nãi sÏ nhê l¸i bu«n cña §¹i Lı chuyÓn hµng ®Õn, còng kh«ng biÕt……",
	"Yªn t©m råi! Trang phôc sÏ ®­îc chuyÓn ®Õn nhanh th«i! Bän hä lµ d©n lµm ¨n lu«n lÊy ch÷ tİn lµm ®Çu mµ.",
	"VËy th× hay l¾m! Kh«ng biÕt hiÖn giê s­ phô ®· nghÜ ra trang phôc nµo míi ch­a?",
	"ı t­ëng ®· cã, nh­ng cßn thiÕu nguyªn liÖu! S¬n S­ B× lÇn tr­íc Thî s¨n Tr­¬ng ®­a cho ta võa cøng võa dÎo nh­ng İt qu¸, trong lóc ta dÖt ®· thö thªm L·nh trïng t¬ vµo ®Ó t¨ng ®é dÎo nh­ng l¹i rÊt khã nhuém. Ng­¬i gióp ta hái th¨m Hoµng §¹i ThÈm lµm sao ®Ó nhuém vµ t¨ng tİnh dÎo dai cña S¬n S­ B×.",
	"§Ö tö ®i ngay!",
	}

	TalkEx("",strTalk);
	if GetTask(TASK_WEAVE_SHANSHI) ~= 4 then
		AddItem(2,2,47,1,1);--µÃµ½É½Ê¨Ö®Æ¤
		SetTask(TASK_WEAVE_SHANSHI,4);
	end
	TaskTip("§em S¬n S­ B× ®Õn Thµnh §« t×m Hoµng §¹i ThÈm hái c¸ch nhuém mµu");

end

function weave_shanshi_008()

local strTalk = {
	"Ng­¬i gióp ta hái th¨m Hoµng §¹i ThÈm lµm sao ®Ó nhuém vµ t¨ng tİnh G©n cèt cña S¬n S­ B×.",
	"§Ö tö ®i ngay!",
	}

	TalkEx("",strTalk);
	
end

function weave_shanshi_009()

local strTalk = {
	"Xin chµo ®¹i thÈm !",
	"Ng­¬i lµ ®Ö tö cña CÈm N­¬ng? Bµ ta th­êng khen mi tr­íc mÆt ta! H«m nay t×m ta cã viÖc g×?",
	"S­ phô t¹i h¹ trong lóc may ¸o míi gÆp chót khã kh¨n. S­ phô muèn c¶i thiÖn ®é dÎo cña S¬n S­ B×. Ng­êi ®· thö thªm L·nh trïng t¬, ®é dÎo th× ®­îc c¶i thiÖn nh­ng mµu s¾c l¹i rÊt khã nhuém. Kh«ng biÕt Hoµng §¹i ThÈm cã thÓ gióp S­ phô gi¶i quyÕt vÊn ®Ò?",
	"Mµu Tr¾ng lµ ­u ®iÓm cña ¤ Tµm Ti nh­ng v× nã qu¸ tr¾ng nªn kh«ng thÓ trén lÉn víi mµu kh¸c. ThÕ nµy vËy! Ta cã ¤ Tµm Ti do mét ng­êi b¹n tÆng. ¤ Tµm nµy sèng trong b¨ng tuyÕt l©u n¨m nªn t¬ nã nh¶ ra kh«ng nh÷ng ch¾c mµ cßn ®Ñp. H·y nhËn lÊy kh«ng chõng sÏ gióp ®­îc ng­¬i.",
	"§a t¹ Hoµng §¹i ThÈm!",
	"§õng kh¸ch s¸o! CÈm N­¬ng còng th­êng tÆng ta trang phôc, sè T¬ t»m nµy th× cã ®¸ng lµ bao. H·y mau ®em vÒ cho CÈm N­¬ng!",
	}

	--¿ÛµôÉ½Ê¨Ö®Æ¤
	if DelItem(2,2,47,1) == 1 then
		TalkEx("",strTalk);
		if GetTask(TASK_WEAVE_SHANSHI) ~= 5 then
			AddItem(2,9,7,5,1);--µÃµ½ÎÚ²ÏË¿
			SetTask(TASK_WEAVE_SHANSHI,5);
		end
		TaskTip("§em 5 ¤ T»m Ti cña Hoµng §¹i ThÈm vÒ cho CÈm N­¬ng");
	else
		TalkEx("",{"{1} tÊm {S¬n S­ B×} CÈm N­¬ng nhê ta ®­a cho s­ phô ch¼ng lÏ ®· lµm mÊt trªn ®­êng?"});
	end

end

function weave_shanshi_010()

local strTalk = {
	"§õng kh¸ch s¸o! CÈm N­¬ng còng th­êng tÆng ta trang phôc, sè T¬ t»m nµy th× cã ®¸ng lµ bao. H·y mau ®em vÒ cho CÈm N­¬ng!",
	}

	TalkEx("",strTalk);

end

function weave_shanshi_011()

local strTalk = {
	"§©y lµ ¤ Tµm Ti cña Hoµng §¹i ThÈm, xin s­ phô xem qua!",
	"å! §Ó ta thö xem……",
	" (1 giê sau…)",
	"T¬ t»m nµy qu¶ nhiªn lµ lo¹i th­îng ®¼ng. ë ®©y cã İt ¤ Tµm Ti vµ c¸ch chÕ t¹o S¬n S­ Tinh B×, ng­¬i h·y tõ tõ nghiªn cøu.",
	"§a t¹ s­ phô!",
	}

	--¿Û5·İÎÚ²ÏË¿
	if GetItemCount(2,9,7) >= 5 then
		DelItem(2,9,7,5);
		TalkEx("",strTalk);
		SetTask(TASK_WEAVE_SHANSHI,6);
		AddRecipe(807);
		AddItem(2,9,7,100,1);
		Msg2Player("B¹n häc ®­îc phèi chÕ: S¬n S­ Tinh B×")
	else
		TalkEx("",{"{5} phÇn {¤ Tµm Ti} Hoµng §¹i ThÈm nhê ta ®­a cho s­ phô ch¼ng lÏ ®· lµm mÊt däc ®­êng?"});
	end
end

-------------------------------------------ÖÆ·ûÏµ³àÎÙÁé·ûÅä·½Ñ§Ï°ÈÎÎñ-----------------------------
function juju_chiwu_001()

local strTalk = {
	"Ng­¬i ®Õn ®óng lóc l¾m! GÇn ®©y søc m¹nh cña O¸n Hån ë Phong §« cµng ngµy cµng m¹nh, gÇn ®©y chóng ®· tÊn c«ng Giang T©n th«n, vi s­ ®ang nghÜ c¸ch chÕ t¹o lo¹i phï míi. LÇn tr­íc {L­u NhÊt Phñ} ë {BiÖn Kinh} vµ {Thî má §¹i} ë {Thµnh §«} cã xin ta {Khu Ma linh phï} nh­ng vÉn ch­a ®­a cho hä, ng­¬i h·y thay ta ®i mét chuyÕn!",
	"§Ö tö ®i ngay!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_JUJU_CHIWU,1);
	AddItem(2,0,395,2,1);--µÃÁ½µÀÇıÄ§Áé·û
	TaskTip("§em 2 tÊm Khu Ma linh phï ®Õn cho L­u NhÊt Phñ ë BiÖn Kinh vµ §¹i kho¸ng c«ng ë Thµnh §«.");
end

function juju_chiwu_002()

local strTalk = {
	"LÇn tr­íc {L­u NhÊt Phñ} ë {BiÖn Kinh} vµ {§¹i kho¸ng c«ng} ë {Thµnh §«} cã xin ta {Khu Ma linh phï} nh­ng vÉn ch­a ®­a cho hä, ng­¬i h·y thay ta ®i mét chuyÕn!",
	"§Ö tö ®i ngay!",
	}
	TalkEx("",strTalk);
	
end

function juju_chiwu_003()

local strTalk = {
	"L­u s­ phô! S­ phô t¹i h¹ gÇn ®©y bËn chÕ t¹o mét lo¹i phï míi, kh«ng thÓ ®em Khu Ma linh phï ®Õn cho ng­êi.",
	"GÇn ®©y O¸n Hån th­êng xuÊt hiÖn ë Giang T©n th«n, cã linh phï nµy sau nµy cã thÓ yªn t©m ®µo kho¸ng.",
	"Søc m¹nh cña Khu Ma phï nµy cã h¹n, s­ phô ngµy ®ªm suy nghÜ ®Ó chÕ t¹o lo¹i phï míi nh­ng kh«ng cã kÕt qu¶.",
	"Ta cã Bå §Ò méc, nghe nãi cã thÇn lùc phï hé, kh«ng biÕt cã thÓ gióp İch g× cho s­ phô ng­¬i.",
	"VËy t¹i h¹ thay mÆt s­ phô ®a t¹ L­u s­ phô!",
	"§õng kh¸ch s¸o!",
	}

	TalkEx("",strTalk);
	--É¾È¥ÇıÄ§Áé·û
	if GetItemCount(2,0,395) >= 1 then
		DelItem(2,0,395,1);
	end
	if GetTask(TASK_JUJU_TALK) ~= SetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01,1) then
		AddItem(2,2,14,10,1);--µÃµ½10¸öÆĞÌáÄ¾
		SetTask(TASK_JUJU_TALK,SetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01,1));
	end
	
	if GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_02) == 1 then
		SetTask(TASK_JUJU_CHIWU,2);
		TaskTip("§em Bå §Ò méc vµ H¾c « th¹ch cña L­u NhÊt Phñ vµ §¹i kho¸ng c«ng vÒ cho V©n Du ®¹o nh©n");
	else
		TaskTip("§­a 1 tÊm Khu Ma Linh Phï cho §¹i kho¸ng c«ng ë Thµnh §«");
	end
	
end

function juju_chiwu_004()

local strTalk = {
	"GÇn ®©y O¸n Hån th­êng xuÊt hiÖn ë Giang T©n th«n, cã linh phï nµy sau nµy cã thÓ yªn t©m ®µo kho¸ng.",
	}
	TalkEx("",strTalk);
	
end

function juju_chiwu_005()

local strTalk = {
	"§¹i s­ phô! S­ phô t¹i h¹ gÇn ®©y bËn chÕ t¹o mét lo¹i phï míi, kh«ng thÓ ®em Khu Ma linh phï ®Õn cho ng­êi.",
	"GÇn ®©y O¸n Hån th­êng xuÊt hiÖn ë Giang T©n th«n, cã tÊm phï nµy sau nµy ta yªn t©m ®µo kho¸ng h¬n.",
	"Søc m¹nh cña Khu Ma phï nµy cã h¹n, s­ phô ngµy ®ªm suy nghÜ ®Ó chÕ t¹o lo¹i phï míi nh­ng kh«ng cã kÕt qu¶.",
	"Ta cã chót H¾c « th¹ch. LÇn tr­íc s­ phô ng­¬i cã nhê ta t×m Thiªn thanh th¹ch ®Ó luyÖn bïa, chÊt l­îng cña H¾c « th¹ch nµy tèt h¬n Thiªn thanh th¹ch, kh«ng biÕt cho gióp İch g× cho S­ phô ng­¬i, h·y ®em nã vÒ cho s­ phô!",
	"VËy t¹i h¹ thay mÆt s­ phô ®a t¹ L­u s­ phô!",
	"§õng kh¸ch s¸o!",
	}

	TalkEx("",strTalk);	
	--É¾È¥ÇıÄ§Áé·û
	if GetItemCount(2,0,395) >= 1 then
		DelItem(2,0,395,1);
	end	
	if GetTask(TASK_JUJU_TALK) ~= SetBit(GetTask(TASK_JUJU_TALK),2,1) then
		AddItem(2,2,37,10,1);--µÃµ½10¸öºÚÎÙÊ¯
		SetTask(TASK_JUJU_TALK,(SetBit(GetTask(TASK_JUJU_TALK),2,1)));
	end
	
	if GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01) == 1 then
		SetTask(TASK_JUJU_CHIWU,2);
		TaskTip("§em Bå §Ò méc vµ H¾c « th¹ch cña L­u NhÊt Phñ vµ §¹i kho¸ng c«ng vÒ cho V©n Du ®¹o nh©n");
	else
		TaskTip("§­a 1 tÊm Khu Ma Linh Phï cho L­u NhÊt Phñ ë BiÖn Kinh");
	end
	
end

function juju_chiwu_006()

local strTalk = {
	"GÇn ®©y O¸n Hån th­êng xuÊt hiÖn ë Giang T©n th«n, cã linh phï nµy sau nµy cã thÓ yªn t©m ®µo kho¸ng.",
	}
	TalkEx("",strTalk);
	
end

function juju_chiwu_007()

local strTalk = {
	"§· ®­a linh phï cho L­u s­ phï vµ §¹i s­ phô? Bän hä th­êng ®èn c©y ®µo kho¸ng trong nói s©u, n¬i ®ã ©m khİ tÒ tô, tuy kh¶ n¨ng cña Khu Ma Linh Phï cã h¹n nh­ng gióp tho¸t th©n th× kh«ng vÊn ®Ò g×.",
	"Hä cã göi cho s­ phô {H¾c « th¹ch} vµ {Bå §Ò méc}, hy väng h÷u İch vµ còng ®Ó ®¸p t¹ l¸ bïa cña ng­êi.",
	"§Ó ta xem thö!",
	"H¾c « th¹ch nµy cã tõ tİnh thÇn kú, Bå §Ò méc nµy còng Èn chøa thÇn lùc phï hé. Ng­¬i cÇm thö xem.",
	" (1 giê sau…)",
	}

	--¿Û10·İºÚÎÙÊ¯ºÍÆĞÌáÄ¾
	if DelItem(2,2,37,10) == 1 and DelItem(2,2,14,10) == 1 then
		TalkEx("juju_chiwu_007_01",strTalk);
	else
		TalkEx("",{"{10} {Bå §Ò méc} vµ {H¾c « th¹ch} L­u s­ phô vµ §¹i s­ phô nhê ta ®­a cho s­ phô ch¼ng lÏ däc ®­êng ®· lµm mÊt?"});
	end
end

function juju_chiwu_007_01()

local strTalk = {
	"S­ phô! ThÕ nµo?",
	"2 mãn L­u s­ phô vµ §¹i s­ phô ®­a ta ®Òu lµ b¶o bèi kh«ng nh÷ng t¨ng uy lùc cña bïa chó mµ cßn cã søc m¹nh thÇn kú.",
	"Vi s­ sÏ truyÒn thô cho ng­¬i ph­¬ng ph¸p, ng­¬i h·y cè g¾ng nghiªn cøu kh«ng chõng sÏ ph¸t hiÖn t¸c dông kh¸c cña nã.",
	"§a t¹ s­ phô chØ ®iÓm!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_JUJU_CHIWU,3);
	AddRecipe(808);
	AddItem(2,2,14,100,1);
	Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch ¤ Linh Phï");

end

--²¹Ñ§Åä·½
--nTypeÎª 1:³¤±øÆ÷¡¢2¶Ì±øÆ÷¡¢3ÆæÃÅ±øÆ÷ 4:»¤¼×Ö¯Ôì¡¡5£ºÖÆÒ©¡¡6£ºÅëâ¿
function ReLearnRecipe(nType)
	if (nType == 1) then
		local nLevel = GetLifeSkillLevel(1, 2);
		if (GetLifeSkillLevel(1, 2) > 1) then
      		if (GetTask(1926) == 10 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        		AddRecipe(750)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        		AddRecipe(751)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        		AddRecipe(752)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
       		elseif (GetTask(1926) == 20 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        		AddRecipe(750)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        		AddRecipe(751)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        		AddRecipe(752)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        		AddRecipe(753)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
       		elseif (GetTask(1926) == 30 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        		AddRecipe(750)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        		AddRecipe(751)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        		AddRecipe(752)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        		AddRecipe(753)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        		AddRecipe(754)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        		AddRecipe(755)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
       		elseif (GetTask(1926) == 40 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        		AddRecipe(750)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        		AddRecipe(751)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        		AddRecipe(752)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        		AddRecipe(753)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        		AddRecipe(754)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        		AddRecipe(755)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        		AddRecipe(756)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
       		elseif (GetTask(1926) == 50 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        		AddRecipe(750)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        		AddRecipe(751)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        		AddRecipe(752)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        		AddRecipe(753)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        		AddRecipe(754)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        		AddRecipe(755)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        		AddRecipe(756)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
        		AddRecipe(757)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tiªm Th­¬ng")
       		elseif (GetTask(1926) == 60 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        		AddRecipe(750)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        		AddRecipe(751)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        		AddRecipe(752)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        		AddRecipe(753)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        		AddRecipe(754)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        		AddRecipe(755)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        		AddRecipe(756)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
        		AddRecipe(757)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tiªm Th­¬ng")
        		AddRecipe(758)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tr­îng B¸t Xµ M©u")
       		elseif (GetTask(1926) == 70 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        		AddRecipe(750)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        		AddRecipe(751)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        		AddRecipe(752)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        		AddRecipe(753)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        		AddRecipe(754)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        		AddRecipe(755)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        		AddRecipe(756)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
        		AddRecipe(757)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tiªm Th­¬ng")
        		AddRecipe(758)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tr­îng B¸t Xµ M©u")
        		AddRecipe(759)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ Thiªn Kİch")
      		elseif (GetTask(1926) == 70 and HaveLearnRecipe(749) == 1 and HaveLearnRecipe(759) == 0) then
        		AddRecipe(759)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ Thiªn Kİch")
        	elseif (nLevel >= 1 and GetTask(1926) == 0) then
        		AddRecipe(86)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thñy Háa C«n")
    			AddRecipe(87)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: Tø B×nh C«n")
    			AddRecipe(97)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: Tİch Tr­îng")
    			AddRecipe(98)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: Ho»ng Ph¸p Tr­îng")
        		AddRecipe(749)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
    			AddRecipe(750)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
    			SetTask(1926, 10)
    		elseif (nLevel >= 10 and GetTask(1926) == 10) then
        		AddRecipe(88)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Phæ §é C«n")
        		AddRecipe(89)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: H¹c Vò C«n")
        		AddRecipe(99)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tam B¶o Tr­îng")
        		AddRecipe(100)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Phôc Ma Tr­îng")
        		AddRecipe(751)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        		AddRecipe(752)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        		SetTask(1926, 20)
    		elseif (nLevel >= 20 and GetTask(1926) == 20) then
        		AddRecipe(90)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ph©n Thñy C«n")
        		AddRecipe(101)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Phæ §é Tr­îng")
        		AddRecipe(753)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        		SetTask(1926, 30)
    		elseif (nLevel >= 30 and GetTask(1926) == 30) then
        		AddRecipe(91)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: TiÒm Long C«n")
        		AddRecipe(92)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim L­¬ng")
        		AddRecipe(102)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Lu©n Tr­îng")
        		AddRecipe(103)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Kh«ng Minh Tr­îng")
        		AddRecipe(754)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        		AddRecipe(755)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        		SetTask(1926, 40)
    		elseif (nLevel >= 40 and GetTask(1926) == 40) then
        		AddRecipe(93)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §¶ CÈu Bæng")
        		AddRecipe(94)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: KhÈn Na La Bæng")
        		AddRecipe(104)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: B¶o Quang Tr­îng")
        		AddRecipe(105)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i Tù T¹i Tr­îng")
        		AddRecipe(756)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
        		SetTask(1926, 50)
    		elseif (nLevel >= 50 and GetTask(1926) == 50) then
        		AddRecipe(95)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Xµ C«n")
        		AddRecipe(106)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i B¸t Nh· Tr­îng")
        		AddRecipe(757)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tiªm Th­¬ng")
        		SetTask(1926, 60)
    		elseif (nLevel >= 60 and GetTask(1926) == 60) then
        		AddRecipe(96)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh Long C«n")
        		AddRecipe(107)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn PhËt Tr­îng")
        		AddRecipe(758)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tr­îng B¸t Xµ M©u")
        		SetTask(1926, 70)
       		elseif (nLevel >= 70 and GetTask(1926) == 70) then
        		AddRecipe(759)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ Thiªn Kİch")
        		SetTask(1926, 80)
       		else
       			TalkEx("",{WEAPON_NPC_DATA[nType][1]..": B¹n trÎ! §õng nãng véi! B¶n lÜnh giang hå cña ng­¬i cßn kĞm, chê ng­¬i luyÖn thªm mét thêi gian n÷a h·y ®Õn t×m ta."})
			end
		end
	end
	
	if (nType == 2) then
		local nLevel = GetLifeSkillLevel(1, 3)
		if (GetLifeSkillLevel(1, 3) > 1) then
			if (nLevel >= 1 and GetTask(1926) == 0) then
				AddRecipe(49)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Ng­ Thñ")
	   			AddRecipe(50)
	   			Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ma Thñ")
    			AddRecipe(62)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: Linh Xµ KiÕm")
				AddRecipe(63)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch Sa KiÕm")
    			AddRecipe(73)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: Giíi §ao")
    			AddRecipe(74)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: ChiÕt ThiÕt §ao")
    			AddRecipe(782)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
    			AddRecipe(783)
    			Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
        		SetTask(1926, 10)
    		elseif (nLevel >= 10 and GetTask(1926) == 10) then
        		AddRecipe(51)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn V©n Thñ")
        		AddRecipe(52)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tam D­¬ng Thñ")
        		AddRecipe(64)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh Minh KiÕm")
        		AddRecipe(65)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt S¸t KiÕm")
        		AddRecipe(75)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: LiÖt DiÖm §ao")
        		AddRecipe(76)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò Hæ §o¹n M«n §ao")
        		AddRecipe(784)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §èi Phi Thİch")
        		AddRecipe(785)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ên §ao")
        		SetTask(1926, 20)
    		elseif (nLevel >= 20 and GetTask(1926) == 20) then
        		AddRecipe(53)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Ng­u Thñ")
        		AddRecipe(66)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Hµm Quang KiÕm")
        		AddRecipe(77)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Cöu ¢m §ao")
        		AddRecipe(786)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Biªn Bøc §ao")
        		SetTask(1926, 30)
    		elseif (nLevel >= 30 and GetTask(1926) == 30) then
        		AddRecipe(54)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Bİch Xµ Thñ")
        		AddRecipe(55)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Kh¸ng Long Thñ")
        		AddRecipe(67)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c D­¬ng")
        		AddRecipe(68)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÒn §iÖn")
        		AddRecipe(78)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ S¬n §ao")
        		AddRecipe(79)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Nh©n §å §ao")
        		AddRecipe(787)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Né Hång")
        		AddRecipe(788)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: B¸o Hoa")
        		SetTask(1926, 40)
    		elseif (nLevel >= 40 and GetTask(1926) == 40) then
        		AddRecipe(56)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: T­êng Phông")
        		AddRecipe(57)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Né Long")
        		AddRecipe(69)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh S­¬ng")
        		AddRecipe(70)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Dao Quang")
        		AddRecipe(80)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Long L©n")
        		AddRecipe(81)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: B¸ch Bİch")
        		AddRecipe(789)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Uyªn ¦¬ng Liªn Hoµn")
        		SetTask(1926, 50)
    		elseif (nLevel >= 50 and GetTask(1926) == 50) then
        		AddRecipe(58)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò Ph­¬ng Quû Chóng")
        		AddRecipe(71)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Bİch HuyÕt")
        		AddRecipe(82)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn S¸t")
        		AddRecipe(790)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt Liªn Hoµn")
        		SetTask(1926, 60)
    		elseif nLevel>=60 and GetTask(1926)==60 then
        		AddRecipe(59)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Nª Lª §Şa Ngôc")
        		AddRecipe(72)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÒn thiÕt Träng KiÕm")
        		AddRecipe(83)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: B¸ V­¬ng")
        		AddRecipe(791)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: T«i NguyÖt")
        		SetTask(1926, 70)
      		elseif nLevel>=70 and GetTask(1926)==70 then
        		AddRecipe(792)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §o¹n Tr­êng")
        		SetTask(1926, 80)
      		else
       			TalkEx("",{WEAPON_NPC_DATA[nType][1]..": B¹n trÎ! §õng nãng véi! B¶n lÜnh giang hå cña ng­¬i cßn kĞm, chê ng­¬i luyÖn thªm mét thêi gian n÷a h·y ®Õn t×m ta."})
      		end
    	end 
	end
	
	if (nType == 3) then
			local nLevel = GetLifeSkillLevel(1, 4)
			if (GetLifeSkillLevel(1, 4) > 1) then
				if (GetTask(1926) == 10 and HaveLearnRecipe(760) == 0) then
			  		AddRecipe(760)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			  		AddRecipe(761)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
				elseif GetTask(1926)==20 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			  		AddRecipe(761)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        			AddRecipe(762)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        			AddRecipe(763)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
      			elseif GetTask(1926)==30 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			  		AddRecipe(761)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        			AddRecipe(762)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        			AddRecipe(763)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        			AddRecipe(764)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
      			elseif GetTask(1926)==40 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			  		AddRecipe(761)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        			AddRecipe(762)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        			AddRecipe(763)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        			AddRecipe(764)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        			AddRecipe(765)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        			AddRecipe(766)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
      			elseif GetTask(1926)==50 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			  		AddRecipe(761)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        			AddRecipe(762)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        			AddRecipe(763)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        			AddRecipe(764)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        			AddRecipe(765)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        			AddRecipe(766)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
        			AddRecipe(767)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim")
      			elseif GetTask(1926)==60 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			  		AddRecipe(761)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        			AddRecipe(762)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        			AddRecipe(763)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        			AddRecipe(764)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        			AddRecipe(765)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        			AddRecipe(766)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
        			AddRecipe(767)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim")
        			AddRecipe(768)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Lùc")
      			elseif GetTask(1926)==70 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			  		AddRecipe(761)
			  		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        			AddRecipe(762)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        			AddRecipe(763)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        			AddRecipe(764)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        			AddRecipe(765)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        			AddRecipe(766)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
        			AddRecipe(767)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim")
        			AddRecipe(768)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Lùc")
        			AddRecipe(769)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Xi Nha")     			
        		elseif (nLevel >= 1 and GetTask(1926) == 0) then
        			AddRecipe(110)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp ®ao")
		    		AddRecipe(111)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: §o¹n Tr­êng tiªu")
		    		AddRecipe(121)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: Ngäc VËn cÇm")
		    		AddRecipe(122)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: Kinh §µo cÇm")
		    		AddRecipe(132)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸n Quan bót")
		    		AddRecipe(133)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: ChiÕt Xung bót")
		    		AddRecipe(760)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
		    		AddRecipe(761)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
		    		AddRecipe(771)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt tr¶o")
		    		AddRecipe(772)
		    		Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang tr¶o")
		    		SetTask(1926, 10)
    			elseif (nLevel >= 10 and GetTask(1926) == 10) then
        			AddRecipe(112)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ DiÖt thÇn ch©m")
        			AddRecipe(113)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tö MÉu Ly Hån tiÔn")
        			AddRecipe(123)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: B«n L«i cÇm")
        			AddRecipe(124)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Béc Liªn ch©u")
        			AddRecipe(134)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Xu©n Phong bót")
        			AddRecipe(135)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Kinh L«i bót")
        			AddRecipe(762)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        			AddRecipe(763)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        			AddRecipe(773)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: C¬ Quan tr¶o")
        			AddRecipe(774)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hoµng tr¶o")
        			SetTask(1926, 20)
    			elseif nLevel>=20 and GetTask(1926)==20 then
        			AddRecipe(114)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c HuyÕt thÇn ch©m")
        			AddRecipe(125)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: L«i §éng v¹n vËt")
        			AddRecipe(136)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: V« Håi bót")
        			AddRecipe(764)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        			AddRecipe(775)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: ¸m Thİch")
        			SetTask(1926, 30)
    			elseif nLevel>=30 and GetTask(1926)==30 then
        			AddRecipe(115)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Ngäc Phong ch©m")
        			AddRecipe(116)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tô Lı cµn kh«n")
        			AddRecipe(126)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÒn Nhai phi béc")
        			AddRecipe(127)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: H¶i NguyÖt thanh huy")
        			AddRecipe(137)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt bót")
        			AddRecipe(138)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: ThŞ Hån bót")
        			AddRecipe(765)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        			AddRecipe(766)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
        			AddRecipe(776)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: R¨ng sãi")
        			AddRecipe(777)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Né DiÖm")
        			SetTask(1926, 40)
    			elseif nLevel>=40 and GetTask(1926)==40 then
        			AddRecipe(117)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Hµm Sa X¹ ¶nh")
        			AddRecipe(118)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt Tinh ThÊu Cèt ch©m")
        			AddRecipe(128)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Cöu Tiªu Hoµn béi")
        			AddRecipe(129)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: HiÖu Chung")
        			AddRecipe(139)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Long ThiÖt")
        			AddRecipe(140)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: R¨ng sãi")
        			AddRecipe(767)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim")
        			AddRecipe(778)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n KiÕp")
        			SetTask(1926, 50)
    			elseif nLevel>=50 and GetTask(1926)==50 then
        			AddRecipe(119)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt S¸t Thiªn La")
        			AddRecipe(130)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc Khëi")
        			AddRecipe(141)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ Qu©n")
        			AddRecipe(768)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Lùc")
        			AddRecipe(779)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng Qu©n")
        			SetTask(1926, 60)
    			elseif nLevel>=60 and GetTask(1926)==60 then
        			AddRecipe(120)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Ngo¹i Phi Tiªn")
        			AddRecipe(131)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Tiªu VÜ")
        			AddRecipe(142)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn C¬")
        			AddRecipe(769)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Xi Nha")
        			AddRecipe(780)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ng S­¬ng")
        			SetTask(1926, 70)
    			elseif nLevel>=70 and GetTask(1926)==70 then
    	  			AddRecipe(770)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Long KhÈu")
        			AddRecipe(781)
        			Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò T«n")
        			SetTask(1926, 80)
      			else
       				TalkEx("",{WEAPON_NPC_DATA[nType][1]..": B¹n trÎ! §õng nãng véi! B¶n lÜnh giang hå cña ng­¬i cßn kĞm, chê ng­¬i luyÖn thªm mét thêi gian n÷a h·y ®Õn t×m ta."})
				end
    		end
	end
	
	if (nType == 4) then
		local nLevel = GetLifeSkillLevel(1, 5)
		if (1 == GetTask(1935)) then
			if (nLevel >= 10 and GetTask(1926) == 10) then
				AddRecipe(167)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L©m trang")
				AddRecipe(168)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Hoµng Hæ b× y")
				AddRecipe(149)
				Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Hµnh phôc")
				AddRecipe(150)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh S­¬ng bµo")
				SetTask(1926,20)
			elseif nLevel>=20 and GetTask(1926)==20 then
				AddRecipe(169)
				Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Ng­u hé gi¸p")
				AddRecipe(170)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Thanh S­¬ng Hoa sam")
				AddRecipe(151)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Tham Lam y")
				AddRecipe(152)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch §ång trô")
				SetTask(1926,30)
			elseif nLevel>=30 and GetTask(1926)==30 then
				AddRecipe(171)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Cï Nhiªm kh¸ch y")
				AddRecipe(172)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn NhÉn bİ trang")
				AddRecipe(153)
				Msg2Player("B¹n häc ®­îc phèi chÕ: NhuyÔn Kim y")
				AddRecipe(154)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Th­¬ng Lan y")
				SetTask(1926,40)
			elseif nLevel>=40 and GetTask(1926)==40 then
				AddRecipe(173)
				Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn S¸ch kim gi¸p")
				AddRecipe(174)
				Msg2Player("B¹n häc ®­îc phèi chÕ: L«i Ng©n Gi¸p")
				AddRecipe(155)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Lam K×nh bØ gi¸p")
				AddRecipe(156)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch Long bµo")
				SetTask(1926,50)
			elseif nLevel>=50 and GetTask(1926)==50 then
				AddRecipe(175)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang HuyÒn kim gi¸p")
				AddRecipe(176)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Thï Th¸nh sam")
				AddRecipe(158)
				Msg2Player("B¹n häc ®­îc phèi chÕ: B¨ng Tµm Trï sam")
				AddRecipe(157)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Lang y")
				SetTask(1926, 60)
			elseif nLevel>=60 and GetTask(1926)==60 then
				AddRecipe(177)
				Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt Hµ Quû V­¬ng kh¶i")
				AddRecipe(159)
				Msg2Player("B¹n häc ®­îc phèi chÕ: S¬n Quû HuyÕt y")
				AddRecipe(178)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Long B¸ ¤ kim y")
				AddRecipe(160)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Gi¸ng bµo")
				SetTask(1926, 70)
			else
				Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
			end
		else
			if nLevel>=10 and GetTask(1926)==10 then
				AddRecipe(185)
				Msg2Player("B¹n häc ®­îc phèi chÕ: LuyÖn Gi¸p th­êng")
				AddRecipe(186)
				Msg2Player("B¹n häc ®­îc phèi chÕ: C¸n Hoa th­êng")
				AddRecipe(203)
				Msg2Player("B¹n häc ®­îc phèi chÕ: MËt V©n sam")
				AddRecipe(204)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Vò §Êu th­êng")
				SetTask(1926,20)
			elseif nLevel>=20 and GetTask(1926)==20 then
				AddRecipe(187)
				Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm Anh th­êng")
				AddRecipe(188)
				Msg2Player("B¹n häc ®­îc phèi chÕ: N÷ KiÖt th­êng")
				AddRecipe(205)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Tµm gi¸p y")
				AddRecipe(206)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Khëi La th­êng")
				SetTask(1926,30)
			elseif nLevel>=30 and GetTask(1926)==30 then
				AddRecipe(189)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh Linh th­êng")
				AddRecipe(190)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Nghª th­êng")
				AddRecipe(207)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn C«ng ®Êu y")
				AddRecipe(208)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Linh Lung th­êng")
				SetTask(1926,40)
			elseif nLevel>=40 and GetTask(1926)==40 then
				AddRecipe(191)
				Msg2Player("B¹n häc ®­îc phèi chÕ: L©n Quang gi¸p y")
				AddRecipe(192)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Hå C¬ vò y")
				AddRecipe(209)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Thó V­¬ng ®Êu y")
				AddRecipe(210)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Th¸i Hoa th­êng")
				SetTask(1926,50)
			elseif nLevel>=50 and GetTask(1926)==50 then
				AddRecipe(193)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Minh Quang gi¸p y")
				AddRecipe(194)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Nghª Th­êng vò y")
				AddRecipe(211)
				Msg2Player("B¹n häc ®­îc phèi chÕ: NghŞch V©n ®Êu y")
				AddRecipe(212)
				Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm V©n th­êng")
				SetTask(1926,60)
			elseif nLevel>=60 and GetTask(1926)==60 then
				AddRecipe(195)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Y")
				AddRecipe(196)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Thiªn th¸i th­êng")
				AddRecipe(213)
				Msg2Player("B¹n häc ®­îc phèi chÕ: V« Song ®Êu y")
				AddRecipe(214)
				Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò Th¸i nghª th­êng")
				SetTask(1926,70)
			else
				Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
			end
		end
	end
		
	if nType == 5 then
		local nLevel = GetLifeSkillLevel(1, 6);
		if (nLevel >= 1) then
			if GetTask(1926)>=20 and HaveLearnRecipe(234)==0 then
		    	AddRecipe(234)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            	AddRecipe(239)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            	AddRecipe(244)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
         	elseif GetTask(1926)==30 and HaveLearnRecipe(234)==0 then
            	AddRecipe(234)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            	AddRecipe(239)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            	AddRecipe(244)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            	AddRecipe(235)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            	AddRecipe(245)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
          	elseif GetTask(1926)==40 and HaveLearnRecipe(234)==0 then
          		AddRecipe(234)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            	AddRecipe(239)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            	AddRecipe(244)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            	AddRecipe(235)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            	AddRecipe(245)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            	AddRecipe(240)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            	AddRecipe(246)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
          	elseif GetTask(1926)==50 and HaveLearnRecipe(234)==0 then
	            AddRecipe(234)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            	AddRecipe(239)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            	AddRecipe(244)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            	AddRecipe(235)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            	AddRecipe(245)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            	AddRecipe(240)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            	AddRecipe(246)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
            	AddRecipe(236)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
            	AddRecipe(241)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
          	elseif GetTask(1926)==60 and HaveLearnRecipe(234)==0 then
            	AddRecipe(234)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            	AddRecipe(239)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            	AddRecipe(244)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            	AddRecipe(235)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            	AddRecipe(245)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            	AddRecipe(240)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            	AddRecipe(246)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
            	AddRecipe(236)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
            	AddRecipe(241)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
            	AddRecipe(237)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ DŞch ®¬n")
            	AddRecipe(247)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Cµn Nguyªn Chİnh Khİ ®¬n")
         	elseif GetTask(1926)==70 and HaveLearnRecipe(234)==0 then
            	AddRecipe(234)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            	AddRecipe(239)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            	AddRecipe(244)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            	AddRecipe(235)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            	AddRecipe(245)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            	AddRecipe(240)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            	AddRecipe(246)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
            	AddRecipe(236)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
            	AddRecipe(241)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
            	AddRecipe(237)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ DŞch ®¬n")
            	AddRecipe(247)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Cµn Nguyªn Chİnh Khİ ®¬n")
            	AddRecipe(242)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt Trïng ThÊt Hoa t¸n")
         	elseif GetTask(1926)==80 and HaveLearnRecipe(234)==0 then
	            AddRecipe(234)
    	        Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            	AddRecipe(239)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            	AddRecipe(244)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            	AddRecipe(235)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            	AddRecipe(245)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            	AddRecipe(240)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            	AddRecipe(246)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
            	AddRecipe(236)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
            	AddRecipe(241)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
            	AddRecipe(237)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ DŞch ®¬n")
            	AddRecipe(247)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Cµn Nguyªn Chİnh Khİ ®¬n")
            	AddRecipe(242)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt Trïng ThÊt Hoa t¸n")
            	AddRecipe(238)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: B«n Tinh NguyÖt §¬n")
            	AddRecipe(243)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i NhËt D­¬ng T¸n")
            	AddRecipe(248)
            	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn V­¬ng Bæ T©m ®¬n")
            elseif (nLevel >= 1 and GetTask(1926) == 0) then
       			AddRecipe(3)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Kim S¸ng t¸n")
        		AddRecipe(8)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: TiÓu Hoµn ®¬n")
    	    	SetTask(1926, 10)  
    		elseif (nLevel >= 10 and GetTask(1926) == 10) then
        		AddRecipe(4)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ HuyÕt t¸n")
        		AddRecipe(13)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh T©m t¸n")
        		AddRecipe(234)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
        		AddRecipe(239)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
		        AddRecipe(244)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
        		SetTask(1926, 20)
    		elseif nLevel>=20 and GetTask(1926)==20 then
        		AddRecipe(9)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Hoµn D­¬ng ®¬n")
        		AddRecipe(14)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: İch Khİ t¸n")
        		AddRecipe(235)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
        		AddRecipe(245)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
        		SetTask(1926, 30)
    		elseif nLevel>=30 and GetTask(1926)==30 then
        		AddRecipe(5)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch V©n t¸n")
        		AddRecipe(240)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
        		AddRecipe(246)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
        		SetTask(1926,40)
    		elseif nLevel>=40 and GetTask(1926)==40 then
        		AddRecipe(10)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i Hoµn ®¬n")
        		AddRecipe(15)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ngäc Linh t¸n")
        		AddRecipe(236)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
        		AddRecipe(241)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
        		SetTask(1926,50)
    		elseif nLevel>=50 and GetTask(1926)==50 then
        		AddRecipe(6)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn H­¬ng CÈm Tôc")
        		AddRecipe(11)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: NhÊt Nguyªn Phôc Thñy ®¬n")
        		AddRecipe(237)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ DŞch ®¬n")
        		AddRecipe(247)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Cµn Nguyªn Chİnh Khİ ®¬n")
        		SetTask(1926,60)
    		elseif nLevel>=60 and GetTask(1926)==60 then
        		AddRecipe(16)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò Hoa Ngäc Lé Hoµn")
        		AddRecipe(7)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c Ngäc §o¹n Tôc cao")
        		AddRecipe(12)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n VËt Quy Nguyªn ®¬n")
        		AddRecipe(242)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt Trïng ThÊt Hoa t¸n")
        		SetTask(1926,70)
      		elseif nLevel>=70 and GetTask(1926)==70 then
	      		AddRecipe(17)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Sinh Sinh Hãa T¸n")
        		AddRecipe(238)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: B«n Tinh NguyÖt §¬n")
        		AddRecipe(243)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i NhËt D­¬ng T¸n")
        		AddRecipe(248)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn V­¬ng Bæ T©m ®¬n")
        		SetTask(1926,80)
       		elseif GetTask(1926)==80 and HaveLearnRecipe(238)==0 then
         		AddRecipe(238)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: B«n Tinh NguyÖt §¬n")
        		AddRecipe(243)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i NhËt D­¬ng T¸n")
        		AddRecipe(248)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn V­¬ng Bæ T©m ®¬n")
    		else
        		Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
      		end
    	end	
	end
	
	if (nType == 6) then 
		local nLevel = GetLifeSkillLevel(1, 7);
		if (nLevel >= 1) then 
			if GetTask(1926)>=20 and HaveLearnRecipe(215)==0 then
				AddRecipe(215)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: M¨ng xµo")
			elseif (nLevel >= 1 and GetTask(1926) == 0) then
        		AddRecipe(18)
	    		Msg2Player("B¹n häc ®­îc phèi chÕ: C¬m n¾m")
	    		AddRecipe(25)
	    		Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªu §ao tö")
	    		SetTask(1926, 10)
    		elseif nLevel>=10 and GetTask(1926)==10 then
        		AddRecipe(19)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Mµn thÇu")
        		AddRecipe(26)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: N÷ Nhi hång")
        		AddRecipe(215)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: M¨ng xµo")
        		SetTask(1926, 20)
    		elseif nLevel>=20 and GetTask(1926)==20 then
        		AddRecipe(22)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tø Quı ®Ëu")
        		SetTask(1926, 30)
    		elseif nLevel>=30 and GetTask(1926)==30 then
        		AddRecipe(20)
        		Msg2Player("B¹n häc ®­îc ph­¬ng ph¸p lµm B¸nh xÕp")
        		AddRecipe(27)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §¹o Hoa h­¬ng")
        		SetTask(1926, 40)
    		elseif nLevel>=40 and GetTask(1926)==40 then
        		AddRecipe(23)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: §Ëu xµo")
        		SetTask(1926, 50)
    		elseif nLevel>=50 and GetTask(1926)==50 then
        		AddRecipe(21)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: B¸nh bao thŞt")
        		AddRecipe(28)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: Tóy Méng töu")
        		SetTask(1926, 60)
        	elseif nLevel>=60 and GetTask(1926)==60 then
        		AddRecipe(24)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C¶i xµo tái")
        		SetTask(1926, 70)
        	elseif nLevel>=70 and GetTask(1926)==70 then
    	  		AddRecipe(218)
        		Msg2Player("B¹n häc ®­îc phèi chÕ: C¬m chiªn trøng")
        		SetTask(1926, 80)
        	else 
        		Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!", 0)
    		end
    	end
	end
end;
	
--¿Õº¯Êı
function nothing()

end

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
