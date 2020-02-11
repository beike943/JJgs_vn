-- IP Bonus created by TuanNA5

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua"); -- TaskID cña VNG

IP_SWITCH = 1
IP_TIME_LIMIT = 7246800--2592000
IP_ONLINE_TIME = 2536
IP_TIME_START = 2537

TASK_GET_FUZHU_DATE = 2270
TASK_GET_FUZHU_TYPE = 2271
TASK_GET_DAY_AWARD = 2538
TASK_FULL_8_HOUR = 2540

tBuff = {
		{"C«ng kÝch +4%", 125, {{"state_p_attack_percent_add", 4},{"state_m_attack_percent_add", 4}}},
		{"Kh¸ng tÊt c¶ +8", 125, {{"state_add_allability", 8}}},
		{"Søc m¹nh +8", 125, {{"state_add_strength", 8}}},
		{"Néi c«ng +8", 125, {{"state_add_energy", 8}}},
		{"G©n cèt +8", 125, {{"state_add_vitality", 8}}},
		{"Th©n ph¸p +8", 125, {{"state_add_dexterity", 8}}},
		{"Linh ho¹t +8", 125, {{"state_add_observe", 8}}},
		{"NÐ tr¸nh +50", 125, {{"state_dodge_rate_point_add", 50}}},
}

tOnlineAward = {
	-- S¬ cÊp
	[1] = 	{
				[0] = {250000,0,0,0,0  ,0},
				[3] = {300000,6,6,0,0  ,4},
				[4] = {390000,6,6,0,66,4},
			},
	
	-- Trung cÊp	
	[2] = 	{
				[1] = {0,0,0,0,0,0},
				[2] = {0,0,0,0,0,0},
				[3] = {0,0,0,0,0,0},
			},
			
	-- Cao cÊp
	[3] = 	{
			[0] = {790000,0  ,0   ,0  ,0     ,0},
			[3] = {790000,10,10,10,0     ,6},
			[4] = {888000,10,10,10,199 ,6},
		},
}

tDayAward = {
	[1] = {
				[1] = {"Phï Ên",{2,1,302,200,1}},
				[2] = {"Tµn KiÕm",{2,1,299,200,1}},
				[3] = {"Linh t¶n",{2,1,185,200,1}},
			},
			
	[2] = {
				[1] = {"Linh huyÕt qu©n dông",{2,0,313,240,1}},
				[2] = {"Linh huyÕt qu©n dông",{2,0,313,240,1}},
				[3] = {"Linh huyÕt qu©n dông",{2,0,313,240,1}},
			},
			
	[3] = {
				[1] = {"Tµng KiÕm anh hïng thiÕp",{2,0,31,1,4}},
				[2] = {"Tµng KiÕm anh hïng thiÕp",{2,0,31,1,4}},
				[3] = {"Tµng KiÕm anh hïng thiÕp",{2,0,31,1,4}},
			},
}
VET_70_GAOJIMIJI_NEW =
{
		[2] =  {"Kim Cang B¸t Nh· Ch©n QuyÓn", {0, 107, 204, 1}}, 
		[3] =  {"V« TrÇn Bå §Ò Ch©n QuyÓn", {0, 107, 206, 1}}, 
		[4] =  {"TiÒm Long Tóc DiÖt Ch©n QuyÓn", {0, 107, 205, 1}}, 
		[14] =  {"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn", {0, 107, 212, 1}}, 
		[15] =  {"Qu©n Tö §íi Phong Ch©n QuyÓn", {0, 107, 213, 1}}, 
		[8] =  {"Nh­ ý Kim §Ønh Ch©n QuyÓn", {0, 107, 208, 1}}, 
		[9] =  {"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn", {0, 107, 209, 1}}, 
		[11] =  {"Hçn §én TrÊn Nh¹c Ch©n QuyÓn", {0, 107, 210, 1}}, 
		[12] =  {"Quú Thiªn Du Long Ch©n QuyÓn", {0, 107, 211, 1}}, 
		[6] =  {"Thiªn La Liªn Ch©u Ch©n QuyÓn", {0, 107, 207, 1}}, 
		[17] =  {"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn", {0, 107, 214, 1}}, 
		[18] =  {"Xuyªn V©n L¹c Hång Ch©n QuyÓn", {0, 107, 215, 1}}, 
		[20] = {"HuyÒn Minh Phong Ma Ch©n QuyÓn", {0, 107, 216, 1}}, 
		[21] = {"Linh Cæ HuyÒn Tµ Ch©n QuyÓn", {0, 107, 217, 1}}, 
		[23] = {"Cöu Thiªn Phong L«i Ch©n QuyÓn", {0, 107, 218, 1}}, 
		[29] = {"Hång TrÇn Tóy Méng Ch©n QuyÓn", {0, 107, 222, 1}}, 
		[30] = {"Phong Hoa Thiªn DiÖp Ch©n QuyÓn", {0, 107, 223, 1}}, 
}

function IsIPBonus()
	return IP_SWITCH;
end

function GetOnlineTime()
	if GetTask(IP_ONLINE_TIME) > IP_TIME_LIMIT then
		SetTask(IP_ONLINE_TIME, IP_TIME_LIMIT)		
	end
	return GetTask(IP_ONLINE_TIME);
end

function SetOnlineTime(nSec,nType)
	if nType == 1 then
		if GetOnlineTime() + nSec < IP_TIME_LIMIT then
			SetTask(IP_ONLINE_TIME, GetOnlineTime() + nSec)
		else
			SetTask(IP_ONLINE_TIME, IP_TIME_LIMIT)
--			if GetTask(TASK_GET_DAY_AWARD) ~= tonumber(date("%Y%m%d"))	then
--				SetTask(TASK_FULL_8_HOUR,1)
--			end
		end	
	elseif nType == 2 then
		if GetTask(IP_ONLINE_TIME) - nSec >= 0 then
			SetTask(IP_ONLINE_TIME, GetOnlineTime() - nSec)
		end
	end
	return GetTask(IP_ONLINE_TIME);
end

function ShowTime()
	local nTime = GetOnlineTime()
	local nHour = 0
	local nMin = 0
	local nSec = 0
	if nTime > 0 then
		nHour = floor(nTime/3600)
		nMin = floor((nTime - nHour*3600)/60)
		nSec = nTime - nHour*3600 - nMin*60
	end
	return nHour, nMin, nSec
end

function IpBonusStart()
	if IsIPBonus() == 1 then
		SetTask(IP_TIME_START, GetTime())
	end
end

function IpBonusClose()
	if IsIPBonus() == 1 then
		if GetTask(IP_TIME_START) > 0 then
			local nCurTime =  GetTime()
			local nOnlineTime = nCurTime - GetTask(IP_TIME_START)
			SetOnlineTime(nOnlineTime,1)
		end
		SetTask(IP_TIME_START, 0)
	end
end

function IpBonusReset()
	if GetTask(TASK_GET_FUZHU_DATE) == tonumber(date("%y%m%d")) then
		if GetTask(TASK_GET_FUZHU_TYPE) ~= 0 then			
			local nRandAttr = GetTask(TASK_GET_FUZHU_TYPE)
			local nAttrId = 2600022;
			local nHour = tonumber(date("%H"));
			local nMin = tonumber(date("%M"));
			local nSec = tonumber(date("%S"));
			local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;			
			for i = 1, getn(tBuff[nRandAttr][3]) do
				CastState(tBuff[nRandAttr][3][i][1], tBuff[nRandAttr][3][i][2], nLeftTime, 1, nAttrId ,1);
				nAttrId = nAttrId + 1;
			end		
		end
	end
end

function TalkEx(fun,szMsg)
	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg..format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"

	dostring(szmsg)	
end	