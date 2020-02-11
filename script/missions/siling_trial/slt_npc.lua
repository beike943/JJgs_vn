Include("\\script\\lib\\date.lua")
Include("\\script\\missions\\siling_trial\\slt_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

--interface for vng
SLT_NPC_DIALOG = "ThÝ LuyÖn Tø Linh/main_slt";

SLT_NPC = "<color=green>B¾c §Èu L·o Nh©n:<color>"

function main()
	main_slt();
end

function main_slt()
	local tSay = {
		format("Tinh lùc tham dù (Mçi ng­êi tiªu hao %d tinh lùc)/slt_npc_join_1", SLT_COST_NUM_1),
		format("Thiªn Kiªu LÖnh tham dù (§éi tr­ëng tiªu hao %d Thiªn Kiªu LÖnh)/slt_npc_join_2", SLT_COST_NUM_2),
		"Ra khái/nothing",	
	}
	Say(SLT_NPC..format("CÊp %d trë lªn ®ång thêi së h÷u b¹n ®ång hµnh phôc sinh míi cã t­ c¸ch tham gia ThÝ LuyÖn Tø Linh. ThÝ LuyÖn Tø Linh cÇn %d ng­êi trë lªn tæ ®éi míi ®­îc tham gia.", SLT_LIMIT_LEVEL, SLT_LIMIT_PLAYER), getn(tSay), tSay);
end

function slt_npc_join_1()
	local today = Date();
	local wday = today:week();
	if wday ~= 2 and wday ~= 5 and wday ~= 0 then
		Say("ThÝ LuyÖn Tø Linh chØ më vµo thø 3, thø 6 vµ chñ nhËt h»ng tuÇn!", 0);
		return 0;
	end
	if slt_check_team(1) ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local nMapSeq, nAeraSeq = slt_GetRandMap(npcIndex);
	if nMapSeq == 0 or nAeraSeq == 0 then
		Say(SLT_NPC.."T¹m thêi kh«ng cã khu vùc trèng ®Ó tiÕn hµnh ThÝ LuyÖn Tø Linh, xin h·y quay l¹i sau!", 0);
		return 0;
	end
	gf_TeamOperateEX(ModifyEnergy, -SLT_COST_NUM_1, 1);
	slt_JoinAera(npcIndex, nMapSeq, nAeraSeq);
	AddRuntimeStat(26, 1, 0, 1);--¾«Á¦¿ªÆô´ÎÊý
end

function slt_npc_join_2()
	local today = Date();
	local wday = today:week();
	if wday ~= 2 and wday ~= 5 and wday ~= 0 then
		Say("ThÝ LuyÖn Tø Linh chØ më vµo thø 3, thø 6 vµ chñ nhËt h»ng tuÇn!", 0);
		return 0;
	end
	if slt_check_team(2) ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local nMapSeq, nAeraSeq = slt_GetRandMap(npcIndex);
	if nMapSeq == 0 or nAeraSeq == 0 then
		Say(SLT_NPC.."T¹m thêi kh«ng cã khu vùc trèng ®Ó tiÕn hµnh ThÝ LuyÖn Tø Linh, xin h·y quay l¹i sau!", 0);
		return 0;
	end
	if DelItem(2, 97, 236, SLT_COST_NUM_2) ~= 1 then
		return 0;
	end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,SLT_COST_NUM_2})
	slt_JoinAera(npcIndex, nMapSeq, nAeraSeq);
	AddRuntimeStat(26, 1, 1, 1);--IB¿ªÆô´ÎÊý
	AddRuntimeStat(26, 4, 0, SLT_COST_NUM_2);--IBÏûºÄ¼ÆÊý
end

function slt_check_team(nType)
	if GetCaptainName() ~= GetName() then
		Say(SLT_NPC.."ChØ cã ®éi tr­ëng míi cã thÓ b¸o danh tham gia ThÝ LuyÖn Tø Linh!", 0);
		return 0
	end
		
	local nTeamSize = gf_GetTeamSize();
	if nTeamSize < SLT_LIMIT_PLAYER then
		Say(SLT_NPC..format("Tæ ®éi kh«ng ®ñ %d ng­êi, kh«ng thÓ më ThÝ LuyÖn Tø Linh.", SLT_LIMIT_PLAYER), 0);
		return 0;
	end
	
	if gf_CheckTeam(function () 
			if GetLevel() < SLT_LIMIT_LEVEL and gf_GetPlayerRebornCount() <= 0 then
				return 0
			end
			return 1;
		end, SLT_NPC..format("Thµnh viªn d­íi ®©y kh«ng ®¹t cÊp %d:\n", SLT_LIMIT_LEVEL)) ~= 1 then
		return 0;
	end
	
	if gf_CheckTeam(function () 
			if gf_IsWorkingPet() ~= 1 and SLT_CHANGE_PET ~= 0 then
				return 0;
			end
			return 1;
		end, SLT_NPC.."Nh÷ng thµnh viªn d­íi ®©y kh«ng cã b¹n ®ång hµnh xuÊt chiÕn: \n") ~= 1 then
		return 0;
	end
	
	if gf_CheckTeam(function () 
			if CanNpcChangeModel(PIdx2NpcIdx()) ~= 1 and SLT_CHANGE_PET ~= 0 then
				return 0;
			end
			return 1;
		end, SLT_NPC.."Nh÷ng thµnh viªn d­íi ®©y cã thÓ ë tr¹ng th¸i c­ìi ngùa,nghåi thiªn, ®äc,t­¬ng t¸c nªn kh«ng thÓ biÕn th©n: \n") ~= 1 then
		return 0;
	end
	
	if gf_CheckTeam(function () 
			local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
			if bOk == 1 and SLT_CHANGE_PET ~= 0 then
				return 0;
			end
			return 1;
		end, SLT_NPC.."Nh÷ng thµnh viªn d­íi ®©y ®· ë tr¹ng th¸i b¹n ®ång hµnh biÕn th©n: \n") ~= 1 then
		return 0;
	end
	
	if 1 == nType then
		if gf_CheckTeam(function () 
				if ModifyEnergy(0, 1) < SLT_COST_NUM_1 then
					return 0
				end
				return 1;
			end, SLT_NPC..format("Thµnh viªn d­íi ®©y tinh lùc kh«ng ®ñ %d ®iÓm\n", SLT_COST_NUM_1)) ~= 1 then
			return 0;
		end
	else
		if GetItemCount(2, 97, 236) < SLT_COST_NUM_2 then
			Say(SLT_NPC..format("Trong hµnh trang %s sè l­îng kh«ng ®ñ %d", "Thiªn Kiªu LÖnh", SLT_COST_NUM_2), 0);
			return 0
		end
	end
	
	return 1;	
end