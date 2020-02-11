
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÍËÈÎ¹ÙÔ±½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\misc\\spreader\\spreader.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

nTuiGuanYuanFlag = 0;--ÉèÖÃÎª1 ´ò¿ªÍÆ¹ãÔ±¹¦ÄÜ

function main()

	--»î¶¯µÄ
	local tSay = {};
	--¸±»î¶¯
	local tActivityID = {120};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	if getn(tSay) > 0 then
		tinsert(tSay, "Tho¸t/nothing")
		Say("Lµm ng­êi, tr­íc khi nh¾m m¾t xu«i tay, cã thÓ cèng hiÕn cho Quèc gia còng lµ viÖc nªn lµm!", getn(tSay), tSay);
		return 
	end
	-------
	
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (IsFreeze() == 1) then  --Èç¹ûÓÃWG±»·â
     Talk(1,"","H·y ®Õn BiÖn Kinh gÆp Quan viªn tho¸i nhiÖm gi¶i trõ phong táa.");
	    return
	end;
	
	if (nState==13) then
		task_013();
		return
	else
	    if (nTuiGuanYuanFlag == 0) then
	        Talk(1,"","Lµm ng­êi, tr­íc khi nh¾m m¾t xu«i tay, cã thÓ cèng hiÕn cho Quèc gia còng lµ viÖc nªn lµm!");
	    else
            local szOp = 
	        {
		        "H·y nhËp cd-key kÝch ho¹t tµi kho¶n/gsp_input_cdkey",
		        "NhËn phÇn th­ëng giai ®o¹n./gsp_phase_prize",
		        "Liªn quan Sø gi¶.../gsp_about",
		        "ChØ ghÐ qua th«i./gsp_cancel"
	        };

	        Say("Hoan nghªnh b¹n b­íc vµo <color=green>hÖ thèng Sø gi¶<color>, chóng t«i cã thÓ gióp g× cho b¹n?", 4, szOp[1], szOp[2], szOp[3], szOp[4]);
	    end
	end;
end;

function gsp_input_cdkey()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	local szError;
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY) then
		szError = "Tµi kho¶n nµy ®· kÝch ho¹t, kh«ng cÇn nhËp l¹i cd-key."
		Talk(1, "", "<color=green>Sø gi¶<color>:"..szError);
		return
	end
	
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "Vui lßng nhËp cd-key:");
end

-- ÁìÈ¡½×¶Î½±Àø
function gsp_phase_prize()
    local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
    local nStage = GetTask(GSP_TASKID_ROLEREINFO);
    if (nValue ~= GSP_ACCOUNT_TYPE_CDKEY) or (GetByte(nStage, GSP_TASKID_TAG_BYTE_ROLETYPE) ~= GSP_TASKID_ROLETYPE_CDKEY) then
		Talk(1, "", "B¹n ch­a dïng [CD-KEY]kÝch ho¹t tµi kho¶n nµy, kh«ng thÓ l·nh ®­îc phÇn th­ëng. Vui lßng xem chi tiÕt trªn trang chñ.");
		return 0;
    end;

    local nLevel = GetLevel();

    if (nLevel >= 1) and GetBit(nStage, GSP_TASKID_TAG_BIT_01BONUS) == 0 then
        Say("Ng­¬i thËt cã duyªn víi ta, ta cã vµi vËt phÈm muèn tÆng ng­¬i, hy väng chóng sÏ gióp ®ì ng­¬i khi hµnh tÈu giang hå. Khi ®¹t ®Õn cÊp 15, cÊp 30, cÊp 40 h·y quay l¹i gÆp ta nhËn sù trî gióp nhÐ!",2,"NhËn lÊy./OnGet1","Ta sÏ quay l¹i sau!/OnLater");
    elseif (nLevel >= 15) and GetBit(nStage, GSP_TASKID_TAG_BIT_15BONUS) == 0 then
        Say("Ng­¬i thËt nç lùc, ngoµi tËp vâ nghÖ ra còng nªn chän mét nghÒ nµo ®ã lµm kÕ sinh nhai, ta cã mét dông cô nµy muèn tÆng cho ng­¬i!",2,"NhËn lÊy./OnGet2","Ta sÏ quay l¹i sau!/OnLater");
    elseif (nLevel >= 30) and GetBit(nStage, GSP_TASKID_TAG_BIT_30BONUS) == 0 then
        Say("Ng­¬i ®· cã chót hiÓu biÕt vÒ trß ch¬i. TÆng ng­¬i m¶nh B¨ng th¹ch nµy, cã thÓ söa nh÷ng trang bÞ ®· h­.",2,"NhËn lÊy./OnGet3","Ta sÏ quay l¹i sau!/OnLater");
    elseif (nLevel >= 40) and GetBit(nStage, GSP_TASKID_TAG_BIT_40BONUS) == 0 then
        Say("ThËt kh«ng lµm ta thÊt väng! Tõ nay kh«ng cßn g× chØ dÉn n÷a, ng­¬i h·y nhËn lÊy Thiªn th¹ch vµ ®iÓm kinh nghiÖm!",2,"NhËn lÊy./OnGet4","Ta sÏ quay l¹i sau!/OnLater");
    else
        Talk(1,"","Lµm ng­êi, tr­íc khi nh¾m m¾t xu«i tay, cã thÓ cèng hiÕn cho Quèc gia còng lµ viÖc nªn lµm!");
    end;
end

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey);
end

function gsp_about()
	Talk(1, "", "<color=green>Sø gi¶<color>, xem chi tiÕt trªn trang Web.");
end

function gsp_cancel()
end

function OnGet1()
    OnGet(1);
end

function OnGet2()
    OnGet(2);
end

function OnGet3()
    OnGet(3);
end

function OnGet4()
    OnGet(4);
end

function OnGet(nStage)
    local nBit = 0;

    if (nStage == 1) then
        Earn(5000);--Òø×Ó50Á½
        AddItem(0,2,14,1,1,3,131,3,45,0,0);--À¶É«ÏÀÉÙ½£ ¼Ó¹¥»÷10µã£¬¼Ó·ÀÓù10µã
        nBit = GSP_TASKID_TAG_BIT_01BONUS;
        Msg2Player("B¹n nhËn ®­îc 1 thanh HiÖp ThiÕu kiÕm vµ 50 l­îng b¹c.");
    elseif (nStage == 2) then
        local index = GetLifeSkill();
        if (index > 0) then
            GetOneLifeTool(index);--»Æ½ðÉú²ú¹¤¾ßÒ»°Ñ
        else
            Say("B¹n h·y chän cho nh©n vËt cña m×nh 1 dông cô s¶n xuÊt b»ng vµng",7,"§èn c©y/OnGetLifeTool1()","Lµm da/OnGetLifeTool2()","Canh t¸c/OnGetLifeTool3()","H¸i thuèc/OnGetLifeTool4()","§µo kho¸ng/OnGetLifeTool5()","KÐo t¬/OnGetLifeTool6()","Ta sÏ quay l¹i sau!/OnLater")
        end;
    elseif (nStage == 3) then
        AddItem(2, 1, 148, 2);--Ð¡¿é½ðÏ¬2¿é
        nBit = GSP_TASKID_TAG_BIT_30BONUS;
        Msg2Player("NhËn ®­îc 2 B¨ng th¹ch.");
    elseif (nStage == 4) then
        AddItem(2, 2, 8, 3);--ÔÉÌú3¿é
        ModifyExp(300000);--30Íò¾­ÑéÖµ
        nBit = GSP_TASKID_TAG_BIT_40BONUS;
        Msg2Player("NhËn ®­îc 2 Thiªn th¹ch vµ 300000 ®iÓm kinh nghiÖm.");
    end;

    if (nBit ~= 0) then
        local nValue = GetTask(GSP_TASKID_ROLEREINFO);
        nValue = SetBit(nValue, nBit, 1); --ÉèÖÃÁìÈ¡±ê¼Ç
        SetTask(GSP_TASKID_ROLEREINFO, nValue);
    end;
end

function OnLater()
end

function GetLifeSkill()
    nGene1, nSKIllId1 = GetMainLifeSkill();
    nGene2, nSKIllId2 = GetAssistLifeSkill();
    
    if (nGene1 == 0) then
        return nSKIllId1
    end
    if (nGene2 == 0) then
        return nSKIllId2
    end
    return 0
end

function OnGetLifeTool1()
    GetOneLifeTool(1);
end

function OnGetLifeTool2()
    GetOneLifeTool(2);
end

function OnGetLifeTool3()
    GetOneLifeTool(3);
end

function OnGetLifeTool4()
    GetOneLifeTool(4);
end

function OnGetLifeTool5()
    GetOneLifeTool(5);
end

function OnGetLifeTool6()
    GetOneLifeTool(6);
end

function GetOneLifeTool(index)
    if (index<1 or index>6) then
        return
    end
    
    if (index == 1) then--·¥Ä¾
        AddItem(0, 200, 26, 1)
        Msg2Player("B¹n nhËn ®­îc 1 thanh Bµn Cæ Phñ!")
    elseif (index == 2) then--ÖÆÆ¤
        AddItem(0, 200, 24, 1)
        Msg2Player("B¹n nhËn ®­îc 1 thanh L«i ThÇn §ao!")
    elseif (index == 3) then--ÊÕ¸û
        AddItem(0, 200, 25, 1)
        Msg2Player("B¹n nhËn ®­îc 1 cuèc Viªm §Õ!")
    elseif (index == 4) then--²ÉÒ©
        AddItem(0, 200, 28, 1)
        Msg2Player("B¹n nhËn ®­îc 1 cuèc ThÇn N«ng!")
    elseif (index == 5) then--ÍÚ¿ó
        AddItem(0, 200, 23, 1)
        Msg2Player("B¹n nhËn ®­îc 1 cuèc Céng C«ng!")
    elseif (index == 6) then--³éË¿
        AddItem(0, 200, 27, 1)
        Msg2Player("B¹n nhËn ®­îc 1 Chøc N÷ Thoa!")
    end
    
    local nValue = GetTask(GSP_TASKID_ROLEREINFO);
    nValue = SetBit(nValue, GSP_TASKID_TAG_BIT_15BONUS, 1); --ÉèÖÃÁìÈ¡±ê¼Ç
    SetTask(GSP_TASKID_ROLEREINFO, nValue);
end

function lua_clear()
    ModifyReputation(-50, 0);
    ClearFreeze();  --½â·â
end;