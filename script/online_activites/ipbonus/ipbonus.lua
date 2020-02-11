Include("\\script\\online_activites\\ipbonus\\string.lua")
Include("\\script\\lib\\globalfunctions.lua")

function VET_CheckIpBonus()
	--local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	--local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	--local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	--local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);
	--local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	--local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	--local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
	--if (VET_TB_IPBONUS_TEST_IP[szCIP] ~= nil) then
	--	return 1;
	--end
	--return 0;
	local bBonus = GetExtPoint(4);
	
	if (bBonus == 1) then
		return 1;
	end
	return 0;
end

function VET_CheckBusinessRoleLimit()
	local nLevel = GetLevel();
	local nFaction = GetPlayerFaction();
	local nReputation = GetReputation();
	local nShimen = GetTask(336);
	
	if (nLevel >= VET_N_IPBONUS_BUSINESS_LEVEL_LIMIT and nFaction ~= 0 and
		 nReputation >= VET_N_IPBONUS_BUSINESS_REPUTATION_LIMIT and 
		 nShimen >= VET_N_IPBONUS_BUSINESS_SHIMEN_LIMIT) then
		 	
		 	return 1;
	end
	
	return 0;
end

function VET_CheckOnlineRoleLimit()
	local nLevel = GetLevel();
	local nFaction = GetPlayerFaction();
	
	if (nLevel < VET_N_IPBONUS_ONLINE_LEVEL_LIMIT or nFaction == 0) then
		Talk(1,"",format(VET_TB_IPBONUS_MSG[4],VET_N_IPBONUS_ONLINE_LEVEL_LIMIT));
		 return 0;
	end
	
	return 1;
end

function VET_IpBonusDailyPersonalTaskAward()
	if (gf_CheckEventDateEx(VET_IPBONUS_ACTIVITY_ID) ~= 1 or VET_CheckIpBonus() ~= 1) then
		return
	end
	gf_EventGiveCustomAward(1, 100000, 1, VET_STR_IPBONUS_LOG_TITLE, VET_TB_IPBONUS_LOG_ACTION[1]);
	gf_WriteCustomLog(VET_STR_IPBONUS_LOG_TITLE, VET_TB_IPBONUS_LOG_ACTION[1], 1)
end

function VET_IpBonusDailyTeamTaskAward()
	if (gf_CheckEventDateEx(VET_IPBONUS_ACTIVITY_ID) ~= 1 or VET_CheckIpBonus() ~= 1) then
		return
	end
	gf_EventGiveCustomAward(1, 100000, 1, VET_STR_IPBONUS_LOG_TITLE, VET_TB_IPBONUS_LOG_ACTION[2]);
	gf_WriteCustomLog(VET_STR_IPBONUS_LOG_TITLE, VET_TB_IPBONUS_LOG_ACTION[2], 1)
end

function VET_IpBonusBusinessAward()
	if (gf_CheckEventDateEx(VET_IPBONUS_ACTIVITY_ID) ~= 1 or
		 VET_CheckIpBonus() ~= 1 or VET_CheckBusinessRoleLimit() ~= 1) then
		return
	end
	
	gf_EventGiveCustomAward(2, 200, 1, VET_STR_IPBONUS_LOG_TITLE, VET_TB_IPBONUS_LOG_ACTION[3]);
	gf_WriteCustomLog(VET_STR_IPBONUS_LOG_TITLE, VET_TB_IPBONUS_LOG_ACTION[3], 1)
end

function VET_IpBonusSeedAward()
	if (gf_CheckEventDateEx(VET_IPBONUS_ACTIVITY_ID) ~= 1 or VET_CheckIpBonus() ~= 1) then
		return
	end
	gf_EventGiveCustomAward(1, 100000, 1, VET_STR_IPBONUS_LOG_TITLE, VET_TB_IPBONUS_LOG_ACTION[4]);
	gf_WriteCustomLog(VET_STR_IPBONUS_LOG_TITLE, VET_TB_IPBONUS_LOG_ACTION[4], 1)
end

function VET_IpBonusJingNangDaShiJiangDialog(tbSayDialog, szSayHead)
	if (gf_CheckEventDateEx(VET_IPBONUS_ACTIVITY_ID) == 1 and VET_CheckIpBonus() == 1) then
		tinsert(tbSayDialog, format("%s/%s",VET_TB_IPBONUS_JINANG_DLG[4],"VET_IpBonusJingNangDaShiJiangOptDialog"));
	end
	return tbSayDialog, szSayHead;
end

function VET_IpBonusJingNangDaShiJiangOptDialog()
	local szSayHead = "";
	local tbSayDialog = {};
	
	if (gf_CheckEventDateEx(VET_IPBONUS_ACTIVITY_ID) == 1 and VET_CheckIpBonus() == 1) then
	    szSayHead = format("%s",VET_TB_IPBONUS_JINANG_DLG[5]);
	
		tinsert(tbSayDialog, format("%s/%s",VET_TB_IPBONUS_JINANG_DLG[1],"VET_IpBonusGetOnlineAward"));
		tinsert(tbSayDialog, format("%s/%s",VET_TB_IPBONUS_JINANG_DLG[2],"VET_IpBonusGetDailyBuff"));
		tinsert(tbSayDialog, VET_TB_IPBONUS_JINANG_DLG[3].."/gf_DoNothing");
	end
	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

function VET_IpBonusGetOnlineExp(nLevel)
	local nExp = 0;
	for i=1,getn(VET_TB_IPBONUS_ONLINE_EXP) do
		local tbAward = VET_TB_IPBONUS_ONLINE_EXP[i];
		if (nLevel >= tbAward[1]) then
			nExp = tbAward[2];
		end
	end
	return nExp;
end

function VET_IpBonusGetOnlineAward()
	if (VET_CheckOnlineRoleLimit() ~=1) then
		return
	end
	local nBaijuTime = GetTask(GLB_TASK_BAIJUWAN_SMALL);
	if (nBaijuTime < VET_N_IPBONUS_ONLINE_BAIJU_TIME) then
		Talk(1,"",format(VET_TB_IPBONUS_MSG[1],VET_N_IPBONUS_ONLINE_BAIJU_TIME/60))
		return
	end
	
	local _,nOnlineTime,_ = GetAntiEnthrallmentInfo();
	if (nOnlineTime < VET_N_IPBONUS_ONLINE_TIME) then
		Talk(1,"",format(VET_TB_IPBONUS_MSG[2],VET_N_IPBONUS_ONLINE_TIME/3600))
		return
	end
	
	local bGeted = GetTask(VET_TSK_IPBONUS_ONLINE_AWARD);
	if (bGeted ~= 0) then
		Talk(1,"",VET_TB_IPBONUS_MSG[3]);
		return
	end
	
	SetTask(GLB_TASK_BAIJUWAN_SMALL, GetTask(GLB_TASK_BAIJUWAN_SMALL) - VET_N_IPBONUS_ONLINE_BAIJU_TIME);
	
	SetTask(VET_TSK_IPBONUS_ONLINE_AWARD, 1);
	
	gf_EventGiveCustomAward(1, VET_IpBonusGetOnlineExp(GetLevel()), 1, VET_STR_IPBONUS_LOG_TITLE, VET_TB_IPBONUS_LOG_ACTION[4]);
end

function VET_IpBonusGetDailyBuff()
	if (VET_CheckOnlineRoleLimit() ~=1) then
		return
	end
	local nBuffType = GetTask(VET_TSK_IPBONUS_BUFF_TYPE);
	if (nBuffType == 0) then
		nBuffType = random(1,5);
		SetTask(VET_TSK_IPBONUS_BUFF_TYPE,nBuffType);
	end
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
	local tbBuff = VET_TB_IPBONUS_BUFF[nBuffType];
	if (tbBuff ~= nil) then
		CastState(tbBuff[3], tbBuff[4], nLeftTime,1);
		Msg2Player(format(VET_TB_IPBONUS_MSG[5],format(tbBuff[1],tbBuff[2],tbBuff[4])));
	end
end
