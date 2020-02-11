-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±NPCÍÞÍÞÉ±ÊÖÕÙ»½ºÍËÀÍöScript
-- By StarryNight
-- 2007/08/07 PM 3:39

-- ======================================================
-- ÒýÓÃ¾çÇéÈÎÎñÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(CREAT_SHASHOUWAWA_TIME);
local strTalk = {
	"Th× ra lµ ng­¬i, tõ xa ta ®· ngõi thÊy mïi th¬m cña KÑo Hå L«, quay l¹i xem th× qu¶ nhiªn lµ KÑo Hå L« cña §­êng Hå L« b¸n. L©u kh«ng gÆp ®· lµ Vò VÖ råi, tèt l¾m. Ng­¬i ®Õn ®©y ®Õn cïng ta gióp Phi Th­êng §¹o Nh©n thu phôc DÞ thó sao? Tèt, Tr­êng Sinh BÊt L·o ®¬n nµy n¾m ch¾c trong tay råi.",
	"Xa Lu©n B¸ V­¬ng sai ta ®Õn cïng ng­¬i gióp Phi Th­êng §¹o Nh©n thu phôc Thó Cæ D­¬ng, nh­ng ta kh«ng t×m ®­îc, sau nhí ra ng­¬i tõng nãi thÝch KÑo Hå L« nªn ®· mua mét Ýt ®Õn ®©y hy väng ng­¬i sÏ xuÊt hiÖn.",
	"Hay l¾m, ng­êi hiÓu ta kh«ng ai ngoµi ng­¬i. TiÓu tö thËt cã lßng, thø ng­¬i mua lµ kÑo hå l« ngon nhÊt §¹i Tèng. Ch¼ng qua ta nhÊt thêi t×m kh«ng ra n¬i Èn n¸u cña Phi Th­êng §¹o Nh©n th«i, tªn Xa Lu©n l¹i lo chuyÖn bao ®ång råi. Nh­ng ng­¬i ®Õn ®©y còng tèt, h·y ®­a kÑo hå l« cho ta ph¶i ¨n xong råi míi cã søc lµm.",
	"Ng­¬i vÉn ch­a biÕt n¬i Èn n¸u cña Phi Th­êng §¹o Nh©n sao? Ta mét lßng muèn thu phôc Thó Cæ D­¬ng, chØ sî sau khi thu phôc Thó Cæ D­¬ng ch­a ch¾c sÏ hîp t¸c víi NhÊt PhÈm ®­êng.",
	}

	if ( nMapID == 512 )and GetFightState() == 1 then
		if GetTask(TASK_XB_ID_01) == 55 then
			if nTime >= 1800 then
				local nNpcIndex = CreateNpc("S¸t Thñ Oa Oa","S¸t Thñ Oa Oa",nMapID,nWx,nWy,-1,1,1,70);
				TalkEx("#OnUse_1("..nNpcIndex..")",strTalk);
				SetNpcLifeTime(nNpcIndex,900); 
				SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\¹ÅÑô¶´Ò»²ã\\npc\\ÍÞÍÞÉ±ÊÖ.lua");				
				SetTask(CREAT_SHASHOUWAWA_TIME,GetTime());
				return
			else
				strTalk = {
					"Thêi gian gi·n c¸ch ®Ó gäi S¸t Thñ Oa Oa lµ 30 phót."
				};
				TalkEx("",strTalk);
			end
		else	
			return
		end
	else
		strTalk = {
			"NÕu S¸t Thñ Oa Oa kh«ng tim thÊy Phi Th­êng §¹o Nh©n ë TÇng 1 th× sÏ ch¹y lªn TÇng 2, hay lµ lªn TÇng 2 xem thö gäi ®­îc S¸t Thñ Oa Oa kh«ng."
		};
		TalkEx("",strTalk);
		end;
	return
end;

function OnUse_1(nNpcIndex)

local strTalk = {
	"Thùc ra chØ lµ lîi dông lÉn nhau th«i. Chóng ta ®· kh«ng sî Thó Cæ D­¬ng dï Phi Th­êng §¹o Nh©n cã trë mÆt th× chóng ta còng kh«ng nÓ mÆt. H×nh nh­ ng­¬i ®· tõng ®Õn Cæ D­¬ng ®éng, sao ng­¬i biÕt N¬i Èn n¸u cña h¾n? TiÓu tö thËt hiÓu ý ta, ®em nhiÒu kÑo hå l« ®Õn ®©y.",
	"N¬i Èn n¸u cña Phi Th­êng §¹o Nh©n lµ mét mËt thÊt, nhÊt thêi th× khã cã thÓ t×m ®­îc, ®îi ng­¬i ¨n xong kÑo hå l« ta cïng nhau ®i t×m.",
	"§­îc, Xa Lu©n ph¸i ng­¬i ®Õn còng cã chót h÷u dông. ¥, sao l¹i cã triÖu chøng nh­ vËy? Nãi mau, ng­¬i vµ Viªn Phi V©n cã quan hÖ g×? µ… th× ra chuyÖn ng­¬i cøu ng­êi trong tay Viªn Phi V©n lµ gi¶… rèt cuéc ng­¬i lµ ai? Sao d¸m nhËp vµo NhÊt PhÈm ®­êng?",
	"Ng­¬i chí cã nhiÒu lêi, theo quy ®Þnh cña NhÊt PhÈm ®­êng th× chuyÖn kh«ng nªn biÕt ®õng hái. Ng­êi cña NhÊt PhÈm ®­êng nham hiÓm ®éc ¸c sím muén cña sÏ bÞ diÖt tËn gèc, nh©n d©n §¹i Tèng sao l¹i ®Ó c¸c ng­¬i tïy tiªn øc hiÕp. TiÕp chiªu ®©y.",
	"Th× ra ng­¬i lµ …",
	}
	
	TalkEx("#OnUse_2("..nNpcIndex..")",strTalk);

end

function OnUse_2(nNpcIndex)

	ChangeNpcToFight(nNpcIndex);
	TaskTip("B¹n ®· triÖu gäi S¸t Thñ Oa Oa, h·y tiªu diÖt nã.");
	Msg2Player("B¹n ®· triÖu gäi S¸t Thñ Oa Oa, h·y tiªu diÖt nã.");
	DelItem(2,0,730,1);--ÃÔ»ê±ùÌÇºùÂ«

end

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {
	"S¸t Thñ Oa Oa qu¶ kh«ng dÔ ®èi phã, nay ®· lÊy ®­îc LÖnh bµi, lµm sao ®Ó cã thÓ qua mÆt Xa Lu©n Ph¸p V­¬ng."
	}
	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 55 then
			TalkEx("",strTalk);
			SetTask(CREAT_SHASHOUWAWA_TIME,0);--±äÁ¿Çå¿Õ
			SetTask(TASK_XB_ID_01,56);
			RemoveTrigger(GetTrigger(KILL_XB_XUNBAOREN));--É¾È¥Ñ°±¦ÈË´¥·¢Æ÷
			AddItem(2,0,754,1,1);--µÃµ½ÍÞÍÞÁîÅÆ
			DelItem(2,0,753,1);--É¾È¥ÃÔÒ©
			TaskTip("§· giÕt chÕt S¸t Thñ Oa Oa, vÒ chç cña Xa Lu©n Ph¸p V­¬ng t×m c¸ch che giÊu qu¸ khø.");
			Msg2Player("§· giÕt chÕt S¸t Thñ Oa Oa, vÒ chç cña Xa Lu©n Ph¸p V­¬ng t×m c¸ch che giÊu qu¸ khø.");
			GivePlayerAward("Award_XB_48","Easy");
		end;	
  else
    for i=1,nMemCount do
       PlayerIndex = GetTeamMember(i);
       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
       if GetTask(TASK_XB_ID_01) == 55 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
       	TalkEx("",strTalk);
       	SetTask(TASK_XB_ID_01, 56);
       	SetTask(CREAT_SHASHOUWAWA_TIME,0);--±äÁ¿Çå¿Õ
       	RemoveTrigger(GetTrigger(KILL_XB_XUNBAOREN));--É¾È¥Ñ°±¦ÈË´¥·¢Æ÷
       	AddItem(2,0,754,1,1);--µÃµ½ÍÞÍÞÁîÅÆ
       	DelItem(2,0,753,1);--É¾È¥ÃÔÒ©
				TaskTip("§· giÕt chÕt S¸t Thñ Oa Oa, vÒ chç cña Xa Lu©n Ph¸p V­¬ng t×m c¸ch che giÊu qu¸ khø.");
				Msg2Player("§· giÕt chÕt S¸t Thñ Oa Oa, vÒ chç cña Xa Lu©n Ph¸p V­¬ng t×m c¸ch che giÊu qu¸ khø.");
				GivePlayerAward("Award_XB_48","Easy");
       end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end