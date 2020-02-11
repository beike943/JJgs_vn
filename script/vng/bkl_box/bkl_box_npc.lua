
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");

tbBox_everyday = {
							[0] = {2, 6, {25, 25, 40, 60, 75, 100}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[1] = {1, 6, {25, 40, 60, 75, 100, 175}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[2] = {1, 6, {25, 40, 60, 75, 100, 175}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[3] = {1, 6, {25, 40, 60, 75, 100, 175}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[4] = {1, 6, {25, 40, 60, 75, 100, 175}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[5] = {2, 6, {25, 25, 40, 60, 75, 100}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[6] = {2, 6, {25, 25, 40, 60, 75, 100}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
					}
function main()
	Talk(1, "", "§©y lµ r­¬ng rèng !!!!")
	do return end
	--Msg2Player("Më r­¬ng")
	if CheckActivatedExt_BKL() ~= 2 then		
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ch­a kÝch ho¹t nhËn th­ëng hoÆc kh«ng ph¶i Vâ L©m TiÒn Bèi!");
		return
	end	
	local nWeek = tonumber(date("%w"))
	local nNumRec = gf_GetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_BOX)

--	Msg2Player("Ngµy: "..nWeek)	
--	if nWeek ~= 5 and nWeek ~= 6 and nWeek ~= 0 then
--		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã thÓ nhËn phÇn th­ëng nµy vµo thø s¸u, thø b¶y vµ chñ nhËt.");
--		return
--	end
	if nNumRec > tbBox_everyday[nWeek][2] then
		Talk(1, "", "<color=green>B¹ch Kim B¶o R­¬ng<color>: H«m nay ®¹i hiÖp ®· hÕt lÇn më r­¬ng, vui lßng quay l¹i vµo ngµy mai.");
		return
	end
	Msg2Player("LÇn më r­¬ng thø "..nNumRec.." trong ngµy, më r­¬ng cÇn "..tbBox_everyday[nWeek][3][nNumRec].." xu vËt phÈm")
	if GetItemCount(2,1,30230) < tbBox_everyday[nWeek][3][nNumRec] then
		Talk(1, "", "<color=green>B¹ch Kim B¶o R­¬ng<color>: §¹i hiÖp kh«ng ®ñ Xu vËt phÈm ®Ó më r­¬ng.");
		return
	end
 	if gf_Judge_Room_Weight(2,100) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end	
-------------------------------------
	local box_index = GetTargetNpc()
--	Msg2Player("Gia tri box_index: "..box_index)
--	SetTask(2693,box_index)  --sau khi xong, ®æi thµnh 2693 ##################################################

	if GetUnitCurStates(box_index,2) ~= 1 or (GetTime() - GetUnitCurStates(box_index,1)) > 30 then
		SetUnitCurStates(box_index,1,GetTime())
		SetUnitCurStates(box_index,2,1)
		DoWait(26,27,5)	
	else
		Talk(1,"","HiÖn ®· cã ng­êi sö dông <color=red>B¹ch Kim B¶o r­¬ng<color>.")
		return
	end

end

function bkl_box_award()
	local tWeapon_bkl = {
		[1] =	{
				{700, "V¹n NhÉn", 0, 0, 14},
				{700, "M·n Thiªn Hoa Vò",	 0, 1, 53},
				{700, "Háa Tinh", 0, 2, 36},
				{700, "Cæ §Ýnh",	0, 3, 64},
				{700, "ThÇn Cung", 0,	4,	119},
				{700, "LiÖt DiÖm", 0, 5, 40},
				{700, "§¹i H¶o L«i Th­¬ng",	0,	6, 108},
				{700, "L¨ng Phong", 0, 7, 12},
				{700, "A La H¸n Tr­îng", 0, 8, 97},
				{700, "ThÇn Hµnh",	 0, 9, 86},
				{700, "Hi Nh©n CÇm", 	0,	10, 75},
				{700, "M·nh Hæ", 0, 11, 12},
				{668, "M¶nh Thiªn M«n", 2, 1, 30410},
				{668, "M¶nh Thiªn Cang",	2,	1,	30390},		
				{132, "Tæ MÉu Lôc Giíi ChØ", {0,102,17,1,1,2,24,3,14,3,305}},
				{132, "Kinh B¹ch Ngäc Béi", {0,102,7,1,1,2,24,3,14,3,305}},
			},
		[5] =	{
				{554, "ThÇn Quy", 0, 0, 15},
				{666, "Khoa Phô",	 0, 1, 54},
				{666, "Häa ¶nh", 0, 2, 37},
				{666, "LËu C¶nh",	0, 3, 65},
				{555, "Viªn §Ò", 0,	4,	120},
				{666, "Ngäc Trô", 0, 5, 41},
				{555, "Cöu Long Toµn KÝch",	0,	6, 109},
				{679, "BÝch Thñy", 0, 7, 13},
				{555, "Môc KiÒn Liªn Tr­îng", 0, 8, 98},
				{666, "Toan D­",	 0, 9, 87},
				{535, "§¹i Th¸nh Di ¢m", 	0,	10, 76},
				{679, "V« NgÊn", 0, 11, 13},
				{968, "M¶nh Thiªn M«n", 2, 1, 30410},
				{968, "M¶nh Thiªn Cang",	2,	1,	30390},		
				{311, "Lam B¶o Th¹ch Giíi ChØ", {0,102,18,1,1,2,24,4,14,4,305}},
				{311, "§µo Hoa Ngäc Béi", {0,102,8,1,1,2,24,4,14,4,305}},
			},	
		[6] =	{
				{269, "¢m D­¬ng ¢n1", 0, 0, 16},
				{709, "Kh«ng Cã",	 0, 1, 55},
				{555, "Nha Cöu", 0, 2, 38},
				{709, "NghÞch L©n",	0, 3, 66},
				{468, "B¸t X¹ Chi X¹", 0,	4,	121},
				{709, "ThÇn Ch©m", 0, 5, 42},
				{666, "Th­¬ng N«",	0,	6, 110},
				{709, "Thiªn T«n", 0, 7, 14},
				{269, "D­îc S­ Tr­îng", 0, 8, 99},
				{679, "Th¸i H­",	 0, 9, 88},
				{357, "Kh« Méc Long Ng©m", 	0,	10, 77},
				{679, "Thanh Long", 0, 11, 14},
				{1221, "M¶nh Thiªn M«n", 2, 1, 30410},
				{1221, "M¶nh Thiªn Cang",	2,	1,	30390},		
				{390, "Tiªn X¹ H­¬ng Nang", {0,102,4,1,1,3,24,4,14,4,305}},
				{390, "Ngò S¾c Ngäc Béi", {0,102,9,1,1,3,24,4,14,4,305}},
			},					
	}
	local tAttribute_bkl_first = {
			[1] =	{
					[1]  	= {27,	30, 	{{3,700}, {4,300}}},
					[2]  	= {28,	60, 	{{6,600}, {7,400}}},
					[3]  	= {41,	70, 	{{4,400}, {5,600}}},
					[4]  	= {42,	70, 	{{4,400}, {5,600}}},
					[5]  	= {49,	80, 	{{6,500}, {7,500}}},
					[6]  	= {50, 	10, 	{{6,800}, {7,200}}},
					[7] 	= {53,	30, 	{{6,600}, {7,400}}},
					[8]  	= {54,	30, 	{{6,600}, {7,400}}},
					[9]  	= {63,	20, 	{{5,500}, {6,500}}},
					[10] 	= {64,	20, 	{{5,500}, {6,500}}},
					[11] 	= {69,	100, 	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {85,	10, 	{{4,600}, {5,400}}},
					[13] 	= {86,	10,	{{4,600}, {5,400}}},
					[14] 	= {94,	80, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {95,	80, 	{{5,300}, {6,500}, {7,200}}},
					[16] 	= {96,	80, 	{{5,300}, {6,500}, {7,200}}},
					[17] 	= {97,	80,	{{5,300}, {6,500}, {7,200}}},
					[18] 	= {98,	80, 	{{5,300}, {6,500}, {7,200}}},
					[19] 	= {102,	30, 	{{5,400}, {6,600}}},
					[20] 	= {111,	30, 	{{5,300}, {6,300}, {7,400}}},
				},
			[5] = {
					[1]  	= {27,	30, 	{{3,700}, {4,300}}},
					[2]  	= {28,	60, 	{{6,600}, {7,400}}},
					[3]  	= {41,	70, 	{{5,400}, {6,600}}},
					[4]  	= {42,	70, 	{{5,400}, {6,600}}},
					[5]  	= {49,	80, 	{{6,500}, {7,500}}},
					[6]  	= {50, 	10, 	{{6,800}, {7,200}}},
					[7] 	= {53,	30, 	{{6,600}, {7,400}}},
					[8]  	= {54,	30, 	{{6,600}, {7,400}}},
					[9]  	= {63,	20, 	{{5,500}, {6,400}, {7,100}}},
					[10] 	= {64,	20, 	{{5,500}, {6,400}, {7,100}}},
					[11] 	= {69,	100, 	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {85,	10, 	{{4,500}, {5,500}}},
					[13] 	= {86,	10,	{{4,500}, {5,500}}},
					[14] 	= {94,	80, 	{{6,500}, {7,500}}},
					[15] 	= {95,	80, 	{{6,500}, {7,500}}},
					[16] 	= {96,	80, 	{{6,500}, {7,500}}},
					[17] 	= {97,	80,	{{6,500}, {7,500}}},
					[18] 	= {98,	80, 	{{6,500}, {7,500}}},
					[19] 	= {102,	30, 	{{5,400}, {6,600}}},
					[20] 	= {111,	30, 	{{6,300}, {7,700}}},
				},
			[6] =	{
					[1]  	= {27,	80, 	{{3,700}, {4,300}}},
					[2]  	= {28,	80, 	{{6,600}, {7,400}}},
					[3]  	= {41,	60, 	{{6,400}, {7,600}}},
					[4]  	= {42,	60, 	{{6,400}, {7,600}}},
					[5]  	= {49,	80, 	{{6,500}, {7,500}}},
					[6]  	= {50, 	10, 	{{6,800}, {7,200}}},
					[7] 	= {53,	30, 	{{6,600}, {7,400}}},
					[8]  	= {54,	30, 	{{6,600}, {7,400}}},
					[9]  	= {63,	10, 	{{5,300}, {6,600}, {7,100}}},
					[10] 	= {64,	10, 	{{5,300}, {6,600}, {7,100}}},
					[11] 	= {69,	60, 	{{6,500}, {7,500}}},
					[12] 	= {85,	10, 	{{4,300}, {5,700}}},
					[13] 	= {86,	10,	{{4,300}, {5,700}}},
					[14] 	= {94,	70, 	{{6,200}, {7,800}}},
					[15] 	= {95,	70, 	{{6,200}, {7,800}}},
					[16] 	= {96,	70, 	{{6,200}, {7,800}}},
					[17] 	= {97,	70,	{{6,200}, {7,800}}},
					[18] 	= {98,	70, 	{{6,200}, {7,800}}},
					[19] 	= {102,	60, 	{{6,200}, {7,800}}},
					[20] 	= {111,	60, 	{{6,200}, {7,800}}},
				},		
	}	
	local tItem = {
		[1] = {{0,102,17,1,1,2,24,3,14,3,305}, {0,102,7,1,1,2,24,3,14,3,305}},
		[5] = {{0,102,18,1,1,2,24,4,14,4,305}, {0,102,8,1,1,2,24,4,14,4,305}},
		[6] = {{0,102,4,1,1,3,24,4,14,4,305}, {0,102,9,1,1,3,24,4,14,4,305}},
	}
--	Msg2Player("B¹n ®ang më r­¬ng")
--	local npc_index = GetTask(2693)
--	if npc_index == 0 or GetNpcName(npc_index) ~= "B¶o r­¬ng B¹ch Kim LÖnh" then			--ÅÐ¶ÏÏä×ÓÊÇ·ñ´æÔÚ
--		return
--	end
--	SetUnitCurStates(npc_index,2,1)
--	SetUnitCurStates(npc_index,4,zgc_pub_day_turn(1))						--´æÈë½ñÌìÊ±¼ä
--	SetNpcLifeTime(npc_index,0)
	local nNumRec = gf_GetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_BOX)
	local nNumRec_Att = nNumRec
	if nNumRec_Att <= 4 then
		nNumRec_Att = 1
	end
--	Msg2Player("Gia tri nhan "..nNumRec_Att)
	local nWeek = tonumber(date("%w"))
	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_bkl(tWeapon_bkl[nNumRec_Att], 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
--	Msg2Player("Gia tri Random: "..nRan_weapon)
	
	--if GetItemCount(2,1,30230) < tbBox_everyday[nWeek][3][nNumRec] then
	if DelItem(2,1,30230,tbBox_everyday[nWeek][3][nNumRec]) ~= 1 then
		Talk(1,"","<color=red>B¹ch Kim B¶o r­¬ng: <color>§¹i hiÖp kh«ng cã ®ñ Xu vËt phÈm trong ng­êi !!!!")
		--gf_WriteLogEx("BKL RUONG", "Xãa Xu thµnh c«ng", tbBox_everyday[nWeek][3][nNumRec], "XOA XU")	
		gf_WriteLogEx("Bach Kim Lenh Bai", "më thµnh c«ng", 1, "6/2013 Më r­¬ng lo¹i "..tbBox_everyday[nWeek][3][nNumRec])
		return	
	end
	gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_BOX, nNumRec + 1)
	--SetTask(TSK_BKLB_FLAG,SetByte(GetTask(TSK_BKLB_FLAG),BYTE_BKLB_BOX,nNumRec + 1))  --Set sè lÇn nhËn trong ngµy thªm 1
	AddItem(2,1,30368, tbBox_everyday[nWeek][4][nNumRec])			
	AddItem(2,1,30369, tbBox_everyday[nWeek][4][nNumRec])			
	gf_WriteLogEx("MO BKL RUONG", "Më r­¬ng BKL thµnh c«ng", 1, "Cæ Linh Th¹ch & Ngäc")	
	if nRan_weapon == 13 or nRan_weapon == 14 or nRan_weapon == 15 or nRan_weapon == 16 then
		if nRan_weapon == 13 then
			AddItem(2,1,30410,tbBox_everyday[nWeek][5][nNumRec])
		end
		if nRan_weapon == 14 then
			AddItem(2,1,30390,tbBox_everyday[nWeek][5][nNumRec])
		end
		if nRan_weapon == 15 then
			if nNumRec == 5 then
				AddItem(0,102,18,1,1,2,24,4,14,4,305)
			elseif nNumRec == 6 then
				AddItem(0,102,4,1,1,3,24,4,14,4,305)		
			else
				AddItem(0,102,17,1,1,2,24,3,14,3,305)			
			end
		end
		if nRan_weapon == 16 then
			if nNumRec == 5 then
				AddItem(0,102,8,1,1,2,24,4,14,4,305)
			elseif nNumRec == 6 then
				AddItem(0,102,9,1,1,3,24,4,14,4,305)		
			else
				AddItem(0,102,7,1,1,2,24,3,14,3,305)			
			end
		end
		add_flag = 1
	else
		for i=1, 3 do
			nRandomAttr =get_random_attrib_bkl(tAttribute_bkl_first[nNumRec_Att], nPerTurn)
			--Msg2Player("Test gia tri random Att: "..nRandomAttr)
			nPerTurn = nPerTurn - tAttribute_bkl_first[nNumRec_Att][nRandomAttr][2]		
		--	Msg2Player("Test gia tri 1: "..nPerTurn)
			nRandomAttrLevel = get_random_attrib_bkl(tAttribute_bkl_first[nNumRec_Att][nRandomAttr][3],1000)
			tWeaponAttr[i][1] = tAttribute_bkl_first[nNumRec_Att][nRandomAttr][3][nRandomAttrLevel][1]
			tWeaponAttr[i][2] = tAttribute_bkl_first[nNumRec_Att][nRandomAttr][1]
			tremove(tAttribute_bkl_first[nNumRec_Att], nRandomAttr)
		end	
		add_flag = AddItem(tWeapon_bkl[nNumRec_Att][nRan_weapon][3],tWeapon_bkl[nNumRec_Att][nRan_weapon][4],tWeapon_bkl[nNumRec_Att][nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	end
	
	prize_name = tWeapon_bkl[nNumRec_Att][nRan_weapon][2]
	
	if add_flag == 1 then
		Msg2Player("B¹n më B¹ch Kim B¶o r­¬ng, nhËn ®­îc: "..prize_name.."!")
		gf_WriteLogEx("MO BKL RUONG", "Më r­¬ng BKL thµnh c«ng", 1, prize_name)
	else
		gf_WriteLogEx("MO BKL RUONG", "Më r­¬ng BKL thÊt b¹i", 1, prize_name)
	end	

end

function get_random_bkl(tWeapon_bkl, nMaxPE, nDefault)
	local nPos = 0;
	local nRand = random(1, nMaxPE);
	for i = 1, getn(tWeapon_bkl) do
		if nRand > nPos and nRand <= nPos + tWeapon_bkl[i][1] then
			return i;
		end
		nPos = nPos + tWeapon_bkl[i][1];
	end
	return nDefault;
end
function get_random_attrib_bkl(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][2]
		if nRandom <= nBase then
			return i			
		end
	end	
end