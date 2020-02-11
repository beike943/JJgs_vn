--==========Code By PhucNG 16-10-2014=======--
--=====Event §ua top bang héi liªn server===--
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\online_activites\\2011_12\\qingrenjie\\sale_chocolate.lua")
Include("\\script\\online_activites\\201202\\zengsongpifeng\\send_pifeng.lua")
Include("\\script\\online_activites\\201211\\jixiang_ruyi.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\vng\\doinguyenlieu.lua")
Include("\\script\\vng\\eventkimxalienserver.lua")

szNpcName = "<color=green>La Sa<color>: "
tbVoteMaterials = {
	[1] = {1, {nExp = 10000000}, "10 triÖu ®iÓm kinh nghiÖm(1 ®iÓm tÝch lòy)"},
	[2] = {10,{nExp = 100000000}, "100 triÖu ®iÓm kinh nghiÖm(10 ®iÓm tÝch lòy)"},
	[3] = {1, {item={{gdp={2,1,30499,1}}}}, "1 Hu©n Ch­¬ng Anh Hïng(1 ®iÓm tÝch lòy)"},
	[4] = {2, {item={{gdp={2,1,30614,1}}}}, "1 L«i Hæ Tinh Ph¸ch(2 ®iÓm tÝch lòy)"},
	[5] = {1, {item={{gdp={2,2,8,5}},{gdp={2,1,30230,8}}}}, "5 Thiªn Th¹ch vµ 8 Xu VËt PhÈm(1 ®iÓm tÝch lòy)"},
}

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if gf_CheckEventDateEx(53) == 1 then
		Say("#<color=green>Lasa<color>: b¸n Socola lÔ t×nh nh©n",2,"Ta ®Õn mua Socola lÔ t×nh nh©n/buy_chocolate","Ta chØ ghÐ ch¬i/do_nothing");
		return 1;
	end
	if gf_CheckEventDateEx(57) == 1 then
		Say("<color=green>Lasa<color>:tÆng Hoµng Kim Phi Phong cho tÊt c¶ n÷ sinh trong thµnh (<color=green>®· sö dông phÇn th­ëng cuèi cña event 8 thang 3 sÏ nhËn ®­îc phÇn th­ëng cuçi phong phó h¬n<color>)",2,"Mêi SaSa thay ta tÆng Phi Phong cho c¸c chÞ em phô n÷ trong thµnh (tiªu hao 8 Phi Phong Hoµng Kim + 3 vµng)/deal_send","Ta chØ ghÐ ch¬i/do_nothing")
		return 1;
	end
	if gf_CheckEventDateEx(VET_ACTIVITY_JIXIANG_RUYI) == 1 then
		Say("<color=green>La Sa<color>: Gi¸ng sinh vui vÎ!", getn(TABLE_JIXIANG_RUYI), TABLE_JIXIANG_RUYI);
		return 1;
	end
	
	--»î¶¯µÄ
	local tSay = {};
	--¸±»î¶¯
	local tActivityID = {84, 124, 127, 136};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	
	--Event Dua Top Bang Hoi Lien Server 21/10/2014 - 30/11/2014
	if GetGlbValue(GLB_TSK_SERVER_ID) ~= 92 then
		--DuaTop_Main()
		if nDate >= 20141022 and nDate <= 20141130 then
			tinsert(tSay,"Bang chñ ®¹i diÖn Bang Héi ®¨ng ký tham gia/DuaTop_DangKy")
			tinsert(tSay,"Xem th«ng tin c¸c Bang Héi tham gia trong m¸y chñ/DuaTop_ViewListBangHoi")
			tinsert(tSay,"ñng hé c¸c Bang Héi/DuaTop_UngHo")
			tinsert(tSay,"Xem tÝch lòy b¶n th©n/DuaTop_ViewPersonalPoint")
			tinsert(tSay,"Xem tÝch lòy c¸c Bang Héi/DuaTop_ViewBangHoiPoint")		
		end	
	end
	
	if nDate >= 20130416 and nDate <= 20130421 then
		tinsert(tSay, "Ta muèn ®æi nguyªn liÖu lÊy kinh nghiÖm/Trade_Material2Exp_Menu")
		tinsert(tSay, "Ta muèn ®æi c¸c lo¹i nguyªn liÖu lÊy phÇn th­ëng/Trade_Material2Item_Menu")
	end
	if nDate >= 20131012 and nDate <= 20131024 then
		tinsert(tSay, "§ua top Trang bÞ Kim Xµ Nguyªn So¸i/EventKimXaLienServer_Menu")
	end
	if nDate == 20131027 then
		tinsert(tSay, "Bang chñ nhËn th­ëng ®ua top Kim Xµ Nguyªn So¸i/EventKimXaLienServer_NhanThuong_Form")
	end
	
	
	tinsert(tSay, "\nKÕt thóc ®èi tho¹i/do_nothing");
	Say("<color=green>La Sa<color>: ThËt ra hä tiÕng hoa cña ta lµ hä T­ëng, nghe hay kh«ng?", getn(tSay), tSay);
end

function do_nothing()
end

function DuaTop_NhanThuong(nRank)
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	local szTongName = GetTongName()
	local isTong = IsTongMaster()
	
	local nCheck = 0
	local nPoint = 0
	for i = 1, getn(LIB_txtData.tbTextData) do
		if szTongName == LIB_txtData.tbTextData[i][1] then
			nPoint = LIB_txtData.tbTextData[i][5]
			nCheck = 1
			break
		end
	end
		
	if nCheck <= 0 then
		Talk(1,"","C¸c h¹ kh«ng cã trong danh s¸ch bang héi nhËn th­ëng!")
		return
	end
	
	if isTong ~= 1 then
		Talk(1,"","C¸c h¹ kh«ng ph¶i bang chñ, kh«ng thÓ nhËn th­ëng!")
		return
	end
	
	local nNhanThuong = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,2,0)
	if nNhanThuong >= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng. Kh«ng thÓ nhËn ®­îc n÷a!")
		return
	end
	
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(7*24*3600));
	if nDayCount <=  1 then
		Talk(1,"",szNpcName.."Thêi gian gia nhËp cña c¸c h¹ Ýt h¬n 7 ngµy, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	if nPoint < 300000 then
		Talk(1,"","§iÓm tÝch lòy d­íi 300,000 ®iÓm. Bang héi kh«ng thÓ nhËn th­ëng!")
		return
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Judge_Room_Weight(15, 700) == 0 then
		Talk(1,"", szNpcName.."H·y chuÈn bÞ Ýt nhÊt 15 « trèng vµ 700 søc lùc råi quay l¹i ®©y nhËn th­ëng !")
		return 0
	end
	local tbAward11 = {item = {{gdp={2,1,1051,1}, name="Bao Thiªn Th¹ch Tinh Th¹ch", nExpired = 7*24*60*60}}}
	local nRoute = GetPlayerRoute()
	if nRank == 1 then
		TraoChienCuong(15)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(13)
		LIB_Award:Award({item = {{gdp={0,112,225,3}, name="MËt TÞch Tiªu Dao Toµn ¶nh"}}})
		TraoMatTichCaoCap(5,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,1051,3}, name="Bao Thiªn Th¹ch Tinh Th¹ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,500}, name="Thiªn Kiªu LÖnh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,10}, name="Hßa ThÞ BÝch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30014,2}, name="B¸o Vµng"}}})
	elseif nRank == 2 then
		TraoChienCuong(13)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(7)
		LIB_Award:Award({item = {{gdp={0,112,225,1}, name="MËt TÞch Tiªu Dao Toµn ¶nh"}}})
		TraoMatTichCaoCap(5,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,1051,1}, name="Bao Thiªn Th¹ch Tinh Th¹ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,200}, name="Thiªn Kiªu LÖnh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,5}, name="Hßa ThÞ BÝch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30013,1}, name="B¸o §en"}}})
	elseif nRank == 3 then
		TraoChienCuong(10)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(0)
		LIB_Award:Award({item = {{gdp={0,112,225,1}, name="MËt TÞch Tiªu Dao Toµn ¶nh"}}})
		TraoMatTichCaoCap(5,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,3356,1}, name="Tói Thiªn Th¹ch Tinh Th¹ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,100}, name="Thiªn Kiªu LÖnh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,2}, name="Hßa ThÞ BÝch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30039,1}, name="Thá §en"}}})
	end
	gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,2,1)
	Msg2Player("C¸c h¹ ®· nhËn th­ëng thµnh c«ng")
end

function DuaTop_ViewPersonalPoint()
	local nPoint = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,1)
	Talk(1,"",szNpcName.."H«m nay c¸c h¹ ®· ñng hé ®­îc tæng céng <color=red>"..nPoint.."<color> ®iÓm")
end

function DuaTop_ViewBangHoiPoint()
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	local msgs = {"","","",""}
		
	for i = 1, getn(LIB_txtData.tbTextData) do
		if i <= 50 then
			msgs[1] = msgs[1] .."<color=green>".. LIB_txtData.tbTextData[i][1].."<color>(<color=red>"..LIB_txtData.tbTextData[i][5].."<color> ®iÓm), "
		elseif i <= 100 then
			msgs[2] = msgs[2] .."<color=green>".. LIB_txtData.tbTextData[i][1].."<color>(<color=red>"..LIB_txtData.tbTextData[i][5].."<color> ®iÓm), "
		end
	end	
	
	if msgs[1] == "" then
		Talk(1,"",szNpcName.."HiÖn t¹i kh«ng cã bang héi nµo ®¨ng ký tham gia!")
		return
	end
	
	for i = 1, getn(msgs) do
		if msgs[i] ~= "" then
			Talk(1, "", msgs[i])
		end
	end
end

function DuaTop_UngHo()
	local nConfirmCDKey = GetTask(2822) --GetExtPoint(EXT_CDKEY)
	local nConfirmVC = GetVipCardRemainTime()
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 100 then
		Talk(1,"", szNpcName.."C¸c h¹ vui lßng ®Õn TuyÒn Ch©u ñng hé nhÐ!")
		return 
	end
	
	if IsPlayerDeath() == 1 then
		Talk(1,"",szNpcName.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ nhËn th­ëng.")	
		return
	end
	
	-- Check Kich ho¹t tµng kiÕm lÖnh 2
	if nConfirmCDKey <= 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a kÝch ho¹t Tµng KiÕm LÖnh, kh«ng thÓ ®¨ng ký tham gia!")
		return
	end
	
	-- Check kÝch ho¹t VIP
	if nConfirmVC <= 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a kÝch ho¹t thÎ Xö n÷, kh«ng thÓ ®¨ng ký tham gia!")
		return
	end

	--Check gia nhËp m«n ph¸i
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia ñng hé Bang Héi!");
		return
	end
	
	--Check Level
	if 	gf_GetPlayerRebornCount() < 1 and GetLevel() < 90 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a ®ñ level 90. H·y vÒ nhµ luyÖn thªm råi quay l¹i ®©y!")
		return
	end
	
	--Check max skill 55
	if CheckMaxSkill55() ~= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a n©ng cÊp tèi ®· kÜ n¨ng cÊp 55!")
		return
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	if LIB_txtData.tbTextData == nil then
		Talk(1,"","Kh«ng cã bang héi nµo ®¨ng ký tham gia!")
		return
	end	
	
	local tbSay = {}
	tbSay[0] = szNpcName.."C¸c h¹ h·y lùa chän bang héi muèn b×nh chän: "
	for i = 1, getn(LIB_txtData.tbTextData) do
		tinsert(tbSay,"Ta muèn b×nh chän bang héi "..LIB_txtData.tbTextData[i][1].."/#DuaTop_UngHo_01("..i..")")
	end
	
	gf_PageSay(tbSay, 1, 6);
end

function DuaTop_UngHo_01(nBang)
	local tbSay = {}
	for i = 1, 5 do
		tinsert(tbSay,format(tbVoteMaterials[i][3].."/#DuaTop_UngHo_02(%d,%d)",i,nBang))
	end
	tinsert(tbSay,"Rêi Khái/gf_DoNothing")
	Say(szNpcName.."C¸c h¹ muèn b×nh chän b»ng h×nh thøc nµo?",getn(tbSay),tbSay)
end

function DuaTop_UngHo_02(nType,nBang)
	
	local nPointVote = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,1)
	if nPointVote + tbVoteMaterials[nType][1] > 200 then
		Talk(1,"","C¸c h¹ chØ ®­îc nép tèi ®a 200 ®iÓm trong ngµy. Xin vui lßng quay l¹i ngµy h«m sau!")
		return
	end
	
	if LIB_Award:CheckMaterial(tbVoteMaterials[nType][2]) ~= 1 then
		return
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,1,nPointVote + tbVoteMaterials[nType][1])
	LIB_txtData.tbTextData[nBang][5] = LIB_txtData.tbTextData[nBang][5] + tbVoteMaterials[nType][1]
	sort(LIB_txtData.tbTextData, function(x,y) return tonumber(x[5]) > tonumber(y[5]) end)
	LIB_txtData:SaveMultiColumn()
	LIB_Award:PayMaterial(tbVoteMaterials[nType][2])
	Msg2Player("C¸c h¹ ®· b×nh chän thµnh c«ng cho bang héi "..LIB_txtData.tbTextData[nBang][1])
	AddGlobalNews("Sù kiÖn §ua Top Bang Héi Liªn Server: Bang Héi "..LIB_txtData.tbTextData[nBang][1].." ®· ®­îc b×nh chän "..tbVoteMaterials[nType][1].." ®iÓm!")
	DuaTop_UngHo_01(nBang)
end

function DuaTop_ViewListBangHoi()
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nCount = getn(LIB_txtData.tbTextData)
	local msgs = {
		szNpcName.."HiÖn t¹i ®· cã "..nCount.." bang héi tham gia sù kiÖn: \n",
		"","","",
	}
	
	for i = 1, nCount do
		if i <= 40 then
			msgs[1] = msgs[1] .. "<color=green>"..LIB_txtData.tbTextData[i][1].."<color>, "
		elseif i <= 80 then
			msgs[2] = msgs[2] .. "<color=green>"..LIB_txtData.tbTextData[i][1].."<color>, "
		end
	end	
	
	for i = 1, getn(msgs) do
		if msgs[i] ~= "" then
			Talk(1, "", msgs[i])
		end
	end
end

function DuaTop_DangKy()
	local szTong = GetTongName()
	local szAccount = GetAccount()
	local nLevel = GetLevel()
	local szName = GetName()
	local nPoint = 0
	local nConfirmCDKey = GetTask(2822) --GetExtPoint(EXT_CDKEY)
	local nConfirmVC = GetVipCardRemainTime()
	
	--Check Kich ho¹t tµng kiÕm lÖnh 2
	if nConfirmCDKey <= 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a kÝch ho¹t Tµng KiÕm LÖnh, kh«ng thÓ ®¨ng ký tham gia!")
		return
	end
	
	--Check kÝch ho¹t VIP
	if nConfirmVC <= 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a kÝch ho¹t thÎ Xö n÷, kh«ng thÓ ®¨ng ký tham gia!")
		return
	end
	
	--Check cã ph¶i bang chñ?
	local isTong = IsTongMaster()
	if isTong ~= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. Kh«ng thÓ ®¨ng ký tham gia Bang Héi ®ua top!")
		return
	end
	
	--Check gia nhËp m«n ph¸i
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia ñng hé Bang Héi!");
		return
	end
	
	--Check Level
	if 	gf_GetPlayerRebornCount() < 1 and GetLevel() < 90 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a ®ñ level 90. H·y vÒ nhµ luyÖn thªm råi quay l¹i ®©y!")
		return
	end
	
	--Check max skill 55
	if CheckMaxSkill55() ~= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a n©ng cÊp tèi ®· kÜ n¨ng cÊp 55!")
		return
	end
	
	--Check Cïng server
	if gf_GetTaskByte(TSK_SERVER_ID,1) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ph¶i thÇn d©n bæn quèc, kh«ng ®­îc ®¨ng ký tham gia!")
		return 0
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheck = 0	
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
		Talk(1,"",szNpcName.."Bang héi c¸c h¹ ®· ®¨ng ký thµnh c«ng, kh«ng ®­îc ®¨ng ký thªm lÇn n÷a!")
		return 0
	end
	
	local szLog = szTong.."	"..szAccount.."	"..szName.."	"..nLevel.."	".. nPoint
	LIB_txtData:AddLine(szLog)
	Talk(1,"",szNpcName.."Bang héi c¸c h¹ b¸o danh sù kiÖn §ua Top Bang Héi Liªn Server thµnh c«ng, xin chóc mõng.")
	AddGlobalNews("Chóc mõng bang héi "..szTong.." b¸o danh thµnh c«ng sù kiÖn §ua Top Bang Héi Liªn Server!")
end