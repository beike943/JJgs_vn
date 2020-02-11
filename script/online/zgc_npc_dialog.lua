------------------------------------------------------------------
--´å³¤Ëµ£º×öÓÎÏ·¾ÍÏñ×ö°®£¬Èç¹ûÄã²»ÓÃĞÄ£¬-------
--µ½×îºó²»Ë¬µÄÖ»»áÊÇ×Ô¼º¡£--2006-12-04
--                    ¡ï
--              ¡î¨¨¡î   
--          ¡î¨¨€¨€¨¡ï
--      ¡ï¨¨€¨€¨€¨€¨¡î
--  ¡î¨¨€¨€¨€¨€¨€¨€¨¡ï
--                   ¨€
------------------------------------------------------------------
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
Include("\\script\\lib\\writelog.lua");

Include("\\script\\online\\newyear08\\newyear08_head.lua");--07Ê¥µ®»î¶¯

--2010ÄêÔ½ÄÏÊ¥µ®Ôö¼ÓÂòÍâ×°¶Ô»°£¬ÓĞÊ±Ğ§µ½20100109
Include("\\script\\online_activites\\2010_12\\activites_02\\head.lua");

--======================================================°ï»áÊı¾İ·â×°=================================================================================
--º¯ÊıÃû³Æ£º°ï»áÊı¾İget
--¹¦        ÄÜ£º°´Î»È¡µÃ°ï»áÊı¾İ
File_name = "\\script\\online\\zgc_npc_dialog.lua"
function Zgc_pub_getconftask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGetConfTask")
end
function CallBackGetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	if conf_data[id] == nil then
		conf_data[id] = 0 
	end
	local return_fun = "ConfDataGetReturn_"..fun_id.."("..conf_data[id]..")"
	dostring(return_fun)
end
--º¯ÊıÃû³Æ£º°ï»áÊı¾İget
--¹¦        ÄÜ£º°´Î»ÉèÖÃ°ï»áÊı¾İ
function Zgc_pub_setconftask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackSetConfTask")
end
function CallBackSetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = ""
	suit_id = tostring(floor(id/10) + 1)			--¼ÆËã´óÎ»ÖÃ
													--È¡Öµ]
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if conf_data[i] == nil then
			conf_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	conf_data[save_id] = value
	local rtn_flag = AddRelayShareData(GetTongName(),0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9])
	local return_fun = "ConfDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--=========================================================Ö÷º¯Êı====================================================================================
function main() 
        --by xiongyizhi Ê¥µ®ÂòÍâ×°¶Ô»°
        if gf_CheckEventDateEx(VET_201012_02_EVENT_NUMBER) == 1 then
            VET_Buy_Xmas_Clothes()
            return 0;
        end

	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	-----------------Ê¥µ®ÈÎÎñ³õÊ¼»¯
	if GetTask(960) ~= 1226 then			--Êı¾İ³õÊ¼»¯
		for j = 961,975 do
			SetTask(j,0)
		end
		SetTask(968,3456)					--½±Àø×é³É
		SetTask(960,1226)					--»î¶¯±êÖ¾
	end
	-------------------½áÊø
	-------------------NPCË÷Òı±£´æ
	SetTaskTemp(164,npc_index)
	-------------------½áÊø


	local npc_name = GetNpcName(npc_index)
	local i = 1
	for i = 1, getn(Npc_Dialog_Table) do
		if npc_name == Npc_Dialog_Table[i][1] then
			if getn(Npc_Dialog_Table[i]) == 2 then
				dostring(Npc_Dialog_Table[i][2])
			end
		end
	end
	local Xmas_tree_diff = GetUnitCurStates(npc_index,0)
	if Xmas_tree_diff == 1 then
		Xmas_Tree_A()
	elseif Xmas_tree_diff == 2 then
		conf_Xmas_tree(npc_index)
	end
end
--=============================================================½ÇÉ«É¾³ı¹¦ÄÜ=====================================================================================
function actor_deldialog()
	do return end
	Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: ThÕ giíi giang hå còng cã ng­êi muèn tung hoµnh, l¹i còng cã ng­êi muèn Èn c­,"..Zgc_pub_sex_name()..", cã lÏ còng hiÓu ®­îc ®iÒu nµy?",
	2,
	"§óng vËy, ta ch¸n c¶nh b«n ba nµy råi!/actor_del_con_chk",
	"ChØ lµ nh©n tiÖn ghĞ qua th«i!/end_dialog")
end
function actor_del_con_chk()
	if IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() == 3 then
		local conf_att = ""
		if IsTongMember() == 1 then
			conf_att = "Bang chñ"
		elseif IsTongMember() == 2 then
			conf_att = "Phã bang"
		else
			conf_att = "Tr­ëng l·o"
		end
		Talk(1,"end_dialog","Ng­¬i thËt sù ®­îc bang chóng ng­ìng mé"..conf_att..", chuyÖn ®¹i sù nh­ thÕ nµy sao kh«ng cïng bang chóng th­¬ng l­îng. §i héi ı bang chóng råi h·y quay l¹i.")
		return
	elseif (GetYinPiao(1) + GetYinPiao(2) + GetItemCount(2,1,198)) ~= 0 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: VŞ "..Zgc_pub_sex_name().." ®em nhiÒu ng©n l­îng nh­ thÕ nµy (<color=red>Ng©n phiÕu lín, Ng©n phiÕu nhá, b¹c lÎ<color>), lÏ nµo kh«ng dïng sao?",
		2,
		"Ta ®· cã quyÕt ®Şnh råi/#actor_del_dem_1(3)",
		"Ta muèn suy nghÜ l¹i/end_dialog"
		)
	elseif (GetTime() - GetCreateTime()) < 604800 and GetLevel() < 30  then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Anh hïng nh­ ng­¬i l¹i mau thèi chİ vËy sao? Cè g¾ng lªn nµo!",
		2,
		"Ta ®· cã quyÕt ®Şnh råi/#actor_del_dem_1(1)",
		"Ta muèn suy nghÜ l¹i/end_dialog")
	elseif GetReputation() >= 3000 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Ng­¬i, mét anh hïng hiÓn h¸ch nh­ vËy ch¼ng lÏ l¹i thèi chİ råi ­?",
		2,
		"Ta ®· cã quyÕt ®Şnh råi/#actor_del_dem_1(3)",
		"Ta muèn suy nghÜ l¹i/end_dialog")
	elseif GetTask(336) >= 4000 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: VŞ cao thñ nµy ®· cèng hiÕn nhiÒu cho quı m«n ph¸i b©y giê rêi khái kh«ng thÊy tiÕc nuèi g× sao?",
		2,
		"Ta ®· cã quyÕt ®Şnh råi/#actor_del_dem_1(3)",
		"Ta muèn suy nghÜ l¹i/end_dialog")		
	elseif (GetTime() - GetCreateTime()) >= 604800 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Nh÷ng th¸ng ngµy vui buån hµnh tÈu giang hå ch¼ng lÏ còng ch¼ng ®Ó l¹i mét Ên t­îng nµo khiÕn ng­¬i ph¶i l­u luyÕn sao?",
		2,
		"Ta ®· cã quyÕt ®Şnh råi/#actor_del_dem_1(2)",
		"Ta muèn suy nghÜ l¹i/end_dialog")
	elseif GetLevel() >= 30 then 
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: Ng­¬i quyÕt ®Şnh nh­ vËy kh«ng c¶m thÊy hèi hËn µ?",
		2,
		"Ta ®· cã quyÕt ®Şnh råi/#actor_del_dem_1(2)",
		"Ta muèn suy nghÜ l¹i/end_dialog")
	end
end
function actor_del_dem_1(actor_flag)
	local actor_dialog = {
		"B¹n ®ång ı xãa nh©n vËt nµy?",
		"Nh©n vËt cña b¹n ®­îc b¶o l­u 7 ngµy (168 giê ). B¹n x¸c nhËn xãa nh©n vËt nµy chø?",
		"Nh©n vËt cña b¹n ®­îc b¶o l­u 7 ngµy (168 giê ). B¹n x¸c nhËn xãa nh©n vËt nµy chø?"
	}
	Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: "..actor_dialog[actor_flag],
		2,
		"§ång ı xãa/#actor_del_dem_2("..actor_flag..")",
		"Ta muèn suy nghÜ l¹i/end_dialog"
	)	
end
function actor_del_dem_2(actor_flag)
	local actor_dialog = {
		"ThËt ®¸ng tiÕc, thÕ giíi giang hå l¹i mÊt ®i mét ng­êi!",
		"Giang hå l¹i mÊt ®i mét vŞ cao thñ, nh­ng néi trong 7 ngµy b»ng h÷u quay l¹i vÉn cßn kŞp!",
		"Ng­¬i rêi khái thÕ giíi giang hå c¸c huynh ®Ö tû muéi ®Òu tiÕc nuèi, nÕu muèn quay l¹i néi trong 7 ngµy vÉn cßn kŞp."
	}
	actor_del(actor_flag)
	Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: "..actor_dialog[actor_flag])
end
function actor_del(del_flag)
	if del_flag == 1 then
		--Ìí¼ÓÉ¾³ı½ÇÉ«´°¿Ú
		EnableDeleteWaitFlag(1)
		EnableDeleteImmedFlag(1)
		ExitGame()		--t
		WriteLog(GetName().."Xãa tr¾ng.")
	else
		--Ôö¼ÓÉ¾³ı½ÇÉ«±êÖ¾
		EnableDeleteWaitFlag(1)
		ExitGame()  --t
		WriteLog(GetName().."L­u vµo danh s¸ch xãa.")
	end
	return
end
--========================================================Ê¥µ®»î¶¯==================================================================================
--------------------------------------------------------------Ö÷¶Ô»°------------------------------------------------------
function Xmas_bishop_dialog()
	if zgc_pub_day_turn(1) >= Xmas_start_day and zgc_pub_day_turn(1) <= Xmas_end_day and IsTongMaster() ~= 1 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi¸ng sinh vui vÎ!!",
		3,
		"nhËn quµ Gi¸ng sinh/get_Xmas_goods",
		"T×m hiÓu ho¹t ®éng Gi¸ng sinh/about_Xmas_feast",
		"KÕt thóc ®èi tho¹i/end_dialog"
		)
		return
	elseif zgc_pub_day_turn(1) >= Xmas_start_day and zgc_pub_day_turn(1) <= Xmas_end_day and IsTongMaster() == 1 then
		conf_Xmas_tree_dialog()
	else
		if get_chrims_state() == 1 then --07ÄêÊ¥µ®»î¶¯
			local strtab = {
				"Ta muèn nhËn Th«ng gi¸ng sinh/get_chrims_tree",
				"ThuyÕt minh ho¹t ®éng Gi¸ng Sinh Nguyªn §¸n/about_chrims_detail",
				"Th«i, ta kh«ng cÇn/nothing"
				};
			Say("<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>Gi¸ng sinh l¹i ®Õn, ta phông mÖnh th­îng ®Õ chuÈn bŞ c©y Gi¸ng sinh n¨m nay, b¹n cã muèn nhËn kh«ng? L­u ı, trong thêi gian tõ <color=yellow>22/12/2008 ®Õn 23h 4/1/2009<color>, tõ 1h s¸ng ®Õn 23h mçi ngµy cã thÓ ®Õn chç ta ®Ó nhËn c©y Gi¸ng sinh, nh­ng mçi ngµy chØ cã thÓ nhËn 1 c©y th«i. <color=yellow>Ng­êi ch¬i cÊp 99, lÇn ®Çu tiªn nhËn c©y Gi¸ng sinh, cã thÓ nhËn ®­îc thªm 1 c©y.<color>",
				getn(strtab),
				strtab);
		else
			Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Trêi phï hé cho ng­¬i!",
				1,
				"KÕt thóc ®èi tho¹i/end_dialog")
		end
	end
end
--****************************************¸öÈËÊ¥µ®Ê÷********************************
-------------------------------------------------------------»î¶¯ÎïÆ·Ìí¼Ó----------------------------------------------
function get_Xmas_goods()
	if Zgc_pub_action_level_chk() ==0 then
		return
	end
	local get_turn = GetTask(961)
	if get_turn >= zgc_pub_day_turn(1) then
		Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Xin lçi, h«m nay ng­¬i ®· nhËn råi. Ngµy mai l¹i ®Õn nhĞ!")
		return
	else
		if Zgc_pub_goods_add_chk(getn(Xmas_goods),10) == 1 then
			local i = 0
			for i = 1, getn(Xmas_goods) do
				local add_flag = AddItem(Xmas_goods[i][1],Xmas_goods[i][2],Xmas_goods[i][3],Xmas_goods[i][4])
				if add_flag ==  1 then
					Msg2Player("B¹n nhËn ®­îc "..Xmas_goods[i][4]..Xmas_goods[i][5]..Xmas_goods[i][6].."!")
				else
					WriteLog ("Ng­êi ch¬i:"..GetName().."T¨ng"..Xmas_goods[i][6].." thÊt b¹i, trŞ quay vÒ:"..add_flag..".")
				end
			end
			SetTask(961,zgc_pub_day_turn(1))
			Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Xin nhËn quµ, chóc mäi sù tèt lµnh!")
		else
			return
		end
	end
end
-------------------------------------------------------------Ê¥µ®»î¶¯½âÊÍ----------------------------------------------
function about_Xmas_feast()
	Talk(3,"#about_Xmas_feast_1(1)",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi¸ng sinh_ Chóc mäi ng­êi an b×nh vui vÎ!",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Ng­¬i mçi ngµy ®Õn chç ta nhËn mét <color=yellow>C©y Gi¸ng sinh tËp thÓ<color> vµ 3 <color=yellow>VËt phÈm trang trİ <color>. Th«ng qua viÖc trång <color=yellow>C©y Gi¸ng sinh<color> vµ <color=yellow>trang trİ c©y Gi¸ng <color> ®Ó nhËn phÇn th­ëng!",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Th«ng qua lµm c¸c nhiÖm vô: Th­¬ng héi, S¸t Thñ, ChiÕn tr­êng, s­ m«n cã thÓ nhËn ®­îc <color=yellow>C©y Gi¸ng sinh kiÒu diÔm<color>, <color=yellow>C©y Gi¸ng sinh léng lÉy<color> vµ <color=yellow>VËt phÈm trang trİ<color>. C¸ch trång 2 c©y nµy còng gièng nh­ c¸ch trång cña <color=yellow>C©y Gi¸ng sinh tËp thÓ<color>. Nh­ng nhí r»ng nÕu trang trİ nhiÒu qu¸ sÏ lµm cho c©y <color=red>ng·<color> vµ nh­ thÕ sÏ kh«ng cã phÇn th­ëng."
	)
end
function about_Xmas_feast_1()
	Talk(2,"end_dialog",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Mçi ngµy bang chñ cã thÓ nhËn <color=yellow>C©y Gi¸ng sinh bang héi<color>, <color=yellow>C©y Gi¸ng sinh tËp thÓ<color>, <color=yellow>C©y Gi¸ng sinh kiÒu diÔm<color> hoÆc <color=yellow>C©y Gi¸ng sinh léng lÉy<color> vµ <color=yellow>VËt phÈm trang trİ<color> t­¬ng øng.",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Trong thêi gian diÔn ra ho¹t ®éng, mçi ngµy tõ <color=red>21:00<color> ®Õn <color=red>21:30<color> t¹i 3 thµnh thŞ chİnh bang chñ cã thÓ trång <color=yellow>C©y Gi¸ng sinh <color>, ®ång thêi mçi thµnh viªn trong bang héi dïng <color=red>khinh c«ng<color> ®Ó treo <color=yellow>vËt phÈm trang trİ<color>. Bang chñ t­íi <color=red>Lé Thñy<color>®Ó <color=yellow>C©y Gi¸ng sinh<color> mau t¨ng cÊp. Khi <color=yellow>C©y Gi¸ng sinh <color> tr­ëng thµnh sÏ nhËn ®­îc v« sè quµ!"
	)
end
-------------------------------------------------------------Ê¥µ®Ê÷µÄ¶Ô»°----------------------------------------------
function Xmas_Tree_A()
	local Xmas_tree_index = GetTargetNpc()
	--ÅĞ¶ÏÊÇ·ñÊÇ¸ÃÍæ¼ÒµÄÊ÷--
		local index_save = GetTask(963)
		if Xmas_tree_name_chk(Xmas_tree_index) ~= 1 then
			Msg2Player("§©y kh«ng ph¶i c©y Gi¸ng sinh cña b¹n!")
			return
		end
	--½áÊø--
	local Tree_diff = GetUnitCurStates(Xmas_tree_index,4)
	local hang_time_remain = 300 - (GetTime() - GetUnitCurStates(Xmas_tree_index,1))	--300
	local tree_time_remian = 600 + hang_time_remain
	local hang_time_remain_str = "<color=yellow>"..Zgc_pub_time_sec_change(hang_time_remain,0).."<color>"
	local tree_time_remian_str = "<color=yellow>"..Zgc_pub_time_sec_change(tree_time_remian,0).."<color>"
	if hang_time_remain > 0 then
		if Zgc_pub_num_apart(Tree_diff,2) ~= 4 then
			Talk(1,"end_dialog","C©y Gi¸ng sinh cña ng­¬i ch­a ®ñ tr­ëng thµnh, cßn"..hang_time_remain_str.." míi cã thÓ trang trİ. NÕu nh­ ng­¬i "..tree_time_remian_str.."kh«ng tiÕp tôc ch¨m sãc, c©y sÏ biÕn mÊt!")
			return
		else
			Talk(1,"end_dialog","C©y Gi¸ng sinh cña ng­¬i ch­a ®ñ tr­ëng thµnh, cßn"..hang_time_remain_str.." míi cã thÓ nhËn th­ëng, nÕu ng­¬i"..tree_time_remian_str.."kh«ng tiÕp tôc ch¨m sãc, c©y sÏ biÕn mÊt!")
			return
		end
	elseif Zgc_pub_num_apart(Tree_diff,3) == 1 then			--²»ĞèÒª´«ÈëÊı¾İ£¬Ê÷µÄË÷ÒıÒÑ¾­´æÈëTaskID
		if Tree_diff < 140 then
			Say("NÕu b¹n ®ang"..tree_time_remian_str.."kh«ng tiÕp tôc ch¨m sãc, c©y sÏ biÕn mÊt!",
				3,
				"Ta ph¶i trang trİ/#Xmas_acc_select_A()",
				"Ta sÏ nhËn th­ëng/Xmas_prize_get",
				"Rêi khái/end_dialog"
			)
		else
			Say("NÕu b¹n ®ang"..tree_time_remian_str.."kh«ng tiÕp tôc ch¨m sãc, c©y sÏ biÕn mÊt!",
				2,
				"Ta sÏ nhËn th­ëng/Xmas_prize_get",
				"Rêi khái/end_dialog"
			)			
		end
	else
		if Zgc_pub_num_apart(Tree_diff,2) ~= 4 then
			Say("NÕu b¹n ®ang"..tree_time_remian_str.."kh«ng tiÕp tôc ch¨m sãc, c©y sÏ biÕn mÊt!",
				3,
				"Ta ph¶i trang trİ/#Xmas_acc_select(0)",
				"Ta sÏ nhËn th­ëng/Xmas_prize_get",
				"Rêi khái/end_dialog"
			)
		else
			Say("NÕu b¹n ®ang"..tree_time_remian_str.."kh«ng tiÕp tôc ch¨m sãc, c©y sÏ biÕn mÊt!",
				2,
				"Ta sÏ nhËn th­ëng/Xmas_prize_get",
				"Rêi khái/end_dialog"
			)
			
		end
	end

end
--------------------------------------------------------------ÊÎÎïÑ¡Ôñ---------------------------------------------------
function Xmas_acc_select_A()
	local dialog_table = {}
	local goods_num = 0
		if GetItemCount(2,0,577) ~= 0 then
			Xmas_acc_hang(1,1)
		else
			Talk(1,"end_dialog","B¹n kh«ng cã vËt phÈm trang trİ phï hîp!")
			return			
		end
end
-------------------------------------------------------------ÊÎÎïÂŞÁĞ----------------------------------------------------
function Xmas_acc_select (page_num)
	local dialog_table = {}
	local goods_num = 0
	for i = 1,getn(Xmas_acc_table) do
		if GetItemCount(Xmas_acc_table[i][1],Xmas_acc_table[i][2],Xmas_acc_table[i][3]) ~= 0 then
			goods_num = goods_num +1
			dialog_table[goods_num] = Xmas_acc_table[i][4].."/#Xmas_acc_hang(0,"..i..")"
		end
	end
	if goods_num == 0 then
		Talk(1,"end_dialog","B¹n kh«ng cã vËt phÈm trang trİ c©y Gi¸ng sinh")
		return
	else
		dialog_table[goods_num + 1] = "§Ó ta nghÜ xem/end_dialog"
		Say("    Treo thªm vËt phÈm trang trİ sÏ gióp c©y Gi¸ng sinh mau t¨ng cÊp, <color=red>nh­ng treo nhiÒu qu¸ sÏ lµm c©y bŞ ng·<color>. Ng­¬i muèn chän vËt phÈm trang trİ lo¹i nµo?",--
			getn(dialog_table),
			dialog_table
		)
	end
end
----------------------------------------------ÊÎÎïÉ¾³ı£¬½øÈëÊ¥µ®Ê÷Éı¼¶º¯Êı------------------------------------
function Xmas_acc_hang(tree_flag,acc_seq)
	local del_flag = 0
	local goods_name = ""
	if tree_flag == 1 then
		del_flag = DelItem(2,0,577,1)
		goods_name = "VËt tr.trİ th«ng GH"
	else
		del_flag = DelItem(Xmas_acc_table[acc_seq][1],Xmas_acc_table[acc_seq][2],Xmas_acc_table[acc_seq][3],1)
		goods_name = Xmas_acc_table[acc_seq][4]
	end
	if del_flag ~= 1 then
		Talk(1,"","X¸c nhËn cã"..goods_name.."!")
		return
	else
		local Xmas_tree_index = GetTask(963)
		local tree_diff = GetUnitCurStates(Xmas_tree_index,4)
		if Zgc_pub_num_apart(tree_diff,3) == 1 then
			Xmas_tree_grow_A()
		else
			Xmas_tree_grow_other(Xmas_acc_table[acc_seq][3])
		end
	end
end
-----------------------------------------------------------Ê¥µ®AÊ÷¹ÒÊÎÎï---------------------------------------------
function Xmas_tree_grow_A()
	local Xmas_tree_index = GetTask(963)
	local tree_grow_way = {
		{121,111,122,"C©y Gi¸ng sinh 1c",1},
		{131,121,132,"C©y Gi¸ng sinh 1b",2},
		{133,122,134,"C©y Gi¸ng sinh 1b",2},
		{141,131,142,"C©y Gi¸ng sinh 1a",3},
		{142,132,143,"C©y Gi¸ng sinh 1a",3},
		{143,133,144,"C©y Gi¸ng sinh 1a",3},
		{144,134,141,"C©y Gi¸ng sinh 1a",3},
	}
	local hang_time_remain = 900 - (GetTime() - GetUnitCurStates(Xmas_tree_index,1))
	if hang_time_remain <= 0 then			--ÅĞ¶ÏÊ÷ÊÇ·ñ»¹´æÔÚ
		return
	end
	local MapID,att_X,att_Y	= GetNpcWorldPos(Xmas_tree_index)
	local Xmas_Tree_diff = GetUnitCurStates(Xmas_tree_index,4)
	SetNpcLifeTime(Xmas_tree_index,0)
	for i = 1 ,getn(tree_grow_way) do
		if Xmas_Tree_diff == tree_grow_way[i][2] then
			local random_num = random(1,2)					--Ëæ»ú·ÖÖ§
			if random_num == 2 then
				random_num = -1
			end
			local SFX_seq = Zgc_pub_num_apart(tree_grow_way[i][2+random_num],1)
			local tree_level = Zgc_pub_num_apart(tree_grow_way[i][2+random_num],2)
			
			local Xmas_tree_name = GetName().." trång "..Conf_Xmas_tree_SQF_name[1][SFX_seq + 1].."-"..Conf_Xmas_tree_SQF_name[2][tree_grow_way[i][5]+1].."C©y th«ng gi¸o héi"
			local new_tree_index = CreateNpc(tree_grow_way[i][4],Xmas_tree_name,MapID,att_X,att_Y,-1,1,0,0)
			SetNpcLifeTime(new_tree_index,900)
			--ÔÚ´Ë¼ÓÈëÌØĞ§
				SetCurrentNpcSFX(new_tree_index,Xmas_tree_SFX_table[1][tree_level][SFX_seq],1,1)
			--ÌØĞ§½áÊø
			SetUnitCurStates(new_tree_index,4,tree_grow_way[i][2 + random_num]) 	--Ğ´ÈëÊ÷µÄÀàĞÍ
			SetUnitCurStates(new_tree_index,1,GetTime()) 							--Ğ´ÈëÖÖÊıµÄÊ±¼ä
			SetUnitCurStates(new_tree_index,0,1	) 									--Ğ´ÈëÖÖÊ÷Çø·Ö
			SetUnitCurStates(new_tree_index,8,strlen(GetName())) 					--Ğ´ÈëÊ÷µÄÀàĞÍ

			SetNpcScript(new_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
			SetTask(962,GetTime())
			SetTask(963,new_tree_index)
		end
	end	
	Msg2Player("B¹n ®· trang trİ c©y Gi¸ng sinh thµnh c«ng!")
end
---------------------------------------------------------Ê¥µ®Ê÷BC¹ÒÊÎÎï-------------------------------------------
function Xmas_tree_grow_other(acc_id)
	local tree_grow_way = {
		{211,212,213,214,311,312,313,314},
		{221,321,222,322,223,323,224,324,221},
		{334,234,333,233,332,331,234,232,334},
		{344,241,341,242,342,243,343,244,344},
		}
	local tree_index = GetTask(963)
	local hang_time_remain = 900 - (GetTime() - GetUnitCurStates(tree_index,1))
	if hang_time_remain <= 0 then			--ÅĞ¶ÏÊ÷ÊÇ·ñ»¹´æÔÚ
		return
	end
	SetNpcLifeTime(tree_index,0)
	if random(1,10) == 3 then				--µ¹Ê÷£¬µ¹Ê÷£¬¾ªÆğÔ§ÑìÎŞÊı
		Talk(1,"end_dialog","Xin lçi, v× treo nhiÒu vËt phÈm, c©y gi¸ng sinh cña b¹n ®· bŞ ng·!")
		SetTask(963,0)
		SetTask(962,0)
		return
	end
	local MapID,att_X,att_Y	= GetNpcWorldPos(tree_index)
	local tree_diff = GetUnitCurStates(tree_index,4)
	local tree_level = Zgc_pub_num_apart(tree_diff,2)
	local even_flag = 0					--ÊÇ·ñÅ¼ÊıÅĞ¶Ï±êÖ¾
	if acc_id == floor(acc_id/2) * 2 then
		even_flag = 1
	end
	local new_tree_diff = 0
	for i = 1, 8 do
		if tree_diff == tree_grow_way[tree_level][i] then
			new_tree_diff = tree_grow_way[tree_level+1][i+even_flag]
		end
	end
	local new_tree_SFC = Zgc_pub_num_apart(new_tree_diff,1)					--ÌØĞ§
	local new_tree_level = Zgc_pub_num_apart(new_tree_diff,2)				--Ê÷µÄµÈ¼¶
	local new_tree_sign = Zgc_pub_num_apart(new_tree_diff,3)				--Ê÷µÄÀàĞÍ
	local Xmas_tree_name = GetName().." trång "..Conf_Xmas_tree_SQF_name[1][new_tree_SFC + 1].."-"..Conf_Xmas_tree_SQF_name[2][new_tree_level].."C©y th«ng gi¸o héi"
	local new_tree_index = CreateNpc(Xms_tree_npc_name[new_tree_level][new_tree_sign],Xmas_tree_name,MapID,att_X,att_Y,-1,1,0,0)
	SetNpcLifeTime(new_tree_index,900)
	--ÔÚ´Ë¼ÓÈëÌØĞ§
	SetCurrentNpcSFX(new_tree_index,Xmas_tree_SFX_table[new_tree_sign][new_tree_level][new_tree_SFC],1,1)
	--ÌØĞ§½áÊø
	SetUnitCurStates(new_tree_index,4,new_tree_diff) 
	SetUnitCurStates(new_tree_index,1,GetTime()) 			--Ğ´ÈëÖÖÊıµÄÊ±¼ä
	SetUnitCurStates(new_tree_index,0,1) 
	SetUnitCurStates(new_tree_index,8,strlen(GetName())) 					--Ğ´ÈëÊ÷µÄÀàĞÍ
	SetNpcScript(new_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	SetTask(962,GetTime())
	SetTask(963,new_tree_index)
	Msg2Player("B¹n ®· trang trİ c©y Gi¸ng sinh thµnh c«ng!")
end
--------------------------------------------------------------Ê¥µ®Ê÷½±Àø-----------------------------------------------
function Xmas_prize_get()
	local tree_index = GetTask(963)
	SetNpcLifeTime(tree_index,0)
	local Tree_diff = GetUnitCurStates(tree_index,4)
	local Xmas_tree_prize = {
						{{1000,5000,10000,15000},{200000,300000,400000,500000}},
						{{300000,600000,900000,1000000},{200000,300000,400000,500000},"ModifyGoldenExp(","®iÓm søc kháe"},
						{{10,20,40,40,},{5,10,15,20},"ModifyReputation("," ®iÓm danh väng!"},
						{2000,4000,6000,8000},					
						}
	local prize_seq_1 = Zgc_pub_num_apart(Tree_diff,3)
	local prize_seq_2 = Zgc_pub_num_apart(Tree_diff,2)
	local prize_seq_3 = Zgc_pub_num_apart(Tree_diff,1)
	if prize_seq_1 < 1 or prize_seq_1 > 4 or prize_seq_2 < 1 or prize_seq_2 > 4 or prize_seq_3 < 1 or prize_seq_3 > 4 then
		WriteLog ("Ng­êi ch¬i:"..GetName().."Tham sè phÇn th­ëng lçi:["..prize_seq_1.."]: ["..Tree_diff.."]")
		return	
	end
	--ÁìÈ¡½±ÀøºóÈÎÎñ¼ÇÂ¼Êı¾İÇå0
	SetTask(963,0)
	SetTask(962,0)
	local num = 0
	if prize_seq_1 == 1 then			--½Ì»áÊ¥µ®Ê÷
		num = (GetLevel() - 10) * Xmas_tree_prize[1][1][prize_seq_2]
		ModifyExp(num)
		Msg2Player("B¹n nhËn ®­îc "..num.." ®iÓm kinh nghiÖm!")
		----------------------------------------½Ì»áÊ¥µ®Ê÷ÌØÊâ½±Àø---------------------------------------
		local Xmas_tree_prize_A = {
			{{0,108,109,"Nãn gi¸ng sinh chuÈn"},{0,108,139,"TuÕ Thñ qu¸n"},{0,109,109,"Th­îng y gi¸ng sinh chuÈn"},{0,109,185,"TuÕ Thñ bµo"},{0,110,73,"H¹ y Gi¸ng sinh chuÈn"},{0,110,81,"TuÕ Thñ ngoa"}},  
			{{0,108,110,"Nãn gi¸ng sinh kh«i ng«"},{0,108,140,"Chİnh Sãc m·o"},{0,109,110,"Gi¸ng sinh kh«i ng«"},{0,109,186,"Chİnh Sãc gi¸p"},{0,110,74,"Trang phôc gi¸ng sinh kh«i ng«"},{0,110,82,"Chİnh Sãc ngoa"}},
			{{0,108,112,"Nãn gi¸ng sinh gîi c¶m"},{0,108,141,"T©n Chİnh kÕt"},{0,109,112,"Th­¬ng y gi¸ng sinh gîi c¶m"},{0,109,187,"T©n Chİnh th­êng"},{0,110,76,"H¹ y gi¸ng sinh n÷ gîi c¶m"},{0,110,83,"T©n Chİnh quÇn"}},
			{{0,108,111,"Nãn gi¸ng sinh nhá"},{0,108,142,"Nguyªn Chİnh tr©m"},{0,109,111,"Th­¬ng y gi¸ng sinh KiÒu n÷"},{0,109,188,"Nguyªn Chİnh th­êng"},{0,110,75,"Gi¸ng sinh KiÒu n÷"},{0,110,84,"Nguyªn Chİnh quÇn"}}	
			}
		local player_model = GetBody()
		if GetTask(968) ~= 0 and random(1,10) == 7 then
			local prize_num = GetTask(968)
			local prize_str = tostring(GetTask(968))
			local prize_num_save = 0
			local prize_seq = 0
			if strlen(prize_str) == 1 then
				prize_seq = prize_num
			else
				local ran_num = random(1,strlen(prize_str))
				prize_seq = Zgc_pub_num_apart(prize_num,ran_num)				--È¡³öµÚ¼¸Î»µÄÖµ
				ran_num = strlen(prize_str) - ran_num + 1
				prize_num_save = Zgc_pub_num_peel(prize_num,ran_num)			--°Ñ¸ÃÎ»Öµ°şÀë
				end
			local add_flag = AddItem(Xmas_tree_prize_A[player_model][prize_seq][1],Xmas_tree_prize_A[player_model][prize_seq][2],Xmas_tree_prize_A[player_model][prize_seq][3],1)
			if add_flag ==  1 then
				Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..Xmas_tree_prize_A[player_model][prize_seq][4])
			end
			SetTask(968,prize_num_save)
		end
		if GetTask(964) == 4 then				--µÚËÄ¿Ã½Ì»áÊ¥µ®Ê÷¸ø¾É°æÃ±×Ó
			AddItem(Xmas_tree_prize_A[player_model][1][1],Xmas_tree_prize_A[player_model][1][2],Xmas_tree_prize_A[player_model][1][3],1)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..Xmas_tree_prize_A[player_model][1][4])
		end
		if GetTask(964) == 8 then				--µÚ°Ë¿ÃÊ¥µ®Ê÷¸øĞÂ°æÃ±×Ó
			AddItem(Xmas_tree_prize_A[player_model][2][1],Xmas_tree_prize_A[player_model][2][2],Xmas_tree_prize_A[player_model][2][3],1)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..Xmas_tree_prize_A[player_model][2][4])
		end
		if GetTask(964) == 10 and GetTask(968) ~= 0 then		--ÖÖµÚÊ®´Î°ÑËùÓĞÎ´¸øµÄ×°±¸¸øÁË¡£
			local prize_num = GetTask(968)
			local prize_str = tostring(GetTask(968))
			for i = 1,strlen(prize_str) do
				local prize_seq = Zgc_pub_num_apart(prize_num,i)
				AddItem(Xmas_tree_prize_A[player_model][prize_seq][1],Xmas_tree_prize_A[player_model][prize_seq][2],Xmas_tree_prize_A[player_model][prize_seq][3],1)
				Msg2Player("Chóc mõng b¹n nhËn ®­îc 1"..Xmas_tree_prize_A[player_model][prize_seq][4])
			end
			SetTask(968,0)
		end
		--°ï»áÊ¥µ®Ê÷ÊÎÎïµÄ½±Àø
		if prize_seq_2 == 4 then
			AddItem(Conf_acc_table[1][1],Conf_acc_table[1][2],Conf_acc_table[1][3],1)
			Msg2Player("B¹n nhËn ®­îc 1"..Conf_acc_table[1][4]..", b¹n cã thÓ dïng nh÷ng vËt phÈm nµy trang trİ lªn c©y Gi¸ng sinh bang héi hoÆc tÆng l¹i cho ng­êi kh¸c.")
		end
		--------------------------------------------------½áÊø--------------------------------------------------
	else
		if prize_seq_1 == 2 then
			num = Xmas_tree_prize[prize_seq_1][1][prize_seq_2]
			if num > GetGoldenExp() then
				num = GetGoldenExp()
			end
			ModifyGoldenExp(-num)
			ModifyExp(num)
			if num ~= 0 then
				Msg2Player("B¹n dïng"..num.."®iÓm søc kháe ®æi ®iÓm kinh nghiÖm.")
			end
		elseif prize_seq_1 == 3 then
			num = Xmas_tree_prize[prize_seq_1][1][prize_seq_2]
			ModifyReputation(num,0)
			Talk(1,"end_dialog","B¹n nhËn ®­îc "..num.." ®iÓm danh väng!")
			local exp_num = (GetLevel()-10) * Xmas_tree_prize[4][prize_seq_3]
			ModifyExp(exp_num)
			Msg2Player("B¹n nhËn ®­îc "..exp_num.." ®iÓm kinh nghiÖm!")	
		end
		
		if prize_seq_2 == 4 then
			local conf_acc_seq_table = random(2,getn(Conf_acc_table))
			AddItem(Conf_acc_table[conf_acc_seq_table][1],Conf_acc_table[conf_acc_seq_table][2],Conf_acc_table[conf_acc_seq_table][3],1)
			Msg2Player("B¹n nhËn ®­îc 1"..Conf_acc_table[conf_acc_seq_table][4]..", b¹n cã thÓ dïng nh÷ng vËt phÈm nµy trang trİ lªn c©y Gi¸ng sinh bang héi hoÆc tÆng l¹i cho ng­êi kh¸c.")	
		end
	end
	Xmas_SFX_prize(prize_seq_3,prize_seq_2)
end
----------------------------------------------ÌØĞ§µÄ½±Àø--------------------------------------------
function Xmas_SFX_prize(SFX_diff,SFX_level)
	local Xmas_SFX_prize_table = {
		{200000,300000,400000,500000},
		{200000,300000,400000,500000},
		{5,10,15,20},
		{2500,3000,3500,4000}
	}
	local num = Xmas_SFX_prize_table[SFX_diff][SFX_level]
	if SFX_diff == 1 then			--¾­Ñé
		ModifyExp(num)
		Msg2Player("B¹n nhËn ®­îc "..num.." ®iÓm kinh nghiÖm!")			
	elseif SFX_diff == 2 then		--½¡¿µ¾­Ñé
		ModifyGoldenExp(num)
		Msg2Player("B¹n nhËn ®­îc "..num.."®iÓm søc kháe")
	elseif SFX_diff == 3 then		--ĞŞÎª
		ModifyReputation(num,0)
		Talk(1,"end_dialog","B¹n nhËn ®­îc "..num.." ®iÓm danh väng!")	
	else
		ModifyPopur(num)
		Msg2Player("B¹n nhËn ®­îc "..num.." ®iÓm tu luyÖn!")	
	end
end
--***************************************°ï»áÊ¥µ®Ê÷*********************************
----------------------------------------------------------´«½ÌÊ¿¶Ô»°---------------------------------------------
function conf_Xmas_tree_dialog()
	Zgc_pub_getconftask(1,1)				--Î»ÖÃ¡¢º¯ÊıĞòºÅ
end
function ConfDataGetReturn_1(data_value)
	if data_value >= zgc_pub_day_turn(1) then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi¸ng sinh vui vÎ!!",
			3,
			"nhËn quµ Gi¸ng sinh/get_Xmas_goods",
			"T×m hiÓu ho¹t ®éng Gi¸ng sinh/about_Xmas_feast",
			--"Ê²Ã´ÊÇÊ¥µ®Ñ½£¿/about_Xmas",
			"Rêi khái/end_dialog"
		)
	else
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi¸ng sinh vui vÎ!!",
			4,
			"NhËn c©y Gi¸ng sinh bang héi/get_conf_Xmas_tree",
			"nhËn quµ Gi¸ng sinh/get_Xmas_goods",
			"T×m hiÓu ho¹t ®éng Gi¸ng sinh/about_Xmas_feast",
			--"Ê²Ã´ÊÇÊ¥µ®Ñ½£¿/about_Xmas",
			"Rêi khái/end_dialog"
			)
	end
end
-----------------------------------------------------°ï»áÊ¥µ®Ê÷¸øÓè-------------------------------------------------
function get_conf_Xmas_tree()
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dialog","ChØ cã bang chñ míi cã thÓ nhËn ®­îc c©y Gi¸ng sinh bang héi!")
		return
	elseif Zgc_pub_action_level_chk () ~= 1 then
			return
	else
		if Zgc_pub_goods_add_chk(1,10) == 1 then
			Zgc_pub_setconftask(1,zgc_pub_day_turn(1),1)		--Î»ÖÃ¡¢Öµ¡¢º¯ÊıĞòºÅ
		else
			return
		end
	end
end
function ConfDataSetReturn_1()
	local add_flag = AddItem(2,0,576,1)
	Msg2Player("B¹n ®· nhËn ®­îc c©y Gi¸ng sinh bang héi")
end
------------------------------------------------°ï»áÊ¥µ®Ê÷¶Ô»°------------------------------------------
function conf_Xmas_tree(conf_Xmas_tree_index)
	if IsTongMember() == 0 then
		Talk(1,"end_dialog","    Gia nhËp bang héi míi cã thÓ trang trİ c©y Gi¸ng sinh.")
		return
	end
	if Conf_Xmas_tree_name_chk(conf_Xmas_tree_index) ~= 1 then
		Talk(1,"end_dialog","     §©y ch¼ng ph¶i lµ c©y Gi¸ng sinh cña quı bang sao?")
		return
	end
	--ÈËÎïµÈ¼¶ÅĞ¶Ï
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	local conf_Xmas_tree_diff = GetUnitCurStates(conf_Xmas_tree_index,4)
	local conf_tree_level =  Zgc_pub_num_apart(conf_Xmas_tree_diff,2)
	local conf_tree_build_time = GetUnitCurStates(conf_Xmas_tree_index,1)
	local conf_tree_acc_A = GetUnitCurStates(conf_Xmas_tree_index,2)
	local conf_tree_acc_B = GetUnitCurStates(conf_Xmas_tree_index,3)
	local conf_tree_acc_total = (conf_tree_acc_A + conf_tree_acc_B)

	local conf_Xmas_time_distance = GetTime() - conf_tree_build_time
	SetTaskTemp(163,conf_Xmas_tree_index)			--Ğ´ÈëÊ÷µÄË÷Òı
	
	if conf_Xmas_tree_diff < 40 then
		local wt_than_max = ""					-- ÊÇ·ñ³¬ÖØµÄ¾¯¸æ£¬Ö»ÓÃÔÚ1-3¼¶¾Í¿ÉÒÔÁË¡£
		if (conf_tree_acc_A + conf_tree_acc_B) > Conf_Xmas_acc_wt_max[conf_tree_level] then
			wt_than_max = "<color=red>VËt phÈm trang trİ qu¸ nÆng cã thÓ sÏ r¬i xuèng!<color>"
		end
		local conf_Xmas_tree_life_time = 600 - conf_Xmas_time_distance
		local conf_Xmas_tree_update_time = 300 - conf_Xmas_time_distance
		
		local conf_Xmas_update_dialog = ""
		if conf_Xmas_tree_update_time < 0 then
			conf_Xmas_update_dialog = "    C©y gi¸ng sinh cña quı bang ®· t¨ng cÊp, cã thÓ tiÕp tôc trang trİ nh­ng nÕu <color=yellow>".. Zgc_pub_time_sec_change(conf_Xmas_tree_life_time,0).."<color> kh«ng t¨ng cÊp c©y sÏ biÕn mÊt."..wt_than_max
		else
			conf_Xmas_update_dialog = "    C©y Gi¸ng sinh cña quı bang cßn ph¶i ®îi <color=yellow>"..Zgc_pub_time_sec_change(conf_Xmas_tree_update_time,0).."<color> míi cã thÓ t¨ng cÊp, cã thÓ tiÕp tôc trang trİ, nÕu nh­ <color=yellow>".. Zgc_pub_time_sec_change(conf_Xmas_tree_life_time,0).."<color> kh«ng t¨ng cÊp c©y sÏ biÕn mÊt."..wt_than_max
		end
		if IsTongMaster() == 1 and (GetTime() - conf_tree_build_time) > 300 then
			Say(conf_Xmas_update_dialog,
			3,
			"Ta cÇn ph¶i gióp c©y Gi¸ng sinh cña bang héi t¨ng cÊp (cÇn mét phÇn Lé thñy)/cong_Xmas_tree_up",
			"Ta ph¶i trang trİ/conf_Xmas_tree_hang_acc",
			"Rêi khái/end_dialog")
		else
			Say(conf_Xmas_update_dialog,
			2,
			"Ta ph¶i trang trİ/conf_Xmas_tree_hang_acc",
			"Rêi khái/end_dialog")		
		end
	else
		local conf_Xmas_tree_life_time_lv4 = 1800 - conf_Xmas_time_distance
		
		Say("C©y Gi¸ng sinh cña quı bang ®· ®¹t ®Õn ®¼ng cÊp cao nhÊt, cã thÓ ®Õn <color=yellow>"..Zgc_pub_time_sec_change(conf_Xmas_tree_life_time_lv4,0).."<color> nhËn phÇn th­ëng.",
		2,
		"Ta sÏ nhËn th­ëng/conf_Xmas_tree_get_prize",
		"Rêi khái/end_dialog")
	end	
end
----------------------------------------------°ï»áÊ¥µ®Ê÷ÊÎÎïÑ¡Ôñ---------------------------------------------
function conf_Xmas_tree_hang_acc()
	local dialog_table = {}
	local acc_num = 0
	for i = 1 ,getn(Conf_acc_table) do
		if GetItemCount(Conf_acc_table[i][1],Conf_acc_table[i][2],Conf_acc_table[i][3]) ~= 0 then
			acc_num = acc_num + 1
			dialog_table[acc_num] = Conf_acc_table[i][4].."/#conf_acc_select("..Conf_acc_table[i][3]..")"
		end
	end	
	dialog_table[acc_num + 1] = "§Ó ta nghÜ xem/end_dialog"
	if acc_num == 0 then
		Talk(1,"end_dialog","B¹n kh«ng cã vËt phÈm trang trİ phï hîp!")
		return
	end
	Say("Chän vËt trang trİ cho c©y Gi¸ng sinh cña bang héi b¹n:",
		getn(dialog_table),
		dialog_table
	)
end
function conf_acc_select(acc_id)
	SetTaskTemp(162,acc_id)
	Talk(1,"end_dialog","Ng­¬i cã thÓ dïng khinh c«ng ®Ó treo vËt trang trİ lªn c©y Gi¸ng sinh.")
end
--------------------------------------------°ï»áÊ¥µ®Ê÷Éı¼¶²Ù×÷------------------------------------
function cong_Xmas_tree_up()
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dilog","    ChØ cã bang chñ míi cã thÓ t¨ng cÊp c©y Gi¸ng sinh bang héi.")
		return
	end
	local conf_tree_index = GetTaskTemp(163)
	if Conf_Xmas_tree_name_chk(conf_tree_index) ~= 1 then
		Talk(1,"end_dialog","    §©y ch¼ng ph¶i lµ c©y Gi¸ng sinh cña quı bang sao?")
		return
	end
	local conf_tree_build_time = GetUnitCurStates(conf_tree_index,1)
	if GetTime() - conf_tree_build_time > 600 then			--ÅĞ¶ÏÊ÷ÊÇ·ñ»¹´æÔÚ
		Talk(1,"end_dialog","    c©y Gi¸ng sinh cña quı bang ®· biÕn mÊt!")	
		return
	end
	--Â¶Ë®
	if GetItemCount(2,0,351) == 0 then
		Talk(1,"end_dialog","    T¨ng cÊp cho c©y Gi¸ng sinh bang héi cÇn ph¶i cã {Lé Thñy}")
		return
	end
	--Â¶Ë®É¾³ı
	if DelItem(2,0,351,1) ~= 1 then
		Talk(1,"end_dialog","    X¸c nhËn trong hµnh trang cña b¹n cã ®em theo {Lé thñy} ®Ó t¨ng cÊp c©y Gi¸ng sinh.")
		return	
	end
	--¾ÉÊı¾İµÄ¶ÁÈ¡
	local conf_tree_diff = GetUnitCurStates(conf_tree_index,4)
	local conf_tree_SQF_seq = Zgc_pub_num_apart(conf_tree_diff,1)
	local conf_tree_level = Zgc_pub_num_apart(conf_tree_diff,2)
	local conf_tree_acc_A = GetUnitCurStates(conf_tree_index,2)
	local conf_tree_acc_B = GetUnitCurStates(conf_tree_index,3)
	local conf_player_num = GetUnitCurStates(conf_tree_index,6)
	--ĞÂÊı¾İµÄ¶¨Òå
	local New_conf_tree_level = conf_tree_level + 1					--ĞÂÊ÷µÈ¼¶
	local New_conf_tree_SQF_seq = 0									--ĞÂÊ÷ÌØĞ§
	if conf_tree_acc_A >= 10 then									--AµÄÊıÁ¿±ØĞë¡µ10¸ö
		local num_step_distance = 0 
		if conf_tree_acc_B >= Conf_Xmas_grow_way[New_conf_tree_level][4][3] then
			if New_conf_tree_level ~= 2 then
				num_step_distance = (4 - conf_tree_SQF_seq) * 7
			end
			if random(1,100) <= (Conf_Xmas_grow_way[New_conf_tree_level][5] - num_step_distance) then
				New_conf_tree_SQF_seq = 4
			else
				New_conf_tree_SQF_seq = 3
			end
		else
			for i = 1,4 do
				if conf_tree_acc_B >= Conf_Xmas_grow_way[New_conf_tree_level][i][2] and conf_tree_acc_B < Conf_Xmas_grow_way[New_conf_tree_level][i][3] then
					if New_conf_tree_level ~= 2 then
						num_step_distance = (i - conf_tree_SQF_seq) * 7
					end
					if random(1,100) <= (Conf_Xmas_grow_way[New_conf_tree_level][i][1] - num_step_distance) then
						New_conf_tree_SQF_seq = i
					else
						New_conf_tree_SQF_seq = i - 1
					end
					break
				end
			end
		end
	end
	local map_ID,att_X,att_Y = GetNpcWorldPos(conf_tree_index)
	local conf_Xmas_tree_name = GetTongName().." trång "..Conf_Xmas_tree_SQF_name[1][New_conf_tree_SQF_seq+1].."-"..Conf_Xmas_tree_SQF_name[2][New_conf_tree_level].."C©y th«ng gi¸o héi"
	local new_conf_Xmas_tree_index = CreateNpc(Xms_tree_npc_name[New_conf_tree_level][4],conf_Xmas_tree_name,map_ID,att_X,att_Y,6,1,1,0)
	SetNpcLifeTime(conf_tree_index,0)
	SetNpcScript(new_conf_Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	--ËÄ¼¶µÄÊ÷Ö»ÄÜÁìÈ¡½±Àø£¬Ó¦¸Ã°ÑtrapµãÈ¥µô
	if New_conf_tree_level == 4 then
		for i = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
			for j = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
				AddMapTrap(map_ID,((att_X + i) * 32),((att_Y + j) * 32),0)
			end
		end
		SetNpcLifeTime(new_conf_Xmas_tree_index,1800)												--´æ»îÊ±¼ä30·ÖÖÓ
		--°ï»á¹«¸æ
		local map_name = Zgc_pub_mapID_name_change(map_ID,1) 
		if map_name ~= 0 then
			SendTongMessage("T¹i"..map_name.."C©y Gi¸ng sinh cña quı bang ®· th¨ng lªn cÊp 4, cã thÓ nhËn phÇn th­ëng.")
		end
	else
		SetNpcLifeTime(new_conf_Xmas_tree_index,600)													--´æ»îÊ±¼ä10·ÖÖÓ
	end
	--½«Ê¥µ®Ê÷µÄ2¡¢3Î»Êı¾İÇå¿Õ
	SetUnitCurStates(new_conf_Xmas_tree_index,2,0)
	SetUnitCurStates(new_conf_Xmas_tree_index,3,0)
	SetUnitCurStates(new_conf_Xmas_tree_index,0,2)
	SetUnitCurStates(new_conf_Xmas_tree_index,6,conf_player_num)
	SetUnitCurStates(new_conf_Xmas_tree_index,8,strlen(GetTongName()))
	--ÌØĞ§ÉèÖÃ
	if New_conf_tree_SQF_seq ~= 0 then
		SetCurrentNpcSFX(new_conf_Xmas_tree_index,Xmas_tree_SFX_table[4][New_conf_tree_level][New_conf_tree_SQF_seq],1,1)
	end
	local new_conf_tree_diff = (New_conf_tree_level * 10) + New_conf_tree_SQF_seq
	SetUnitCurStates(new_conf_Xmas_tree_index,4, new_conf_tree_diff)					--Ğ´ÈëÊ÷µÄÀàĞÍ
	SetUnitCurStates(new_conf_Xmas_tree_index,1, GetTime())								--Ğ´ÈëÖÖÊıµÄÊ±¼ä		
	WriteLog ("Bang héi"..GetTongName().."CÊp:"..New_conf_tree_level.."§¼ng cÊp hiÖu qu¶ ®Æc biÖt:"..New_conf_tree_SQF_seq)
end
--------------------------------------------------------°ï»áÊ¥µ®Ê÷½±Àø»ñµÃ-------------------------------------------------------------
function conf_Xmas_tree_get_prize()
	local conf_Xmas_tree_index = GetTaskTemp(163)
	if conf_Xmas_tree_index == 0 then
		return
	end
	if Conf_Xmas_tree_name_chk(conf_Xmas_tree_index) ~= 1 then
		Talk(1,"end_dialog","§©y ch¼ng ph¶i lµ c©y Gi¸ng sinh cña quı bang sao?")
		return
	end
	--Ã¿¸öÈËÃ¿ÌìÖ»ÄÜ»ñµÃÒ»´Î°ï»á½±Àø£¬×¢ÒâºóÃæÒªzgc_pub_day_turn(1)Ğ´Èë
	if GetTask(975) >= zgc_pub_day_turn(1) then					
		Talk(1,"end_dialog","H«m nay ng­¬i ®· nhËn phÇn th­ëng cña bang héi, ngµy mai l¹i ®Õn nhĞ!")
		return
	end
	local conf_Xmas_tree_prize = {
		{1000,1000,1},
		{2000,2000,5},
		{5000,3000,8},
		{10000,5000,10},
		{20000,10000,20}
	}
	if Zgc_pub_goods_add_chk(1,10) == 0 then
		return
	end
	--½ñÌìÉÏ½»µÄÊÎÎï¸öÊı
	local conf_Xmas_acc_up_flag = 0				
	if GetTask(973) == zgc_pub_day_turn(1) then
		conf_Xmas_acc_up_flag = 1					
	end
	local conf_Xmas_tree_diff = GetUnitCurStates(conf_Xmas_tree_index,4)
	local conf_Xmas_tree_SQF = Zgc_pub_num_apart(conf_Xmas_tree_diff,1) + 1
	local Player_level_diff = (GetLevel() - 10)
	if conf_Xmas_acc_up_flag == 1 then
		ModifyExp((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2]) * Player_level_diff)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2])*Player_level_diff).." ®iÓm kinh nghiÖm!")
		WriteLog (GetName().."§óng"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2]) * Player_level_diff).." ®iÓm kinh nghiÖm!")
	else
		ModifyExp((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff).." ®iÓm kinh nghiÖm!")
		WriteLog (GetName().."§óng"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff).." ®iÓm kinh nghiÖm!")
	end
	SetTask(975,zgc_pub_day_turn(1))
	if IsTongMaster() == 1 and GetUnitCurStates(conf_Xmas_tree_index,5) ~= 37 then
		local player_num = GetUnitCurStates(conf_Xmas_tree_index,6)
		local goods_num = floor((GetUnitCurStates(conf_Xmas_tree_index,6)/50) * conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3]) + 1
		if goods_num > conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3] then
			goods_num = conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3]
		end
		SetUnitCurStates(conf_Xmas_tree_index,5,37)
		AddItem(2,0,545,goods_num)
		SendTongMessage("NhËn phÇn th­ëng c©y Gi¸ng sinh bang héi:"..goods_num.." Sinh ThÇn Cang!")
		WriteLog ("Bang héi"..GetTongName().."§· nhËn "..goods_num.." Sinh ThÇn Cang!")
	end
end
--=============================================================end=====================================================================================

--===============================07ÄêÊ¥µ®»î¶¯==========================
function get_chrims_tree()
	local nLv = GetLevel();
	if nLv < 40 then
		Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>§¼ng cÊp cña b¹n qu¸ thÊp, tõ cÊp 40 trë lªn míi cã thÓ tham gia ho¹t ®éng nµy.");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_GET_TREE) >= nDate then
		Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> H«m nay ng­¬i ®· nhËn 1 c©y Th«ng gi¸ng sinh råi, ngµy mai h·y ®Õn.");
		return
	end 
	if Zgc_pub_goods_add_chk(2,2) ~= 1 then
		return 
	end
	local Add_flag = AddItem(2,0,574,1); --Ê¥µ®Ê÷id
	if Add_flag == 1 then
		SetTask(TASK_GET_TREE,nDate);
		if GetTask(TASK_TAIYI_TUPU) == 0 and GetLevel() == 99 then
			SetTask(TASK_TAIYI_TUPU,1);
			AddItem(2,0,574,1);
			Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>§a t¹ b¹n ®· ñng hé Vâ L©m 2 trong thêi gian qua. Gi¸ng sinh l¹i vÒ, xin tÆng b¹n lÔ vËt Gi¸ng Sinh! B¹n ®· nhËn ®­îc thªm mét <color=yellow>c©y Gi¸ng Sinh<color> n÷a, chóc b¹n ch¬i vui vÎ!");
		else
			Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> cÇm ®i, Th«ng gi¸ng sinh cña ng­¬i ®©y, nÕu muèn biÕt c¸ch trang trİ Th«ng gi¸ng sinh, vµ Th«ng gi¸ng sinh cã nh÷ng phÇn th­ëng nµo, cã thÓ xem thuyÕt minh.");
		end
	else
		WriteLog("[07 ho¹t ®éng Gi¸ng Sinh nhËn Th«ng gi¸ng sinh]"..GetName().."NhËn Th«ng gi¸ng sinh thÊt b¹i, tiªu chİ thÊt b¹i:"..Add_flag);
	end
end

function about_chrims_detail()
	local strtab = {			
					"Trang trİ Th«ng gi¸ng sinh thÕ nµo/how_strew_tree",
					"Trang trİ Th«ng gi¸ng sinh nhËn ®­îc phÇn th­ëng nµo/about_tree_award",
					"T×m hiÓu ho¹t ®éng b¸i s­/about_newyear08_bai",
					"Ta chØ ®Õn xem thö/nothing"
					}	
	Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> B¹n muèn t×m hiÓu ph­¬ng diÖn nµo?",
		getn(strtab),
		strtab)
end

function how_strew_tree()
	Talk(1,"how_strew_tree2","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> cã ®­îc Th«ng gi¸ng sinh xong, cã thÓ sö dông ë mäi n¬i (nhÊp chuét tr¸i sö dông). Cã hai lùa chän\nMét, ®Æt Th«ng gi¸ng sinh\nHai, kh«ng, ®Æt sau\nChän ®Æt Th«ng gi¸ng sinh xong, trªn mÆt ®Êt sÏ xuÊt hiÖn Th«ng gi¸ng sinh, b¹n cã thÓ trang trİ Th«ng gi¸ng sinh vµ nhËn phÇn th­ëng.\nChän 'Kh«ng, ®Æt sau', sÏ tho¸t khái lùa chän. \nMçi lÇn ®Æt Th«ng gi¸ng sinh kĞo dµi nhiÒu nhÊt 30 phót, sau 30 phót tù ®éng thu l¹i, muèn trang trİ ph¶i ®Æt l¹i.");
end

function how_strew_tree2()
	Talk(1,"how_strew_tree3","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> Khi b¹n ®Æt Th«ng gi¸ng sinh xong, cã thÓ thao t¸c trªn Th«ng gi¸ng sinh\n Cã thÓ t×m kiÕm néi dung trªn Th«ng gi¸ng sinh nh­ sau\nMét, trang trİ Th«ng gi¸ng sinh\nHai, nhËn phÇn th­ëng trang trİ Th«ng gi¸ng sinh\nBa, nhËn quµ Gi¸ng Sinh\nBèn, thu l¹i Th«ng gi¸ng sinh");
end

function how_strew_tree3()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color> Trang trİ Th«ng gi¸ng sinh cã thÓ lµm Th«ng gi¸ng sinh ®Ñp h¬n, cßn cã thÓ nhËn phÇn th­ëng trang trİ Th«ng gi¸ng sinh, mçi lÇn trang trİ Th«ng gi¸ng sinh xong, phÇn th­ëng nhËn ®­îc lÇn sau sÏ ®uîc nh©n ®«i cho ®Õn khi hoµn tÊt trang trİ Th«ng gi¸ng sinh. \nNÕu b¹n hµi lßng víi Th«ng gi¸ng sinh m×nh trang trİ cã thÓ nhËn quµ Gi¸ng sinh cuèi cïng, cÇn chó ı, nhËn quµ xong, Th«ng gi¸ng sinh sÏ biÕn mÊt. NÕu kh«ng hµi lßng, suy nghÜ xem m×nh cã muèn nhËn quµ kh«ng. \nNgoµi quµ trang trİ Th«ng gi¸ng sinh phæ th«ng, cßn cã mét sè thiÖp chóc do c¸c gi¸o sÜ lµm ®Ó tÆng cho c¸c ®¹i m«n ph¸i. B¹n cã cèng hiÕn cho s­ m«n sÏ nhËn ®­îc thiÖp chóc nµy.");	
end

function about_tree_award() --Ãâ·ÑÇøÎª¾­Ñé
	Talk(1,"about_tree_award2","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>Mçi lÇn trang trİ c©y Gi¸ng Sinh b¹n ®Òu cã c¬ héi nhËn ®­îc phÇn th­ëng, vµ phÇn th­ëng kinh nghiÖm. Khi c©y Gi¸ng Sinh cña b¹n ®· ®¹t ®Õn møc cao nhÊt th× cã thÓ nhËn ®­îc phÇn th­ëng cuèi cïng. PhÇn th­ëng cuèi cïng, ngoµi ®iÓm kinh nghiÖm phong phó, cßn cã c¬ héi nhËn ®­îc Linh th¹ch quı hiÕm.\nDùa vµo ®¼ng cÊp mµ b¹n sÏ nhËn ®­îc nh÷ng phÇn th­ëng kh¸c nhau. §¼ng cÊp cµng cao th× phÇn th­ëng nhËn ®­îc cµng nhiÒu.<color=yellow> L­u ı, nÕu b¹n ®· ®ñ kinh nghiÖm cña cÊp 99, th× sÏ kh«ng thÓ nhËn thªm kinh nghiÖm.<color>\nNgoµi ra, lóc b¹n nhËn ®­îc phÇn th­ëng cuèi cïng, dùa vµo tr×nh ®é trang trİ c©y Gi¸ng Sinh, cßn cã x¸c suÊt nhËn ®­îc tuÇn léc Gi¸ng Sinh, T©n Nguyªn Ngo¹i Trang vµ TriÒu Hoa Ngo¹i Trang.\nMçi ngµy, b¹n cßn cã c¬ héi trë thµnh ng«i sao Gi¸ng Sinh, nhËn ®­îc gÊp ®«i phÇn th­ëng kinh nghiÖm trong lóc nhËn phÇn th­ëng cuèi cïng.");
end

function about_tree_award2()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>3 Vâ l©m cao thñ cña Trung Nguyªn, Th­¬ng ThÇn Doanh Thiªn, b¾c Lôc l©m minh chñ vµ L·nh H­¬ng L¨ng c­íp ®­îc rÊt nhiÒu Th«ng gi¸ng sinh cña tİn ®å, chóng ta lµ Quû ®á, nÕu ng­¬i muèn ®o¹t l¹i Th«ng gi¸ng sinh, tïy ng­¬i. \nNh­ng phÇn lín Th«ng gi¸ng sinh ®Òu kh«ng dïng ®­îc. \nMçi ng­êi chØ ®­îc trang trİ 2 c©y Th«ng gi¸ng sinh mét ngµy.");
end

function about_newyear08_bai()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>N¨m míi l¹i ®Õn, xin chóc trong n¨m míi b¹n sÏ nhËn ®­îc nhiÒu niÒm vui h¬n n¨m qua. Cæ nh©n nãi, trong ba ng­êi ®i trªn ®­êng ¾t cã ng­êi lµm thÇy ta, v× vËy b¹n h·y ®Õn gÆp nh÷ng ng­êi m¹nh h¬n m×nh ®Ó thØnh gi¸o kinh nghiÖm giang hå.\n§Çu tiªn b¹n h·y tæ ®éi víi ng­êi b¹n muèn thØnh gi¸o, ®¼ng cÊp cña ®èi ph­¬ng ph¶i cao h¬n b¹n, thùc hiÖn ®éng t¸c 'b¸i' ®Ó thÓ hiÖn thµnh ı cña b¶n th©n, ®èi ph­¬ng sÏ ®¸p l¹i ı nguyÖn cña b¹n. NÕu hai ng­êi t©m ®Çu ı hîp, cã thÓ sÏ nhËn ®­îc phÇn th­ëng gÊp ®«i.\nL­u ı, mçi ngµy mçi ng­êi chØ cã thÓ thØnh gi¸o kinh nghiÖm giang hå mét lÇn, cho nªn ph¶i chän cho m×nh l·o s­ thËt tèt. Ng­êi ch¬i cÊp 99 ph¶i t×m ng­êi ch¬i cïng ®¼ng cÊp ®Ó tæ ®éi. NÕu kinh nghiÖm ®· ®Çy th× kh«ng thÓ nhËn thªm kinh nghiÖm n÷a.");
end
