Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua")

PROMOTION_EVERYDAY = "KHUYEN MAI MOI NGAY"
SALEOFF_START_DATE = 20130102
SALEOFF_END_DATE = 20130217
SALEOFF_START_TIME = 1945
SALEOFF_END_TIME = 2130
szNpcName = "<color=green>Tô B¶o Th­¬ng Nh©n: <color>"

--tbItemSaleOff = {
--	{"Hßa ThÞ BÝch",2,1,1001,1,{2,1,1001,1}, 30*24*60*60},	
--	{"Tói Thiªn Th¹ch Tinh Th¹ch",2,1,3356,1,{2,1,3356,1}, 30*24*60*60},
--	{"Bao Th«ng Thiªn LÖnh Lín",2,1,30412,1,{2,1,30412,1}, 30*24*60*60},
--	{"Bao Tô NghÜa LÖnh Lín",2,95,211,1,{2,95,211,1}, 30*24*60*60},
--	{"Tói H¹t Gièng",2,1,30087,1,{2,1,30087,1}, 7*24*60*60},
--	{"ChuyÓn Sinh §¬n",2,1,30345,1,{2,1,30345,1}, 30*24*60*60},
--}

tbThuCuoi = {
		[1] = {"§éc Gi¸c Thó B¶o B¶o", 0,105,30032},
		[2] = {"Kim Kú L©n B¶o B¶o", 0,105,30017},
		[3] = {"Kim Mao Ng­u B¶o B¶o", 0,105,30022},
		[4] = {"B¸o Vµng B¶o B¶o", 0,105,30030},
}

function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = ""
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= SALEOFF_START_DATE and nDate <= SALEOFF_END_DATE then
		local tbSay = {}
		for i=1, getn(tbThuCuoi) do
			tinsert(tbSay, "Mua "..tbThuCuoi[i][1].." gi¸ rÎ (999 vµng)/#MuaThuCuoi("..i..")")
		end
		tinsert(tbSay,"Ta chØ ghÐ xem/gf_Nothing")
		Say("Ta cã vµi con kú tr©n dÞ thó, ng­¬i cã muèn mua lµm thó c­ìi kh«ng?", getn(tbSay), tbSay)
	else
		Say("Ta th­êng cã nh÷ng mÆt hµng quÝ hiÕm, gi¸ c¶ l¹i v« cïng rÎ, ng­¬i h·y th­êng xuyªn ghÐ th¨m nhÐ...",1,"T¹i h¹ biÕt råi/gf_Nothing")
	end
	
	--:::::::::::::::::: Sieu Khuyen Mai :::::::::::::::::::::::::::
--	local nDate = tonumber(date("%Y%m%d"))
--	local nTime = tonumber(date("%H%M"))
--	if nDate >= SALEOFF_START_DATE and nDate <=SALEOFF_END_DATE then
--		if nTime >= SALEOFF_START_TIME and nTime <= SALEOFF_END_TIME then
--			tbSayDialog = SaleOff_CreateMenu()
--		else
--			Talk(1,"",szNpcName.."Cöa tiÖm cña ta chØ më cöa tõ 19:45 ®Õn 21:30, c¸c h¹ h·y tranh thñ ®Õn vµo ®óng thêi ®iÓm.!")
--			return 0
--		end
--	end
--	gf_PageSay(tbSayDialog, 1, 6)
	--------------------------------------------------------------
end

function MuaThuCuoi(nOption)
	if gf_JudgeRoomWeight(1,200) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	if GetCash() < 9990000 then
		Talk(1,"",szNpcName.."ThuËn mua võa b¸n, <color=yellow>999<color> vµng cña ng­¬i ®©u? §ñ tiÒn ta míi giao hµng nhÐ!!");
		return 0
	end
	if Pay(9990000) == 1 then
		local tbAward = {item={{gdp={tbThuCuoi[nOption][2],tbThuCuoi[nOption][3],tbThuCuoi[nOption][4],1,1,-1,-1,-1,-1,-1,-1,-1}, name= tbThuCuoi[nOption][1], nExpired = 7*24*60*60}}}
		LIB_Award.szLogTitle = "BAN THU CUOI GIA RE"
		LIB_Award.szLogAction = "mua"
		LIB_Award:Award(tbAward)
	end
end

--****************************************************************
--			Siªu khuyÕn m·i - BEGIN
--****************************************************************
--function SaleOff_CreateMenu()
--	local tSay = {}
--	local szFileName = date("%Y%m%d") .. ".txt"
--	LIB_txtData:Init(szFileName)
--	local nRet = LIB_txtData:LoadMultiColumn();
--	if nRet > 0 then	
--		tSay[0] =  szNpcName.."Ta míi ®em vÒ l« hµng gi¸ ®Æc biÖt, mêi vâ l©m hµo kiÖt ®Õn xem thö!!!"
--		for i = 1, getn(LIB_txtData.tbTextData) do
--			local szItem = tbItemSaleOff[i][1]
--			local nQty = tonumber(LIB_txtData.tbTextData[i][1])
--			local nPrize = tonumber(LIB_txtData.tbTextData[i][2])
--			local szExpired = ""
--			if tonumber(LIB_txtData.tbTextData[i][3]) > 0 then
--				szExpired = ", h¹n sö dông ".. LIB_txtData.tbTextData[i][3] .. "ngµy"
--			end
--			tinsert(tSay ,szItem..": Gi¸ " .. nPrize  .. " xu vËt phÈm" .. szExpired .." (cßn l¹i " .. nQty ..")/#MuaSieuKhuyenMai("..i..")")
--		end
--	else
--		tSay[0] =  szNpcName.."Hµng hãa h«m nay kh«ng cã, khi kh¸c c¸c h¹ ®Õn nhÐ!!!"
--	end
--	return tSay
--end
--
--
--function MuaSieuKhuyenMai(nOption)
--	if gf_JudgeRoomWeight(1,100) == 0 then
--		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
--		return 0
--	end
--	local nTime = GetTime()
--	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 6) then
--		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 6) - GetTime()
--		Talk(1,"","NhiÒu ng­êi mua qu¸, cho ta nghØ mÖt mét tÝ. H·y quay l¹i sau "..nTimeRemain.." gi©y n÷a !!!")
--		return 0
--	end
--	
--	local szFileName = date("%Y%m%d") .. ".txt"
--	LIB_txtData:Init(szFileName)
--	local nRet = LIB_txtData:LoadMultiColumn();
--	if nRet == 0 then
--		return 0
--	end
--	local nQty = tonumber(LIB_txtData.tbTextData[nOption][1])
--	if nQty <= 0 then
--		Talk(1,"",szNpcName.."<color=yellow>"..tbItemSaleOff[nOption][1].." ®· hÕt, hay lµ c¸c h¹ h·y chän mãn kh¸c nhÐ!.")
--		return 0
--	end
--	if GetItemCount(2,1,30230) <  tonumber(LIB_txtData.tbTextData[nOption][2]) then
--		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®ñ xu vËt phÈm ®Ó ®æi mãn nµy, hay chän mãn kh¸c rÎ h¬n?.")
--		return 0
--	end
--	LIB_txtData.tbTextData[nOption][1] = nQty - 1
--	LIB_txtData:SaveMultiColumn()
--	
--	LIB_Award.szLogTitle = "SIEU KHUYEN MAI THANG 11"
--	LIB_Award.szLogAction = "mua"
--	local nHSD = tonumber(LIB_txtData.tbTextData[nOption][3]) * 24*60*60
--	local tbAward = {
--			item={gdp={tbItemSaleOff[nOption][2],tbItemSaleOff[nOption][3],tbItemSaleOff[nOption][4],1}, name = tbItemSaleOff[nOption][1], nExpired = nHSD}
--	}
--	if DelItem(2,1,30230,tonumber(LIB_txtData.tbTextData[nOption][2])) == 1 then
--		LIB_txtData.tbTextData[nOption][1] = nQty - 1
--		LIB_txtData:SaveMultiColumn()
--		--LIB_Award:Award(tbAward)
--		SetGlbValue(GLB_TASK_PROMOTION, GetTime())
--		--Talk(1,"","Thanh cong - " ..nHSD)
--		gf_AddItemEx2(tbItemSaleOff[nOption][6], tbItemSaleOff[nOption][1], PROMOTION_EVERYDAY, "mua "..tbItemSaleOff[nOption][1], tbItemSaleOff[nOption][7])
--		
--	end
--end
--****************************************************************
--			Siªu khuyÕn m·i - END
--****************************************************************









--function get_selloff()
--	local nTime = tonumber(date("%H%M"))
--	if nTime < 0800 or nTime > 2400 then
--		Talk(1,"","HiÖn t¹i ch­a ®Õn giê b¸n, ®¹i hiÖp h·y quay l¹i sau nha !!!")		
--		return
--	end
--	local tbSayDialog = {};
--	tinsert(tbSayDialog, "§ång ý /confirm_buy")
--	tinsert(tbSayDialog, "Ta chØ ghÐ ngang /do_nothing")	
--	Say("Ch­¬ng tr×nh khuyÕn m·i gi¸ rÎ", getn(tbSayDialog), tbSayDialog);
--end
--function get_infor()
--	proday:load()
--	local nNumremain = 0
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate ~= proday.tList["baothienthach"][2] then
--		nNumremain = 500
--	else
--		nNumremain = proday.tList["baothienthach"][1]
--	end
--	Talk(1,"","Sè l­îng cßn cã thÓ mua trong ngµy hiÖn t¹i lµ: "..nNumremain.." c¸i")	
--end
--
--function confirm_buy()
--	proday:load()
--	---------------------------------
--	local nDate = tonumber(date("%Y%m%d"))
--	local nTime = GetTime()
--	print(proday.tList["baothienthach"][2])
--	if nDate ~= proday.tList["baothienthach"][2] then
--		proday.tList["baothienthach"][1] = 500
--	end
--	
--	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 6) then
--		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 6) - GetTime()
--		Talk(1,"","NhiÒu ng­êi mua qu¸, cho ta nghØ mÖt mét tÝ. H·y quay l¹i sau "..nTimeRemain.." gi©y n÷a !!!")
--		return
--	end
--	---------------------------------
--	if proday.tList["baothienthach"][1] <= 0 then
--		Talk(1,"","ThËt ®¸ng tiÕc! §· hÕt hµng gi¶m gi¸ råi. Ngµy mai ®¹i hiÖp nhí ghÐ sím nhÐ  !!!")
--		return
--	end
--	if IsPlayerDeath() ~= 0 then 
--		Talk(1, "", "HiÖn t¹i kh«ng thÓ mua !!!")
--		return
--	end
--	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
--        	return
--    end
--	if GetItemCount(2,1,30230) < 500 then
--		Talk(1,"","HiÖn kh«ng cã ®ñ Xu, ®¹i hiÖp vui lßng quay l¹i vµo lóc kh¸c!")
--		return
--	end
--
--	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
--	gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua thµnh c«ng")
--	proday:register()
--	if DelItem(2, 1, 30230, 500) == 1  then
----		gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua thµnh c«ng")
--		gf_AddItemEx2({2, 1, 1001, 1}, "Hoa Thi Bich", PROMOTION_EVERYDAY, "mua Hßa ThÞ BÝch", 7*24*60*60)
--		Talk(1,"","C¸c h¹ ®· mua thµnh c«ng 1 Hßa ThÞ BÝch")
--		Msg2Player("C¸c h¹ ®· mua thµnh c«ng 1 Hßa ThÞ BÝch")
--	--	AddGlobalNews("Chóc mõng ®¹i hiÖp <color=yellow>"..GetName().."<color> ®· mua thµnh c«ng 1 Bao Thiªn Th¹ch Tinh Th¹ch víi gi¸ rÎ.")
--	end
--end
--
--function do_nothing()
--
--end
