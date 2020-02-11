--file name:star_item.lua
--author:yanjun
--create date:2006-6-26
--describe:06ÄêÆßÏ¦»î¶¯Á÷ÐÇ£¨ÎïÆ·£©½Å±¾
Include("\\script\\online\\qixi06\\qixi06_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnUse()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(1981) >= nDate then
		Talk(1,"","H«m nay ng­¬i ®· th¾p s¸ng c¸c ng«i sao, mçi ng­êi mçi ngµy chØ cã thÓ th¾p s¸ng 1 lÇn.");
		return 0;
	end;
	local nMapID = GetWorldPos()
	if nMapID ~= GALAXY_MAP1 and nMapID ~= GALAXY_MAP2 and nMapID ~= GALAXY_MAP3 then
		Talk(1,"","B¹n chØ cã thÓ th¾p s¸ng sao trªn d¶i Ng©n Hµ");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,10) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc cña ng­¬i kh«ng ®ñ, xin kiÓm tra l¹i tr­íc!");
		return 0;
	end;
	AskClientForString("create_star","",1,14,"H·y nhËp tªn cña ng«i sao:");
end;

function create_star(sName)
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%Y%m%d"));
	local nOldPlayerIndex = PlayerIndex;
	local nRandomNum = 0;
	if nMapID ~= GALAXY_MAP1 and nMapID ~= GALAXY_MAP2 and nMapID ~= GALAXY_MAP3 then
		Talk(1,"","B¹n chØ cã thÓ th¾p s¸ng sao trªn d¶i Ng©n Hµ");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	if DelItem(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4],1) == 1 then
		local nNpcIndex = CreateNpc("Ng­êi V« h×nh",sName,GetWorldPos());
		local nTimeLeft = get_time_left();
		SetNpcLifeTime(nNpcIndex,nTimeLeft);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
		SetTask(1981,nDate);
		local nLevel = GetLevel();
		if nLevel ~= 99 then
			local nExpAward = floor((nLevel^2)/(80^2)*1000000);
			ModifyExp(nExpAward);
			Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");
			WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."Th¾p sao nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");
		else
			AddItem(2,1,2642,2);
			Msg2Player("B¹n nhËn ®­îc 2 Tói b¶o th¹ch");
			WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."Th¾p sao nhËn ®­îc 2 Tói b¶o th¹ch");		
		end;
		Msg2Player("Sao cña ng­¬i ®· th¾p s¸ng, thêi gian t¾t hiÖn giê cßn "..tf_GetTimeString(nTimeLeft));
	end;
end;

function get_time_left()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nTimeLeft = (23-nHour)*3600+(59-nMin)*60+(59-nSec)
	return nTimeLeft;
end;
