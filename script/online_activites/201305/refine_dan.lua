Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

RD_ACTIVITY_ID = 90
RD_DIALOG_TITLE = "Luy÷n Th«n T∏n ß¨n/Vet_201305_Refine_Dan";
RD_REFINE_COST = 39
RD_REFINE_MAX = 10
RD_USE_MAX = 10
RD_TEAM_SIZE_MIN = 4
RD_TOTAL_COUNT = 20
RD_EXP_AWARD = 50000

RD_EXP_CAP_AWARD = {
	[2] = 600000,
	[3] = 612000,
	[4] = 630000,
	[5] = 660000,
	[6] = 690000,
	[7] = 720000,
	[8] = 810000,	
}

VET_201305_RD_TASKGROUP = TaskManager:Create(1, 13);
VET_201305_RD_TASKGROUP.DaySeq = 1;
VET_201305_RD_TASKGROUP.RefineTimes = 2;
VET_201305_RD_TASKGROUP.UseTimes = 3;
VET_201305_RD_TASKGROUP.TriggerCount = 4;
VET_201305_RD_TASKGROUP.TeamSize = 5;

function Vet_201305_Refine_Dan()
	if gf_CheckEventDateEx(RD_ACTIVITY_ID) ~= 1 then
		Talk(1,"","Event v…n ch≠a khÎi ÆÈng");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh´ng gian hµnh trang kh´ng ÆÒ");
		return 0;
	end
	if GetItemCount(2,1,30230) < RD_REFINE_COST then
		Talk(1,"",format("C«n <color=red>%d<color>XU mÌi c„ th” luy÷n ch’ Th«n T∏n ß¨n", RD_REFINE_COST));
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Chÿ ÆÈi tr≠Îng mÌi c„ th” k›ch hoπt luy÷n Th«n T∏n ß¨n");
		return 0;
	end
	if GetTeamSize() < RD_TEAM_SIZE_MIN then
		Talk(1,"",format("TÊ ÆÈi tr™n <color=red>%d<color> ng≠Íi c„ th” luy÷n ch’ Th«n T∏n ß¨n", RD_TEAM_SIZE_MIN));
		return 0;
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.DaySeq) ~= zgc_pub_day_turn() then
		VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.DaySeq, zgc_pub_day_turn());
		for i = 2, 10 do
			VET_201305_RD_TASKGROUP:SetTask(i, 0);
		end
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.RefineTimes) >= RD_REFINE_MAX then
		Talk(1,"",format("MÁi ngµy mÁi nh©n vÀt c„ th” luy÷n %d Th«n T∏n ß¨n",RD_REFINE_MAX));
		return 0;
	end
	DoWait(115, 116, 3*60);
end

function Vet_201305_Refine_Dan_Suc()
	if gf_CheckEventDateEx(RD_ACTIVITY_ID) ~= 1 then
		Talk(1,"","Event v…n ch≠a khÎi ÆÈng");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh´ng gian hµnh trang kh´ng ÆÒ");
		return 0;
	end
	if GetItemCount(2,1,30230) < RD_REFINE_COST then
		Talk(1,"",format("C«n <color=red>%d<color>XU mÌi c„ th” luy÷n ch’ Th«n T∏n ß¨n", RD_REFINE_COST));
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Chÿ ÆÈi tr≠Îng mÌi c„ th” k›ch hoπt luy÷n Th«n T∏n ß¨n");
		return 0;
	end
	if GetTeamSize() < RD_TEAM_SIZE_MIN then
		Talk(1,"",format("TÊ ÆÈi tr™n <color=red>%d<color> ng≠Íi c„ th” luy÷n ch’ Th«n T∏n ß¨n", RD_TEAM_SIZE_MIN));
		return 0;
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.DaySeq) ~= zgc_pub_day_turn() then
		VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.DaySeq, zgc_pub_day_turn());
		for i = 2, 10 do
			VET_201305_RD_TASKGROUP:SetTask(i, 0);
		end
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.RefineTimes) >= RD_REFINE_MAX then
		Talk(1,"",format("MÁi ngµy mÁi nh©n vÀt c„ th” luy÷n %d Th«n T∏n ß¨n",RD_REFINE_MAX));
		return 0;
	end
	if DelItem(2,1,30230, RD_REFINE_COST) == 1 then
		gf_AddItemEx2({2,1,30520,1}, "Th«n T∏n ß¨n", "EVENT THAN TAN DON 2013", "Luy÷n Th«n T∏n ß¨n", 15*24*3600, 1);
		VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.RefineTimes, VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.RefineTimes) + 1);
	end
end


--…Ò…¢µ§ π”√Ω≈±æ
function OnUse(nItem)
    	local nDate = tonumber(date("%y%m%d"))
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.DaySeq) ~= nDate then
		VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.DaySeq, nDate);
		for i = 2, 10 do
			VET_201305_RD_TASKGROUP:SetTask(i, 0);
		end
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.UseTimes) >= RD_USE_MAX then
		Talk(1,"",format("MÁi ngµy mÁi nh©n vÀt c„ th” sˆ dÙng %d Th«n T∏n ß¨n",RD_USE_MAX));
		return 0;
	end
	if GetTeamSize() < 2 then
		Talk(1,"","TÊ ÆÈi tr™n 2 ng≠Íi c„ th” sˆ dÙng Th«n T∏n ß¨n")
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Chÿ ÆÈi tr≠Îng mÌi c„ th” k›ch hoπt luy÷n Th«n T∏n ß¨n");
		return 0;
	end
	if GetTrigger(1531*2) ~= 0 then
		Talk(1,"","Kh´ng th” sˆ dÙng lπi Th«n T∏n ß¨n");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.TeamSize, GetTeamSize());
	VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.TriggerCount, 0);
	VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.UseTimes, VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.UseTimes) + 1);
	CreateTrigger(1, 1531, 1531*2);
	ContinueTimer(GetTrigger(1531*2));
end

function OnTimer()
	local nCount = VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.TriggerCount);
	if nCount >= RD_TOTAL_COUNT then
		RemoveTrigger(GetTrigger(1531*2));
		Msg2Player("T∏c dÙng cÒa Th«n T∏n ß¨n k’t thÛc");
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		RemoveTrigger(GetTrigger(1531*2));
		Talk(1,"","Chÿ c„ ÆÈi tr≠Îng mÌi nhÀn Æ≠Óc hi÷u qu∂ Th«n T∏n ß¨n");
		return 0;
	end
--	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.TeamSize) < GetTeamSize() then
--		RemoveTrigger(GetTrigger(1531*2));
--		Msg2Player("Thµnh vi™n trong tÊ ÆÈi c„ s˘ thay ÆÊi".."T∏c dÙng cÒa Th«n T∏n ß¨n k’t thÛc");
--		return 0;
--	end
	VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.TriggerCount, nCount + 1);
	local OldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if OldPlayerIndex == PlayerIndex then
			if RD_EXP_CAP_AWARD[GetTeamSize()] then
				ModifyExp(RD_EXP_CAP_AWARD[GetTeamSize()]);
				Msg2Player(format("Th«n T∏n ß¨n: c∏c hπ nhÀn Æ≠Óc %d kinh nghi÷m [%d/%d]", RD_EXP_CAP_AWARD[GetTeamSize()], nCount, RD_TOTAL_COUNT));
			end
		else
			ModifyExp(RD_EXP_AWARD);
			Msg2Player(format("Th«n T∏n ß¨n: c∏c hπ nhÀn Æ≠Óc %d kinh nghi÷m [%d/%d]", RD_EXP_AWARD, nCount, RD_TOTAL_COUNT));
		end
	end
	PlayerIndex = OldPlayerIndex;
end