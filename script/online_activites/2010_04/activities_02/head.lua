Include("\\script\\online_activites\\task_values.lua");                        --ÈÎÎñ±äÁ¿Í·ÎÄ¼þ
Include("\\script\\online_activites\\2010_04\\activities_02\\strings.lua");    --»î¶¯×Ö·û´®
Include("\\script\\lib\\globalfunctions.lua");                                 --¹«¹²º¯ÊýÎÄ¼þ

DEBUG = 0;
VET_201004_02_EVENT_NUMBER = 6;                                                --ÔÚ»î¶¯±íÉÏµÄ±àºÅÊÇ6

function VET_201004_02_GivePlantSmallTreeAward()
	do return end
    if gf_CheckEventDateEx(5) == 1 then
        gf_AddItemEx2({2, 1, 30184, 50}, "Tói Nguyªn LiÖu","Hoat dong thang 4 nam 2010","PhÇn th­ëng trång c©y b¸t nh· nhá");
    end
    --±¾»î¶¯Ã»ÓÐÊ±¼äÏÞÖÆ
    --gf_EventGiveRandAward( VET_201004_02_TB_SMALLTREE_RAND_AWARD_LIST, 100, 1, VET_201004_02_STR_LOG_TITLE, VET_201004_02_TB_LOG_ACTION_LIST[2]);
end

function VET_201004_02_GivePlantBigTreeAward()
	do return end
    if gf_CheckEventDateEx(5) == 1 then
        gf_AddItemEx2({2, 1, 30184, 50}, "Tói Nguyªn LiÖu","Hoat dong thang 4 nam 2010","PhÇn th­ëng trång c©y b¸t nh· lín");
    end
    --±¾»î¶¯Ã»ÓÐÊ±¼äÏÞÖÆ
    --gf_EventGiveRandAward( VET_201004_02_TB_BIGTREE_RAND_AWARD_LIST, 100, 1, VET_201004_02_STR_LOG_TITLE, VET_201004_02_TB_LOG_ACTION_LIST[3]);
end