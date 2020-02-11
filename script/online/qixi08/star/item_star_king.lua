--file name:star_item.lua
--author:yanjun
--create date:2006-6-26
--describe:06ÄêÆßÏ¦»î¶¯Á÷ÐÇ£¨ÎïÆ·£©½Å±¾
Include("\\script\\online\\qixi08\\star\\head.lua");
Include("\\script\\lib\\globalfunctions.lua")
function OnUse()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TSK_AOYUN_PLANT_STAR) >= nDate then
		Talk(1,"","H«m nay ng­¬i ®· th¾p s¸ng c¸c ng«i sao, mçi ng­êi mçi ngµy chØ cã thÓ th¾p s¸ng 1 lÇn.");
		return 0;
	end;
	local nMapID = GetWorldPos()
	if nMapID ~= GALAXY_MAP1 and nMapID ~= GALAXY_MAP2 and nMapID ~= GALAXY_MAP3 then
		Talk(1,"","B¹n chØ cã thÓ ch¹m vµo mét ng«i sao s¸ng trªn Ng©n Hµ.");
		return 0;
	end;
	if gf_JudgeRoomWeight(5,20) == 0 then
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
	if DelItem(2,0,1071,1) == 1 then
		local nMapID,nMapX,nMapY = GetWorldPos();
		local nNpcIndex = CreateNpc("Ng­êi V« h×nh",sName,nMapID,nMapX,nMapY);
		local nTimeLeft = get_time_left();
		SetNpcLifeTime(nNpcIndex,nTimeLeft);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
		for i=1,7 do	--´óÐÇÐÇÒ»¹²Òª8¸öÌØÐ§
			nNpcIndex = CreateNpc("Ng­êi V« h×nh"," ",nMapID,nMapX,nMapY);
			SetNpcLifeTime(nNpcIndex,nTimeLeft);
			SetCurrentNpcSFX(nNpcIndex,935,1,1);
		end;
		SetTask(TSK_AOYUN_PLANT_STAR,nDate);
		local nLevel = GetLevel();
		local nExpAward = floor((nLevel^2)/(80^2)*2000000);
		if nLevel ~= 99 then
			ModifyExp(nExpAward);
			Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");
			AddItem(2,1,2642,2);
			Msg2Player("B¹n nhËn ®­îc 2 Tói b¶o th¹ch");
			WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."Lo¹i Tinh Tinh Chi V­¬ng, nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm vµ 2 Tói b¶o th¹ch");
		else
			AddItem(2,1,2642,4);
			Msg2Player("B¹n nhËn ®­îc 4 Tói b¶o th¹ch");
			WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."Trång Tinh Tinh Chi V­¬ng nhËn ®­îc 4 Tói b¶o th¹ch");
		end;
		if GetSex() == 1 then
			AddItem(2,0,352,1);
			Msg2Player("B¹n nhËn ®­îc 1 H¹t gièng hoa hång");
			WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."Trång Tinh Tinh Chi V­¬ng nhËn ®­îc 1 H¹t gièng hoa hång");
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
