Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")

WN_201403_CAMPTASK_ID = 118

WN_201403_CAMPTASK_NPC = "<color=green>Th¸i thó T­¬ng D­¬ng<color>:"

WN_201403_CAMPTASK_TASKGROUP = TaskManager:Create(10, 8)
WN_201403_CAMPTASK_TASKGROUP.DaySeq = 1
WN_201403_CAMPTASK_TASKGROUP.TaskStatus = 2 --0Î´ÁìÈ¡1ÁìÈ¡ÈÎÎñ2½ÓÊÜÉ±¹Ö3Íê³É
WN_201403_CAMPTASK_TASKGROUP.TaskStep1 = 3
WN_201403_CAMPTASK_TASKGROUP.TaskStep2 = 4
WN_201403_CAMPTASK_TASKGROUP.TaskStep3 = 5
WN_201403_CAMPTASK_TASKGROUP.TaskStep4 = 6
WN_201403_CAMPTASK_TASKGROUP.IsAward1 = 7
WN_201403_CAMPTASK_TASKGROUP.IsAward2 = 8
WN_201403_CAMPTASK_TASKGROUP.IsAward3 = 9

function WN_201403_CampTask_DailyReset()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.DaySeq) ~= zgc_pub_day_turn() then
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.DaySeq, zgc_pub_day_turn())
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep1, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep2, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep3, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep4, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward2, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward3, 0)
	end
end

--KillNpc
function WN_201403_CampTask_Killer(sName)
	if gf_CheckEventDateEx(WN_201403_CAMPTASK_ID) ~= 1 then
		return
	end
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus) == 3 then
		return
	end
	local nMapID, nX, nY = GetWorldPos()
	gf_TeamOperateEX(function ()
		if %nMapID ~= GetWorldPos() then
			return
		end
		local nNum1 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep1)
		if %sName == "Oa Quèc L·ng Nh©n" and nNum1 < 300 then
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep1,  nNum1 + 1)
			Msg2Player(format("Tiªu diÖt %d/%d Oa quèc l·ng nh©n",nNum1 + 1,300))
			nNum1 = nNum1 + 1
		end
		local nNum2 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep2)
		if %sName == "H¶i TÆc" and nNum2 < 300 then
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep2,  nNum2 + 1)			
			Msg2Player(format("Tiªu diÖt  %d/%d H¶i tÆc",nNum2 + 1,300))
			nNum2 = nNum2 + 1
		end
		local nNum3 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep3)
		if %sName == "Oa Quèc §ao kh¸ch" and nNum3 < 300 then
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep3,  nNum3 + 1)			
			Msg2Player(format("Tiªu diÖt %d/%d Oa quèc ®ao kh¸ch",nNum3 + 1,300))
			nNum3 = nNum3 + 1
		end
		local nNum4 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep4)
		if %sName == "S¸t thñ ngo¹i téc" and nNum4 < 300 then
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep4,  nNum4 + 1)			
			Msg2Player(format("Tiªu diÖt %d/%d Ngo¹i téc s¸t thñ",nNum4 + 1,300))
			nNum4 = nNum4 + 1
		end
		if nNum1 >= 300 and nNum2 >= 300 and nNum3 >= 300 and nNum4 >= 300 then
			Talk(1,"","b¹n ®· hoµn thµnh nhiÖm vô qu©n doanh!")		
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 3)
			return
		end
	end)
end

--Ì«ÊØ
WN_201403_CAMPTASK_TASK = "NhËn nhiÖm vô qu©n doanh/WN_201403_CampTask_GetTask"

function WN_201403_CampTask_GetTask()
	WN_201403_CampTask_DailyReset()
	local nStatus = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus)
	if 1 == nStatus then
		Talk(1,"","B¹n ®· nhËn nhiÖm vô qu©n doanh, mau ®Õn T­¬ng D­¬ng t×m chØ huy sø ®Ó t×m hiÓu t×nh h×nh ®i!")
		return
	end
	if 2 == nStatus then
		Talk(1,"","B¹n ®· nhËn nhiÖm vô qu©n doanh, Oa KhÊu xuÊt hiÖn ë trung nguyªn, b¸ch tİnh c¨m phÉn, h·y ®i t×m vµ giÕt chóng ®i!")
		return
	end
	if 3 == nStatus then
		Talk(1,"","b¹n ®· hoµn thµnh nhiÖm vô qu©n doanh")
		return
	end
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 1)
	Talk(1,"","B¹n ®· nhËn nhiÖm vô qu©n doanh, mau ®Õn T­¬ng D­¬ng t×m chØ huy sø ®Ó t×m hiÓu t×nh h×nh ®i!")
	Msg2Player("B¹n ®· nhËn nhiÖm vô qu©n doanh, mau ®Õn T­¬ng D­¬ng t×m chØ huy sø ®Ó t×m hiÓu t×nh h×nh ®i!")
	TaskTip("B¹n ®· nhËn nhiÖm vô qu©n doanh, mau ®Õn T­¬ng D­¬ng t×m chØ huy sø ®Ó t×m hiÓu t×nh h×nh ®i!")
end

--±øÂíÖ¸»ÓÊ¹
function WN_201403_CampTask_DealTask()
	local nStatus = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus)
	if 1 == nStatus then
		Talk(1,"","B¹n ®· nhËn nhiÖm vô qu©n doanh, Oa KhÊu xuÊt hiÖn ë trung nguyªn, b¸ch tİnh c¨m phÉn, h·y ®i t×m vµ giÕt chóng ®i!".."\n<color=red>Tiªu diÖt 300 Oa quèc l·ng nh©n(§«ng h¶i h¶i t©n 2)\nTiªu diÖt 300 h¶i tÆc (§«ng h¶i h¶i taan2)\nTiªu diÖt 300 Oa quèc ®ao kh¸ch(Thanh ¢m ®éng 1)\nTiªu diÖt 300 ngo¹i téc s¸t thñ (V­¬ng Kú Bé L¹c)\n<color>")
		TaskTip("Tiªu diÖt 300 Oa quèc l·ng nh©n ( §«ng h¶i h¶i t©n 2)")
		TaskTip("Tiªu diÖt  300 H¶i tÆc ( §«ng h¶i h¶i t©n 2)")
		TaskTip("Tiªu diÖt 300 Oa quèc ®ao kh¸ch (Thanh ©m ®éng 1)")
		TaskTip("tiªu diÖt300S¸t thñ ngo¹i téc (bé l¹c V­¬ng Kú )")
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 2)
		return 1
	end
	if 2 == nStatus then
		local nNum1 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep1)
		local nNum2 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep2)
		local nNum3 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep3)
		local nNum4 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep4)
  	if nNum1 >= 300 and nNum2 >= 300 and nNum3 >= 300 and nNum4 >= 300 then
			Talk(1,"","b¹n ®· hoµn thµnh nhiÖm vô qu©n doanh!".."Mau ®Õn T­¬ng D­¬ng t×m ®Ö tù thî rÌn L­u nhËn th­ëng ®i!")		
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 3)
			return 1
		end
		Talk(1,"","B¹n ®· nhËn nhiÖm vô qu©n doanh, Oa KhÊu xuÊt hiÖn ë trung nguyªn, b¸ch tİnh c¨m phÉn, h·y ®i t×m vµ giÕt chóng ®i!".."\n<color=red>Tiªu diÖt 300 Oa quèc l·ng nh©n(§«ng h¶i h¶i t©n 2)\nTiªu diÖt 300 h¶i tÆc (§«ng h¶i h¶i taan2)\nTiªu diÖt 300 Oa quèc ®ao kh¸ch(Thanh ¢m ®éng 1)\nTiªu diÖt 300 ngo¹i téc s¸t thñ (V­¬ng Kú Bé L¹c)\n<color>")
		Msg2Player(format("Tiªu diÖt %d/%d Oa quèc l·ng nh©n ( §«ng h¶i h¶i t©n 2)",nNum1,300))
		Msg2Player(format("Tiªu diÖt %d/%d H¶i tÆc ( §«ng h¶i h¶i t©n 2)",nNum2,300))
		Msg2Player(format("Tiªu diÖt %d/%d Oa quèc ®ao kh¸ch (Thanh ©m ®éng 1)",nNum3,300))
		Msg2Player(format("tiªu diÖt%d/%dS¸t thñ ngo¹i téc (bé l¹c V­¬ng Kú )",nNum4,300))
		return 1
	end
	if 3 == nStatus then
		Talk(1,"","b¹n ®· hoµn thµnh nhiÖm vô qu©n doanh!")
		return 1
	end
	return 0
end

--ÁõÌú½³µÜ×Ó¶Ô»°
WN_201403_CAMPTASK_AWARD = "Qu©n doanh-t­íng sÜ tµi n¨ng/WN_201403_CampTask_GetAward"

function WN_201403_CampTask_GetAward()
	WN_201403_CampTask_DailyReset()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus) ~= 3 then
		Talk(1,"","Hoµn thµnh nhiÖm vô xong míi ®­îc nhËn th­ëng")
		return
	end
	local tSay = {
		"nhËn th­ëng qu©n doanh/WN_201403_CampTask_GetAward_1",
		"®æi qu©n c«ng ch­¬ng anh hïng/WN_201403_CampTask_GetAward_2",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ta lµ ®Ö tö giái nhÊt cña thî rÌn L­u. Ta cã thÓ gióp ng­¬i th¨ng cÊp trang bŞ linh khİ cao cÊp. Ngoµi ra, nÕu ng­¬i cã trang bŞ th­îng cæ thÇn khİ Hoµng §Õ, ta còng cã thÓ thæi thÇn khİ gióp ng­¬i, lµm cho trang bŞ phï hîp víi ng­¬i h¬n. <color=red>L­u ı, nÕu vò khİ cña ng­¬i ®· kİch ho¹t Linh Ph¸ch, sau khi ta tiÕn hµnh thao t¸c, Linh Ph¸ch sÏ bŞ huû.<color>",
		getn(tSay), tSay)
end

function WN_201403_CampTask_GetAward_1()
	local tSay = {
			"miÔn phİ ( tiªu hao 07 giê tİch lòy online)/WN_201403_CampTask_GetAward_1_1",
			"tiªu phİ ( tiªu hao 07 giê tİch lòy online + 299 vµng)/WN_201403_CampTask_GetAward_1_2",
			"VIP ( tiªu hao 07 giê tİch lòy online + 299 vµng + 299 Xu vËt phÈm)/WN_201403_CampTask_GetAward_1_3",
			"T¹i h¹ chØ xem qua th«i/nothing"
	}
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ta lµ ®Ö tö giái nhÊt cña thî rÌn L­u. Ta cã thÓ gióp ng­¬i th¨ng cÊp trang bŞ linh khİ cao cÊp. Ngoµi ra, nÕu ng­¬i cã trang bŞ th­îng cæ thÇn khİ Hoµng §Õ, ta còng cã thÓ thæi thÇn khİ gióp ng­¬i, lµm cho trang bŞ phï hîp víi ng­¬i h¬n. <color=red>L­u ı, nÕu vò khİ cña ng­¬i ®· kİch ho¹t Linh Ph¸ch, sau khi ta tiÕn hµnh thao t¸c, Linh Ph¸ch sÏ bŞ huû.<color>",
		getn(tSay), tSay)
end

VET_LOGINTIME_TASK = 2536 --µ¥Î»ÊÇmin
function WN_201403_VetGetTime()
	return GetTask(VET_LOGINTIME_TASK) --ÀÛ¼ÆµÇÂ½·ÖÖÓmin
end

function WN_201403_VetSetTime(nMinute)
	SetTask(VET_LOGINTIME_TASK, nMinute) --ÉèÖÃÀÛ¼ÆÊ±¼ämin
end

function WN_201403_CampTask_GetAward_1_1()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1) ~= 0 then
		Talk(1,"","Mét ngµy chØ nhËn ®­îc mét lÇn th­ëng, hÑn gÆp l¹i ngµy mai nhĞ!")
		return
	end
	if gf_Judge_Room_Weight(1, 100) ~= 1 then
		Talk(1,"",format("Tói kh«ng ®ñ %d", 1))
		return
	end
	local nTime = WN_201403_VetGetTime()
	if nTime < 7 * 60 then
		Talk(1,"",format("Thêi gian tİch lòy online kh«ng ®ñ %d giê", 7))
		return
	end
	WN_201403_VetSetTime(nTime - 7 * 60)
	--
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1, 1)
	gf_Modify("Exp", 30000000)
	gf_AddItemEx2({2, 1, 30499, 1, 4}, "Hu©n ch­¬ng anh hïng", "2XU vËt phÈm", "nhËn qu©n c«ng t­íng", 0, 1)
end

function WN_201403_CampTask_GetAward_1_2()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1) ~= 0 then
		Talk(1,"","Mét ngµy chØ nhËn ®­îc mét lÇn th­ëng, hÑn gÆp l¹i ngµy mai nhĞ!")
		return
	end
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"",format("Tói kh«ng ®ñ %d", 2))
		return
	end
	if GetCash() < 2990000 then
		Talk(1,"",format("Sè vµng trong tói kh«ng ®ñ %d vµng ", 299))
		return
	end
	local nTime = WN_201403_VetGetTime()
	if nTime < 7 * 60 then
		Talk(1,"",format("Thêi gian tİch lòy online kh«ng ®ñ %d giê", 7))
		return
	end
	if Pay(2990000) ~= 1 then
		return
	end
	WN_201403_VetSetTime(nTime - 7 * 60)
	--
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1, 1)
	gf_Modify("Exp", 88000000)
	ahf_GetAFruits(18)
	gf_AddItemEx2({2, 1, 30499, 1, 4}, "Hu©n ch­¬ng anh hïng", "2XU vËt phÈm", "nhËn qu©n c«ng t­íng", 0, 1)
end

function WN_201403_CampTask_GetAward_1_3()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1) ~= 0 then
		Talk(1,"","Mét ngµy chØ nhËn ®­îc mét lÇn th­ëng, hÑn gÆp l¹i ngµy mai nhĞ!")
		return
	end
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"",format("Tói kh«ng ®ñ %d", 2))
		return
	end
	if GetCash() < 2990000 then
		Talk(1,"",format("Sè vµng trong tói kh«ng ®ñ %d vµng ", 299))
		return
	end
	if GetItemCount(2, 1, 30230) < 299 then
		Talk(1,"",format("Sè Xu item trong tói kh«ng ®ñ %d", 299))
		return
	end
	local nTime = WN_201403_VetGetTime()
	if nTime < 7 * 60 then
		Talk(1,"",format("Thêi gian tİch lòy online kh«ng ®ñ %d giê", 7))
		return
	end
	if Pay(2990000) ~= 1 then
		return
	end
	if DelItem(2, 1, 30230, 299) ~= 1 then
		return
	end
	WN_201403_VetSetTime(nTime - 7 * 60)
	--
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1, 1)
	gf_Modify("Exp", 113114115)
	ahf_GetAFruits(39)
	gf_AddItemEx2({2, 1, 30499, 3, 4}, "Hu©n ch­¬ng anh hïng", "2XU vËt phÈm", "nhËn qu©n c«ng t­íng", 0, 1)
end

function WN_201403_CampTask_GetAward_2()
	local tSay = {
			"§æi 01 hu©n ch­¬ng anh hïng (tiªu hao 150xu vËt phÈm+15 vµng)/WN_201403_CampTask_GetAward_2_1",
			"§æi 10 hu©n ch­¬ng anh hïng(tiªu hao1500xu vËt phÈm + 150 vµng)/WN_201403_CampTask_GetAward_2_2",
			"T¹i h¹ chØ xem qua th«i/nothing"
	}
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ta lµ ®Ö tö giái nhÊt cña thî rÌn L­u. Ta cã thÓ gióp ng­¬i th¨ng cÊp trang bŞ linh khİ cao cÊp. Ngoµi ra, nÕu ng­¬i cã trang bŞ th­îng cæ thÇn khİ Hoµng §Õ, ta còng cã thÓ thæi thÇn khİ gióp ng­¬i, lµm cho trang bŞ phï hîp víi ng­¬i h¬n. <color=red>L­u ı, nÕu vò khİ cña ng­¬i ®· kİch ho¹t Linh Ph¸ch, sau khi ta tiÕn hµnh thao t¸c, Linh Ph¸ch sÏ bŞ huû.<color>",
		getn(tSay), tSay)
end

function WN_201403_CampTask_GetAward_2_1()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward2) ~= 0 then
		Talk(1,"","Mét ngµy chØ nhËn ®­îc mét lÇn th­ëng, hÑn gÆp l¹i ngµy mai nhĞ!")
		return
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return
	end
	if GetItemCount(2, 1, 30230) < 150 then
		Talk(1,"",format("Sè Xu item trong tói kh«ng ®ñ %d", 150))
		return
	end
	if GetCash() < 150000 then
		Talk(1,"",format("Sè vµng trong tói kh«ng ®ñ %d vµng ", 15))
		return
	end
	if Pay(150000) ~= 1 or DelItem(2, 1, 30230, 150) ~= 1 then
		return
	end
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward2, 1)
	gf_AddItemEx2({2, 1, 30499, 1, 4}, "Hu©n ch­¬ng anh hïng", "2XU vËt phÈm", "§æi hu©n ch­¬ng anh hïng ", 0, 1)
end

function WN_201403_CampTask_GetAward_2_2()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward3) ~= 0 then
		Talk(1,"","Mét ngµy chØ nhËn ®­îc mét lÇn th­ëng, hÑn gÆp l¹i ngµy mai nhĞ!")
		return
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return
	end
	if GetItemCount(2, 1, 30230) < 1500 then
		Talk(1,"",format("Sè Xu item trong tói kh«ng ®ñ %d", 1500))
		return
	end
	if GetCash() < 1500000 then
		Talk(1,"",format("Sè vµng trong tói kh«ng ®ñ %d vµng ", 150))
		return
	end
	if Pay(1500000) ~= 1 or DelItem(2, 1, 30230, 1500) ~= 1 then
		return
	end
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward3, 1)
	gf_AddItemEx2({2, 1, 30499, 10, 4}, "Hu©n ch­¬ng anh hïng", "2XU vËt phÈm", "§æi hu©n ch­¬ng anh hïng ", 0, 1)
end