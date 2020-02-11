Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")

--interface for viet----------
function _vjw_SetTaixu()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2);
	if nTimes < 2 then
		gf_SetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("NhiÖm vô kÝch ho¹t c¶nh giíi Vâ T«n: %s (%d/%d)", "Tham gia Th¸i H­ HuyÔn C¶nh", nTimes + 1, 2));
	end
end

function _vjw_SetZyz()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("NhiÖm vô kÝch ho¹t c¶nh giíi Vâ T«n: %s (%d/%d)", "Hoµn thµnh Tµi Nguyªn ChiÕn", nTimes + 1, 1));
	end
end
-------------------------------

function _vjw_SetWjz()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 3);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 3, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("NhiÖm vô kÝch ho¹t c¶nh giíi Vâ T«n: %s (%d/%d)", "Hoµn thµnh nhiÖm vô V¹n KiÕm Tròng", nTimes + 1, 1));
	end
end

function _vjw_SetLs()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 4);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 4, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("NhiÖm vô kÝch ho¹t c¶nh giíi Vâ T«n: %s (%d/%d)", "Hoµn thµnh nhiÖm vô L­¬ng S¬n B¹c", nTimes + 1, 1));
	end
end

function vjw_GetTaixu()
	return gf_GetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2);
end

function vjw_GetWjz()
	return gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 3);
end

function vjw_GetLs()
	return gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 4);
end

function vjw_GetZyz()
	return gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5);
end

function vjw_GetTimes()
	return gf_GetTaskByte(TASKID_IB_ACT_WUZUN_TASK, 4);
end

function vjw_SetTimes()
	local nTimes = gf_GetTaskByte(TASKID_IB_ACT_WUZUN_TASK, 4);
	if nTimes >= 3 then
		return 0;
	end
	gf_SetTaskByte(TASKID_IB_ACT_WUZUN_TASK, 4, nTimes + 1, TASK_ACCESS_CODE_VJW);
end

function vjw_MerdianIBActivate()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		Say("<color=green>Nh¹c BÊt QuÇn:<color> Nh©n vËt ch­a ®¹t chuyÓn sinh 6 cÊp 90, kh«ng thÓ tham gia nhiÖm vô kÝch ho¹t Vâ T«n!", 0);
		return 0;
	end
	vjw_DailyReset();
	local msg = "<color=green>Nh¹c BÊt QuÇn:<color>"..format("Sau khi hoµn thµnh nh÷ng nhiÖm vô h»ng ngµy sau, %s cã thÓ nhËn ®­îc %d c¬ héi th¨ng cÊp c¶nh giíi Vâ T«n.\n", gf_GetPlayerSexName(), 3);
	local nFinish = 1;
	local tColor = {
		[1] = {"<color=green>", "<color>"},
		[2] = {"<color=white>", "<color>"},
	}
	local tGoal = {
		{"Tham gia Th¸i H­ HuyÔn C¶nh", vjw_GetTaixu, 2},
		{"Hoµn thµnh nhiÖm vô V¹n KiÕm Tròng", vjw_GetWjz, 1},
		{"Hoµn thµnh nhiÖm vô L­¬ng S¬n B¹c", vjw_GetLs, 1},
		{"Hoµn thµnh Tµi Nguyªn ChiÕn", vjw_GetZyz, 1},
	}
	for i = 1, getn(tGoal) do
		local nc = 0;
		if tGoal[i][2]() >= tGoal[i][3] then
			nc = 1;
		else
			nc = 2;
			nFinish = 0;
		end
		msg = msg..format("%s- %s(%d/%d)%s\n", tColor[nc][1], tGoal[i][1], tGoal[i][2](), tGoal[i][3], tColor[nc][2]);
	end
	local tSay = {};
	if nFinish == 1 then
		tinsert(tSay, format("Ta muèn kÝch ho¹t c¶nh giíi Vâ T«n (Cßn %d lÇn)/vjw_ActivateWZ", max(3 - vjw_GetTimes(), 0)));
		tinsert(tSay, format("Kh«ng cÇn ®©u/nothing"));
	else
		tinsert(tSay, format("Hoµn thµnh nhiÖm vô råi quay l¹i/nothing"));
	end
	Say(msg, getn(tSay), tSay);
end

function vjw_DailyReset()
	local nDay = gf_TodayDate();
	if GetTask(TASKID_IB_ACT_WUZUN_TIME) ~= nDay then
		SetTask(TASKID_IB_ACT_WUZUN_TIME, nDay, TASK_ACCESS_CODE_VJW);
		SetTask(TASKID_IB_ACT_WUZUN_TASK, 0, TASK_ACCESS_CODE_VJW);
	end
end

function vjw_ActivateWZ()
	local msg = "<color=green>Nh¹c BÊt QuÇn:<color>"..format("Nguyªn liÖu cÇn tiªu hao ®Ó kÝch ho¹t c¶nh giíi Vâ T«n: <color=gold>%d Bµn Long BÝch, %d XU ®¹o cô, %d N÷ Oa Tinh Th¹ch<color>, kÝch ho¹t cã x¸c suÊt thÊt b¹i, khi thÊt b¹i sÏ mÊt mét sè ®¹o cô", 8, 600, 3);
	Say(msg, 2, "§ång ý/vjw_ActivateWZ_try", "Hñy bá/nothing");
end

function vjw_ActivateWZ_try()
	if vjw_GetTimes() >= 3 then
		Say("<color=green>Nh¹c BÊt QuÇn:<color>"..format("H«m nay ®· dïng hÕt sè lÇn kÝch ho¹t, ngµy mai h·y quay l¹i!"), 0);
		return 0;
	end
	if GetItemCount(2, 1, 1000) < 8 then
		Say("<color=green>Nh¹c BÊt QuÇn:<color>"..format("Hµnh trang kh«ng gian %s kh«ng ®ñ %d", "Bµn Long bÝch", 8), 0);
		return 0;
	end
	if GetItemCount(2, 1, 30230) < 600 then
		Say("<color=green>Nh¹c BÊt QuÇn:<color>"..format("Hµnh trang kh«ng gian %s kh«ng ®ñ %d", "XU ®¹o cô", 600), 0);
		return 0;
	end
	if GetItemCount(2, 1, 504) < 3 then
		Say("<color=green>Nh¹c BÊt QuÇn:<color>"..format("Hµnh trang kh«ng gian %s kh«ng ®ñ %d", "N÷ Oa Tinh Th¹ch", 3), 0);
		return 0;
	end
	vjw_SetTimes();
	local nRand = random(100);
	if nRand > 92 then
		if DelItem(2, 1, 1000, 8) ~= 1 then
			return 0;
		end
		if DelItem(2, 1, 30230, 600) ~= 1 then
			return 0;
		end
		if DelItem(2, 1, 504, 3) ~= 1 then
			return 0;
		end
		local nMeridianLevel = MeridianGetLevel();
		if nMeridianLevel == 3 then
			MeridianUpdateLevel();
			PlaySound("\\sound\\sound_i016.wav");
			SetCurrentNpcSFX(PIdx2NpcIdx(),901,0,0);
		end
		local str = format("Chóc mõng %s%s kÝch ho¹t Vâ T«n thµnh c«ng!", GetName(), gf_GetPlayerSexName());
		Say("<color=green>Nh¹c BÊt QuÇn:<color>"..str, 0);
		Msg2Global(msg);
	else
		local tLost = {
			{1, 70, {2, 1, 504, 1}},
			{2, 20, {2, 1, 1000, 6}},
			{3, 10, {2, 1, 30230, 100}},
		}
		local nIndex = gf_GetRandItemByTable(tLost, gf_SumRandBase(tLost), 1);
		DelItem(gf_UnPack(tLost[nIndex][3]));
		Msg2Player(format("KÝch ho¹t thÊt b¹i! MÊt ®i %s*%d", GetItemName(tLost[nIndex][3][1], tLost[nIndex][3][2], tLost[nIndex][3][3]), tLost[nIndex][3][4]));
		Say("<color=green>Nh¹c BÊt QuÇn:<color>".."RÊt tiÕc, kÝch ho¹t thÊt b¹i! LÇn sau h·y quay l¹i", 0);
	end
end