Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")

WN_201403_ACTIVITY_ID = 117

WN_201403_NPC_MAIN = "<color=green>Vò N­¬ng<color>:"
WN_201403_NPC = "<color=green>Phïng §ång Nhi<color>:"

WN_201403_DIALOG = {
	"nhËn nhiÖm vô truy t×m Ên tÝn/WN_201403_GetTask",
	"nhËn phÇn th­ëng hoµn thµnh nhiÖm vô /WN_201403_FinishTask",
	"T¹i h¹ chØ xem qua th«i/nothing",	
}

WN_201403_TASKGROUP = TaskManager:Create(9, 8)
WN_201403_TASKGROUP.DaySeq = 1
WN_201403_TASKGROUP.TaskStatus = 2 --0Î´ÁìÈ¡1µÚÒ»²½2µÚ¶þ²½3µÚÈý²½4Íê³É5ÒÑÁì½±
WN_201403_TASKGROUP.TaskStep1_1 = 3
WN_201403_TASKGROUP.TaskStep1_2 = 4
WN_201403_TASKGROUP.TaskStep1_3 = 5
WN_201403_TASKGROUP.TaskStep2_1 = 6
WN_201403_TASKGROUP.TaskStep2_2 = 7
WN_201403_TASKGROUP.TaskStep2_3 = 8
WN_201403_TASKGROUP.TaskStep3_1 = 9

function WN_201403_DailyReset()
	if WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus) == 4 then
		return
	end
	if WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.DaySeq) ~= zgc_pub_day_turn() then
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.DaySeq, zgc_pub_day_turn())
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_1, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_2, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_3, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_1, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_2, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_3, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep3_1, 0)
	end
end

function WN_201403_GetTask()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus == 3 then
		Talk(1,"",WN_201403_NPC_MAIN.."b¹n ®· nhËn ®­îc nhiÖm vô truy t×m Ên tÝn \n"..format("H·y ®i %s t×m %s hoµn thµnh nhiÖm vô!", "Thiªn s­ bÝ c¶nh", "§Ö Tö C«n L«n"))
		return
	end
	if nTaskStatus == 2 then
		Talk(1,"",WN_201403_NPC_MAIN.."b¹n ®· nhËn ®­îc nhiÖm vô truy t×m Ên tÝn \n"..format("H·y ®i %s t×m %s hoµn thµnh nhiÖm vô!", "D­îc V­¬ng cèc", "L­u Tam "))
		return
	end
	if nTaskStatus == 1 then
		Talk(1,"",WN_201403_NPC_MAIN.."b¹n ®· nhËn ®­îc nhiÖm vô truy t×m Ên tÝn \n"..format("H·y ®i %s t×m %s hoµn thµnh nhiÖm vô!", "Thµnh §«", "Chu UÊt Ly"))
		return
	end
	if nTaskStatus == 4 then
		Talk(1,"",WN_201403_NPC_MAIN.."B¹n ®· hoµn thµnh nhiÖm vô truy t×m Ên tÝn, mau ®i l·nh th­ëng ®i#")
		return
	end
	if nTaskStatus == 5 then
		Talk(1,"",WN_201403_NPC_MAIN.."B¹n ®· hoµn thµnh vµ nhËn phÇn th­ëng nhiÖm vô, hÑn gÆp l¹i ngµy mai nhÐ#")
		return
	end
	if nTaskStatus ~= 0 then
		Talk(1,"",WN_201403_NPC_MAIN.."Kh«ng thÓ nhËn nhiÖm vô")
		return
	end
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 1)
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_1, 0)
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_2, 0)
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_3, 0)
	local msg = format("H·y ®i %s t×m %s hoµn thµnh nhiÖm vô!", "Thµnh §«", "Chu UÊt Ly")
	Msg2Player(msg)
	Talk(1,"",msg)
	TaskTip(msg)
end

--É±¹Ö
function WN_201403_KillNpc(sName)
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) ~= 1 then
		return
	end
	local nStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nStatus ~= 1 and nStatus ~= 2 and nStatus ~= 3 then
		return
	end
	local nMapID, nX, nY = GetWorldPos()
	gf_TeamOperateEX(function ()
		if %nMapID ~= GetWorldPos() then
			return
		end
		local tbKill = {
			[1] = WN_201403_KILL_1,
			[2] = WN_201403_KILL_2,
			[3] = WN_201403_KILL_3,
		}
		local tbTask = {
			[1] = {3, 4, 5},
			[2] = {6, 7, 8},
			[3] = {9, 9, 9},
		}
		local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
		local tbKillSub = tbKill[nTaskStatus]
		if not tbKillSub then
			return
		end
		local tbTaskSub = tbTask[nTaskStatus]
		if not tbTaskSub then
			return
		end
		local nIndex = WN_201403_GetKind()
		local tbKillSub1 = tbKillSub[nIndex]
		if not tbKillSub1 then
			return
		end
		for i=1, getn(tbKillSub1) do
			if tbKillSub1[i][2] == %sName then
				local nNum = WN_201403_TASKGROUP:GetTask(tbTaskSub[i])
				if nNum < tbKillSub1[i][1] then
					WN_201403_TASKGROUP:SetTask(tbTaskSub[i], nNum + 1)
					if nNum + 1 == tbKillSub1[i][1] then
						Msg2Player(format("tiªu diÖt%s %d/%d", %sName, nNum + 1, tbKillSub1[i][1]).."(Hoµn thµnh)")
					else
						Msg2Player(format("tiªu diÖt%s %d/%d", %sName, nNum + 1, tbKillSub1[i][1]))
					end
				end
			end
		end
		local nIsCompelte = 1
		for i=1, getn(tbKillSub1) do
			if WN_201403_TASKGROUP:GetTask(tbTaskSub[i]) < tbKillSub1[i][1] then
				nIsCompelte = 0
			end
		end
		if nIsCompelte == 1 then
			local tName = {
				[1] = "Chu UÊt Ly",
				[2] = "L­u Tam ",
				[3] = "§Ö Tö C«n L«n",
			}
			Talk(1,"","B¹n ®· hoµn thµnh nhiÖm vô!")
			Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô!"..format("Mau chãng ®i t×m %s hoµn thµnh nhiÖm vô", tName[nTaskStatus]))
		end
	end)
end

function WN_201403_GetKind()
	local nLevel = gf_GetPlayerRebornCount()
	local nKind = 1
	if nLevel <= 0 then
		return nKind
	end
	if nLevel > 0 and nLevel <= 5 then
		nKind = 2
	end
	if nLevel > 5 then
		nKind = 3
	end
	return nKind
end

WN_201403_KILL_1 =
{
	[1] = {
		{399, "Tú Bµ Tiªn Tö", "§éng V­¬ng MÉu tÇng 1"},
		{399, "Tr× M©u Hé VÖ", "Thiªn tÇm th¸p tÇng 1"},
		{399, "Tr× §ao Hé VÖ", "Thiªn tÇm th¸p tÇng 1"},
	},
	[2] = {
		{500, "T¶n Tiªn Tö", "§éng V­¬ng MÉu tÇng 2"},
		{500, "KiÕm tiªn Tö", "§éng V­¬ng MÉu tÇng 3"},
		{500, "Thiªn TÇm Ph¸p T¨ng", "Thiªn tÇm th¸p tÇng 2"},
	},
	[3] = {
		{690, "§Þch tiªn Tö", "§éng V­¬ng MÉu tÇng 3"},
		{690, "T©y H¹ Dòng SÜ", "D­îc V­¬ng cèc"},
	},
}

--ÖÜÓôÀëµÄÈÎÎñ¶Ô»°
function WN_201403_Talk1()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus ~= 1 then
		return 0
	end
	local nKillNum1 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep1_1)
	local nKillNum2 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep1_2)
	local nKillNum3 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep1_3)
	local tbKillNum = {nKillNum1, nKillNum2, nKillNum3}
	local nIndex = WN_201403_GetKind()
	local tbKill = WN_201403_KILL_1[nIndex]
	if not tbKill then return end
	if 0 == nKillNum1 and 0 == nKillNum2 and 0 == nKillNum3 then
		for i =1, getn(tbKill) do
			local msg = format("Tiªu diÖt %dcon%s(%s)", tbKill[i][1], tbKill[i][2], tbKill[i][3])
			Msg2Player(msg)
			TaskTip(msg)
		end
		Talk(1,"","¾c tÆc xuÊt hiÖn, gióp chóng ta tiªu diÖt chóng")
		return 1
	end
	local bIsComplete = 1
	local tbMsg = {}
	for i =1, getn(tbKill) do
		tinsert(tbMsg, format("Tiªu diÖt%d/%dcon%s(%s)", tbKillNum[i], tbKill[i][1], tbKill[i][2], tbKill[i][3]))
		if tbKillNum[i] < tbKill[i][1] then
			bIsComplete = 0
		end
	end
	for i =1, getn(tbMsg) do
		Msg2Player(tbMsg[i])
		if bIsComplete ~= 1 then
			TaskTip(tbMsg[i])
		end
	end
	if bIsComplete == 1 then
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 2)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_1, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_2, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_3, 0)
		local msg = "NhiÖm vô hoµn thµnh!"..format("Mau ®i%st×m%s®i!", "D­îc V­¬ng cèc", "L­u Tam ")
		Msg2Player(msg)
		Talk(1,"",msg)
		TaskTip(msg)
	end
	return 1
end

WN_201403_KILL_2 =
{
	[1] = {
		{399, "Cung t­îng", "Hoµng l¨ng mé thÊt tÇng 1"},
		{399, "KÎ ®µo mé", "Hoµng l¨ng mé thÊt tÇng 1"},
	},
	[2] = {
		{399, "T­îng binh m· Hé VÖ", "Hoµng l¨ng mé thÊt tÇng 1"},
		{399, "Cung t­îng", "Hoµng l¨ng mé thÊt tÇng 1"},
		{399, "T­îng binh m· Vò VÖ", "Hoµng l¨ng mé thÊt tÇng 1"},
	},
	[3] = {
		{690, "Th­¬ng t­îng", "Hoµng l¨ng mé thÊt tÇng 2"},
		{690, "TÇm B¶o Nh©n", "Mª cung sa m¹c"},
	},
}

--Ò©Íõ¹ÈÁõÈýµÄÈÎÎñ¶Ô»°
function WN_201403_Talk2()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus ~= 2 then
		return 0
	end
	local nKillNum1 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep2_1)
	local nKillNum2 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep2_2)
	local nKillNum3 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep2_3)
	local tbKillNum = {nKillNum1, nKillNum2, nKillNum3}
	local nIndex = WN_201403_GetKind()
	local tbKill = WN_201403_KILL_2[nIndex]
	if not tbKill then return end
	if 0 == nKillNum1 and 0 == nKillNum2 and 0 == nKillNum3 then
		for i =1, getn(tbKill) do
			local msg = format("Tiªu diÖt %dcon%s(%s)", tbKill[i][1], tbKill[i][2], tbKill[i][3])
			Msg2Player(msg)
			TaskTip(msg)
		end
		Talk(1,"","TÇn Thñy Hoµng l¨ng cã rÊt nhiÒu b¸u vËt, h·y vµo tiªu diÖt qu¸i vËt vµ lÊy b¸u vËt ra ®©y!")
		return 1
	end
	local bIsComplete = 1
	local tbMsg = {}
	for i =1, getn(tbKill) do
		tinsert(tbMsg, format("Tiªu diÖt%d/%dcon%s(%s)", tbKillNum[i], tbKill[i][1], tbKill[i][2], tbKill[i][3]))
		if tbKillNum[i] < tbKill[i][1] then
			bIsComplete = 0
		end
	end
	for i =1, getn(tbMsg) do
		Msg2Player(tbMsg[i])
		if bIsComplete ~= 1 then
			TaskTip(tbMsg[i])
		end
	end
	if bIsComplete == 1 then
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 3)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep3_1, 0)
		local msg = "NhiÖm vô hoµn thµnh!"..format("Mau ®i%st×m%s®i!", "Thiªn s­ bÝ c¶nh", "§Ö Tö C«n L«n")
		Msg2Player(msg)
		Talk(1,"",msg)
		TaskTip(msg)
	end
	return 1
end

WN_201403_KILL_3 =
{
	[1] = {
		{555, "HuyÕt C« L©u", "Thiªn s­ bÝ c¶nh"},
	},
	[2] = {
		{555, "HuyÕt C« L©u", "Thiªn s­ bÝ c¶nh"},
	},
	[3] = {
		{555, "HuyÕt C« L©u", "Thiªn s­ bÝ c¶nh"},
	},
}

--ÌìÊ¦ÃØ¾³À¥ÂØµÜ×ÓµÄÈÎÎñ¶Ô»°
function WN_201403_Talk3()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus ~= 3 then
		return 0
	end
	local nKillNum1 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep3_1)
	local tbKillNum = {nKillNum1, nKillNum1, nKillNum1}
	local nIndex = WN_201403_GetKind()
	local tbKill = WN_201403_KILL_3[nIndex]
	if not tbKill then return end
	if 0 == nKillNum1 and 0 == nKillNum2 and 0 == nKillNum3 then
		for i =1, getn(tbKill) do
			local msg = format("Tiªu diÖt %dcon%s(%s)", tbKill[i][1], tbKill[i][2], tbKill[i][3])
			Msg2Player(msg)
			TaskTip(msg)
		end
		Talk(1,"","Ên tÝn??? quªn råi, gióp t«i giÕt HuyÕt C« L©u, cã lÏ sÏ gióp ta kh«i phôc l¹i trÝ nhí")
		return 1
	end
	local bIsComplete = 1
	local tbMsg = {}
	for i =1, getn(tbKill) do
		tinsert(tbMsg, format("Tiªu diÖt%d/%dcon%s(%s)", tbKillNum[i], tbKill[i][1], tbKill[i][2], tbKill[i][3]))
		if tbKillNum[i] < tbKill[i][1] then
			bIsComplete = 0
		end
	end
	for i =1, getn(tbMsg) do
		Msg2Player(tbMsg[i])
		if bIsComplete ~= 1 then
			TaskTip(tbMsg[i])
		end
	end
	if bIsComplete == 1 then
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 4)
		local msg = "NhiÖm vô hoµn thµnh!"..format("Mau ®i t×m%s t×m%s nhËn th­ëng ®i!", "Thµnh §«", "Vò N­¬ng")
		Msg2Player(msg)
		Talk(1,"",msg)
		TaskTip(msg)
	end
	return 1
end

function WN_201403_FinishTask()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus == 5 then
		Talk(1,"",WN_201403_NPC_MAIN.."H«m nay b¹n ®· nhËn phÇn th­ëng nµy råi, ngµy mai h·y ®Õn tiÕp nhÐ#")
		return
	end
	if nTaskStatus == 3 then
		Talk(1,"",WN_201403_NPC_MAIN.."B¹n ch­a hoµn thµnh nhiÖm vô truy t×m Ên tÝn\n"..format("H·y ®i %s t×m %s hoµn thµnh nhiÖm vô!", "Thiªn s­ bÝ c¶nh", "§Ö Tö C«n L«n"))
		return
	end
	if nTaskStatus == 2 then
		Talk(1,"",WN_201403_NPC_MAIN.."B¹n ch­a hoµn thµnh nhiÖm vô truy t×m Ên tÝn\n"..format("H·y ®i %s t×m %s hoµn thµnh nhiÖm vô!", "D­îc V­¬ng cèc", "L­u Tam "))
		return
	end
	if nTaskStatus == 1 then
		Talk(1,"",WN_201403_NPC_MAIN.."B¹n ch­a hoµn thµnh nhiÖm vô truy t×m Ên tÝn\n"..format("H·y ®i %s t×m %s hoµn thµnh nhiÖm vô!", "Thµnh §«", "Chu UÊt Ly"))
		return
	end
	if nTaskStatus == 0 then
		Talk(1,"",WN_201403_NPC_MAIN.."B¹n ch­a nhËn nhiÖm vô truy t×m Ên tÝn ")
		return
	end
	if nTaskStatus ~= 4 then
		Talk(1,"",WN_201403_NPC_MAIN.."B¹n tr­a hoµn thµnh nhiÖm vô truy t×m Ên tÝn, kh«ng thÓ nhËn th­ëng ")
		return
	end
	local tSay = {
		"PhÇn th­ëng phæ th«ng#miÔn phÝ#/WN_201403_GetAward1",
		"phÇn th­ëng ­u ®·i#tiªu hao 399 vµng +39 ngäc tiªu dao#/WN_201403_GetAward2",
		"phÇn th­ëng siªu cÊp#tiªu hao 606 vµng +203 ngäc tiªu dao#/WN_201403_GetAward3",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(WN_201403_NPC_MAIN.."h·y chän c¸ch nhËn phÇn th­ëng:",getn(tSay),tSay)
end

function WN_201403_GetAward1()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 5)
	gf_Modify("Exp", 100000000)
	gf_Modify("Rep", 19)
	gf_EventGiveCustomAward(4, 19, 1, "Event phô 1 th¸ng 3");
	ahf_GetPetBook(1)
end

function WN_201403_GetAward2()
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return
	end
	if GetCash() < 3990000 then
		Talk(1,"",WN_201403_NPC..format("Sè vµng trong tói kh«ng ®ñ %d vµng ", 399))
		return
	end
	if GetItemCount(2, 1, 30603) < 39 then
		Talk(1,"",WN_201403_NPC..format("sè ngäc tiªu dao trong tói kh«ng ®ñ %d c¸i ", 39))
		return
	end
	if Pay(3990000) ~= 1 or DelItem(2, 1, 30603, 39) ~= 1 then
		return
	end
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 5)
	gf_Modify("Exp", 399399399)
	gf_Modify("Rep", 55)
	AwardGenuineQi(55);
	ahf_GetPetBook(2)
	ahf_GetPetBook(2)
end

function WN_201403_GetAward3()
	if gf_Judge_Room_Weight(6, 200, " ") ~= 1 then
		return
	end
	if GetCash() < 6060000 then
		Talk(1,"",WN_201403_NPC..format("Sè vµng trong tói kh«ng ®ñ %d vµng ", 606))
		return
	end
	if GetItemCount(2, 1, 30603) < 203 then
		Talk(1,"",WN_201403_NPC..format("sè ngäc tiªu dao trong tói kh«ng ®ñ %d c¸i ", 203))
		return
	end
	if Pay(6060000) ~= 1 or DelItem(2, 1, 30603, 203) ~= 1 then
		return
	end
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 5)
	gf_Modify("Exp", 1234567890)
	gf_Modify("Rep", 500)
	gf_EventGiveCustomAward(4, 200, 1, "Event phô 1 th¸ng 3");
	ahf_GetPetBook(3)
	ahf_GetPetBook(4)
	AddItem(2, 1, 30632, 2000)
	AddItem(2, 1, 30633, 2000)
	gf_AddItemEx2({2, 1, 30497, 100, 4}, "Ma Tinh", "Event phô 1 th¸ng 3","siªu cÊp nhËn th­ëng ", 0, 1)
	gf_AddItemEx2({2, 1, 9977, 1, 4}, "Qu©n C«ng Huy Hoµng", "Event phô 1 th¸ng 3","siªu cÊp nhËn th­ëng ", 7 * 24 * 3600, 1)
end