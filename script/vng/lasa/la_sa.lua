Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 


TUI_HAT_GIONG_NopCount = 6

function main()
	local nDate =  tonumber(date("%y%m%d%H"))
--	if nDate < 120312 or nDate > 120408 then
--		Talk(1, "", "§· hÕt h¹n tÆng quµ cho chÞ em Phô N÷!")
--		return
--	end
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Ho¹t ®éng nép tói h¹t gièng:"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog, "Ta muèn nhËn th­ëng trång c©y (tiªu hao 1 tói h¹t gièng + 20 lé thñy)/nop_hatgiong")
	if (nDate >= 12082010 or GetAccount() == "pemiliem") and nDate < 12083100 then
		tinsert(tbSayDialog, "Ta ®Õn b×nh chän giai nh©n/VoteMynu_Form")
	end
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
	
end

function nop_hatgiong()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh©n vËt cÊp <color=green>79<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end

	VietResetDate() -- reset gi¸ trÞ mçi ngµy
	if mod(GetTask(TSK_COUNT_EVERYDAY),100) >= TUI_HAT_GIONG_NopCount then
		Talk(1,"",format("Mçi ngµy giíi h¹n nép <color=green>%d<color> lÇn Tói H¹t Gièng",TUI_HAT_GIONG_NopCount));
		return 0;
	end
	if GetItemCount(2,1,30087) < 1 then 
		Talk(1,"","§¹i hiÖp kh«ng cã Tói H¹t Gièng ®Ó ®æi th­ëng !!!")
		return 0;
	end
	if GetItemCount(2,0,351) < 20 then 
		Talk(1,"","§¹i hiÖp kh«ng cã ®ñ 20 Lé Thñy ®Ó ®æi th­ëng !!!")
		return 0;
	end
	if DelItem(2,1,30087,1) == 1 and DelItem(2,0,351,20) == 1 then
		SetTask(TSK_COUNT_EVERYDAY, GetTask(TSK_COUNT_EVERYDAY)+1);
		ModifyExp(6600000)
 		gf_WriteLogEx("NOP TUI HAT GIONG", "nép thµnh c«ng", 1, "Nép tói h¹t gièng")
	end	
end

-- Binh chon My nu
function VoteMynu_Form()
local nDate =  tonumber(date("%y%m%d"))
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>C¸c h¹ h·y b×nh chän cho giai nh©n m×nh yªu thÝch nhÐ."
	local tbDanhSachMyNu = {
			[1] = {"NguyÔn ThÞ Quúnh Anh",7},
			[2] = {"Lª Ngäc HuyÒn Tr©m",2},
			[3] = {"Lª Ph­¬ng Thóy",5},
			[4] = {"TrÇn ThÞ HuyÒn Trang",1},
			[5] = {"NguyÔn Mai Chinh",3},
			[6] = {"§µm ThÞ Hµ Trang",6},
			[7] = {"Bïi Th¹ch Nh­ ý",9},	
			[8] = {"NguyÔn ThÞ Kim Nguyªn",4},
			[9] = {"TrÞnh ThÞ Ph­¬ng Oanh",8},
		}
	LIB_txtData:Init("hotgirl.txt")
	LIB_txtData:LoadData()
	
	local tbSayDialog = {};
	for i=getn(tbDanhSachMyNu),1,-1 do
		local nVoteListID = tbDanhSachMyNu[i][2]
		tinsert(tbSayDialog,1,"Ta muèn b×nh chän cho Mü n÷ " .. tbDanhSachMyNu[i][1] .. " (" ..LIB_txtData.tbTextData[nVoteListID]  .. " lÇn chän)/#VoteMynu(" .. nVoteListID .. ")")
	end
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end


function VoteMynu(nID)
	if GetAccount() == "pg1team002" or GetAccount() == "pg1team007" then
		LIB_txtData:Init("hotgirl.txt")
		LIB_txtData:AddValue(nID,1)
		VoteMynu_Form()
	else
		if gf_Judge_Room_Weight(2, 500,"") == 0 then
			Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ");
			return 0
		end
		local nTraicay = 0
		for i=30164, 30183 do
			if GetItemCount(2,1,i) >= 10 then
				nTraicay = i
				break
			end
		end
		if nTraicay == 0 then
			Talk(1,"","C¸c h¹ kh«ng ®em ®ñ tr¸i c©y, h·y chuÈn bÞ ®Çy ®ñ råi ®Õn gÆp ta nhÐ!")
			return 0
		end
		if DelItem(2,1,nTraicay,10) == 1 then
			LIB_txtData:Init("hotgirl.txt")
			LIB_txtData:AddValue(nID,1)
			TraoThuongVoteMyNu()
			VoteMynu_Form()
		end
	end
end

function TraoThuongVoteMyNu()
	local tbAward1 = {item = {{gdp={2,1,30367,1}, name="Tói tiÒn"}}}
	local tbAward2 = {item = {{gdp={2,1,30367,2}, name="Tói tiÒn"}}}
	local tbAward3 = { item = {{gdp={2,1,30367,3}, name="Tói tiÒn"}}}
	local tbAward4 = {item = {{gdp={2,1,30367,4}, name="Tói tiÒn"}}}
	local tbAward5 = {item = {{gdp={2,1,30367,5}, name="Tói tiÒn"}}}
	local tbAward6 = {item = {{gdp={2,0,504,1}, name="C©y B¸t Nh· nhá", nExpired = 7*24*60*60}}}
	local tbAward7 = {item = {{gdp={2,0,398,1}, name="C©y B¸t Nh· lín", nExpired = 7*24*60*60}}}
	local tbAward8 = {item = {{gdp={2,1,30269,1}, name="C©y Tø Linh", nExpired = 7*24*60*60}}}
	local tbAward9 = {item = {{gdp={1,0,6,1}, name="H¾c Ngäc §o¹n Tôc Cao"}}}
	local tbAward10 = {item = {{gdp={2,1,3356,1}, name="Tói Thiªn Th¹ch Tinh Th¹ch", nExpired = 7*24*60*60}}}
	local tbAward11 = {item = {{gdp={2,1,1051,1}, name="Bao Thiªn Th¹ch Tinh Th¹ch", nExpired = 7*24*60*60}}}
	local tbAward12 = {item = {{gdp={2,1,30406,1}, name="Thiªn HuyÔn Kh¾c B¶n cÊp 1"}}}
	local tbAward13 = {item = {{gdp={2,1,30407,1}, name="Thiªn HuyÔn Kh¾c B¶n cÊp 2"}}}
	local tbAward14 = {item = {{gdp={2,1,30408,1}, name="Thiªn HuyÔn Kh¾c B¶n cÊp 3"}}}
	local tbAward15 = {item = {{gdp={2,1,30346,1}, name="M¶nh B¹ch Kim"}}}
	local tbAward16 = {item = {{gdp={2,95,204,1}, name="Thiªn Cang LÖnh"}}}
	local tbAward17 = {item = {{gdp={2,1,1068,1}, name="Thiªn Thiªn Th¹ch Linh Th¹ch", nExpired = 7*24*60*60}}}
	local tbAward18 = {item = {{gdp={2,1,1067,1}, name="§Þnh Hån Thiªn Thiªn Th¹ch ThÇn Th¹ch", nExpired = 7*24*60*60}}}
	local tbAward19 = {item = {{gdp={2,1,1113,1}, name="§¹i §Þnh Hån", nExpired = 7*24*60*60}}}
	local tbAwardExp = {nExp = 250000}
	local tbAwardSet = {
		[1] = {[1] = tbAward1, nRate = 45.730},
		[2] = {[1] = tbAward2, nRate = 11.433},
		[3] = {[1] = tbAward3, nRate = 3.000},
		[4] = {[1] = tbAward4, nRate = 2.000},
		[5] = {[1] = tbAward5, nRate = 1.000},
		[6] = {[1] = tbAward6, nRate = 1.000},
		[7] = {[1] = tbAward7, nRate = 1.000},
		[8] = {[1] = tbAward8, nRate = 1.000},
		[9] = {[1] = tbAward9, nRate = 30.000},
		[10] = {[1] = tbAward10, nRate = 0.500},
		[11] = {[1] = tbAward11, nRate = 0.001},
		[12] = {[1] = tbAward12, nRate = 3.000},
		[13] = {[1] = tbAward13, nRate = 0.330},
		[14] = {[1] = tbAward14, nRate = 0.001},
		[15] = {[1] = tbAward15, nRate = 0.001},
		[16] = {[1] = tbAward16, nRate = 0.001},
		[17] = {[1] = tbAward17, nRate = 0.001},
		[18] = {[1] = tbAward18, nRate = 0.001},
		[19] = {[1] = tbAward19, nRate = 0.001},
	}
	LIB_Award.szLogTitle = "BINH CHON GIAI NHAN"
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAwardExp)
	LIB_Award:AwardByRate(tbAwardSet)
end