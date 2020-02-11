--=============================================
--create by baiyun 2010.1.7
--describe:Ô½ÄÏ°æÍê³ÉÊ¦ÃÅÈÎÎñ¸ø½±Àø Í·ÎÄ¼ş
--related files: °ÑÃ¿¸ö»î¶¯¹ıÊ¦ÃÅÈÎÎñ¡¢²Ø½£µÈµÃµ½½±Àø
--               µÄ´úÂë¶¼°üº¬ÔÚ´Ë´¦
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\task\\happiness_bag\\happiness_bag.lua"); 
Include("\\script\\online_activites\\silingmount\\silingmount.lua")		--ËÄÁé×øÆï
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua")			--IpBonus
Include("\\script\\online_activites\\shimen_tier4\\tier4.lua")			--Ê¦ÃÅ4Ì××°±¸·¢·Å
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online_activites\\2011_08\\activity_03\\lamp_head.lua")
Include("\\script\\online_activites\\treasure_box\\head.lua") --²Æ¸»±¦Ïä
Include("\\script\\online_activites\\2011_11\\activity_02\\init.lua")--201112Ê¥µ®½Ú»î¶¯
Include("\\script\\online_activites\\2011_12\\chunjie\\init.lua") --2012´º½Ú»î¶¯
Include("\\script\\online_activites\\201201\\qingrenjie\\init.lua") --2012Äê2ÔÂÇéÈË½Ú»î¶¯
Include("\\script\\online_activites\\201202\\guojifunvjie\\init.lua")--2012Äê2ÔÂ¹ú¼Ê¸¾Å®½Ú
Include("\\script\\online_activites\\2014_01\\spring1.lua") 
Include("\\script\\online_activites\\2014_01\\valentine.lua")
Include("\\script\\online_activites\\2014_01\\spring2.lua") 
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")
Include("\\script\\online_activites\\2014_03\\task_camp.lua")
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

--¹ıÊ¦ÃÅÈÎÎñ¸ø½±Àø
function Give_Faction_Award()

end
--¹ı²Ø½£¸ø½±Àø
function Give_CangJian_Award(nStage, GS_RECORD_CHANCE)                         
end
--Ì«ĞéÀïÃæ´òËÀÒ»¸ö¹Ö¸ø½±Àø
function Give_TaiXu_KillMonster_Award(szMonsterName)                           

end
--Í¨¹ıÌ«ĞéµÚ8¹Ø¸ø½±Àø
function Give_PassTaiXu_Award()                                                
	SetTask(VET_201009_00_TASK_TONGGUAN_TAIXU,1)
end

--Íê³É¸öÈËÈÕ³£ÈÎÎñ¸øµÄ½±Àø
function Give_Daily_Personal_Task_Award(bBonus)
	--ËÄÁé×øÆï ³¤ÆÚ
	VET_SilingMountDailyPersonalTaskAward(); 
	VET_IpBonusDailyPersonalTaskAward();
	VET_Tier4DailyPersonalTaskAward(bBonus);
	--²Æ¸»±¦Ïä
	get_award_woodenbox()
end

--Íê³ÉÍÅ¶ÓÈÕ³£ÈÎÎñ¸øµÄ½±Àø
function Give_Daily_Team_Task_Award(bBonus)
	--ËÄÁé×øÆï ³¤ÆÚ
	VET_SilingMountDailyTeamTaskAward(); 
	VET_IpBonusDailyTeamTaskAward();
	VET_Tier4DailyTeamTaskAward(bBonus);
	--²Æ¸»±¦Ïä
	get_award_woodenbox()
end
--ÖÖĞ¡°ãÈôÊ÷½±Àø
function Give_XiaoBanRuoShu_Award()                                           
	HBRewardInSmallWisdomTree();
	--VET_IpBonusSeedAward();
	--11Äê6ÔÂ»î¶¯ºóÍ³Ò»´¦Àí
	vaf_award_api("tPlantSmallTreePrize")
	--¹Ò»¨µÆ-Ğ¡Ê÷
	vaf_20110803_small_tree()
end
--ÖÖ´ó°ãÈôÊ÷½±Àø
function Give_DaBanRuoShu_Award()                                              
	HBRewardInBigWisdomTree();
	--VET_IpBonusSeedAward();
	--11Äê6ÔÂ»î¶¯ºóÍ³Ò»´¦Àí
	vaf_award_api("tPlantBigTreePrize")
	--¹Ò»¨µÆ-Ğ¡Ê÷
	vaf_20110803_big_tree()													
end
--ÖÖÖÖ×Ó30086
function Give_Zhongzi_Award()                                              
	HBRewardInPlantingTreeSeeds();
	--VET_IpBonusSeedAward();
	vaf_award_api("tPlantSeedTree")
end
--´ò¿ªÖÖ×Ó°ü¸ø½±Àø£¨×¢Òâ±³°ü¿Õ¼ä£©
function Give_seedbag_Award()                              
	vaf_award_api("tOpenSeedBagPrize")
end

function give_tuoguan_activity_award()
end
--ÉÌ»áÈÎÎñ
function Give_Business_Award()                                              
	VET_IpBonusBusinessAward();
end
--ÖÖÖÖ×Ó30075
function Give_Zhongzi2_Award()                                              
	--VET_IpBonusSeedAward();
	vaf_award_api("tPlantSeedTree")
end
--ÁºÉ½¹Ø¿¨-É±boss
function vaf_liangshan_boss_down()
	--2011Äê8ÔÂ¹ÒµÆ»î¶¯
	vaf_liangshan_boss_down_20110803()
	--²Æ¸»±¦Ïä
	--get_award_woodenbox()
	--»î¶¯ÁºÉ½É±boss»ñµÃµÀ¾ß
	vaf_award_api("tLiangShanKillBoss")
end
--ÁºÉ½¹Ø¿¨-Ã¿ÈÕÈÎÎñ
function vaf_liangshan_daily_task()
	--2011Äê8ÔÂ¹ÒµÆ»î¶¯
	vaf_liangshan_daily_task_20110803()
	--²Æ¸»±¦Ïä
	get_award_woodenbox()
	--2011Äê12ÔÂÊ¥µ®½Ú»î¶¯
	get_award_liangshan()
	--2012´º½Ú»î¶¯
	get_award_liangshan_chunjie()
	--2012Äê2ÔÂÇéÈË½Ú»î¶¯
	get_award_liangshan_qingrenjie()
	--2012Äê3ÔÂ¹ú¼Ê¸¾Å®½Ú»î¶¯
	get_award_liangshan_funvjie()
	--»î¶¯ÁºÉ½Ã¿ÈÕÈÎÎñ»ñµÃµÀ¾ß
	vaf_award_api("tLiangShanDailyTask")
end
--ÁºÉ½¹Ø¿¨-¿ªÆô¾ÛÒå±¦Ïä
function vaf_liangshan_juyibox()
	--201112Ê¥µ®½Ú»î¶¯
	get_award_juyibox()
	--2012´º½Ú»î¶¯
	get_award_juyibox_chunjie()
	--2012Äê2ÔÂÇéÈË½Ú»î¶¯
	get_award_juyibox_qingrenjie()
	--2012Äê3ÔÂ¹ú¼Ê¸¾Å®½Ú»î¶¯
	get_award_juyibox_funvjie()

end
--TODO add ÌìÃÅÕó-ËÎÁÉ×ÊÔ´Õù¶áÕ½ function ½Ó¿Ú
--²Î¼ÓÒ»³¡ÌìÃÅÕó
function extra_tianmenzhen_award(nType)
	--²Æ¸»±¦Ïä
	--get_award_woodenbox()
	--201112Ê¥µ®½Ú»î¶¯
	get_award_tianmenzhen(nType)
	--2012´º½Ú»î¶¯
	get_award_tianmenzhen_chunjie(nType)
	--2012Äê2ÔÂÇéÈË½Ú»î¶¯
	get_award_tianmenzhen_qingrenjie(nType)
	--2012Äê3ÔÂ¹ú¼Ê¸¾Å®½Ú»î¶¯
	get_award_tianmenzhen_funvjie(nType)
	--ÌìÃÅÕó»ñµÃ»î¶¯µÀ¾ß
	vaf_TianMenZhen_Award_Api(nType)
end
--TODO add Íò½£Ú£¹ı¹Ø½±Àø
function extra_wjz_award()
	vaf_award_api("tWanJianZhong")
end
--TODO add Í¨Ìì»Ã¾³¹ı¹Ø½±Àø
function extra_ttd_award()
	vaf_award_api("tTongTianHuanJing")
end

--µØĞş¹¬¿ªÆô¾«Ó¢±¦Ïä
function open_dxg_tyjyx_award()
	--vaf_dxg_open_jyx();
end

--µØĞş¹¬¿ªÆôÌìÒõÊ¥ÎïÏä
function open_dxg_tyswx_award()
	--vaf_dxg_open_swx();
end

--É±Ò°Íâ¹ÖÎïÓĞ¸ÅÂÊµôÂä»î¶¯µÀ¾ß
function trigger_killnpc_drop()
	vaf_kill_npc_drop();
end

--2014´º½Ú¸±»î¶¯2É±Ò°Öí
function trigger_killnpc_wildpig(sName)
	Vet_201401_Kill_WildPig(sName);
end

--2014´º½Ú¸±»î¶¯3É±»ÒÍÃºÍÒ°ÍÃ
function trigger_killnpc_tuzi(sName)
	Vet_201401_Valentine_Trigger(sName);
end

--2014´º½Ú¸±»î¶¯4É±Ò°Öí
function trigger_killnpc_wildpig2(sName)
	Vet_201401_sprint2_trigger(sName);
end

--»î¶¯É±¹ÖÍ¨ÓÃ½Ó¿Ú
function trigger_killnpc_common(sName)
	WN_201403_KillNpc(sName)
	WN_201403_CampTask_Killer(sName)
	g_akct_KillTrigger(sName)
end

--131»ñµÃÁ«×ÓÌğÆ·
function vaf_get_prize_daily_reset()
	if gf_CheckEventDateEx(131) ~= 1 then
		return 0;
	end
	local tb = TaskManager:Create(5,10)
	tb:SetTask(10, 0);
end

function vaf_get_prize_item_30709(nRand, nNum)
	if gf_CheckEventDateEx(131) ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	local tb = TaskManager:Create(5,10)
	if tb:GetTask(10) >= 30 then
		return 0;
	end
	if random(100) <= nRand then
		tb:SetTask(10, tb:GetTask(10) + nNum);
		gf_AddItemEx2({2,1,30709,nNum}, "ChÌ H¹t Sen", "Ho¹t ®éng th¸ng 8", "NhËn ®­îc ChÌ H¹t Sen", 0, 1)
	end
end