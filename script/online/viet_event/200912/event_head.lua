--=============================================
--create by baiyun 2009.11.17
--describe:Ô½ÄÏ°æ12ÔÂ·Ý»î¶¯ Í·ÎÄ¼þ
--=============================================
Include("\\script\\lib\\globalfunctions.lua");

VIET_0912_TASK_SHIMENG_DATE = 2080;			--Ê¦ÃÅÈÎÎñµÃµ½Ê¥µ®ÌÇ¹ûµÄÈÕÆÚ
VIET_0912_TASK_SHIMENG_NUM = 2089;			--Ê¦ÃÅÈÎÎñµÃµ½Ê¥µ®ÌÇ¹ûµÄÊýÁ¿
VIET_0912_TASK_XIANGCAODANGAO_COUNT = 1521;             --ÒÑ¾­Ê¹ÓÃµÄÏã²Ýµ°¸âµÄÊýÁ¿
VIET_0912_TASK_GET_NPC_AWARD_DATE = 1522;               --´ÓNPCÄÇÀï»ñµÃ½±ÀøµÄÈÕÆÚ
VIET_0912_TASK_USE_YANHUO_DATE = 1523;                  --Ê¹ÓÃÑÌ»ðµÄÈÕÆÚ
VIET_0912_TASK_USE_YANHUO_COUNT = 1524;                 --±¾ÌìÒÑ¾­Ê¹ÓÃÑÌ»ðµÄ´ÎÊý
VIET_0912_TASK_USE_YANHUO_TIME = 1525;                  --ÉÏ´ÎÊ¹ÓÃÑÌ»ðµÄÊ±¼äGetTime()
VIET_0912_TASK_USE_KAOROU_TIME = 1526;                  --Íæ¼ÒÉÏ´Îµã»÷¿¾ÈâµÄÊ±¼äGetTime()
VIET_0912_TASK_USE_KAOROU_DATE = 1527;                  --Íæ¼Òµ±Ç°µã»÷¿¾ÈâµÄÈÕÆÚ
VIET_0912_TASK_USE_KAOROU_COUNT = 1528;                 --Íæ¼Ò½ñÌìÒÑ¾­µã»÷¿¾ÈâµÄ´ÎÊý
VIET_0912_TASK_USE_SHENGDANLIHE_DATE = 1529;            --Íæ¼Òµã»÷Ê¥µ®ÀñºÐµÄÈÕÆÚ
VIET_0912_TASK_USE_SHENGDANLIHE_TIME = 1530;            --Íæ¼Òµã»÷Ê¥µ®ÀñºÐµÄÊ±¼äGetTime()
VIET_0912_TASK_USE_SHENGDANLIHE_COUNT = 1531;           --Íæ¼Ò½ñÌìµã»÷Ê¥µ®ÀñºÐµÄÊýÁ¿
VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME = 1532; --´¥·¢Æ÷´æÔÚµÄÊ±¼ä£¬¼ÇÂ¼ÔÚÍæ¼ÒÉíÉÏ£¬Ã¿´Î´¥·¢£¬´ËÊ±¼ä¼õ1£¬µ¥Î»ÊÇ·ÖÖÓ

VIET_0912_STR_EVENT_LOG_TITLE = "Hoat dong thang 12";
VIET_0912_NPC_NAME_1 = "<color=green>CÈm nang ®¹i sù kiÖn<color>";
VIET_0912_NPC_NAME_2 = "<color=green>Th«ng Gi¸ng Sinh v¹n niªn: <color>";
VIET_0912_NPC_NAME_3 = "<color=green>Ph¸o hoa: <color>";

VIET_0912_SHIMEN_AWARD_MAX_COUNT = 10;                  --Ã¿ÌìÊ¦ÃÅÈÎÎñ×î¶à»ñµÃ½±ÀøµÄ´ÎÊý
VIET_0912_XIANGCAODANGAO_MAX_COUNT = 1200;              --Ã¿½ÇÉ«×î¶àÊ¹ÓÃµÄÏã²Ýµ°¸âµÄÊýÁ¿
VIET_0912_YANHUO_MAX_COUNT = 20;                        --Ã¿Ìì×î¶àÊ¹ÓÃµÄÑÌ»ðµÄÊýÁ¿
VIET_0912_KAOROU_MAX_COUNT = 120;                       --Ã¿Ìì×î¶àµã»÷µÄ¿¾ÈâÊýÁ¿
VIET_0912_SHENGDANLIHE_MAX_COUNT = 15;                  --Ã¿Ìì×î¶àµã»÷Ê¥µ®ÀñºÐµÄÊýÁ¿

--Í¨¹ýÊ¦ÃÅÈÎÎñ»ñµÃµÄÊ¥µ®ÌÇ¹ûµÄÊýÁ¿
VIET_0912_SHIMEN_SHENGDANTANGGUO = {
	[1] = 30,
	[2] = 30,
	[3] = 30,
	[4] = 30,
	[5] = 30,
	[6] = 40,
	[7] = 50,
	[8] = 60,
	[9] = 70,
}

--Ïã²Ýµ°¸â½±ÀøÎïÆ·
--{ÀàÐÍ=1(ÎïÆ·), ¸ÅÂÊ, Ãû×Ö, {id1,id2,id3,count}, ´æÔÚÊ±¼ä(ÎÞÏÞÖÆÌî0)}
--{ÀàÐÍ=2(½ðÇ®), ¸ÅÂÊ, ÊýÁ¿£¨µ¥ÊÇÍ­£©}
--{ÀàÐÍ=3(ÉùÍû), ¸ÅÂÊ, ÊýÁ¿, 1=ÒªMsg2Player£¬0²»ÐèÒª}
--{ÀàÐÍ=4(Ê¦ÃÅ¹±Ï×¶È), ¸ÅÂÊ, ÊýÁ¿, Èç¹ûÍæ¼ÒÃ»ÈëÃÅÅÉÑ¡Ôñ´úÌæµÄË÷Òý, 1=ÒªMsg2Player£¬0±íÊ¾²»ÐèÒª}
--{ÀàÐÍ=5(¾­Ñé), ¸ÅÂÊ, ÊýÁ¿, 1=ÒªMsg2Player£¬0»ò²»Ìî±íÊ¾²»Ðè}
--{ÀàÐÍ=6(×Ô¶¨ÒåÃüÁî), ¸ÅÂÊ, "×Ô¶¨µÄÃüÁî£¨ÐèÒªdostringµÄ´úÂë£©", "×Ô¶¨ÒåµÄMsg2Player£¬Èç¹û²»Ìî±íÊ¾²»ÐèÒª"}
--1000000
VIET_0912_XIANGCAODANGAO_AWARD = {
		{1, 4, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
		{1, 4, "Thiªn th¹ch", {2, 2, 8, 1}, 0},
		{1, 5, "M¶nh B¨ng th¹ch", {2, 1, 148, 1},  0},
		{1, 5, "B¨ng th¹ch", {2, 1, 149, 1}, 0},
		{1, 3, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 15 * 24 * 3600},
		{1, 1, "ThÕ Th©n Phï", {2, 0, 556, 1}, 15 * 24 * 3600},
		{3, 28, 1, 1},
		{4, 27, 1, 1},
		{1, 2, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 15 * 24 * 3600},
		{1, 2, "XÝch ThiÕt Tinh", {2, 1, 2652, 1}, 0},		
		{1, 4, "L­u Tinh lÖ", {2, 1, 2000, 1}, 0},
		{1, 4, "Ngäc Tóy", {2, 1, 2001, 1}, 0},
		{1, 9, "Lé Thñy", {2, 0, 351, 1}, 0},
		{1, 2, "NguyÖt Hoa", {2, 1, 2002, 1}, 0},
};

VIET_0912_XIANGCAODANGAO_AWARD_50 = {
		{1, 25, "§ång TiÒn Vµng", {2, 1, 30094, 1}, 0},
		{1, 5, "R­¬ng BÝ KÝp", {2, 1, 30093, 1}, 15 * 24 * 3600},
		{1, 10,"Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 15 * 24 * 3600},
		{1, 5, "Tø Linh Thiªn ý Phæ", {0, 107, 160, 1}, 0},
		{1, 5, "Tø Linh Tö ý Phæ", {0, 107, 161, 1}, 0},
		{1, 5, "Tø Linh ChiÕn ý Phæ", {0, 107, 159, 1}, 0},
		{1, 15, "Bµn Long bÝch", {2, 1, 1000, 1}, 15 * 24 * 3600},
		{1, 10, "Tö Quang Bµi", {2, 0, 762, 1}, 15 * 24 * 3600},
		{1, 5, "TÈy Tñy §¬n", {2, 0, 136, 1}, 15 * 24 * 3600},
		{1, 5, "V« NgÊn Thñy", {2, 1, 503, 1}, 15 * 24 * 3600},
		{1, 10, "§Êu Hån", {2, 1, 1157, 1}, 15 * 24 * 3600},
}

VIET_0912_XIANGCAODANGAO_AWARD_FULL = {
		{1, 7, "B¶o R­¬ng §Æc BiÖt", {2, 1, 30091, 1}, 15*3600*24},
		{1, 5468, "R­¬ng TrÊn Ph¸i", {2, 1, 30113, 1}, 15*3600*24},
		{1, 250, "TÈy Tñy Linh §¬n", {2, 0, 137, 1}, 15*3600*24},
		{1, 100, "B¸t B¶o TÈy Tñy §¬n", {2, 0, 138, 1}, 15*3600*24},
		{1, 250, "R­¬ng YÕu QuyÕt_Cao cÊp", {2, 1, 30112, 1}, 15*3600*24},
		{1, 100, "Thiªn C¬ Toµn", {2, 1, 1176, 1}, 15*3600*24},
		{1, 100, "N÷ Oa Tinh Th¹ch", {2, 1, 504, 1}, 15*3600*24},
		{1, 100, "Thiªn Th¹ch Linh Th¹ch", {2, 1, 1068, 1}, 15*3600*24},
		{1, 1500, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},
		{1, 100, "Cöu Thiªn V« Cùc §¬n", {2, 1, 1006, 1}, 15*3600*24},
		{1, 25, "L¨ng Ba Vi Bé", {0, 112, 78, 1}, 0},
		{1, 200, "Tø Linh ChiÕn ý phæ", {0, 107, 162, 1}, 0},
		{1, 100, "Tö Quang ThÇn Th¹ch", {2, 1, 30131, 1}, 0},
		{1, 100, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 15*3600*24},
		{1, 100, "Phi Yªn Th¹ch", {2, 1, 30130, 1}, 0},
		{1, 1500, "NguyÖt Hoa Chi Tinh", {2, 1, 3219, 1}, 0},		
}

--ÔùËÍ¸øNPC20¸öÏã²Ýµ°¸âÒÔºó»ñµÃµÄ½±Àø
VIET_0912_NPC_AWARD = {		
		{1, 100, "§¹i Nh©n S©m", {2, 0, 553, 1}, 15 * 24 * 3600},
		{1, 30, "§Êu hån", {2, 1, 1157, 1}, 15 * 24 * 3600},
		{1, 30, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},
		{1, 30, "MÆt n¹ S¸t Thñ §­êng", {2, 1, 1087, 1}, 15 * 24 * 3600},
		{1, 30, "Tø Linh Thiªn ý Phæ", {0, 107, 160, 1}, 0},
		{1, 30, "Tø Linh Tö ý Phæ", {0, 107, 161, 1}, 0},
		{1, 30, "Tø Linh ChiÕn ý Phæ", {0, 107, 159, 1}, 0},
		{2, 320, 600000},
		{1, 10, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 15 * 24 * 3600},
		{1, 40, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 15 * 24 * 3600},
		{1, 20, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 15 * 24 * 3600},
		{1, 100, "Th¸i H­ §a MËt Qu¶", {2, 1, 387, 1}, 15 * 24 * 3600},
		{1, 20, "TÈy Tñy ®¬n", {2, 0, 136, 1}, 15 * 24 * 3600},
		{1, 15, "Bé C¶nh", {0, 105, 13, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 15, "Hèt L«i B¸c", {0, 105, 12, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 15, "XÝch Thè", {0, 105, 9, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 15, "Tr¶o Hoµng Phi DiÖn", {0, 105, 11, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 75, "S­ M«n LÖnh Th­", {2, 1, 1016, 1}, 15 * 24 * 3600},
		{1, 75, "S­ M«n T×nh NguyÖn Th­", {2, 1, 1019, 1}, 15 * 24 * 3600},		
};

--ÓñÍÃÏä¡¢¼¦½Å¡¢Ñ¼ÍÈ¡¢ÑòÈâµÄ½±Àø
VIET_0912_YUTUXIAO_AWARD = {
		{1, 5000, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
		{1, 5033, "Thiªn th¹ch", {2, 2, 8, 1}, 0},
		{1, 1400, "B¨ng th¹ch", {2, 1, 149, 1}, 0},
		{1, 100, "TÈy Tñy linh ®¬n", {2, 0, 137, 1}, 15 * 24 * 3600},
		{1, 500, "R­¬ng BÝ KÝp", {2, 1, 30093, 1}, 30 * 24 * 3600},
		{1, 100, "Siªu Quang", {0, 105, 19, 1, 1, -1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 500, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
		{1, 2000, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 15 * 24 * 3600},
		{1, 10, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 15 * 24 * 3600},
		{1, 60, "R­¬ng TrÊn Ph¸i", {2, 1, 30113, 1}, 30 * 24 * 3600},
		{1, 40, "ThÇn hµnh b¶o ®iÓn", {0, 200, 40, 1}, 30 * 24 * 3600},
		{1, 120, "Tö Quang Bµi", {2, 0, 762, 1}, 15 * 24 * 3600},
		{1, 15137, "C¬m chiªn trøng", {1, 1, 14, 1}, 0},
		{1, 14000, "B¸nh Bét vµng", {1, 1, 15, 1}, 15 * 24 * 3600},
		{1, 14000, "L¹c Mai", {1, 1, 16, 1}, 0},
		{1, 14000, "Minh NguyÖt D¹", {1, 1, 17, 1}, 0},
		{1, 14000, "Méc Lan Xu©n", {1, 1, 18, 1}, 0},
		{1, 14000, "T©y B¾c Väng", {1, 1, 19, 1}, 0},
};

--ÔùËÍ¸øNPC20¸öÏã²Ýµ°¸âÒÔºó»ñµÃ½±Àø
function give_xiangcaodangao_get_award()
    local nDate = tonumber(date("%d"));
    local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
    if GetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),1) ~= nDate then
        SetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE, SetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),1,nDate))
        SetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE, SetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),2,0))        
    end
    local nTaskVal = GetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),2)
    if nTaskVal >= 3 then
    		Talk(1, "", VIET_0912_NPC_NAME_2.."H«m nay ®¹i hiÖp ®· ­íc 3 lÇn råi, mai h·y tiÕp tôc!");
        	return 0;
    end    
    if GetItemCount(2, 1, 30124) < 10 then
        Talk(1, "", VIET_0912_NPC_NAME_2.."Kh«ng ®ñ 10 b¸nh kÐm Vani ®Ó thùc hiÖn ®iÒu ­íc!");
        return 0;
    end
    if gf_Judge_Room_Weight(2, 50, VIET_0912_NPC_NAME_2) == 0 then
        return 0;
    end
    if DelItem(2, 1, 30124, 10) == 1 then
        SetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE, SetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE), 2, nTaskVal + 1))        
        gf_EventGiveRandAward(VIET_0912_NPC_AWARD, 1000, 1, szFullLogTitle, "TÆng B¸nh Kem Vani");--¸ø½±Àø
        gf_EventGiveCustomAward(1, 1500000, 1,"TÆng B¸nh Kem Vani")--¸ø¾­Ñé
    end
end