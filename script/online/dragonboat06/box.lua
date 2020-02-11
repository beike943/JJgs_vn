Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local npcIndex = GetTriggeringUnit();
	SetNpcLifeTime(npcIndex,0);
	local nRandomNum = random(1,100);
	if nRandomNum <= 10 then
		doeffect(1,"state_move_speed_percent_add",20,5)	--×ÔÉí¼ÓËÙ20%5Ãë
		Msg2Player("B¹n nhËn ®­îc t¨ng tèc 20% trong 5 gi©y");
	elseif nRandomNum <= 20 then
		doeffect(2,"state_move_speed_percent_add",20,5)	--ÆäËûÑ¡ÊÖ¼ÓËÙ20%5Ãë
		Msg2MSAll(MISSION_ID,GetName().."Mäi ng­êi ®­îc t¨ng 20% tèc ®é trong 5 gi©y");
	elseif nRandomNum <= 30 then
		doeffect(1,"state_dispear",0,10)	--×ÔÉíÎÞµÐ10Ãë
		Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ v« ®Þch trong 10 gi©y");
	elseif nRandomNum <= 40 then
		doeffect(2,"state_dispear",0,5)	--ÆäËûÑ¡ÊÖÎÞµÐ5Ãë
		Msg2MSAll(MISSION_ID,GetName().."Mäi ng­êi ®­îc tr¹ng th¸i v« ®Þch trong 5 gi©y");
	elseif nRandomNum <= 44 then
		doeffect(1,"state_slow",20,5)	--×ÔÉí¼õËÙ20%5Ãë
		Msg2Player("B¹n bÞ gi¶m 20% tèc ®é trong 5 gi©y");
	elseif nRandomNum <= 48 then
		doeffect(2,"state_slow",20,5)	--ÆäËûÈË¼õËÙ20%5Ãë
		Msg2MSAll(MISSION_ID,GetName().."Mäi ng­êi gi¶m 20% tèc ®é trong 5 gi©y");
	elseif nRandomNum <= 52 then
		doeffect(1,"state_confusion",0,3)	--×ÔÉí»ìÂÒ3Ãë
		Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ hçn lo¹n trong 3 gi©y");
	elseif nRandomNum <= 56 then
		doeffect(2,"state_confusion",0,3)	--ÆäËûÑ¡ÊÖ»ìÂÒ3Ãë
		Msg2MSAll(MISSION_ID,GetName().."Mäi ng­êi bÞ lo¹n trong 3 gi©y");
	elseif nRandomNum <= 60 then
		doeffect(1,"state_sleep",0,3)	--×ÔÉíË¯Ãß3Ãë
		Msg2Player("Mäi ng­êi sÏ r¬i vµo tr¹ng th¸i ngñ mª trong 3 gi©y.");
	elseif nRandomNum <= 64 then
		doeffect(2,"state_sleep",0,3)	--ÆäËûÑ¡ÊÖË¯Ãß3Ãë
		Msg2MSAll(MISSION_ID,GetName().."Mäi ng­êi sÏ r¬i vµo tr¹ng th¸i ngñ mª trong 3 gi©y.");
	elseif nRandomNum <= 67 then
		doeffect(1,"state_vertigo",0,3)	--×ÔÉíÑ£ÔÎ3Ãë
		Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ cho¸ng trong 3 gi©y");
	elseif nRandomNum <= 70 then
		doeffect(2,"state_vertigo",0,3)	--ÆäËûÈËÑ£ÔÎ3Ãë
		Msg2MSAll(MISSION_ID,GetName().."Mäi ng­êi bÞ cho¸ng trong 3 gi©y");
	elseif nRandomNum <= 73 then
		doeffect(1,"state_fetter",0,3)	--×ÔÉí¶¨Éí3Ãë
		Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ ®Þnh th©n trong 3 gi©y");
	elseif nRandomNum <= 76 then
		doeffect(2,"state_fetter",0,3)	--ÆäËûÈË¶¨Éí3Ãë
		Msg2MSAll(MISSION_ID,GetName().."Mäi ng­êi ®Þnh th©n trong 3 gi©y");
	elseif nRandomNum <= 84 then
		ModifyReputation(2,0)	--2µãÉùÍû
		Msg2Player("B¹n nhËn ®­îc 2 ®iÓm danh väng");
	elseif nRandomNum <= 92 then
		Earn(20000)	--2Á½½ð×Ó
		Msg2Player("B¹n nhËn ®­îc 2 l­îng vµng");
	elseif nRandomNum <= 100 then
		ModifyPopur(100)	--10ÐÞÎª
		Msg2Player("B¹n nhËn ®­îc 100 ®iÓm tu luyÖn");
	else
		Write_Log("Ho¹t ®éng tÕt §oan Ngä sai sãt","Khi më r­¬ng, lçi hµm sè ngÉu nhiªn! Tªn nh©n vËt:"..GetName())
	end;
end;

--nTypeÎª£±Ê±£¬×÷ÓÃÓÚ×Ô¼º£»Îª£²Ê±×÷ÓÃÓÚÆäËûÈË£¬Îª£³Ê±×÷ÓÃÓÚËùÓÐÈË
function doeffect(nType,sStr,nParam,nTime)
	local OldPlayerIndex = PlayerIndex;
	if nType == 1 then
		CastState(sStr,nParam,nTime*18);
	elseif nType == 2 then
		for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
			PlayerIndex = Get_Player_By_Rank(i);
			if PlayerIndex > 0 and PlayerIndex ~= OldPlayerIndex and GetTask(POSITION) ~= TRAPCOUNT then
				CastState(sStr,nParam,nTime*18);
			end;
		end;
	elseif nType == 3 then
		for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
			PlayerIndex = Get_Player_By_Rank(i);
			if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT then
				CastState(sStr,nParam,nTime*18);
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;