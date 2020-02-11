--filename:xiaonianshou_death.lua
--create date:2006-01-11
--author:yanjun
--describe:Ð¡ÄêÊÞ¶Ô»°½Å±¾
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
Include("\\script\\lib\\globalfunctions.lua");
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	local nTimeNow = GetTime();
	if nTimeNow - GetTask(TASK_GOT_NIANSHOU) >= 3600 then
		if gf_JudgeRoomWeight(1,10) == 1 then
			SetNpcLifeTime(nNpcIndex, 0)
			SetTask(TASK_GOT_NIANSHOU,nTimeNow);
			
			local nRet, nItem = 0, 0;
			nRet, nItem = gf_AddItemEx( {2,1,30002,1,1}, "MËu tý ®¹i hång bao" );
			if nRet ~= 0 and nItem ~= nil then
				nRet = gf_setItemExpireDate(nItem, 2008, 2, 29, 24);
				if nRet ~= 1 then
					WriteLog("Thêi h¹n sö dông MËu tý ®¹i hång bao thÊt b¹i: date = 2008, 2, 29, 24");
				end
				WriteLog("[Ho¹t ®éng n¨m míi]:"..GetName().."B¹n nhËn ®­îc 1 MËu tý ®¹i hång bao.");
			end
		else
			Msg2Player("Kho¶ng trèng trong tói hµnh trang kh«ng ®ñ");
		end;
	else
		Msg2Player("Mçi ng­êi, mçi ngµy chØ cã thÓ nhÊn lÊy mét mËu tý §¹i Hång Bao");
	end;
end