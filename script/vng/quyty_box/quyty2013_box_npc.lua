
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");

tbDieuKien = {
						[1] = {--option
									[1] = {59, "59 xu vËt phÈm"},	--tabb
									[2] = {139, "139 xu vËt phÈm"},	--cdpb
									[3] = {268, "268 xu vËt phÈm"},	--xtcv								
								},
						[2] = {--option
									[1] = {--tabb
												[1] = {250, "250 vµng"},
												[2] = {25, "25 thiªn th¹ch"},	
											},
									[2] = {--cdpb
												[1] = {77, "77 vµng"},
												[2] = {7, "7 thiªn th¹ch tinh th¹ch"},
											},	
									[3] = {--xtcv
												[1] = {199, "199 xu vËt phÈm"},
												[2] = {4, "4 thiªn th¹ch tinh th¹ch"},
											},		
								},
					}
function main()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
--	if GetLevel() < 86 then
--		Talk(1, "", "§¹i hiÖp ch­a ®ñ cÊp 86 ®Ó cã thÓ më ®­îc r­¬ng !!!")
--		return
--	end
--	if gf_Check55FullSkill == 0 then
--		Talk(1, "", "§¹i hiÖp ch­a häc ®ñ kü n¨ng cÊp 55 ®Ó cã thÓ më ®­îc r­¬ng !!!")
--		return
--	end
	local npc_index = GetTargetNpc()
	local nNPC_name = GetNpcName(npc_index)
	local nLoaiBox = 0
	if nNPC_name == "TuyÖt ¶nh BÝ B¶o" then
		nLoaiBox = 1
	elseif nNPC_name == "ChiÕu D¹ Ph¸p B¶o" then
		nLoaiBox = 2	
	elseif nNPC_name == "XÝch Thè Cæ VËt" then
		nLoaiBox = 3
	end
	if nLoaiBox == 0 then
		Talk(1, "", "Lo¹i r­¬ng nµy hiÖn t¹i ch­a cã !!!")
		return
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."	
	tinsert(tbSayDialog, "Sö dông vËt phÈm Xu ®Ó më r­¬ng/#open_QuyTy_box(1,"..nLoaiBox..")")
	tinsert(tbSayDialog, "Sö dông vËt phÈm kh¸c ®Ó më r­¬ng/#open_QuyTy_box(2,"..nLoaiBox..")")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
	
end

function open_QuyTy_box(nType, nLoaiBox)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	local npc_index = GetTargetNpc()
	local nNPC_name = GetNpcName(npc_index)
	if nType == 1 then
		if GetItemCount(2,1,30230) < tbDieuKien[nType][nLoaiBox][1] then
			Talk(1, "", "<color=green>"..nNPC_name.."<color>: §¹i hiÖp kh«ng ®ñ "..tbDieuKien[nType][nLoaiBox][2].." ®Ó më r­¬ng.");
			return 0
		end
	end
	if nType == 2 then	
		if nLoaiBox == 1 or nLoaiBox == 2 then
			if GetCash() < tbDieuKien[nType][nLoaiBox][1][1]*10000 then
				Talk(1, "", "<color=green>"..nNPC_name.."<color>: §¹i hiÖp kh«ng ®ñ "..tbDieuKien[nType][nLoaiBox][1][2].."  ®Ó më r­¬ng.");
				return 0
			end	
		end
		if nLoaiBox == 2 or nLoaiBox == 3 then
			if GetItemCount(2,1,1009) < tbDieuKien[nType][nLoaiBox][2][1] then	--check thiªn th¹ch tinh th¹ch
				Talk(1, "", "<color=green>"..nNPC_name.."<color>: §¹i hiÖp kh«ng ®ñ "..tbDieuKien[nType][nLoaiBox][2][2].." ®Ó më r­¬ng.");
				return 0
			end
		end
		if nLoaiBox == 1 then
			if GetItemCount(2,2,8) < tbDieuKien[nType][nLoaiBox][2][1] then	--check thiªn th¹ch 
				Talk(1, "", "<color=green>"..nNPC_name.."<color>: §¹i hiÖp kh«ng ®ñ "..tbDieuKien[nType][nLoaiBox][2][2].." ®Ó më r­¬ng.");
				return 0
			end
		end
		if nLoaiBox == 3 then
			if GetItemCount(2,1,30230) < tbDieuKien[nType][nLoaiBox][1][1] then	--check xu vËt phÈm
				Talk(1, "", "<color=green>"..nNPC_name.."<color>: §¹i hiÖp kh«ng ®ñ "..tbDieuKien[nType][nLoaiBox][1][2].." ®Ó më r­¬ng.");
				return 0
			end
		end
	end
 	if gf_Judge_Room_Weight(5,500) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end	
-------------------------------------
	local box_index = GetTargetNpc()
--	Msg2Player("Gia tri box_index: "..box_index)
--	SetTask(2693,box_index)  --sau khi xong, ®æi thµnh 2693 ##################################################

	if GetUnitCurStates(box_index,2) ~= 1 or (GetTime() - GetUnitCurStates(box_index,1)) > 5 then
		SetUnitCurStates(box_index,1,GetTime())
		SetUnitCurStates(box_index,2,1)
		 gf_WriteLogEx("GIAP NGO BAO RUONG", "më r­¬ng thµnh c«ng", 1, "Më r­¬ng option "..nType.." ,lo¹i "..nNPC_name)		
		if nLoaiBox == 1 then
			DoWait(28,29,1)	
		elseif nLoaiBox ==2 then
			DoWait(30,29,1)	
		elseif nLoaiBox == 3 then
			DoWait(31,29,1)	
		end
		if nType == 1 then
			DelItem(2,1,30230, tbDieuKien[nType][nLoaiBox][1])
		elseif nType == 2 then
			if nLoaiBox == 1 then
				Pay(tbDieuKien[nType][nLoaiBox][1][1]*10000)
				DelItem(2,2,8, tbDieuKien[nType][nLoaiBox][2][1])
			elseif nLoaiBox == 2 then
				Pay(tbDieuKien[nType][nLoaiBox][1][1]*10000)
				DelItem(2,1,1009, tbDieuKien[nType][nLoaiBox][2][1])
			elseif nLoaiBox == 3 then
				DelItem(2,1,30230, tbDieuKien[nType][nLoaiBox][1][1])
				DelItem(2,1,1009, tbDieuKien[nType][nLoaiBox][2][1])
			end
		end
		if nLoaiBox == 1 then
			local nCount1 = VNG_GetTaskPos(TSK_GIAPNGO_1, 4,1)
			if nCount1< 1000 then
				VNG_SetTaskPos(TSK_GIAPNGO_1, nCount1 + 1, 4,1)
				Msg2Player("Më r­¬ng "..nNPC_name.." thµnh c«ng, lÇn thø :"..nCount1 + 1)
			end
		elseif nLoaiBox == 2 then
			local nCount2 = VNG_GetTaskPos(TSK_GIAPNGO_1, 9,6)
			if nCount2< 1000 then
				VNG_SetTaskPos(TSK_GIAPNGO_1, nCount2 + 1, 9,6)
				Msg2Player("Më r­¬ng "..nNPC_name.." thµnh c«ng, lÇn thø :"..nCount2 + 1)
			end
		elseif nLoaiBox == 3 then
			local nCount3 = VNG_GetTaskPos(TSK_GIAPNGO_2, 4,1)
			if nCount3< 1000 then
				VNG_SetTaskPos(TSK_GIAPNGO_2, nCount3 + 1, 4,1)
				Msg2Player("Më r­¬ng "..nNPC_name.." thµnh c«ng, lÇn thø :"..nCount3 + 1)
			end
		end
	else
		Talk(1,"","HiÖn ®· cã ng­êi sö dông <color=red> B¶o r­¬ng<color>.")
		return
	end
	
end

function tuyetanh_box_award()
	Msg2Player("PhÇn th­ëng TuyÖt ¶nh")
	local tAward_QuyTy = {
				{1, 6000, "Qu©n C«ng Ch­¬ng", {2,1,9999, 4},7 * 24 * 3600},
				{1, 2000, "Qu©n C«ng §¹i", {2,1,9998, 2},7 * 24 * 3600},
				{1, 1000, "Qu©n C«ng Huy Hoµng", {2,1,9977, 1},7 * 24 * 3600},
				{2, 9500, 9999999},
				{2, 9500, 14000000},
				{2, 9500, 21000000},
				{31, 9500, "give_fruit1()"},
				{31, 9500, "give_fruit2()"},
				{31, 9500, "give_fruit3()"},
				{31, 9500, "give_fruit4()"},
				{31, 8499, "give_weapon7()"},
				{31, 800, "Book_Pet1(2)"},	
				{31, 8000, "Book_Pet2(1)"},
				{31, 1, "give_HHVD4()"},
			}		
	gf_EventGiveRandAward(tAward_QuyTy, 100000,1,"GIAP NGO BAO RUONG","më r­¬ng thµnh c«ng")	
	--print("\n=====quyty_box_award==========\n")
end

function chieuda_box_award()
	Msg2Player("PhÇn th­ëng ChiÕu D¹")
	local tAward_QuyTy = {
				{1, 5000, "Qu©n C«ng Huy Hoµng", {2,1,9977, 1},7 * 24 * 3600},
				{2, 10000, 13000000},
				{2, 16798, 21000000},
				{2, 10000, 47000000},	
				{1, 100, "Thiªn Th¹ch Linh Th¹ch", {2,1,1068, 1},7 * 24 * 3600},
				{1, 100, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2,1,1067, 1},7 * 24 * 3600},
				{31, 15000, "give_weapon7()"},
				{31, 5000, "give_weapon8()"},
				{31, 10000, "TrangBiKimXa3Sao(3)"},	
				{31, 8000, "Book_Pet1(2)"},
				{31, 12000, "Book_Pet2(1)"},			
				{31, 8000, "Book_Pet3(1)"},	
				{31, 1, "give_HHVD4()"},
				{31, 1, "give_HHVD5()"},
			}		
	gf_EventGiveRandAward(tAward_QuyTy, 100000,1,"GIAP NGO BAO RUONG","më r­¬ng thµnh c«ng")	
	--print("\n=====quyty_box_award==========\n")
end

function xichtho_box_award()
	Msg2Player("PhÇn th­ëng XÝch Thè")
	local tAward_QuyTy = {
				{1, 5000, "Qu©n C«ng Huy Hoµng", {2,1,9977, 2},7 * 24 * 3600},
				{2, 4428, 74000000},
				{2, 12000, 123000000},
				{2, 10000, 147000000},	
				{1, 100, "Thiªn Th¹ch Linh Th¹ch", {2,1,1068, 1},7 * 24 * 3600},
				{1, 100, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2,1,1067, 1},7 * 24 * 3600},
				{1, 100, "§¹i §Þnh Hån", {2,1,1113, 1},7 * 24 * 3600},
				{1, 100, "ChuyÓn Sinh §¬n", {2,1,30345, 1},7 * 24 * 3600},
				{31, 15000, "give_weapon7()"},
				{31, 10000, "give_weapon8()"},
				{31, 5000, "give_weapon9()"},
				{31, 10000, "TrangBiKimXa3Sao(3)"},	
				{31, 10000, "Book_Pet2(3)"},	
				{31, 10000, "Book_Pet3(2)"},			
				{31, 8000, "Book_Pet4(1)"},		
				{31, 1, "give_HHVD4()"},
				{31, 1, "give_HHVD5()"},
				{31, 170, "MatTichMonPhai20_Random()"},	
			}		
	gf_EventGiveRandAward(tAward_QuyTy, 100000,1,"GIAP NGO BAO RUONG","më r­¬ng thµnh c«ng")	
	--print("\n=====quyty_box_award==========\n")
end

function give_weapon7()
tAttribute_quyty_first = {	--tAttribute_bkl_first
					[1]  	= {41,	60, 	{{5,600}, {6,400}}},
					[2]  	= {42,	60, 	{{5,600}, {6,400}}},
					[3]  	= {49,	60, 	{{6,500}, {7,500}}},		
					[4]  	= {53,	35, 	{{6,600}, {7,400}}},
					[5] 	= {54,	35, 	{{6,600}, {7,400}}},
					[6] 	= {63,	35, 	{{5,500}, {6,450}, {7,50}}},
					[7] 	= {64,	40, 	{{5,500}, {6,450}, {7,50}}},
					[8] 	= {85,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[9] 	= {86,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[10] 	= {94,	75, 	{{5,300}, {6,500}, {7,200}}},
					[11] 	= {95,	75,	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {96,	75, 	{{5,300}, {6,500}, {7,200}}},
					[13] 	= {97,	75, 	{{5,300}, {6,500}, {7,200}}},
					[14] 	= {98,	75, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {102,	40, 	{{5,400}, {6,500}, {7,100}}},
					[16] 	= {111,	70, 	{{5,300}, {6,300}, {7,400}}},
					[17] 	= {252,	5,		{{3,800}, {4,150}, {5,50}}},
					[18]  	= {268,	5, 		{{4,800}, {5,150}, {6,50}}},		
					[19]  	= {277,	35,	{{3,400}, {4,400}, {5,200}}},		
					[20]  	= {278,	35,	{{3,400}, {4,400}, {5,200}}},
					[21]  	= {285,	15,	{{4,700}, {5,150}, {6,150}}},
					[22]  	= {304,	30, 	{{4,800}, {5,150}, {6,50}}},
					[23]  	= {308,	50, 	{{5,600}, {6,300}, {7,100}}},
					[24] 	= {390,	5,	 	{{3,750}, {4,200}, {5,50}}},							
			}	
	local tWeapon_quyty = { --tWeapon_bkl
				{600, "V¹n NhÉn", 0, 0, 14},
				{600, "M·n Thiªn Hoa Vò",	 0, 1, 53},
				{1000, "Háa Tinh", 0, 2, 36},
				{600, "Cæ §Ýnh",	0, 3, 64},
				{600, "ThÇn Cung", 0,	4,	119},
				{600, "LiÖt DiÖm", 0, 5, 40},
				{600, "§¹i H¶o L«i Th­¬ng",	0,	6, 108},
				{600, "L¨ng Phong", 0, 7, 12},
				{600, "A La H¸n Tr­îng", 0, 8, 97},
				{600, "ThÇn Hµnh",	 0, 9, 86},
				{600, "Hi Nh©n CÇm", 	0,	10, 75},
				{600, "M·nh Hæ", 0, 11, 12},
				{1200, "Minh B¨ng", 0, 12, 12},
				{1200, "Ngäc Doanh", 0, 13, 12},
		}

	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
		--print("gia tri random "..nRandomAttr)
		nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]	
		tremove(tAttribute_quyty_first, nRandomAttr)
	end	
	add_flag = AddItem(tWeapon_quyty[nRan_weapon][3],tWeapon_quyty[nRan_weapon][4],tWeapon_quyty[nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon_quyty[nRan_weapon][2]
	if add_flag == 1 then
		Msg2Player("B¹n më B¶o r­¬ng, nhËn ®­îc: "..prize_name.."!")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "Më r­¬ng thµnh c«ng", 1, prize_name)
	else
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "Më r­¬ng thÊt b¹i", 1, prize_name)
	end	
end
function give_weapon8()
tAttribute_quyty_first = {	--tAttribute_bkl_first
				[1]  	= {41,	60, 	{{5,600}, {6,400}}},
					[2]  	= {42,	60, 	{{5,600}, {6,400}}},
					[3]  	= {49,	60, 	{{6,500}, {7,500}}},		
					[4]  	= {53,	35, 	{{6,600}, {7,400}}},
					[5] 	= {54,	35, 	{{6,600}, {7,400}}},
					[6] 	= {63,	35, 	{{5,500}, {6,450}, {7,50}}},
					[7] 	= {64,	40, 	{{5,500}, {6,450}, {7,50}}},
					[8] 	= {85,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[9] 	= {86,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[10] 	= {94,	75, 	{{5,300}, {6,500}, {7,200}}},
					[11] 	= {95,	75,	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {96,	75, 	{{5,300}, {6,500}, {7,200}}},
					[13] 	= {97,	75, 	{{5,300}, {6,500}, {7,200}}},
					[14] 	= {98,	75, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {102,	40, 	{{5,400}, {6,500}, {7,100}}},
					[16] 	= {111,	70, 	{{5,300}, {6,300}, {7,400}}},
					[17] 	= {252,	5,		{{3,800}, {4,150}, {5,50}}},
					[18]  	= {268,	5, 		{{4,800}, {5,150}, {6,50}}},		
					[19]  	= {277,	35,	{{3,400}, {4,400}, {5,200}}},		
					[20]  	= {278,	35,	{{3,400}, {4,400}, {5,200}}},
					[21]  	= {285,	15,	{{4,700}, {5,150}, {6,150}}},
					[22]  	= {304,	30, 	{{4,800}, {5,150}, {6,50}}},
					[23]  	= {308,	50, 	{{5,600}, {6,300}, {7,100}}},
					[24] 	= {390,	5,	 	{{3,750}, {4,200}, {5,50}}},				
		}	
	local tWeapon_quyty = { --tWeapon_bkl
				{600, "ThÇn Quy", 0, 0, 15},
				{600, "Khoa Phô",	 0, 1, 54},
				{1000, "Häa ¶nh", 0, 2, 37},
				{600, "LËu C¶nh",	0, 3, 65},
				{600, "Viªn §Ò", 0,	4,	120},
				{600, "Ngäc Trô", 0, 5, 41},
				{600, "Cöu Long Toµn KÝch",	0,	6, 109},
				{600, "BÝch Thñy", 0, 7, 13},
				{600, "Môc KiÒn Liªn Tr­îng", 0, 8, 98},
				{600, "Toan D­",	 0, 9, 87},
				{600, "§¹i Th¸nh Di ¢m", 	0,	10, 76},
				{600, "V« NgÊn", 0, 11, 13},
				{1200, "XÝch Tiªu", 0, 12, 13},
				{1200, "Di T©m", 0, 13, 13},
		}

	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
		nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]
		tremove(tAttribute_quyty_first, nRandomAttr)
	end	
	add_flag = AddItem(tWeapon_quyty[nRan_weapon][3],tWeapon_quyty[nRan_weapon][4],tWeapon_quyty[nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon_quyty[nRan_weapon][2]
	if add_flag == 1 then
		Msg2Player("B¹n më B¶o r­¬ng, nhËn ®­îc: "..prize_name.."!")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "Më r­¬ng thµnh c«ng", 1, prize_name)
	else
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "Më r­¬ng thÊt b¹i", 1, prize_name)
	end	
end
function give_weapon9()
	 tAttribute_quyty_first = {	--tAttribute_bkl_first
					[1]  	= {41,	60, 	{{5,600}, {6,400}}},
					[2]  	= {42,	60, 	{{5,600}, {6,400}}},
					[3]  	= {49,	60, 	{{6,500}, {7,500}}},		
					[4]  	= {53,	35, 	{{6,600}, {7,400}}},
					[5] 	= {54,	35, 	{{6,600}, {7,400}}},
					[6] 	= {63,	35, 	{{5,500}, {6,450}, {7,50}}},
					[7] 	= {64,	40, 	{{5,500}, {6,450}, {7,50}}},
					[8] 	= {85,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[9] 	= {86,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[10] 	= {94,	75, 	{{5,300}, {6,500}, {7,200}}},
					[11] 	= {95,	75,	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {96,	75, 	{{5,300}, {6,500}, {7,200}}},
					[13] 	= {97,	75, 	{{5,300}, {6,500}, {7,200}}},
					[14] 	= {98,	75, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {102,	40, 	{{5,400}, {6,500}, {7,100}}},
					[16] 	= {111,	70, 	{{5,300}, {6,300}, {7,400}}},
					[17] 	= {252,	5,		{{3,800}, {4,150}, {5,50}}},
					[18]  	= {268,	5, 		{{4,800}, {5,150}, {6,50}}},		
					[19]  	= {277,	35,	{{3,400}, {4,400}, {5,200}}},		
					[20]  	= {278,	35,	{{3,400}, {4,400}, {5,200}}},
					[21]  	= {285,	15,	{{4,700}, {5,150}, {6,150}}},
					[22]  	= {304,	30, 	{{4,800}, {5,150}, {6,50}}},
					[23]  	= {308,	50, 	{{5,600}, {6,300}, {7,100}}},
					[24] 	= {390,	5,	 	{{3,750}, {4,200}, {5,50}}},				
		}	
	local tWeapon_quyty = { --tWeapon_bkl
				{600, "¢m D­¬ng ¢n", 0, 0, 16},
				{600, "Kh«ng Cã",	 0, 1, 55},
				{1000, "Nha Cöu", 0, 2, 38},
				{600, "NghÞch L©n",	0, 3, 66},
				{600, "B¸t X¹ Chi X¹", 0,	4,	121},
				{600, "ThÇn Ch©m", 0, 5, 42},
				{600, "Th­¬ng N«",	0,	6, 110},
				{600, "Thiªn T«n", 0, 7, 14},
				{600, "D­îc S­ Tr­îng", 0, 8, 99},
				{600, "Th¸i H­",	 0, 9, 88},
				{600, "Kh« Méc Long Ng©m", 	0,	10, 77},
				{600, "Thanh Long", 0, 11, 14},
				{600, "U©n H­¬ng", 0, 12, 14},
				{600, "Hoan Linh", 0, 13, 14},
		}

	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
		nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]
		tremove(tAttribute_quyty_first, nRandomAttr)
	end	
	add_flag = AddItem(tWeapon_quyty[nRan_weapon][3],tWeapon_quyty[nRan_weapon][4],tWeapon_quyty[nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon_quyty[nRan_weapon][2]
	if add_flag == 1 then
		Msg2Player("B¹n më B¶o r­¬ng, nhËn ®­îc: "..prize_name.."!")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "Më r­¬ng thµnh c«ng", 1, prize_name)
	else
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "Më r­¬ng thÊt b¹i", 1, prize_name)
	end	
end
function get_random_quyty(tWeapon_quyty, nMaxPE, nDefault) --get_random_bkl
	local nPos = 0;
	local nRand = random(1, nMaxPE);
	for i = 1, getn(tWeapon_quyty) do
		if nRand > nPos and nRand <= nPos + tWeapon_quyty[i][1] then
			return i;
		end
		nPos = nPos + tWeapon_quyty[i][1];
	end
	return nDefault;
end
function get_random_attrib_quyty(nTabQuyTy, nDeterminator) --get_random_attrib_bkl
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTabQuyTy) do
		nBase = nBase + nTabQuyTy[i][2]
		if nRandom <= nBase then
			return i			
		end
	end	
	--them gia tri default o day
	--return 1
end
-- MËt tÞch cao cÊp 
VET_2012_GAOJIMIJI = {
				[2] = {"Kim Cang B¸t Nh· Ch©n QuyÓn ", {0, 107, 204, 1}},		
				[4] = {"TiÒm Long Tóc DiÖt Ch©n QuyÓn", {0, 107, 205, 1}},
				[3] = {"V« TrÇn Bå §Ò Ch©n QuyÓn", {0, 107, 206, 1}},		
				[6] = {"Thiªn La Liªn Ch©u Ch©n QuyÓn", {0, 107, 207,1 }},		
				[8] = {"Nh­ ý Kim §Ønh Ch©n QuyÓn", {0, 107, 208, 1}},		
				[9] = {"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn", {0, 107, 209, 1}},		
				[11] = {"Hçn §én TrÊn Nh¹c Ch©n QuyÓn", {0, 107, 210, 1}},		
				[12] = {"Quú Thiªn Du Long Ch©n QuyÓn", {0, 107, 211, 1}},		
				[14] = {"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn", {0, 107, 212, 1}},		
				[15] = {"Qu©n Tö §íi Phong Ch©n QuyÓn", {0, 107, 213, 1}},		
				[17] = {"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn", {0, 107, 214, 1}},		
				[18] = {"Xuyªn V©n L¹c Hång Ch©n QuyÓn", {0, 107, 215, 1}},		
				[20] = {"HuyÒn Minh Phong Ma Ch©n QuyÓn", {0, 107, 216, 1}},		
				[21] = {"Linh Cæ HuyÒn Tµ Ch©n QuyÓn", {0, 107, 217, 1}},		
				[23] = {"Cöu Thiªn Phong L«i Ch©n QuyÓn", {0, 107, 218, 1}},		
				[29] = {"Hång TrÇn Tóy Méng Ch©n QuyÓn", {0, 107, 222, 1}},		
				[30] = {"Phong Hoa Thiªn DiÖp Ch©n QuyÓn", {0, 107, 223, 1}},						
}

function give70GaojiMiji()
	local nRoute = GetPlayerRoute()
	gf_AddItemEx2(VET_2012_GAOJIMIJI[nRoute][2], VET_2012_GAOJIMIJI[nRoute][1], "GIAP NGO BAO RUONG BK", "nhËn ®­îc")	
	--gf_EventGiveRandAward(VET_2012_GAOJIMIJI,10000,1)
end
VET_2013_FRUIT = {
		[1] = {1, 5, "Nh·n", {2, 1, 30164, 1}, 0},
		[2] = {1, 5, "Ch«m Ch«m", {2, 1, 30165, 1}, 0},
		[3] = {1, 5, "Cam", {2, 1, 30165, 1}, 0},
		[4] = {1, 5, "Dõa", {2, 1, 30167, 1}, 0},
		[5] = {1, 5, "M¨ng Côt", {2, 1, 30168, 1}, 0},
		[6] = {1, 5, "M·ng cÇu", {2, 1, 30179, 1}, 0},
		[7] = {1, 5, "Khãm", {2, 1, 30180, 1}, 0},
		[8] = {1, 5, "Lª", {2, 1, 30181, 1}, 0},
		[9] = {1, 5, "Bßn Bon", {2, 1, 30182, 1}, 0},
		[10] = {1, 5, "KhÕ", {2, 1, 30183, 1}, 0},
		[11] = {1, 5, "B­ëi", {2, 1, 30169, 1}, 0},
		[12] = {1, 5, "D©u", {2, 1, 30170, 1}, 0},
		[13] = {1, 5, "Chuèi", {2, 1, 30171, 1}, 0},
		[14] = {1, 5, "Xoµi", {2, 1, 30172, 1}, 0},
		[15] = {1, 5, "§µo", {2, 1, 30173, 1}, 0},
		[16] = {1, 5, "MËn", {2, 1, 30174, 1}, 0},
		[17] = {1, 5, "V¶i", {2, 1, 30175, 1}, 0},
		[18] = {1, 5, "T¸o", {2, 1, 30176, 1}, 0},
		[19] = {1, 5, "B¬", {2, 1, 30177, 1}, 0},
		[20] = {1, 5, "§u §ñ", {2, 1, 30178, 1}, 0},
		}
function give_fruit1()
--	local nIndex = random(1,20)
	local nG = VET_2013_FRUIT[6][4][1]
	local nD = VET_2013_FRUIT[6][4][2]
	local nP = VET_2013_FRUIT[6][4][3]
	gf_AddItemEx2({nG, nD, nP, 77}, VET_2013_FRUIT[6][3], "GIAP NGO BAO RUONG BK", "tr¸i c©y")
	Msg2Player("B¹n nhËn ®­îc 77 M·ng CÇu")
end
function give_fruit2()
--	local nIndex = random(1,20)
	local nG = VET_2013_FRUIT[4][4][1]
	local nD = VET_2013_FRUIT[4][4][2]
	local nP = VET_2013_FRUIT[4][4][3]
	gf_AddItemEx2({nG, nD, nP, 77}, VET_2013_FRUIT[4][3], "GIAP NGO BAO RUONG BK", "tr¸i c©y")
	Msg2Player("B¹n nhËn ®­îc 77 Dõa")
end
function give_fruit3()
--	local nIndex = random(1,20)
	local nG = VET_2013_FRUIT[20][4][1]
	local nD = VET_2013_FRUIT[20][4][2]
	local nP = VET_2013_FRUIT[20][4][3]
	gf_AddItemEx2({nG, nD, nP, 77}, VET_2013_FRUIT[20][3], "GIAP NGO BAO RUONG BK", "tr¸i c©y")
	Msg2Player("B¹n nhËn ®­îc 77 §u §ñ")
end
function give_fruit4()
--	local nIndex = random(1,20)
	local nG = VET_2013_FRUIT[14][4][1]
	local nD = VET_2013_FRUIT[14][4][2]
	local nP = VET_2013_FRUIT[14][4][3]
	gf_AddItemEx2({nG, nD, nP, 77}, VET_2013_FRUIT[14][3], "GIAP NGO BAO RUONG BK", "tr¸i c©y")
	Msg2Player("B¹n nhËn ®­îc 77 Xoµi")
end
function give_HHVD2()
	gf_AddItemEx2({0,102,8840, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Hoµng Chi Thñy", "GIAP NGO BAO RUONG BK", "Huy Hoµng Chi Thñy")
	gf_AddItemEx2({0,102,8841, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh Dù Chi Thñy", "GIAP NGO BAO RUONG BK", "Vinh Dù Chi Thñy")
end
function give_HHVD3()
	gf_AddItemEx2({0,102,8842, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Hoµng Chi KÕ", "GIAP NGO BAO RUONG BK", "Huy Hoµng Chi KÕ")
	gf_AddItemEx2({0,102,8843, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh Dù Chi KÕ", "GIAP NGO BAO RUONG BK", "Vinh Dù Chi KÕ")
end
function give_HHVD4()
	gf_AddItemEx2({0,102,8844, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Hoµng QuËt Khëi", "GIAP NGO BAO RUONG BK", "Huy Hoµng QuËt Khëi")
	gf_AddItemEx2({0,102,8845, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh Dù QuËt Khëi", "GIAP NGO BAO RUONG BK", "Vinh Dù QuËt Khëi")
	Msg2Player("B¹n nhËn ®­îc vËt phÈm Huy Hoµng Vinh Dù QuËt Khëi")
end
function give_HHVD5()
	gf_AddItemEx2({0,102,8846, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Hoµng", "GIAP NGO BAO RUONG BK", "Huy Hoµng")
	gf_AddItemEx2({0,102,8847, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh Dù", "GIAP NGO BAO RUONG BK", "Vinh Dù")
	Msg2Player("B¹n nhËn ®­îc vËt phÈm Huy Hoµng Vinh Dù")
end

function giapngo()
	local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."NhËn th­ëng xong 3 lo¹i (TuyÖt ¶nh BÝ B¶o, ChiÕu D¹ Ph¸p B¶o, XÝch Thè Cæ VËt) sÏ ®­îc nhËn phÇn th­ëng hÊp dÉn M· §¸o Thµnh C«ng"

	tinsert(tSay, "NhËn th­ëng TuyÖt ¶nh BÝ B¶o (kÝch ho¹t r­¬ng TuyÖt ¶nh thµnh c«ng 1000 lÇn)/#get_MaDaoThanhCong(1)")
	tinsert(tSay, "NhËn th­ëng ChiÕu D¹ Ph¸p B¶o (kÝch ho¹t r­¬ng ChiÕu D¹ thµnh c«ng 1000 lÇn)/#get_MaDaoThanhCong(2)")
	tinsert(tSay, "NhËn th­ëng XÝch Thè Cæ VËt (kÝch ho¹t r­¬ng XÝch Thè thµnh c«ng 1000 lÇn)/#get_MaDaoThanhCong(3)")
	tinsert(tSay, "NhËn th­ëng M· §¸o Thµnh C«ng (®· nhËn th­ëng thµnh c«ng 3 lo¹i r­¬ng)/#get_MaDaoThanhCong(4)")
	tinsert(tSay, "Ta ch­a muèn nhËn th­ëng/dialog_over")
	Say(tHeader, getn(tSay), tSay)	
end

function get_MaDaoThanhCong(nType)
 	if gf_Judge_Room_Weight(5,500) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end	
	local nCheck = 0
	local nCount = 0
	if nType == 1 then
		nCheck = VNG_GetTaskPos(TSK_GIAPNGO_1, 5,5)
		nCount = VNG_GetTaskPos(TSK_GIAPNGO_1, 4,1)
	elseif nType == 2 then
		nCheck = VNG_GetTaskPos(TSK_GIAPNGO_1, 10,10)
		nCount = VNG_GetTaskPos(TSK_GIAPNGO_1, 9,6)
	elseif nType == 3 then
		nCheck = VNG_GetTaskPos(TSK_GIAPNGO_2, 5,5)
		nCount = VNG_GetTaskPos(TSK_GIAPNGO_2, 4,1)
	elseif nType == 4 then	--check ®k lo¹i 4
		nCheck = VNG_GetTaskPos(TSK_GIAPNGO_2, 6,6)
		local nCheck1 = VNG_GetTaskPos(TSK_GIAPNGO_1, 5,5)
		local nCheck2 = VNG_GetTaskPos(TSK_GIAPNGO_1, 10,10)
		local nCheck3 = VNG_GetTaskPos(TSK_GIAPNGO_2, 5,5)
		if nCheck >= 1 then
			Talk(1,"", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi. PhÇn th­ëng chØ nhËn ®­îc 1 lÇn duy nhÊt !!!!")
			return 0
		end 
		if nCheck1 < 1 or nCheck2 < 1 or nCheck3 < 1 then
			Talk(1,"", "§¹i hiÖp ch­a nhËn th­ëng hÕt 3 lo¹i B¶o R­¬ng ë trªn !!!!")
			return 0
		end
	end
	--check ®k lo¹i 1, 2, 3
	if nType == 1 or nType == 2 or nType == 3 then
		if nCheck >= 1 then
			Talk(1,"", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi. PhÇn th­ëng chØ nhËn ®­îc 1 lÇn duy nhÊt !!!!")
			return 0
		end
		if nCount < 1000 then
			Talk(1,"", "§¹i hiÖp ch­a kÝch ho¹t ®ñ 1000 B¶o R­¬ng !!!!")
			return 0
		end
	end
	--ph¸t th­ëng
	if nType == 1 then
		VNG_SetTaskPos(TSK_GIAPNGO_1, 1, 5,5)
		ModifyExp(1000000000)
		give_weapon7()
		Msg2Player("Ph¸t th­ëng TuyÖt ¶nh BÝ B¶o thµnh c«ng")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nhËn", 1, "NhËn th­ëng cuèi TuyÖt ¶nh BÝ B¶o")
	elseif nType == 2 then
		VNG_SetTaskPos(TSK_GIAPNGO_1, 1, 10,10)
		ModifyExp(2000000000)
		MatTichMonPhai20_Random()
		Msg2Player("Ph¸t th­ëng ChiÕu D¹ Ph¸p B¶o thµnh c«ng")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nhËn", 1, "NhËn th­ëng cuèi ChiÕu D¹ Ph¸p B¶o")
	elseif nType == 3 then
		VNG_SetTaskPos(TSK_GIAPNGO_2, 1, 5,5)
		ModifyExp(2000000000)
		give_weapon8()
		Msg2Player("Ph¸t th­ëng XÝch Thè Cæ VËt thµnh c«ng")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nhËn", 1, "NhËn th­ëng cuèi XÝch Thè Cæ VËt")
	elseif nType == 4 then
		VNG_SetTaskPos(TSK_GIAPNGO_2, 1, 6,6)
		ModifyExp(2000000000)
		give_HHVD5()
		MatTichMonPhai20_HePhai()
		Msg2Player("Ph¸t th­ëng M· §¸o Thµnh C«ng thµnh c«ng")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nhËn", 1, "NhËn th­ëng cuèi M· §¸o Thµnh C«ng")
	end
end
VET_BOOK_PET1 = {
	{1, 699, "Ch©n khÝ hé thÓ CÊp 1", {2,150,1,1}, 0},
	{1, 699, "Ých Thä Diªn D­¬ng CÊp 1", {2,150,5,1}, 0},
	{1, 699, "C­êng Th©n B¸ ThÓ CÊp 1", {2,150,9,1}, 0},
	{1, 699, "¢m Phong Thùc Cèt CÊp 1", {2,150,13,1}, 0},
	{1, 456, "HuyÒn Vò V« Song CÊp 1", {2,150,17,1}, 0},
	{1, 699, "V« Hµnh V« T­¬ng CÊp 1", {2,150,21,1}, 0},
	{1, 699, "Kim Linh Phô ThÓ CÊp 1", {2,150,25,1}, 0},
	{1, 699, "Méc Linh Phô ThÓ CÊp 1", {2,150,29,1}, 0},
	{1, 699, "Thñy Linh Phô ThÓ CÊp 1", {2,150,33,1}, 0},
	{1, 699, "Háa Linh Phô ThÓ CÊp 1", {2,150,37,1}, 0},
	{1, 699, "Thæ Linh Phô ThÓ CÊp 1", {2,150,41,1}, 0},
	{1, 699, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 1", {2,150,45,1}, 0},
	{1, 699, "S¸t th­¬ng gia n©ng CÊp 1", {2,150,49,1}, 0},
	{1, 456, "Khinh Linh TÊn TËt CÊp 1", {2,150,53,1}, 0},
	{1, 700, "V« H×nh Chi Cæ CÊp 1", {2,150,57,1}, 0},
}

VET_BOOK_PET2 = {
	{1, 699, "Ch©n khÝ hé thÓ CÊp 2", {2,150,2,1}, 0},
	{1, 699, "Ých Thä Diªn D­¬ng CÊp 2", {2,150,6,1}, 0},
	{1, 699, "C­êng Th©n B¸ ThÓ CÊp 2", {2,150,10,1}, 0},
	{1, 699, "¢m Phong Thùc Cèt CÊp 2", {2,150,14,1}, 0},
	{1, 456, "HuyÒn Vò V« Song CÊp 2", {2,150,18,1}, 0},
	{1, 699, "V« Hµnh V« T­¬ng CÊp 2", {2,150,22,1}, 0},
	{1, 699, "Kim Linh Phô ThÓ CÊp 2", {2,150,26,1}, 0},
	{1, 699, "Méc Linh Phô ThÓ CÊp 2", {2,150,30,1}, 0},
	{1, 699, "Thñy Linh Phô ThÓ CÊp 2", {2,150,34,1}, 0},
	{1, 699, "Háa Linh Phô ThÓ CÊp 2", {2,150,38,1}, 0},
	{1, 699, "Thæ Linh Phô ThÓ CÊp 2", {2,150,42,1}, 0},
	{1, 699, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 2", {2,150,46,1}, 0},
	{1, 699, "S¸t th­¬ng gia n©ng CÊp 2", {2,150,50,1}, 0},
	{1, 456, "Khinh Linh TÊn TËt CÊp 2", {2,150,54,1}, 0},
	{1, 700, "V« H×nh Chi Cæ CÊp 2", {2,150,58,1}, 0},
}

VET_BOOK_PET3 = {
	{1, 718, "Ch©n khÝ hé thÓ CÊp 3", {2,150,3,1}, 0},
	{1, 718, "Ých Thä Diªn D­¬ng CÊp 3", {2,150,7,1}, 0},
	{1, 718, "C­êng Th©n B¸ ThÓ CÊp 3", {2,150,11,1}, 0},
	{1, 718, "¢m Phong Thùc Cèt CÊp 3", {2,150,15,1}, 0},
	{1, 333, "HuyÒn Vò V« Song CÊp 3", {2,150,19,1}, 0},
	{1, 718, "V« Hµnh V« T­¬ng CÊp 3", {2,150,23,1}, 0},
	{1, 718, "Kim Linh Phô ThÓ CÊp 3", {2,150,27,1}, 0},
	{1, 718, "Méc Linh Phô ThÓ CÊp 3", {2,150,31,1}, 0},
	{1, 718, "Thñy Linh Phô ThÓ CÊp 3", {2,150,35,1}, 0},
	{1, 718, "Háa Linh Phô ThÓ CÊp 3", {2,150,39,1}, 0},
	{1, 718, "Thæ Linh Phô ThÓ CÊp 3", {2,150,43,1}, 0},
	{1, 718, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 3", {2,150,47,1}, 0},
	{1, 718, "S¸t th­¬ng gia n©ng CÊp 3", {2,150,51,1}, 0},
	{1, 333, "Khinh Linh TÊn TËt CÊp 3", {2,150,55,1}, 0},
	{1, 718, "V« H×nh Chi Cæ CÊp 3", {2,150,59,1}, 0},
}
VET_BOOK_PET4 = {
	{1, 718, "Ch©n khÝ hé thÓ CÊp 4",{2,150,4,1}, 0},
	{1, 718, "Ých Thä Diªn D­¬ng CÊp 4",{2,150,8,1}, 0},
	{1, 718, "C­êng Th©n B¸ ThÓ CÊp 4",{2,150,12,1}, 0},
	{1, 718, "¢m Phong Thùc Cèt CÊp 4",{2,150,16,1}, 0},
	{1, 333, "HuyÒn Vò V« Song CÊp 4",{2,150,20,1}, 0},
	{1, 718, "V« Hµnh V« T­¬ng CÊp 4",{2,150,24,1}, 0},
	{1, 718, "Kim Linh Phô ThÓ CÊp 4",{2,150,28,1}, 0},
	{1, 718, "Méc Linh Phô ThÓ CÊp 4",{2,150,32,1}, 0},
	{1, 718, "Thuû Linh Phô ThÓ CÊp 4",{2,150,36,1}, 0},
	{1, 718, "Ho¶ Linh Phô ThÓ CÊp 4",{2,150,40,1}, 0},
	{1, 718, "Thæ Linh Phô ThÓ CÊp 4",{2,150,44,1}, 0},
	{1, 718, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 4",{2,150,48,1}, 0},
	{1, 718, "S¸t th­¬ng gia n©ng cÊp 4",{2,150,52,1}, 0},
	{1, 333, "Khinh Linh TÊn TËt  CÊp 4",{2,150,56,1}, 0},
	{1, 718, "V« H×nh Chi Cæ CÊp 4",{2,150,60,1}, 0},
}
function Book_Pet1(nNum)
	for i = 1, nNum do
		gf_EventGiveRandAward(VET_BOOK_PET1,10000,"", "GIAP NGO BAO RUONG BK","S¸ch PET 1")
		Msg2Player("B¹n nhËn ®­îc 1 s¸ch PET cÊp 1")
	end
end

function Book_Pet2(nNum)
	for i = 1, nNum do
		gf_EventGiveRandAward(VET_BOOK_PET2,10000,"", "GIAP NGO BAO RUONG BK","S¸ch PET 2")
		Msg2Player("B¹n nhËn ®­îc 1 s¸ch PET cÊp 2")
	end
end

function Book_Pet3(nNum)
	for i = 1, nNum do
		gf_EventGiveRandAward(VET_BOOK_PET3,10000,"", "GIAP NGO BAO RUONG BK","S¸ch PET 3")
		Msg2Player("B¹n nhËn ®­îc 1 s¸ch PET cÊp 3")
	end
end

function Book_Pet4(nNum)
	for i = 1, nNum do
		gf_EventGiveRandAward(VET_BOOK_PET4,10000,"", "GIAP NGO BAO RUONG BK","S¸ch PET 4")
		Msg2Player("B¹n nhËn ®­îc 1 s¸ch PET cÊp 4")
	end
end

tbKimXa3sao = {
	[1] = {item={{gdp={0,152,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Háa V©n"}}},
	[2] = {item={{gdp={0,152,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Kim ChÕ ngò hµnh"}}},
	[3] = {item={{gdp={0,152,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Méc ChÕ ngò hµnh"}}},
	[4] = {item={{gdp={0,152,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Thñy ChÕ ngò hµnh"}}},
	[5] = {item={{gdp={0,152,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Háa ChÕ ngò hµnh"}}},
	[6] = {item={{gdp={0,152,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Thæ ChÕ ngò hµnh"}}},
	[7] = {item={{gdp={0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng ¢m ChÕ ngò hµnh"}}},
	[8] = {item={{gdp={0,153,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Ngäc ChÕ"}}},
	[9] = {item={{gdp={0,153,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Kim ChÕ ngò hµnh"}}},
	[10] = {item={{gdp={0,153,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Méc ChÕ ngò hµnh"}}},
	[11] = {item={{gdp={0,153,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Thñy ChÕ ngò hµnh"}}},
	[12] = {item={{gdp={0,153,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Háa ChÕ ngò hµnh"}}},
	[13] = {item={{gdp={0,153,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Thæ ChÕ ngò hµnh"}}},
	[14] = {item={{gdp={0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng ¢m ChÕ ngò hµnh"}}},
	[15] = {item={{gdp={0,154,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Bè ChÕ Cao §ång Ngoa"}}},
	[16] = {item={{gdp={0,154,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Kim ChÕ ngò hµnh"}}},
	[17] = {item={{gdp={0,154,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Méc ChÕ ngò hµnh"}}},
	[18] = {item={{gdp={0,154,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Thñy ChÕ ngò hµnh"}}},
	[19] = {item={{gdp={0,154,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Háa ChÕ ngò hµnh"}}},
	[20] = {item={{gdp={0,154,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi Thæ ChÕ ngò hµnh"}}},
	[21] = {item={{gdp={0,154,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="ChiÕn Hµi ¢m ChÕ ngò hµnh"}}},
}

tbAwardRate = {
	[1] = {[1] = 	tbKimXa3sao[1], nRate = 7},
	[2] = {[1] = 	tbKimXa3sao[2], nRate = 5},
	[3] = {[1] = 	tbKimXa3sao[3], nRate = 5},
	[4] = {[1] = 	tbKimXa3sao[4], nRate = 5},
	[5] = {[1] = 	tbKimXa3sao[5], nRate = 5},
	[6] = {[1] = 	tbKimXa3sao[6], nRate = 5},
	[7] = {[1] = 	tbKimXa3sao[7], nRate = 1},
	[8] = {[1] = 	tbKimXa3sao[8], nRate = 7},
	[9] = {[1] = 	tbKimXa3sao[9], nRate = 5},
	[10] = {[1] = 	tbKimXa3sao[10], nRate = 5},
	[11] = {[1] = 	tbKimXa3sao[11], nRate = 5},
	[12] = {[1] = 	tbKimXa3sao[12], nRate = 5},
	[13] = {[1] = 	tbKimXa3sao[13], nRate = 5},
	[14] = {[1] = 	tbKimXa3sao[14], nRate = 1.5},
	[15] = {[1] = 	tbKimXa3sao[15], nRate = 7},
	[16] = {[1] = 	tbKimXa3sao[16], nRate = 5},
	[17] = {[1] = 	tbKimXa3sao[17], nRate = 5},
	[18] = {[1] = 	tbKimXa3sao[18], nRate = 5},
	[19] = {[1] = 	tbKimXa3sao[19], nRate = 5},
	[20] = {[1] = 	tbKimXa3sao[20], nRate = 5},
	[21] = {[1] = 	tbKimXa3sao[21], nRate = 1.5},
}

function TrangBiKimXa3Sao(nQty)
	for i=1,nQty do
		LIB_Award:AwardByRate(tbAwardRate)
		Msg2Player("B¹n nhËn ®­îc trang bÞ Kim Xµ !!!!")
	end
	gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nhËn", 1, "trang bÞ Kim Xµ")
end
tbMatTich_GN = {
		[2] = {0,107,204, 2,"Kim Cang B¸t Nh· Ch©n QuyÓn"},
		[4] = {0,107,205, 1,"TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[3] = {0,107,206, 1,"V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[6] = {0,107,207, 2,"Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] = {0,107,208, 1,"Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[9] = {0,107,209, 1,"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0,107,210, 2,"Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0,107,211, 2,"Quú Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0,107,212, 1,"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[15] = {0,107,213, 2,"Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[17] = {0,107,214, 2,"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0,107,215, 2,"Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0,107,216, 2,"HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0,107,217, 1,"Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[23] = {0,107,218,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[29] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
	}
function MatTichMonPhai20_HePhai()
	local nRoute = GetPlayerRoute()
	local _, nItemID = AddItem(tbMatTich_GN[nRoute][1], tbMatTich_GN[nRoute][2], tbMatTich_GN[nRoute][3], 1)
	if tbMatTich_GN[nRoute][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nhËn", 1, "MËt tÞch siªu cÊp")
	Msg2Player("B¹n nhËn ®­îc 1 mËt tÞch siªu cÊp")
end
tbMatTich_random_GN = {
		[0] = {0,107,204, 2,"Kim Cang B¸t Nh· Ch©n QuyÓn"},
		[1] = {0,107,205, 1,"TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[2] = {0,107,206, 1,"V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[3] = {0,107,207, 2,"Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[4] = {0,107,208, 1,"Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[5] = {0,107,209, 1,"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[6] = {0,107,210, 2,"Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[7] = {0,107,211, 2,"Quú Thiªn Du Long Ch©n QuyÓn"},
		[8] = {0,107,212, 1,"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[9] = {0,107,213, 2,"Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[10] = {0,107,214, 2,"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[11] = {0,107,215, 2,"Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[12] = {0,107,216, 2,"HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[13] = {0,107,217, 1,"Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[14] = {0,107,218,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[15] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[16] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
	}
function MatTichMonPhai20_Random()
	local nAwardRand = mod(random(1,1000),17)
	local _, nItemID = AddItem(tbMatTich_random_GN[nAwardRand][1], tbMatTich_random_GN[nAwardRand][2], tbMatTich_random_GN[nAwardRand][3], 1)
	if tbMatTich_random_GN[nAwardRand][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nhËn", 1, "MËt tÞch siªu cÊp")
	Msg2Player("B¹n nhËn ®­îc 1 mËt tÞch siªu cÊp")
end
function dialog_over()

end