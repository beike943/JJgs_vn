--filename:chocolate_item.lua
--create date:2006-01-19
--author:yanjun
--describe:ÇÉ¿ËÁ¦µÀ¾ß½Å±¾
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110214 or nDate > 110220 then
		Talk(1, "", "S«c«la ®· hÕt h¹n sö dông!")
		return
	end
	if IsLoversTeam() == 1 then
		if GetSex() ~= 1 then
			Say("ChØ cã nam nh©n míi ®­îc phÐp sö dông.",0)
			return 0
		end
		local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
		if (nPlayerMapId ~= 100 and nPlayerMapId ~= 150 and nPlayerMapId ~= 200 and nPlayerMapId ~= 300 and nPlayerMapId ~= 350 and nPlayerMapId ~= 400 and nPlayerMapId ~= 500) then
			Talk(1,"","S«c«la chØ cã thÓ sö dông ë 7 ®¹i thµnh thÞ!")
			return	
		end
		local nOldPlayerIndex = PlayerIndex
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if GetPlayerRoute() == 0 or GetLevel() < 77 then
				Talk(1, "", "ChØ cã nh©n vËt cÊp 77 trë lªn ®· gia nhËp m«n ph¸i míi cã thÓ tham gia ho¹t ®éng nµy!")
				return
			end
			local nDate = tonumber(date("%y%m%d"))
			local nUsedDate = floor(GetTask(TSK_VALENTINE_USE_FLAG_2011) / 100)
			if nDate ~= nUsedDate then
				SetTask(TSK_VALENTINE_USE_FLAG_2011, nDate * 100)
			end
			
			local nGetUsed = mod(GetTask(TSK_VALENTINE_USE_FLAG_2011), 10)
			if nGetUsed >= 4 then
				gf_Msg2Team("Cã ng­êi trong tæ ®éi cña b¹n ®· sö dông S«c«la ®ñ 4 lÇn trong ngµy, kh«ng thÓ sö dông thªm!")
				return
			end
			
			local nUsedExp = GetTask(TSK_VALENTINE_USED_EXP_2011)
			if nUsedExp >= 28000000 then
				Talk(1, "", "B¹n ®· sö dông S«c«la ®¹t tèi ®a sè ®iÓm kinh nghiÖm cho phÐp, kh«ng thÓ sö dông thªm!")
				return
			end
		end
		PlayerIndex = nOldPlayerIndex
		
		if GetTrigger(TRIGGER_USER_DEFINE_VALENTINE_2011) ~= 0 then
			Talk(1,"","B¹n ®ang sö dông S«c«la råi, h·y chê ®Õn khi sö dông xong!")
			return
		end
		
		if DelItemByIndex(nItemIdx, 1) == 1 then
			local nOldPlayerIndex = PlayerIndex
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				CreateTrigger(1, TRIGGER_TB_DEFINE_VALENTINE_2011, TRIGGER_USER_DEFINE_VALENTINE_2011);
	        		ContinueTimer(GetTrigger(TRIGGER_USER_DEFINE_VALENTINE_2011))
	        		
	        		local nTimes = floor(mod(GetTask(TSK_VALENTINE_USE_FLAG_2011), 100) / 10)
	        		SetTask(TSK_VALENTINE_USE_FLAG_2011, GetTask(TSK_VALENTINE_USE_FLAG_2011) - (nTimes * 10) + 1)
	        		gf_WriteLogEx("Valentine 2011", "sö dông S«c«la")
	        	end
	        	local nOldPlayerIndex = PlayerIndex
		end
	else
		Say("2 ng­êi kh¸c ph¸i tæ ®éi míi cã thÓ ¨n S«c«la.",0)
	end		
end		
		--µÚ2×Ö½ÚÓÃÀ´±ê¼ÇÍæ¼Òµ±ÌìÊÇ·ñÊ¹ÓÃ¹ýÇÉ¿ËÁ¦
--		local nDay = tonumber(date("%d"))
--		if GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),2) < nDay then
--			SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3,0))
--		end
--		
--		local qklleft = 7 - GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3)
--		if qklleft <= 0 then
--			Say("H«m nay b¹n ®· sö dông 7 thanh chocola, ngµy mai h·y sö dông tiÕp nhÐ!",0)
--			return 0
--		end
--		
--		local selTab = {
--			"§ång ý/ok",
--			"Hñy bá/cancel"
--		}
--		Say("Tr­íc khi ¨n, h·y x¸c nhËn b¹n vµ ®éi h÷u ®· kÕt thµnh h¶o h÷u ch­a? NÕu kh«ng, ¨n S«c«la sÏ kh«ng hiÖu qu¶. B»ng h÷u cßn cã thÓ ¨n <color=yellow>"..qklleft.."<color> thái S«c«la. B»ng h÷u cã muèn ¨n S«c«la kh«ng?",2,selTab)
--	else
--		Say("2 ng­êi kh¸c ph¸i tæ ®éi míi cã thÓ ¨n S«c«la.",0)
--	end
--end

function ok()
	local OldPlayerIndex = PlayerIndex
	local nDay = tonumber(date("%d"))
	if DelItem(2,0,361,1) == 1 then
		local player_name
		PlayerIndex = GetTeamMember(1)
		player_name = GetName()
		PlayerIndex = GetTeamMember(2)
		ModifyFriendliness(player_name,2+random(1,4))
		PlayerIndex = OldPlayerIndex
		WriteLog("[LÔ t×nh nh©n vµ nguyªn tiªu]:"..GetName().."§· sö dông S«c«la. ")
		SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),2,nDay))
		SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3,GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3)+1))
	end
end

function cancel()

end
