Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")

function CS6_Mission_Kill()
	local tbMobsList = {
		[1] = {"TiÓu Lam §ao Quû", 	TSK_CS6_DaoQuy_XoaQuy, 	1},
		[2] = {"TiÓu Lam Xoa Quû", 		TSK_CS6_DaoQuy_XoaQuy, 	2},
		[3] = {"Sa M¹c Hµnh Nh©n", 	TSK_CS6_SaMac_TamBao, 		1},
		[4] = {"TÇm B¶o Nh©n", 			TSK_CS6_SaMac_TamBao, 		2},
		[5] = {"KiÕm tiªn Tö", 				TSK_CS6_KiemTien_DichTien, 	1},
		[6] = {"§Þch tiªn Tö", 				TSK_CS6_KiemTien_DichTien, 	2},
		[7] = {"LiÖt Nhan Li Long", 		TSK_CS6_LiLong_HoaHo, 		1},
		[8] = {"XÝch LuyÖn Háa Hå", 	TSK_CS6_LiLong_HoaHo, 		2},
	}
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	local nIndex = 0
	for i=1, getn(tbMobsList) do
		if tbMobsList[i][1] == sName then
			nIndex = i
			break
		end
	end
	if nIndex == 0 then
		return 0
	end
	
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 then
		CS6_MobKilled_Add(tbMobsList[nIndex][1], tbMobsList[nIndex][2], tbMobsList[nIndex][3])
	else
		local nOldIndex = PlayerIndex
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			CS6_MobKilled_Add(tbMobsList[nIndex][1], tbMobsList[nIndex][2], tbMobsList[nIndex][3])
		end
		PlayerIndex = nOldIndex
	end
end


function CS6_MobKilled_Add(szMobName, nMisstionTask, nPosition)
	local nTaskValue = GetTask(nMisstionTask)
	local nMobCount = floor(nTaskValue/10000)
	local nAddValue = 10000
	if nPosition ~= 1 then
		nMobCount = mod(nTaskValue,10000)
		nAddValue = 1
	end
	if GetTask(TSK_CS6_TULINH) == 4 and nMobCount < 9999 then
		nTaskValue = nTaskValue + nAddValue
		SetTask(nMisstionTask, nTaskValue)
		Msg2Player("NhiÖm vô Tø Linh Phôc Sinh: §· giÕt ®­îc ".. nMobCount  .."/9999 "..szMobName)
	end
end


function CS7_Mission_Kill()
	local tbMobsList = {
		[1] = {"KiÕm tiªn Tö", 	2},
		[2] = {"Sa M¹c Hµnh Nh©n", 3},
		[3] = {"XÝch LuyÖn Háa Hå", 4},
		[4] = {"TiÓu Lam Xoa Quû", 5},
	}
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	local nIndex = 0
	for i=1, getn(tbMobsList) do
		if tbMobsList[i][1] == sName then
			nIndex = i
			break
		end
	end
	if tbMobsList[nIndex] == nil then
		return 0
	end
	if tbMobsList[nIndex][2] ~= PhucSinh2_GetDailyMission() then
		return 0
	end
	PhucSinh2_SetMissionPart()
end