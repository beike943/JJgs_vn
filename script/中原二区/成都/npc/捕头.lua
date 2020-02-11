-- ====================== ÎÄ¼şĞÅÏ¢ ======================             
             
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñÊµÌå´¦ÀíÎÄ¼ş             
-- Edited by Starry              
-- 2005/09/05 PM 16:21             
             
-- ======================================================             

--ÒıÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local strButouTitle = "<color=green>Bé ®Çu<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nLevel = GetLevel();
	local nTotalPoint = GetTask(TASK_POINT_TOTAL); 
	
	--»ı·Ö²¹³¥
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Nghe nãi trªn ng­êi cña bän s¸t thñ §­êng còng cã Linh Th¹ch, thiÕu hiÖp ph¶i theo dâi bän chóng!");
	end;
	if nTotalPoint == 0 then
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = GetTask(TASK_KILLER_DONUM)*100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);
	end; 
			
	--¼ì²éÊ±¼äÊÇ·ñÎªÖÜÒ»ÖÁÖÜËÄ20µãÖÁ24µã
	if CheckTime() == 1 then
	
		--½ÓÊÕÈÎÎñµÄµÈ¼¶×îµÍÎª20¼¶
		if nLevel >= 20 then
					
			if task_state == 0 then
				Say(strButouTitle.."GÇn ®©y téi ph¹m c¸c n¬i ngµy mét nhiÒu, ng­êi nha m«n th× bËn bŞu kh«ng biÕt c¸c h¹ cã thÓ gióp mét tay kh«ng?",
					4,
					"Ng­êi luyÖn vâ nh­ chóng ta sao cã thÓ ®øng lµm ng¬!/Task_Confirm",
					"C¸c b­íc nhiÖm vô/Task_Show",
					"Bèi c¶nh nhiÖm vô/Task_Backdrop",
					"T¹i h¹ cßn cã chuyÖn ph¶i lµm!/Taks_Exit");	
			end;
			
			if task_state >= 1 then
			
				local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
				local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
				local nKillerName = getKillerName(nSurnameID,nFirstnameID);	
				local nPosID = GetTask(TASK_KILLER_MAP_ID);
				local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
				Say(strButouTitle.."C¸c h¹ cã ph¶i ®· gióp ta ®¸nh b¹i s¸t thñ xung quanh <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"Ta ®· giÕt/Task_Finish",
					"T¹m thêi ch­a/Taks_Exit",
					"Ta kh«ng muèn giÕt/Task_Cancel");		
			end;
		
		else
			Say(strButouTitle.."Kinh nghiÖm c¸c h¹ cßn kĞm h¬n n÷a giang hå hiÓm ¸c ®îi ®¹t <color=yellow>cÊp 20<color> míi ®Õn t×m ta!",0)
				
		end;
		
	elseif task_state >= 1 then
			
		local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
		local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
		local nKillerName = getKillerName(nSurnameID,nFirstnameID);		
		local nPosID = GetTask(TASK_KILLER_MAP_ID);
		local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
			Say(strButouTitle.."C¸c h¹ cã ph¶i ®· gióp ta ®¸nh b¹i s¸t thñ xung quanh <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"Ta ®· giÕt/Task_Finish",
					"T¹m thêi ch­a/Taks_Exit",
					"Ta kh«ng muèn giÕt/Task_Cancel");		
	else
		Say(strButouTitle.."Tõ <color=yellow>Thø hai<color> ®Õn <color=yellow>Thø N¨m<color>, tõ <color=yellow>20h:00<color> ®Õn <color=yellow>24h:00 <color>. Thêi gian nµy Bé ®Çu míi c«ng bè Danh s¸ch truy n·!",
				3,
				"C¸c b­íc nhiÖm vô/Task_Show",
				"Bèi c¶nh nhiÖm vô/Task_Backdrop",
				"KÕt thóc ®èi tho¹i/Taks_Exit");
	end;
end;

--½ÓÊÜÈÎÎñ
function Task_Confirm()

	local nKillerName = "";
	local nKillerMode = "";
	local nMapName = "";
	local nMapID = 0;
	local nWx,nWy,nMx,nMy = 0,0,0,0;
	local strButouTitle = "<color=green>Bé ®Çu<color>:";
	local nTriggerID = 0;
	local nCustomID = 0;
	local nTime = 0;
	local nBuTouMapID = GetWorldPos();
	local nTotal_DoNum = 0;
	local i=0;
	local nNowTime = GetTime();
	local nLastTime = GetTask(TASK_ACCEPT_TIME);--»ñÈ¡ÉÏÒ»´Î½Ó»ñÈÎÎñÊ±¼ä
	local nCoolTime = 300 - (nNowTime-nLastTime);
			if nLastTime == nil or nCoolTime < 0 then
				nCoolTime = 0;
			end;
	local strCoolTime = TurnTime(nCoolTime);
	
	--¸ù¾İµØµã¶ÁÈ¡¸ÃµØµãÄ¿Ç°½Ó»ñÍ¨¼©ÈÎÎñµÄÈËÊı
--	if nBuTouMapID == 100 then nTotal_DoNum = GetMapTaskTemp(100,1);i=1;end;--ÈªÖİ
--	if nBuTouMapID == 150 then nTotal_DoNum = GetMapTaskTemp(150,1);i=2;end;--ÑïÖİ
--	if nBuTouMapID == 200 then nTotal_DoNum = GetMapTaskTemp(200,1);i=3;end;--ãê¾©
--	if nBuTouMapID == 300 then nTotal_DoNum = GetMapTaskTemp(300,1);i=4;end;--³É¶¼
--	if nBuTouMapID == 350 then nTotal_DoNum = GetMapTaskTemp(350,1);i=5;end;--ÏåÑô
	
--	Ò»ÌìÄÚÍ¬Ò»µØµã²¶¿ì³ö½Ó»ñÈÎÎñ´ÎÊıÉÙÓÚ100
--	if nTotal_DoNum < 100 then 
		
		--½Ó»ñÈÎÎñºóĞèÒª5·ÖÖÓ·½ÄÜ½ÓÏÂÒ»´ÎÈÎÎñ
		if nCoolTime ~= 0 then
			Talk(1,"",strButouTitle.."§õng n«n nãng, c¸c h¹ cßn "..strCoolTime.." míi nhËn ®­îc nhiÖm vô kÕ tiÕp, nh­êng c¬ héi cho ng­êi kh¸c ®i!")
			return
		end;
		
		--Éú³ÉÒ»¸öÉ±ÊÖÊı¾İ
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
				
		SetTask(TASK_KILLER_STATE_ID,1);--½ÓÊÜÒ»¸öÍ¨¼©ÈÎÎñ£¬ÖÃ±äÁ¿Îª 1
		--SetMapTaskTemp(nBuTouMapID,1,nTotal_DoNum+1);--¼ÇÂ¼Ò»ÌìÄÚÈİÒ×µØµã²¶¿ì½Ó»ñÈÎÎñ´ÎÊı
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--¼ÇÂ¼Íæ¼Ò½Ó»ñÈÎÎñÊ±µÄµÈ¼¶
		
		--nTotal_DoNum = GetMapTaskTemp(BuTouMapData[i][1],1);
		
		Say(strButouTitle.."Theo tin th¸m b¸o, s¸t thñ <color=yellow>"..nKillerName.."<color> gÇn ®©y hay xuÊt hiÖn t¹i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H·y ®i diÖt trõ h¾n trõ hËu häa!",0);--£¨ÕâÊÇ±¾´Î¸Ã²¶Í··¢²¼µÄµÄµÚ<color=yellow>"..nTotal_DoNum.."<color>´ÎÈÎÎñ£¬Ã¿´Î·¢²¼ÈÎÎñÊıÁ¿Îª<color=yellow>100<color>´Î¡££©",0);
		
		--Éú³ÉÊ±¼ä´¥·¢Æ÷£¬¼ÆÊıÖµÎª1800
		CreateTrigger(1,400,500);
		ContinueTimer(GetTrigger(500));
		
		--±£´æµ±Ç°Ê±¼ä
		nTime = GetTime();--»ñÈ¡1970ÄêÖÁ½ñ¾­¹ıµÄÃëÊı
		SetTask(TASK_ACCEPT_TIME,nTime);
		
		--Éú³ÉµØÍ¼´¥·¢Æ÷
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--±£´æµØÍ¼´¥·¢Æ÷ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);

		TaskTip("CÇn hoµn thµnh nhiÖm vô trong 30 phót, xem thªm trong lÖnh truy n·!");
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end;
				
--	else
--		Say(strButouTitle.."<color=yellow>"..BuTouMapData[i][2].."<color>±¾ÅúÍ¨¼©Ãûµ¥ÒÑ·¢²¼Íê±Ï£¡",0);
--				 
--	end;
		
end;

--Íê³ÉÈÎÎñ¼°½±ÀøÅäÈ¡
function Task_Finish()

	local strButouTitle = "<color=green>Bé ®Çu<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	if task_state == 2 then
		Say(strButouTitle.."Thay mÆt quan phñ c¸m ¬n c¸c h¹ ra tay gióp ®ì, ®©y lµ phÇn th­ëng!",0);
		KillerAward();
		SetTask(TASK_KILLER_STATE_ID,0);--Íê³ÉÈÎÎñ£¬ÈÎÎñ×´Ì¬ÖÃ0
		SetTask(TASK_KILLER_DONUM,nDoNum+1);--Íê³ÉÈÎÎñ£¬´ÎÊı¼Ó1
		
		--»ı·ÖÀÛ¼Æ´¦Àí
		local nTotalPoint = GetTask(TASK_POINT_TOTAL);
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = nTotalPoint + 100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);	
		
		--É¾È¥Í¨¼©Áî
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;
		-- Ê¦Í½ÈÎÎñ £¨É±ÊÖ£©
		local nChance, nMaxChance = CustomDataRead("mp_shashou")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shashou", "dd", nChance, nMaxChance)
				Msg2Player("Hoµn thµnh nhiÖm vô s­ ®å-s¸t thñ:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
	else
		Say(strButouTitle.."Hõ! Tuæi cßn nhá mµ d¸m g¹t ta ­?",0);
	end;
end;

--È¡ÏûÈÎÎñ
function Task_Cancel()

local strButouTitle = "<color=green>Bé ®Çu<color>:";

	Say(strButouTitle.."Sao dÔ n¶n lßng vËy?",
	2,
	"T¹i h¹ ®i giÕt chóng ®©y!/Task_Exit",
	"Ta kh«ng giÕt th× sao!/Task_CancelConfirm");
	
end;

--ÔÙ´ÎÈ·ÈÏÈ¡ÏûÈÎÎñ
function Task_CancelConfirm()

local strButouTitle = "<color=green>Bé ®Çu<color>:";

	SetTask(TASK_KILLER_STATE_ID,0);--È¡ÏûÈÎÎñ£¬ÈÎÎñ×´Ì¬ÖÃ0
	SetTask(TASK_KILLER_STATE_STAR,0);
	Say(strButouTitle.."Hõ! §å v« dông!",0);
	
	TaskPunish();

		--É¾È¥Í¨¼©Áî
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;	
	
	--É¾µô¸ÃµØÍ¼´¥·¢Æ÷
	RemoveTrigger(GetTrigger(600));
	--É¾µôÊ±¼ä´¥·¢Æ÷
	RemoveTrigger(GetTrigger(500));
	
end;

--Í¨¼©ÈÎÎñÁ÷³ÌËµÃ÷
function Task_Show()

local str1 = "Nh©n sÜ <color=yellow>tõ cÊp 20 trë lªn<color>, lóc <color=yellow>20h:00<color> ®Õn <color=yellow>24h:00<color> tõ <color=yellow>Thø hai<color> ®Õn <color=yellow>Thø n¨m<color> hµng tuÇn, cã thÓ ®Õn c¸c Nha m«n gÆp <color=yellow>Bé ®Çu<color> nhËn nhiÖm vô Truy n·!";
local str2 = "Khi ®· nhËn danh s¸ch truy n· <color=yellow>néi trong 30 phót<color> ph¶i truy t×m cho ®­îc s¸t thñ, nÕu qu¸ thêi gian hoÆc hñy bá nhiÖm vô th× xem nh­ nhiÖm vô thÊt b¹i.";
local str3 = "Dï hoµn thµnh nhiÖm vô, hñy nhiÖm vô hay nhiÖm vô thÊt b¹i ®Òu ph¶i <color=yellow>5 phót<color> sau míi nhËn tiÕp nhiÖm vô.";

	Talk(3,"",str1,str2,str3);

end;

--Í¨¼©ÈÎÎñ±³¾°ËµÃ÷
function Task_Backdrop()

local str1 = "C­êng quèc T©y H¹ n»m ë phİa t©y trung nguyªn tuy vÎ ngoµi kh«ng ®éng tÜnh thùc chÊt ngÊp nghĞ l·nh thæ trung nguyªn, ngoµi cÊu kÕt víi Minh gi¸o ®Ó lîi dông lÉn nhau, chóng cßn gióp c¸c gian thÇn trong triÒu ®×nh.";
local str2 = "T©y H¹ tİn ng­ìng vâ häc, s¸ng lËp ra NhÊt PhÇm ®­êng víi c¸c kú nh©n dŞ sÜ. Hä ®­îc xem lµ c¬ cÊu ®èi ngo¹i tèt nhÊt cña T©y H¹, tæ chøc nµy tõng ph¸i s¸t thñ ®Õn trung nguyªn ph¸ ho¹i vµ giÕt kh«ng İt c¸c trung thÇn.";
local str3 = "Lµ con ch¸u ®¹i Tèng sao ng­¬i cã thÓ khoanh tay ®øng nh×n…...";
	
	Talk(3,"",str1,str2,str3);
	
end;
	
--¿Õº¯Êı£¬²»×öÈÎºÎÊÂ
function Taks_Exit()

end;
