Include("\\script\\online_activites\\2010_04\\activities_02\\head.lua");--»î¶¯Í·ÎÄ¼þ
Include("\\script\\online\\plant\\fruit_baoguo.lua");
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\doinguyenlieu.lua")
Include("\\script\\vng\\kimxathang1.lua")

function main()
    --³õÊ¼»¯Êý¾Ý
    local nDate = tonumber(date("%Y%m%d"));
    local tbSays = {};    
    if GetTask(VET_201004_02_TASK_DATE_HANDIN_FRUIT) < nDate then               --Ä³ÌìµÚÒ»´Îµã»÷³õÊ¼»¯
        SetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD, 0);
        SetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT, 0);
        SetTask(VET_201004_02_TASK_FLAG_ISHANDED, 0);
        SetTask(VET_201004_02_TASK_DATE_HANDIN_FRUIT, nDate);
    end
    
	if nDate <= 20140119 then
		tinsert(tbSays, "Kim xµ th¸ng 1/KimXaThang1_Menu")
		tinsert(tbSays, "NhËn phÇn th­ëng ®æi 6 lÇn trang bÞ Kim Xµ/KimXaThang1_FinalAward")
	end
    
    --Ìõ¼þÅÐ¶Ï
    if GetPlayerRoute() == 0 then
       Talk(1, "", VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][14]); 
       return 0;
    end
    if GetLevel() < 73 then
       Talk(1, "", VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][13]); 
       return 0;    
    end
    --szSay
    local szSay = VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][1];
    --tbSays
-- §æi nguyªn liÖu b»ng §¹i §Þnh Hån, Thiªn Th¹ch Linh Th¹ch
    if nDate >= 20130515 and nDate <= 20130531 then
    		tinsert(tbSays, "Ta muèn trao ®æi mét Ýt nguyªn liÖu/Trade_Material_Menu2")
    	end
    tinsert(tbSays, VET_201004_02_TB_STRINGS[2][2].."/businessman_handin_fruit");
if DEBUG == 1 then
    print("TaskValue(VET_201004_02_TASK_FLAG_MULTI_REWARD) = "..GetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD));
    print("TaskValue(VET_201004_02_TASK_NUM_HANDIN_FRUIT) = "..GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT));
end
    if GetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD) == 0 and GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) > 1 then
        tinsert(tbSays, VET_201004_02_TB_STRINGS[2][3].."/businessman_multi_award");
    end
    --tinsert(tbSays, "T¹i h¹ muèn trao ®æi tr¸i c©y/ExchangeFruit");
	--tinsert(tbSays,"T¹i h¹ muèn mua mét sè lo¹i tr¸i c©y/BuyFruit_Form")
    tinsert(tbSays, VET_201004_02_TB_STRINGS[2][4].."/businessman_guide");
    tinsert(tbSays, VET_201004_02_TB_STRINGS[2][5].."/gf_DoNothing");
    Say(szSay, getn(tbSays), tbSays);
end

function businessman_handin_fruit()
    --¸ºÖØ¼ì²â
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
    --tbDialogList
    local tbDialogList = {};
    ----say head
    tbDialogList[0] = VET_201004_02_TB_STRINGS[2][9];
    ----Ñ¡ÏîÉú³É
    local nFlagIsHanded = GetTask(VET_201004_02_TASK_FLAG_ISHANDED);
	if DEBUG == 1 then
	    print("nFlagIsHanded = "..nFlagIsHanded);
	end
    for i = 1, 20 do
        if GetBit(nFlagIsHanded, i) == 0 then
            tinsert(tbDialogList, format(VET_201004_02_TB_STRINGS[2][8], VET_201004_02_TB_ITEM_LIST[i][1]).."/#businessman_handin_fruit_final("..i..")");
        end
    end
    if getn(tbDialogList) == 0 then
        Talk(1, "", VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][11]);
        return 1;
    end
    --tinsert(tbDialogList, VET_201004_02_TB_STRINGS[2][10].."/main");
    gf_PageSay(tbDialogList, 1, 6);
end

function businessman_multi_award()
    if GetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD) == 1 then
       Talk(1, "main", VET_201004_02_TB_STRINGS[2][15]); 
       return 0; 
    end
	if gf_Judge_Room_Weight(2,100) == 0 then
		Talk(1,"","Søc lùc hoÆc hµnh trang kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	local nExp = 0
    if GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) >= 20 then
    		nExp = 120000000
    		AddItem(2,1,30340,50)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) == 19 then
    		nExp = 80000000
    		AddItem(2,1,30340,30)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) == 18 then
    		nExp = 60000000
    		AddItem(2,1,30340,20)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) == 17 then
    		nExp = 40000000
    		AddItem(2,1,30340,10)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) == 16 then
    		nExp = 30000000
    		AddItem(2,1,30340,5)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) > 1 then
        	nExp = 1000000*GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT);
    end
    ModifyExp(nExp);
    Msg2Player(format(VET_201004_02_TB_STRINGS[2][16], nExp));
    SetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD, 1);
end

function businessman_guide()
    local szTalkString = VET_201004_02_TB_STRINGS[1][3];
    szTalkString = szTalkString..VET_201004_02_TB_STRINGS[2][6]..VET_201004_02_TB_STRINGS[2][7];
    Talk(1, "main", szTalkString);
end

function businessman_handin_fruit_final(nType)
    --·ÀÖ¹ÍòÒ»£¬ÔÙ´Î¼ì²â
    local nFlagIsHanded = GetTask(VET_201004_02_TASK_FLAG_ISHANDED);
    if GetBit(nFlagIsHanded, nType) == 1 then
        Talk(1, "businessman_handin_fruit", format(VET_201004_02_TB_STRINGS[2][12], VET_201004_02_TB_ITEM_LIST[nType][1]));
        return 0;
    end
    --¼ì²âÉíÉÏË®¹ûÐ¯´ø
if DEBUG ~= 1 then            --debugÂË¹ýÌõ¼þ
    if GetItemCount(VET_201004_02_TB_ITEM_LIST[nType][2], VET_201004_02_TB_ITEM_LIST[nType][3], VET_201004_02_TB_ITEM_LIST[nType][4]) < 10 then
        Talk(1, "", format(VET_201004_02_TB_STRINGS[2][17], VET_201004_02_TB_ITEM_LIST[nType][1], 10));
        return 0;
    end
    --É¾³ýË®¹û
    if DelItem(VET_201004_02_TB_ITEM_LIST[nType][2], VET_201004_02_TB_ITEM_LIST[nType][3], VET_201004_02_TB_ITEM_LIST[nType][4], 10) ~= 1 then
        Talk(1, "", format(VET_201004_02_TB_STRINGS[2][17], VET_201004_02_TB_ITEM_LIST[nType][1], 10));
        return 0;
    end
end
    nFlagIsHanded = SetBit(nFlagIsHanded, nType, 1);
    SetTask(VET_201004_02_TASK_FLAG_ISHANDED, nFlagIsHanded);                   --Ä³ÖÖË®¹ûÒÑ¾­ÉÏ½»ÁË
    SetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT, GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) + 1);
    ModifyExp(500000);
    Msg2Player(format(VET_201004_02_TB_STRINGS[2][16], 500000));
    if tonumber(date("%y%m%d")) < 100709 then
    	gf_EventGiveRandAward(VET_201004_02_TB_RAND_AWARD_LIST, 100, 1, VET_201004_02_STR_LOG_TITLE, VET_201004_02_TB_LOG_ACTION_LIST[1]);
    end
end



--		LIB_Award.szLogTitle = "EVENT TRAI CAY BA MIEN"
--		LIB_Award.szLogAction = "nhËn"
--		local tbNhan = {item = {{gdp = {2, 1, 30164, 20}, name="Nh·n"}}}
--		local tbChomChom = {item = {{gdp = {2, 1, 30165, 20}, name="Ch«m Ch«m"}}}
--		local tbCam = {item = {{gdp = {2, 1, 30166, 20}, name="Cam"}}}
--		local tbDua = {item = {{gdp = {2, 1, 30167, 20}, name="Dõa"}}}
--		local tbMangCut = {item = {{gdp = {2, 1, 30168, 20}, name="M¨ng Côt"}}}
--		local tbBuoi = {item = {{gdp = {2, 1, 30169, 20}, name="B­ëi"}}}
--		local tbDau = {item = {{gdp = {2, 1, 30170, 20}, name="D©u"}}}
--		local tbChuoi = {item = {{gdp = {2, 1, 30171, 20}, name="Chuèi"}}}
--		local tbXoai = {item = {{gdp = {2, 1, 30172, 20}, name="Xoµi"}}}
--		local tbDao = {item = {{gdp = {2, 1, 30173, 20}, name="§µo"}}}
--		local tbMan = {item = {{gdp = {2, 1, 30174, 20}, name="MËn"}}}
--		local tbVai = {item = {{gdp = {2, 1, 30175, 20}, name="V¶i"}}}
--		local tbTao = {item = {{gdp = {2, 1, 30176, 20}, name="T¸o"}}}
--		local tbBo = {item = {{gdp = {2, 1, 30177, 20}, name="B¬"}}}
--		local tbDuDu = {item = {{gdp = {2, 1, 30178, 20}, name="§u §ñ"}}}
--		local tbMangCau = {item = {{gdp = {2, 1, 30179, 20}, name="M·ng CÇu"}}}
--		local tbKhom = {item = {{gdp = {2, 1, 30180, 20}, name="Khãm"}}}
--		local tbLe = {item = {{gdp = {2, 1, 30181, 20}, name="Lª"}}}
--		local tbBonBon = {item = {{gdp = {2, 1, 30182, 20}, name="Bßn Bon"}}}
--		local tbKhe = {item = {{gdp = {2, 1, 30183, 20}, name="KhÕ"}}}

tbTraiCay = {
	[1] = {"Nh·n", 30164, 5},
	[2] = {"Ch«m Ch«m", 30165, 5},
	[3] = {"Cam", 30166, 5},
	[4] = {"Dõa", 30167, 5},
	[5] = {"M¨ng Côt", 30168, 5},
	[6] = {"B­ëi", 30169, 5},
	[7] = {"D©u", 30170, 5},
	[8] = {"Chuèi", 30171, 5},
	[9] = {"Xoµi", 30172, 5},
	[10] = {"§µo", 30173, 5},
	[11] = {"MËn", 30174, 5},
	[12] = {"V¶i", 30175, 5},
	[13] = {"T¸o", 30176, 5},
	[14] = {"B¬", 30177, 5},
	[15] = {"§u §ñ", 30178, 5},
	[16] = {"M·ng CÇu", 30179, 5},
	[17] = {"Khãm", 30180, 5},
	[18] = {"Lª", 30181, 5},
	[19] = {"Bßn Bon", 30182, 5},
	[20] = {"KhÕ", 30183, 5},
}
		

function BuyFruit_Form()
	tbSay = {}
	tbSay[0] = VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][1];
	for i=1,20 do
		tinsert(tbSay, tbTraiCay[i][1] .. "/#BuyFruit_Confirm("..  i .. ")")
	end
	--tinsert(tbSay,"Ta chØ tiÖn ghÐ ngang/gf_DoNothing");
	--Say(szSay,getn(tbSay),tbSay)
	gf_PageSay(tbSay, 1, 6);
end


function BuyFruit_Confirm(nFruitID)
	SetTaskTemp(TSK_TMP_FRUIT_INDEX, nFruitID)
	AskClientForNumber("BuyFruit_Done", 1, 999, "Sè l­îng (1-999)")
end


function BuyFruit_Done(nCount)
	local nFruitID = GetTaskTemp(TSK_TMP_FRUIT_INDEX)
	SetTaskTemp(TSK_TMP_FRUIT_INDEX, 0)

	if gf_Judge_Room_Weight(2,100) == 0 then
		Talk(1,"","Søc lùc hoÆc hµnh trang kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < nCount*4 then
		Talk(1,"","C¸c h¹ kh«ng ®ñ xu vËt phÈm, hay lµ quªn mang theo?");
		return 0
	end
	
	LIB_Award.szLogTitle = "MUA TRAI CAY"
	LIB_Award.szLogAction = "nhËn"
	local tbAward = {item = {{gdp = {2,1,tbTraiCay[nFruitID][2], nCount}, name = tbTraiCay[nFruitID][1]}}}
	
	if DelItem(2,1,30230,nCount*4) == 1 then
		LIB_Award:Award(tbAward)
	end
end