--=============================================
--create by baiyun 2010.1.7
--describe:Ô½ÄÏ°æ2010Äê1ÔÂ´º½Ú»î¶¯ Í·ÎÄ¼ş
--related files: 
--script\settings\online_activites.txt »î¶¯ÅäÖÃ±íÎÄ¼ş
--settings\other.txt ĞÂÎïÆ·
--\script\global\action_bar_callback.lua ¿ªĞÒÔËºì°ü¶ÁÌõºóµÄ»Øµ÷ÎÄ¼ş£¬µ÷ÓÃ13¡¢14ºÅº¯Êı
--=============================================

Include("\\script\\online_activites\\task_values.lua");--ÈÎÎñ±äÁ¿Í·ÎÄ¼ş
Include("\\script\\online_activites\\2010_01\\activites_01\\strings.lua");--»î¶¯×Ö·û´®
Include("\\script\\lib\\globalfunctions.lua");

VET_201001_EVENT_NUMBER = 1; --ÔÚ»î¶¯±íÉÏµÄ±àºÅÊÇ1
VET_201001_NUM_GET_FACTION_AWARD_MAX_COUNT = 10;  --Ã¿½ÇÉ«Ã¿Ìì×î¶à»ñµÃÊ¦ÃÅÈÎÎñ½±ÀøµÄ´ÎÊı
VET_201001_NUM_USE_JIPINZONGZI_EXP = 150000; --Ê¹ÓÃÒ»¸ö¼«Æ·ôÕ×Ó»ñµÃµÄ¾­Ñé
VET_201001_NUM_USE_JIPINZONGZI_MAX_COUNT = 270000000 / VET_201001_NUM_USE_JIPINZONGZI_EXP; --Ã¿½ÇÉ«×î¶àÊ¹ÓÃôÕ×ÓÊıÁ¿


--Í¨¹ıÊ¦ÃÅÈÎÎñ»ñµÃµÄÊ¥µ®ÌÇ¹ûµÄÊıÁ¿
VET_201001_TB_FACTION_FINISH_AWARD_NUM_LIST = {
	[1] = 30,
	[2] = 30,
	[3] = 30,
	[4] = 30,
	[5] = 30,
	[6] = 50,
	[7] = 60,
	[8] = 70,
	[9] = 80,
};

--ĞÒÔËºì°ü½±ÀøÁĞ±í
VET_201001_TB_HONGBAO_AWARD_LIST = {
    {3, 2000, 80000, 1},
    {3, 100, 880000, 1},
    {3, 1, 8880000, 1},
    {2, 7899, 150000, 1},
};
function VET_201001_GiveHongBaoAward(nItemIdx)
    if DelItemByIndex(nItemIdx, 1) == 1 then
        gf_EventGiveRandAward(VET_201001_TB_HONGBAO_AWARD_LIST, 10000, 4, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[18]);        
    end
end

function VET_201001_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201001_EVENT_NUMBER) == 1 then
        szSayHead = VET_201001_TB_STRINGS[3];--½õÄÒ´óÊÂ¼şsayµÄ±êÌâ
    
        tinsert(tbSayDialog, VET_201001_TB_STRINGS[5].."/exchange_jipinzongzi");
        tinsert(tbSayDialog, VET_201001_TB_STRINGS[6].."/get_xingyunhongbao");

        tinsert(tbSayDialog, VET_201001_TB_STRINGS[7].."/get_expmax_award");

        --¶Ô»°´¦Àí
    end
    return tbSayDialog, szSayHead;
end

--ÁìÈ¡¾­ÑéÉÏÏŞ½±Àø
function get_expmax_award()
	if GetTask(VET_201001_TASK_HAS_GET_LIMIT_AWARD) == 0 then--¿ÉÒÔÁìÈ¡¾­ÑéÉÏÏŞ½±Àø
		Say("C¸c h¹ ch­a sö dông ®ñ sè l­îng B¸nh Ch­ng!",0)
		return 0;
	end
	if GetTask(VET_201001_TASK_HAS_GET_LIMIT_AWARD) == 2 then--¿ÉÒÔÁìÈ¡¾­ÑéÉÏÏŞ½±Àø
		Say("C¸c h¹ ®· nhËn phÇn th­ëng nµy råi!",0)
		return 0;
	end
	if gf_JudgeRoomWeight(2, 50, VET_201001_TB_STRINGS[12]) == 0 then
           return 0;
     end    
    SetTask(VET_201001_TASK_HAS_GET_LIMIT_AWARD, 2);
    gf_EventGiveCustomAward(1, 30000000, 1, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[15]);        
    gf_EventGiveRandAward(VET_201001_TB_AWARD_LIST3, 10000, 2, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[15]);        
end

--ÁìÈ¡ĞÒÔËºì°ü
function get_xingyunhongbao()
    if GetLevel() < 73 or gf_Check55FullSkill() == 0 then
        Talk(1, "", VET_201001_TB_STRINGS[12]..VET_201001_TB_STRINGS[25]);
        return 0;
    end
     if gf_JudgeRoomWeight(3, 100, "") == 0 then
        return 0;
    end
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(VET_201001_TASK_GET_HONGBAO_DATE) < nDate then
        SetTask(VET_201001_TASK_GET_HONGBAO_COUNT, 0);
    end
    if GetTask(VET_201001_TASK_GET_HONGBAO_COUNT) >= 2 then
        Talk(1, "", VET_201001_TB_STRINGS[12]..VET_201001_TB_STRINGS[26]);
        return 0;
    end
    if GetItemCount(VET_201001_TB_ITEMS[1][2], VET_201001_TB_ITEMS[1][3], VET_201001_TB_ITEMS[1][4]) < 20 then
        Talk(1, "", VET_201001_TB_STRINGS[12]..VET_201001_TB_STRINGS[27]);
        return 0;
    end
    if DelItem(VET_201001_TB_ITEMS[1][2], VET_201001_TB_ITEMS[1][3], VET_201001_TB_ITEMS[1][4], 20) == 1 then
        gf_AddItemEx2({VET_201001_TB_ITEMS[8][2], VET_201001_TB_ITEMS[8][3], VET_201001_TB_ITEMS[8][4], 1}, VET_201001_TB_ITEMS[8][1],
                VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[17], 24 * 3600, 1);
        SetTask(VET_201001_TASK_GET_HONGBAO_COUNT, GetTask(VET_201001_TASK_GET_HONGBAO_COUNT) + 1);
        SetTask(VET_201001_TASK_GET_HONGBAO_DATE, nDate);
    end
end

function GivePlayerItem()
    if gf_CheckEventDateEx(VET_201001_EVENT_NUMBER) == 0 then
        return 0;
    end
    --¸ø½õÄÒ´óÊÂ¼ş
    if GetItemCount(VET_201001_TB_ITEMS[2][2], VET_201001_TB_ITEMS[2][3], VET_201001_TB_ITEMS[2][4]) ~= 0 then
        return 0;
    end
    gf_AddItemEx2({VET_201001_TB_ITEMS[2][2], VET_201001_TB_ITEMS[2][3], VET_201001_TB_ITEMS[2][4], 1}, 
                    VET_201001_TB_ITEMS[2][1], VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[1], 0, 1);
end

--¸ø°ãÈôÊ÷½±Àø£¬nType=1Ğ¡£¬nType=2´ó
function VET_201001_GiveBanRuoShuAward(nType)
    --Íâ²¿ÒÑ¾­ÅĞ¶ÏÊ±¼ä
    gf_AddItemEx2({VET_201001_TB_ITEMS[1][2], VET_201001_TB_ITEMS[1][3], VET_201001_TB_ITEMS[1][4], 100},
                    VET_201001_TB_ITEMS[1][1], VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[10 + nType], 0, 1
    );
end

-- Íê³ÉÊ¦ÃÅÈÎÎñ¸ø½±Àø
function VET_201001_Give_Faction_Award()
    --Íâ²¿ÒÑ¾­ÅĞ¶ÏÊ±¼ä
    gf_EventFactionAward(
        {VET_201001_TB_ITEMS[1][2], VET_201001_TB_ITEMS[1][3], VET_201001_TB_ITEMS[1][4]},
        VET_201001_TB_ITEMS[1][1],
        VET_201001_TB_FACTION_FINISH_AWARD_NUM_LIST, 
        VET_201001_NUM_GET_FACTION_AWARD_MAX_COUNT, 
        VET_201001_TASK_FACTION_DATE, 
        VET_201001_TASK_FACTION_COUNT, 
        VET_201001_STR_LOG_TITLE
    );
end


--¶Ò»»¼«Æ·ôÕ×Ó
function exchange_jipinzongzi()
    if GetItemCount(VET_201001_TB_ITEMS[3][2], VET_201001_TB_ITEMS[3][3], VET_201001_TB_ITEMS[3][4]) < 2 or 
        GetItemCount(VET_201001_TB_ITEMS[4][2], VET_201001_TB_ITEMS[4][3], VET_201001_TB_ITEMS[4][4]) < 1 or
        GetItemCount(VET_201001_TB_ITEMS[5][2], VET_201001_TB_ITEMS[5][3], VET_201001_TB_ITEMS[5][4]) < 1 or 
        GetItemCount(VET_201001_TB_ITEMS[6][2], VET_201001_TB_ITEMS[6][3], VET_201001_TB_ITEMS[6][4]) < 1 then
        Talk(1, "", VET_201001_TB_STRINGS[9]);
        return 0;
    end
    if gf_JudgeRoomWeight(1, 100, "") == 0 then
        return 0;
    end
    if DelItem(VET_201001_TB_ITEMS[3][2], VET_201001_TB_ITEMS[3][3], VET_201001_TB_ITEMS[3][4], 2) == 1 and
        DelItem(VET_201001_TB_ITEMS[4][2], VET_201001_TB_ITEMS[4][3], VET_201001_TB_ITEMS[4][4], 1) == 1 and
        DelItem(VET_201001_TB_ITEMS[5][2], VET_201001_TB_ITEMS[5][3], VET_201001_TB_ITEMS[5][4], 1) == 1 and
        DelItem(VET_201001_TB_ITEMS[6][2], VET_201001_TB_ITEMS[6][3], VET_201001_TB_ITEMS[6][4], 1) == 1 then
        
        gf_AddItemEx2({VET_201001_TB_ITEMS[7][2], VET_201001_TB_ITEMS[7][3], VET_201001_TB_ITEMS[7][4], 1}, VET_201001_TB_ITEMS[7][1],
          VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[13], 0, 1);
          SelectSay()
    end    
end


