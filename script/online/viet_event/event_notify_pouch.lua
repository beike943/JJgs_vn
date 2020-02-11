--=============================================
--create by baiyun 2009.11.17
--describe:Ô½ÄÏ°æ12ÔÂ·Ý»î¶¯ ½õÄÒ´óÊÂ¼þ
--=============================================

Include("\\script\\online\\viet_event\\200912\\event_head.lua");
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua") -- IP bonus
Include("\\script\\online\\viet_event\\shop_tieuquyen\\tieuquyen_npc.lua");
Include("\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
Include("\\script\\task\\faction_boss\\wulinmeng_teshi.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online\\viet_event\\firework_10\\head.lua");			-- include file ph¸o hoa 20-11-2010
Include("\\script\\online\\viet_event\\firework_10\\head1.lua");
Include("\\script\\online_activites\\2010_07\\activites_01\\item\\item_qiannian.lua");
Include("\\script\\online\\viet_event\\bhta4\\register5.lua")
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua");
Include("\\script\\online_activites\\2011_09\\activity_02\\head.lua");
Include("\\script\\online_activites\\2011_10\\activity_04\\plant_flower.lua");
Include("\\script\\online_activites\\2011_10\\activity_02\\send_flowers.lua");
Include("\\script\\online_activites\\2011_11\\activity_03\\send_gift.lua");
Include("\\script\\online_activites\\2011_11\\activity_04\\decorate_tree.lua");
--Include("\\script\\online_activites\\2011_12\\chunjie\\chunjie_interface.lua");
--Include("\\script\\online_activites\\2011_12\\lilishishi\\send_gift.lua");
--Include("\\script\\online_activites\\2011_12\\wupanguo\\silin_dogz.lua");
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua") 
Include("\\script\\online\\viet_event\\platinum_card\\npc_platinum.lua")
Include("\\script\\online\\viet_event\\vipcare\\vipcare.lua");
Include("\\script\\online\\viet_event\\denbuthang4\\denbuthang4.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\online_activites\\201211\\christmas_tree.lua") 
Include("\\script\\online_activites\\head\\activity_normal_define.lua")
Include("\\script\\online_activites\\201309\\plant_flower.lua")
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")
Include("\\script\\vng\\award\\traothuong3ty.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\online_activites\\201410\\plant_flower.lua")

function SelectSay()	
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	local nDate = tonumber(date("%Y%m%d"))
	local szNationality = get_nationality_name(GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR))
   	
     --tbSayDialog, szSayHead = get_tbJNDialog_info(tbSayDialog, szSayHead)
     szSayHead = szSayHead..format(". B¹n ®ang lµ thÇn d©n cña <color=yellow>%s quèc<color>.", szNationality)

	if VET_CheckIpBonus() == 1 then
		szSayHead = szSayHead..". HiÖn ®ang ch¬i t¹i <color=yellow>Phßng M¸y Th©n ThiÖn<color>."
	end
		--ÎäÁÖvipÔÂ¿¨
	if vc_IsVipCardOpen() ~= 0 then
		tinsert(tbSayDialog, vc_GetMainTitle()) 
	end
	--------------------------------
	--NhËn th­ëng l¹i trang bÞ diÖu d­¬ng bÞ lçi event th¸ng 3/2014
	if nDate >= 20140329 and nDate <= 20140405 then
		local nCheck_ext = GetExtPoint(5)
		if nCheck_ext == 1 then
			tinsert(tbSayDialog, "NhËn th­ëng l¹i event th¸ng 3/get_award201403")
		end
	end	
	----------------------------------
--	if nDate >= 20120611 and nDate <= 20120718 then
--		tinsert(tbSayDialog, "Më R­¬ng ThÇn Tµi ®ãn Phiªn B¶n Míi/get_Invite")
--	end	
--  	if nDate >= 20120308 and nDate <= 20120508 then
--		tinsert(tbSayDialog, "NhËn th­ëng T©n Thñ LÖnh /get_NewRegis")
--	end
--   	-- Event th¸ng 11
--     if nDate >= 20111111 and nDate <= 20111212 then
--    		tinsert(tbSayDialog, VET_201111_STRING_LIST[1].."/active_fire_for_warm")
--		tinsert(tbSayDialog, VET_201111_STRING_LIST[2].."/buy_match")
--		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TWO[1].."/send_flower")
--	end
--
--	if nDate >= 20110722 and nDate <= 20110821 then
--  		tinsert(tbSayDialog, "Chµo mõng sù kiÖn Kem SoCola /ChangeSoCola")
--  	end
--  	if nDate >= 20110617 and nDate <= 20110710 then
--   		tinsert(tbSayDialog, "§æi Sinh tè tr¸i c©y (cÇn 5 tr¸i c©y mïa hÌ + 2 VËt phÈm Xu)/VET_201102_Operating_SinhTo")
--   	end
--    if nDate >= 20110422 and nDate <= 20110616 then
--    		szSayHead = VET_STR_201104_LIBERATION_OPERATING_DLG[4]
--    		tinsert(tbSayDialog,gf_VnGetChangeSaySel("201104LiberationChg2").."/#VET201104CHG(2)")
--    		tinsert(tbSayDialog, "§æi Bã Hoa ChiÕn Th¾ng (cÇn 5 Hoa ChiÕn Th¾ng + 2 VËt phÈm Xu)/VET_201104_304_MassExchange")
--    		tinsert(tbSayDialog, "Nép bã hoa chiÕn th¾ng/VET_201104_give_Winflower")
--    end
--    
--     if nDate >= 20110121 and nDate <= 20110220 then
--     		tinsert(tbSayDialog, PB_menu[7])
--     end
     


--	if nDate >= 20110304 and nDate <= 20110410 then
--		  tinsert(tbSayDialog, "TÆng kÑo S«c«la mõng ngµy quèc tÕ phô n÷ 8/3 (cÇn 10 S«c«la)/VET_201102_give_chocolate");
--	end
--	
--	--Event th¸ng 12
--	if nDate >= 20111216 and nDate <= 20120108 then
--    		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TB[1].."/send_gift")
--    		tinsert(tbSayDialog, format(tSTRING_DECORATETREE_TABLE[1],VET_201111_TREE_VALUE).."/sale_christmas_tree")
--	end
--

--	-- ****************** Event Ph¸o hoa 20101116 ******************
--	if nDate >= 20110405 and nDate <= 20110421 then
--		tinsert ( tbSayDialog, "NhËn bao l× x×/VET_201102_give_dahongbao" )
--	end	
--	-- ****************** NhËn max event ë mèc 4000******************
--	if nDate >= 20120727 and nDate <= 20120812 then		
--		tinsert ( tbSayDialog, "NhËn th­ëng sö dông lo¹i tèi ®a vËt phÈm event/prize_max_event_thang7" )
--	end
--	
--
--	if nDate >= 20100917 and nDate <= 20101024 then
--		tinsert(tbSayDialog,"NhËn vËt phÈm Kû NiÖm 1000 N¨m Th¨ng Long/get_1000_tl")
--	end
	
--	if CheckTongJoinRoseWar() == 1 and nDate <= 20110410 then
--		-- §æi hoa hång vµng tõ hoa hång phÊn
--		tinsert(tbSayDialog, "Ta muèn ®æi Hoa Hång Vµng (5 Hoa Hång PhÊn + 2 Xu)/bhta5_exchange_rose")
--		tinsert(tbSayDialog, "Ta muèn ®æi Hoa Hång Vµng (5 Hoa Hång PhÊn + 7 Vµng)/bhta5_exchange_rose2")
--		-- Sö dông hoa hång vµng
--		tinsert(tbSayDialog,"Sö dông hoa hång vµng/UseYellowRose")
--	end
   	if nDate >= 20140318 and nDate <= 20140320 then
		tinsert(tbSayDialog, "Trao gi¶i li xi 3 tû/TraoThuong2Ty_Menu")
	end
	local tbFeatureMenu = FeatureMenu()
	if nDate >= 20141107 and nDate <= 20141130 then
--		tinsert(tbSayDialog, "Mua 1000 Hå Keo (tiªu hao 79 vµng)/#nguyenlieu_thang4(1)")
--		tinsert(tbSayDialog, "Mua 1000 GiÊy Ngò S¾c (tiªu hao 79 vµng)/#nguyenlieu_thang4(2)")
		tinsert(tbSayDialog, "Event ChÝnh Th¸ng 11/EventMenu")
		--tinsert(tbSayDialog, "Event MÇm Hoa Th¸ng 10/EventMenu_MamHoa")
	end
	if nDate >= 20130919 and nDate <= 20131013 then	
--		tinsert(tbSayDialog, "Event MÇm C©y/Event_Tree_Thang5")
	end
	if nDate >= 20130919 and nDate <= 20131013 then
		tinsert(tbSayDialog, "Event Hoa Hång/VET_201309_AdditionDialog")
	--	tinsert(tbSayDialog, "Mua c©y th«ng Noel (gi¸ 68 vµng/1c©y)/buy_christmas_tree_coin")	
	--	tinsert(tbSayDialog, "Mua c©y th«ng Noel (gi¸ 19 Xu vËt phÈm/1c©y)/buy_christmas_tree_xu")			
	end
	if nDate >= 20130910 and nDate <= 20130915 then
		tinsert(tbSayDialog, "NhËn 1000 nguyªn liÖu Event ( tiªu hao 100 vâ l©m b¶o h¹p + 100 vµng )/EventThang8_HoTro1")
		tinsert(tbSayDialog, "NhËn 1000 nguyªn liÖu Event ( tiªu hao 39 xu vËt phÈm )/EventThang8_HoTro2")
	end
	for i=1,getn(tbFeatureMenu) do
		tinsert(tbSayDialog, tbFeatureMenu[i])
	end
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function Event_Tree_Thang5()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	tbSayDialog, szSayHead = get_tbJNDialog_info(VET_XA_ACTIVITY_TABLE)
   
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/do_nothing"	)
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function EventMenu_MamHoa()

	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	
	tbSayDialog,szSayHead = VET_201410_AdditionDialog(tbSayDialog, szSayHead);
	
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function EventMenu()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	tbSayDialog, szSayHead = get_tbJNDialog_info(VET_JN_ACTIVITY_TABLE)
	local szNationality = get_nationality_name(GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR))
     szSayHead = szSayHead..format(". B¹n ®ang lµ thÇn d©n cña <color=yellow>%s quèc<color>.", szNationality)
	if VET_CheckIpBonus() == 1 then
		szSayHead = szSayHead..". HiÖn ®ang ch¬i t¹i <color=yellow>Phßng M¸y Th©n ThiÖn<color>."
	end
--		
--	if gf_GetTaskByte(2731, 1) < 2 then
--		tinsert(tbSayDialog, "NhËn th­ëng sö dông ®¹t mèc 3000 c¸c lo¹i b¸nh Trung Thu/prize_max_both_event_3000_choose")
--	elseif gf_GetTaskByte(2731, 1) < 4 then
--		tinsert(tbSayDialog, "NhËn th­ëng sö dông ®¹t mèc 4000 c¸c lo¹i b¸nh Trung Thu/prize_max_both_event_4000_choose")	--prize_max_event_4000_choose
--	end
--	if GetTask(2788) == 4000 and VNG_GetTaskPos(2731,1,1) == 0 then
--		tinsert(tbSayDialog, 1, "NhËn phÇn th­ëng 4000 Tranh Gèi/#EventT10_Max4000_Menu(1,1)")
--	end
--	if GetTask(2789) == 4000 and VNG_GetTaskPos(2731,2,2) == 0 then
--		tinsert(tbSayDialog, 1, "NhËn phÇn th­ëng 4000 Tranh §«ng Hå/#EventT10_Max4000_Menu(2,2)")
--	end
--	if GetTask(2790) == 4000 and VNG_GetTaskPos(2731,3,3) == 0 then
--		tinsert(tbSayDialog, 1, "NhËn phÇn th­ëng 4000 Tranh Th­ Ph¸p/#EventT10_Max4000_Menu(3,3)")
--	end
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function FeatureMenu()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nDate = tonumber(date("%Y%m%d"))
	local nDate1 =  tonumber(date("%Y%m%d%H"))

--     tbSayDialog, szSayHead = VET_201012_03_JingNangDaShiJiangDialog(szSayDialog, szSayHead); 
    	  	 
--	tinsert(tbSayDialog,"Mua 10 Lé Thñy = 1 vµng/BuyWater")
--	tinsert(tbSayDialog, "Mua thuèc trÞ bÖnh/NT_Dialog2")
	
-- Den bu thang 4
--	if nDate>=20120510 and nDate<=20120512 then
--		tinsert(tbSayDialog,"§Òn bï th¸ng 4/DenBuThang4")
--	end
	-- ****************** Quay sè Ingame th¸ng 2012******************
	if nDate >= 20131219 and nDate < 20140101 then
		tinsert(tbSayDialog,"NhËn th­ëng may m¾n/lucky_award")		
	end	
	-- Vipcare thang 4
	if nDate>=20120420 and nDate<=20120722 then
		tinsert(tbSayDialog, "Ta muèn nhËn th­ëng VIP/VipCareAward");
	end

--     if nDate >= 20110826 and nDate <= 20111002 then
--  		--tinsert(tbSayDialog, "N­íng b¸nh Trung Thu /#VET_201108_BakedCakes_Dialog(tbSayDialog, szSayHead)")
--  		tinsert(tbSayDialog, VET_201108_STRING_LIST[14].."/active_show")
--		tinsert(tbSayDialog, VET_201108_STRING_LIST[1].."/active_oven")
--		tinsert(tbSayDialog, VET_201108_STRING_LIST[2].."/buy_match_201108")
--  	end
  	
--	if nDate >= 20110624 and nDate <= 20110703 and (nNation == 10 or nNation == 52 or nNation == 17 or nNation == 3) then
--		tinsert(tbSayDialog,"Ta muèn sö nhËn phÇn th­ëng vinh dù server trong cuéc thi Karaoke/reward_karaoke_2011")
--	end
--	
--	if nDate >= 20100917 and nDate <= 20100924 and (nNation == 6 or nNation == 4 or nNation == 51 or nNation == 3) then
--		tinsert(tbSayDialog,"Ta muèn sö dông ph¸o hoa thÇn t­îng Vâ L©m 2/use_firework1")
--	end
--	
--	if nDate >= 20110422 and nDate <= 20110529 then
--    		szSayHead = VET_STR_201104_LIBERATION_OPERATING_DLG[4]
--    		tinsert(tbSayDialog,VET_STR_201104_LIBERATION_OPERATING_DLG[1])
--		tinsert(tbSayDialog,VET_STR_201104_LIBERATION_OPERATING_DLG[2])
--    	end
--	
--	 if nDate >= 20110401 and nDate <= 20110417 then
--    		szSayHead = VET_TB_201103_OPERATING_DLG[1]
--    		tinsert(tbSayDialog, format("%s/%s",VET_TB_201103_OPERATING_DLG[5],"VET_201103_Operating_SetAwardModeDlg"))
--    		tinsert(tbSayDialog, format("%s/%s",VET_TB_201103_OPERATING_DLG[4],"VET_201103_Operating_GetFinalAwardDlg"))
--     end
--     
--     if nDate >= 20110125 and nDate <= 20110327 then
--     		szSayHead = "Ho¹t ®éng th¸ng 3 diÔn ra trong thêi gian tõ ngµy 25 th¸ng 2 n¨m 2011 ®Õn 24 giê ngµy 27 th¸ng 3 n¨m 2011, néi dung chi tiÕt t¹i trang chñ <color=red>http://volam2.zing.vn<color>"
--     		tinsert(tbSayDialog, format("%s/%s",VET_TB_201102_OPERATING_DLG[5],"VET_201102_Operating_SetAwardModeDlg"))
--     	end
     	--tinsert(tbSayDialog,"NhËn th­ëng Hoµng Kim LÖnh Bµi/golden_award")	
 --    if nDate >= 20121129 then
--		tinsert(tbSayDialog,"NhËn th­ëng L«i Hæ LÖnh/platinum_award")	
--	end
	--Ph¸o hoa mõng phiªn b¶n míi th¸ng 9
	if nDate >= 20110820 and nDate <= 20151231 then
		tinsert ( tbSayDialog, "NhËn Ph¸o Hoa mõng n¨m míi/Confirm_VET_201106_Give_Fire" )	--VET_201106_Give_Fire
	end
	tinsert(tbSayDialog,"Ta muèn ®æi 1 §¹i Ng©n PhiÕu lÊy 100 vËt phÈm Xu/exchange_xu")	
	tinsert(tbSayDialog,"NhËn th­ëng tÝch lòy online/IpBonus")	
	tinsert(tbSayDialog,"B¹n §ång Hµnh/pet_init")
--	tinsert(tbSayDialog,"Ta muèn mua mÆt n¹ S¸t Thñ §­êng (60 vµng)/buy_mask")	
--	tinsert(tbSayDialog,"Ta muèn nép Cñi Kh«/give_wood_201012")	
--	if nDate >= 20110422 and nDate <= 20110529 then
--		tinsert(tbSayDialog, format("%s/%s", format(VET_TB_201102_PLANT_DLG[1],VET_TB_201102_PLANT_NPC_NAME[1]),"VET_201102_Plant_ActiveCheck"));
--		tinsert(tbSayDialog, format("%s/%s", format(VET_TB_201102_PLANT_DLG[2],VET_TB_201102_PLANT_ITEM_TITLE[1], 1,VET_TB_201102_PLANT_ITEM_TITLE[1],20,VET_TB_201102_PLANT_ITEM_TITLE[2]),"VET_201102_Plant_BuyItem"));
--	end
	
--	tinsert(tbSayDialog,"Trang tr­íc/SelectSay")
--	tinsert(tbSayDialog,"Trang sau/NextPage2")
--	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)
	return tbSayDialog
end


function NextPage()
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function NextPage2()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nDate = tonumber(date("%Y%m%d"))

      if nDate >= 20101210 and nDate <= 20110109 then
    		szSayHead = "<color=yellow>Ho¹t ®éng mõng Gi¸ng Sinh<color> b¾t ®Çu tõ <color=red>ngµy 10/12/2010 ®Õn ngµy 09/1/2011<color>. Néi dung chi tiÕt vui lßng t×m hiÓu t¹i trang chñ <color=green>http://volam2.zing.vn<color>"
   	 end
   	 
     if nDate >= 20110401 and nDate <= 20110417 then
    		szSayHead = VET_TB_201103_OPERATING_DLG[1]
    		tinsert(tbSayDialog, format("%s/%s",VET_TB_201103_OPERATING_DLG[4],"VET_201103_Operating_GetFinalAwardDlg"))
     end
     
     if nDate >= 20110125 and nDate <= 20110327 then
     		szSayHead = "Ho¹t ®éng th¸ng 3 diÔn ra trong thêi gian tõ ngµy 25 th¸ng 2 n¨m 2011 ®Õn 24 giê ngµy 27 th¸ng 3 n¨m 2011, néi dung chi tiÕt t¹i trang chñ <color=red>http://volam2.zing.vn<color>"
     		tinsert(tbSayDialog, format("%s/%s",VET_TB_201102_OPERATING_DLG[4],"VET_201102_Operating_GetFinalAwardDlg"))
     	end

--	tinsert(tbSayDialog,"§æi vËt phÈm C«ng Thµnh/exchange_citywar")	
--	tinsert(tbSayDialog,"Chuéc l¹i qu©n c«ng tæn thÊt trong ngµy (1 ®iÓm = 2 b¹c)/take_jungong_back")
	--tinsert(tbSayDialog,"Trang tr­íc/NextPage")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)

	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function Viet_0912_GetXiangCaoDanGao()
	local SourceTable = {{"C©y KÑo Gi¸ng Sinh", {2, 1, 30138, 4}}, {"¤ng giµ tuyÕt", {2, 1, 30125, 1}}};
	local DestTable = {{"B¸nh Kem Vani", 100, {2, 1, 30124, 1}}};
	if GetItemCount(2,1,30138) < 4 or GetItemCount(2,1,30125) < 1 then
		Talk(1,"SelectSay","Nguyªn liÖu kh«ng ®ñ!")
		return
	end
	local szFullTitle = VIET_0912_STR_EVENT_LOG_TITLE
	gf_ExchangeItem(SourceTable, DestTable, szFullTitle, 0, 0, 1, 10, VIET_0912_NPC_NAME_1, 1);
	SelectSay()	
end

function Viet_0912_GetMaxXiangCaoDanGao()
	if GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT) > VIET_0912_XIANGCAODANGAO_MAX_COUNT then
		Talk(1, "", "B¹n ®· nhËn phÇn th­ëng nµy råi!")
		return 0;
	end
	if GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT) == VIET_0912_XIANGCAODANGAO_MAX_COUNT then
		if GetFreeItemRoom() < 2 then	
			Talk(1, "", "Hµnh trang ng­¬i kh«ng ®ñ 2 « trèng!")
			return 0;
		end
		SetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT, VIET_0912_TASK_XIANGCAODANGAO_COUNT + 1)
		ModifyExp(20000000)
		local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
		gf_EventGiveRandAward(VIET_0912_XIANGCAODANGAO_AWARD_FULL, 10000, 2, szFullLogTitle, "Max Event");
	else
		Talk(1, "", "B¹n ch­a sö dông ®ñ sè l­îng B¸nh Kem Vani!");
	end
end

function clear_pk_value()
	local nPK = GetPKValue()
	if nPK == 0 then
		Talk(1, "", "§iÓm PK hiÖn t¹i cña c¸c h¹ ®ang lµ 0, kh«ng cÇn ph¶i tÈy PK!")
		return
	else	
		local tbSayDialog = {}
		local nSaySize = 0
		local szSayHead = format("§iÓm PK cña c¸c h¹ ®ang lµ %d, cÇn cã %d giê ñy th¸c B¹ch C©u Tiªn §¬n, %d giê ñy th¸c Tam Thanh Tiªn §¬n, %d giê ñy th¸c Lôc ThÇn Tiªn §¬n ®Ó tiÕn hµnh tÈy ®iÓm. Cã muèn tÈy ®iÓm PK kh«ng?", nPK, nPK*2, nPK, nPK)
		tinsert(tbSayDialog,"§ång ý/clear_pk")
		tinsert(tbSayDialog,"Kh«ng ®æi n÷a/dialog_over")
		nSaySize = getn(tbSayDialog)
		Say(szSayHead, nSaySize, tbSayDialog)
	end
end

function clear_pk()
	local nPK = GetPKValue()
	local nExBigBCH = GetTask(2508)
	local nExBigLTH = EatLiushen(3,0)
	local nExBigTTH = EatSanqin(3,0)
	
	if nExBigBCH < (120 * nPK) then
		Talk(1,"",szNpcName.."Kh«ng ®ñ giê ñy th¸c B¹ch C©u Tiªn §¬n!")
		return
	elseif nExBigTTH < (60 * nPK) then
		Talk(1,"",szNpcName.."Kh«ng ®ñ giê ñy th¸c Tam Thanh Tiªn §¬n!")
		return
	elseif nExBigLTH < (60 * nPK) then
		Talk(1,"",szNpcName.."Kh«ng ®ñ giê ñy th¸c Lôc ThÇn Tiªn §¬n!")
		return
	else
		SetTask(2508,nExBigBCH - (120 * nPK))
		EatLiushen(3,-(60 * nPK))
		EatSanqin(3,-(60 * nPK))
		AddPKValue(nPK * (-1))
		WriteLogEx("Hoat dong thang 5","tÈy "..nPK.." ®iÓm PK")			
	end
end

function exchange_xu()
	if GetItemCount(2,1,199) < 1 then
		Talk(1, "", "§¹i hiÖp ch­a mang theo §¹i Ng©n PhiÕu mµ ®ßi ®æi Xu µ?")
		return
	end
	if gf_Judge_Room_Weight(2, 2," ") ~= 1 then
        	return
    end
    if DelItem(2,1,199,1) == 1 then
    		gf_AddItemEx2({2,1,30230, 100}, "Xu", "Doi Dai Ngan Phieu ra Xu", "CNDSK")
    end
    SelectSay()
end

function dialog_over()
end

  --NhËn ph¸o hoa mõng phiªn b¶n TMT
function VET_201106_Give_Fire()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead ="NhËn ph¸o hoa mçi ngµy. §¹i hiÖp cã thÓ sö dông chøc n¨ng VIP ®Ó nh©n ®«i ®iÓm khi sö dông ph¸o hoa."
	
	tinsert(tbSayDialog,"NhËn ph¸o hoa mçi ngµy/Confirm_VET_201106_Give_Fire")	
	--tinsert(tbSayDialog,"KÝch ho¹t sö dông ph¸o hoa d¹ng VIP (tiªu hao 12 Xu vËt phÈm)/Active_VET_201106_Give_Fire")		
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over"	)

	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function Active_VET_201106_Give_Fire()
	VietResetDate()
	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) == 1 then
		Talk(1, "", "H«m nay b¹n ®· kÝch ho¹t sö dông ph¸o hoa d¹ng VIP råi !!!!")
		return
	end
	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) ~= 0 then
		Talk(1, "", "H«m nay b¹n ®· kÝch ho¹t sö dông ph¸o hoa d¹ng Th­êng råi !!!!")
		return
	end

	if GetItemCount(2,1,30230) < 12 then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ®ñ Xu vËt phÈm ®Ó kick ho¹t VIP?")
		return
	end
	DelItem(2,1,30230,12)
	SetTask(TSK_ACTIVE_VIP_PHAOHOA, 1)
	gf_WriteLogEx("KICK HOAT VIP", "kick ho¹t thµnh c«ng", 1, "VIP ph¸o hoa")
end


function Confirm_VET_201106_Give_Fire()
	local nUsedDate = floor(GetTask(TSK_DAHONGBAO_201101) / 1000)
	local nDate = tonumber(date("%y%m%d"))
	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
        	return
    end	
	if GetLevel() < 73 then
		Talk(1, "", "§¼ng cÊp 73 trë lªn míi cã thÓ tham gia ho¹t ®éng nµy!")
		return
	end
	
--	if nDate > 121230 then
--		Talk(1,"","§· hÕt thêi h¹n sù kiÖn!")
--		return
--	end
	
	if nUsedDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	local nCount = floor(mod(GetTask(TSK_DAHONGBAO_201101), 1000) / 100)
	local nMaxRecv = 60
	if nCount >= 1 then
		Talk(1,"","H«m nay ®¹i hiÖp ®· hÕt lÇn nhËn ph¸o hoa !!!")
		return
	end
	
--	if nCount == 1 then
--		if GetCash() < 1600000 then
--			Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ vµng !!!")
--			return
--		end
--		Pay(1600000)
--		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Ph¸o Hoa mõng phiªn b¶n míi lÇn 2", "Phao hoa phien ban moi thang 6", "nhËn "..nMaxRecv.." Ph¸o hoa")
--	elseif nCount ==2 then
--			if GetItemCount(2,1,30230) < 40 then
--			Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ Xu vËt phÈm !!!")
--			return
--		end
--		DelItem(2,1,30230,40)
--		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Ph¸o Hoa mõng phiªn b¶n míi lÇn 3", "Phao hoa phien ban moi thang 6", "nhËn "..nMaxRecv.." Ph¸o hoa")
--	else
		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "NhËn Ph¸o Hoa mçi ngµy", "Phao hoa CNDSK 2013 bk", "nhËn "..nMaxRecv.." Ph¸o hoa")
		gf_WriteLogEx("Phao hoa CNDSK 2013", "nhËn 60 ph¸o hoa", 1, "NhËn Ph¸o Hoa mçi ngµy")
--	end
	
	Msg2Player("B¹n nhËn ®­îc "..nMaxRecv.." ph¸o hoa.")
	SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 100)
end

function reward_karaoke_2011()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate > 110703 then
		Talk(1,"","§· hÕt thêi gian nhËn th­ëng!")
		return
	end
	
	if nNationality ~= nNation then
		Talk(1, "", "B¹n kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return
	end
	
	if gf_GetTaskBit(TSK_GIVE_AWARD_CNDSK, BIT_KARAOKE2011) == 1 then
		Talk(1, "","B¹n ®· nhËn phÇn th­ëng råi")
		return
	end
	
	if GetLevel() < 73 then
		Talk(1, "", "§¼ng cÊp 73 trë lªn míi cã thÓ nhËn th­ëng!")
		return
	end
	
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "ThiÕu hiÖp ch­a v« m«n ph¸i nªn kh«ng thÓ nhËn th­ëng!" )
		return
	end
	
	local tKaraokeAward = 
	{
		[3]   = 30000000,
		[10] = 10000000,
		[17] = 20000000,
		[52] = 10000000,
	}
	
	local nExp = tKaraokeAward[nNationality]
	gf_SetTaskBit(TSK_GIVE_AWARD_CNDSK, BIT_KARAOKE2011, 1)
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm")
end	
------------------------
-- §æi Kem Socola lÊy ®iÓm kinh nghiÖm
function ChangeSoCola()
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = floor(GetTask(TKS_KSOCOLA_TIMES)/100)
	if nDate ~= nCurdate then
		SetTask(TKS_KSOCOLA_TIMES , nDate*100)
	end
	if GetItemCount(2,1,30325) < 10 then
		Talk(1,"","§¹i hiÖp mang kh«ng ®ñ 10 Kem Socola")
		return
	end
	local nUse = mod(GetTask(TKS_KSOCOLA_TIMES),100)
	if nUse >= 4 then
		Talk(1,"","H«m nay ®¹i hiÖp ®æi 4 lÇn råi. Ngµy mai quay l¹i")
		return
	end
	
	if DelItem(2,1,30325,10) == 1 then
		ModifyExp(2500000)
		Msg2Player("B¹n ®· nhËn ®­îc 2500000 ®iÓm kinh nghiÖm")
		SetTask(TKS_KSOCOLA_TIMES,GetTask(TKS_KSOCOLA_TIMES)+1)
	end
end

tbItem = {
	{{2,1,30086,24,4}, "H¹t gièng", 7*24*60*60},
	{{2,1,9999,1,4},"Qu©n c«ng ch­¬ng", 7*24*60*60},
	{{2,1,9998,1,4},"Qu©n c«ng §¹i", 7*24*60*60},
	{{2,1,9977,1,4},"Qu©n c«ng Huy Hoµng", 7*24*60*60},
	{{2,1,1017,1,4}, "S­ m«n lÖnh kú", 7*24*60*60},

}
function get_NewRegis()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if gf_Judge_Room_Weight(30, 100," ") ~= 1 then
        	return
    end
	if gf_GetExtPointByte(1,1) <= 0 then
		Talk(1, "", "§¹i hiÖp ch­a kÝch ho¹t code hoÆc ®· nhËn th­ëng råi nªn kh«ng thÓ nhËn th­ëng ®­îc n÷a!!!")
		return
	end 
	if  gf_GetExtPointByte(1,1) == 1 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			for i = 1, getn(tbItem) do
				gf_AddItemEx2(tbItem[i][1], tbItem[i][2], "NHAN THUONG TAN THU", "nhËn thµnh c«ng", tbItem[i][3])
			end		
			Earn(240000)	
		end
	else
		Talk(1, "", "§¹i hiÖp ch­a kÝch ho¹t code hoÆc ®· nhËn th­ëng råi nªn kh«ng thÓ nhËn th­ëng ®­îc n÷a!!!")
		return
	end
end


function prize_max_event_4000()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
	if GetTask(2731) < 1 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 4000 Cua Rang Muèi vµ 4000 Cµng GhÑ N­íng Muèi ít!!!!")
		return 0
	end
	if GetTask(2731) > 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0		
	end

	LIB_Award.szLogTitle = "Hoat dong thang 7 nam 2012"
	LIB_Award.szLogAction = "NhËn mèc event 4000"
	
	local tbAward1 = {item = {{gdp={2,1,30341,5}, name = "Tµng R­¬ng"}}, nChankhi = 10000}
	local tbAward2 = {item = {{gdp={2,1,30341,10}, name = "Tµng R­¬ng"}}, nChankhi = 10000}
	local tbAward3 = {item = {{gdp={2,1,30341,15}, name = "Tµng R­¬ng"}}, nChankhi = 10000}
	local tbAward4 = {item = {{gdp={2,1,30341,20}, name = "Tµng R­¬ng"}}, nChankhi = 10000}
	local tbAward5 = {item = {{gdp={2,1,30341,25}, name = "Tµng R­¬ng"}}, nChankhi = 10000}
	local tbAwardSet = {
		[1] = {[1] = tbAward1, nRate = 55.550},
		[2] = {[1] = tbAward2, nRate = 33.330},
		[3] = {[1] = tbAward3, nRate = 10.100},
		[4] = {[1] = tbAward4, nRate = 1.019},
		[5] = {[1] = tbAward5, nRate = 0.001},
	}
    	if LIB_Award:AwardByRate(tbAwardSet) == 1 then
		SetTask(2731,2)
    	end
 end
 
 
 function prize_max_event_6000()
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
	if GetTask(2731) < 3 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 6000 Cua Rang Muèi vµ 6000 Cµng GhÑ N­íng Muèi ít!!!!")
		return 0
	end
	if GetTask(2731) > 3 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0		
	end

	LIB_Award.szLogTitle = "Hoat dong thang 7 nam 2012"
	LIB_Award.szLogAction = "NhËn mèc event 6000"
	
	local tbAward1 = {item = {{gdp={2,1,30346,1}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAward2 = {item = {{gdp={2,1,30346,2}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAward3 = {item = {{gdp={2,1,30346,3}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAward4 = {item = {{gdp={2,1,30346,4}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAward5 = {item = {{gdp={2,1,30346,5}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAward6 = {item = {{gdp={2,1,30346,6}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAward7 = {item = {{gdp={2,1,30346,7}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAward8 = {item = {{gdp={2,1,30346,8}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAward9 = {item = {{gdp={2,1,30346,9}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAward10 = {item = {{gdp={2,1,30346,10}, name = "M¶nh B¹ch Kim"}}, nChankhi = 10000}
	local tbAwardSet = {
		[1] = {[1] = tbAward1, nRate = 50.551},
		[2] = {[1] = tbAward2, nRate = 30.551},
		[3] = {[1] = tbAward3, nRate = 15.551},
		[4] = {[1] = tbAward4, nRate = 0.999},
		[5] = {[1] = tbAward5, nRate = 0.888},
		[6] = {[1] = tbAward6, nRate = 0.777},
		[7] = {[1] = tbAward7, nRate = 0.666},
		[8] = {[1] = tbAward8, nRate = 0.010},
		[9] = {[1] = tbAward9, nRate = 0.006},
		[10] = {[1] = tbAward10, nRate = 0.001},
	}
    	if LIB_Award:AwardByRate(tbAwardSet) == 1 then
		SetTask(2731,4)
    	end
 end
 
 
 function prize_max_event_8000()
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
	if GetTask(2731) < 5 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 8000 Cua Rang Muèi vµ 8000 Cµng GhÑ N­íng Muèi ít!!!!")
		return 0
	end
	if GetTask(2731) > 5 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0		
	end

	LIB_Award.szLogTitle = "Hoat dong thang 7 nam 2012"
	LIB_Award.szLogAction = "NhËn mèc event 10000"
	
	local tbAward1 = {item = {{gdp={2,95,204,2}, name = "Thiªn Cang LÖnh"}}, nChankhi = 10000}
	local tbAward2 = {item = {{gdp={2,95,204,4}, name = "Thiªn Cang LÖnh"}}, nChankhi = 10000}
	local tbAward3 = {item = {{gdp={2,95,204,6}, name = "Thiªn Cang LÖnh"}}, nChankhi = 10000}
	local tbAward4 = {item = {{gdp={2,95,204,8}, name = "Thiªn Cang LÖnh"}}, nChankhi = 10000}
	local tbAward5 = {item = {{gdp={2,95,204,10}, name = "Thiªn Cang LÖnh"}}, nChankhi = 10000}
	
	local tbAwardSet = {
		[1] = {[1] = tbAward1, nRate = 88.888},
		[2] = {[1] = tbAward2, nRate = 10.123},
		[3] = {[1] = tbAward3, nRate = 0.696},
		[4] = {[1] = tbAward4, nRate = 0.292},
		[5] = {[1] = tbAward5, nRate = 0.001},
	}
    	if LIB_Award:AwardByRate(tbAwardSet) == 1 then
		SetTask(2731,6)
    	end
 end

 function prize_max_event_3000_choose()
 	local nCheckKinhMach = MeridianGetLevel()
 	local nCheckPet = mod(GetTask(TASK_VNG_PET), 100)
 	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Chän 1 trong 3 lo¹i phÇn th­ëng:  !!!!"
	
	tinsert(tbSayDialog, "PhÇn th­ëng 1.000.000.000 ®iÓm kinh nghiÖm/#confirm_prize_max_event_3000_choose(1)")
	tinsert(tbSayDialog, "PhÇn th­ëng 1 chuyÓn sinh ®¬n (60 ngµy sö dông)/#confirm_prize_max_event_3000_choose(2)")
	tinsert(tbSayDialog, "PhÇn th­ëng 30.000 ®iÓm ch©n khÝ/#confirm_prize_max_event_3000_choose(3)")
	tinsert(tbSayDialog,"Ta chØ hái th¨m/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	
	Say(szSayHead, nSaySize, tbSayDialog); 
 end
 function confirm_prize_max_event_3000_choose(nType) 
  	local nCheckKinhMach = MeridianGetLevel()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)

	if nCheckMaxEvent1 < 1 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 3000 Sinh Tè vµ 3000 Tr¸i C©y dÇm!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0
	end
 	if gf_Judge_Room_Weight(2,50) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end	
	if nType == 3 then
		if nCheckKinhMach < 1 then
			Talk(1,"","§¹i hiÖp ch­a kÝch ho¹t kinh m¹ch nªn kh«ng thÓ nhËn th­ëng !!!!")
			return 0
		end
	end
	--SetTask(2731,2)
	gf_SetTaskByte(2731, 1, 2)		
	if nType == 1 then
		ModifyExp(1000000000)
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 3000 lo¹i 1 tû ®iÓm kinh nghiÖmÝ")
	end
	if nType == 2 then
		gf_AddItemEx2({2,1,30345, 1}, "ChuyÓn sinh ®¬n", "Log phu Hoat dong thang 07 nam 2013", "ChuyÓn Sinh §¬n", 60 * 24 * 3600)
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 3000 lo¹i chuyÓn sinh ®¬n")
	end
	if nType == 3 then
		AwardGenuineQi(30000);
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 3000 lo¹i ch©n khÝ")
	end	

---phÇn th­ëng
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn th­ëng mèc 3000 thµnh c«ng")
	gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "Tæng nhËn mèc event 3000")
 end
 function prize_max_event_4000_choose()
 	local nCheckKinhMach = MeridianGetLevel()
 	local nCheckPet = mod(GetTask(TASK_VNG_PET), 100)
 	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Chän 1 trong 3 lo¹i phÇn th­ëng:  !!!!"
	
	tinsert(tbSayDialog, "PhÇn th­ëng 2.000.000.000 ®iÓm kinh nghiÖm/#confirm_prize_max_event_4000_choose(1)")
	tinsert(tbSayDialog, "PhÇn th­ëng 2 chuyÓn sinh ®¬n (60 ngµy sö dông)/#confirm_prize_max_event_4000_choose(2)")
	tinsert(tbSayDialog, "PhÇn th­ëng 60.000 ®iÓm ch©n khÝ/#confirm_prize_max_event_4000_choose(3)")
	tinsert(tbSayDialog,"Ta chØ hái th¨m/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	
	Say(szSayHead, nSaySize, tbSayDialog); 
 end
 function confirm_prize_max_event_4000_choose(nType) 
  	local nCheckKinhMach = MeridianGetLevel()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)

	if nCheckMaxEvent1 < 3 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 4000 Sinh Tè vµ 4000 Tr¸i C©y dÇm!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 3 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0
	end
 	if gf_Judge_Room_Weight(4,50) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end	
	if nType == 3 then
		if nCheckKinhMach < 1 then
			Talk(1,"","§¹i hiÖp ch­a kÝch ho¹t kinh m¹ch nªn kh«ng thÓ nhËn th­ëng !!!!")
			return 0
		end
	end
	--SetTask(2731,2)
	gf_SetTaskByte(2731, 1, 4)		
	if nType == 1 then
		ModifyExp(2000000000)
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 3000 lo¹i 1 tû ®iÓm kinh nghiÖmÝ")
	end
	if nType == 2 then
		gf_AddItemEx2({2,1,30345, 2}, "ChuyÓn sinh ®¬n", "Log phu Hoat dong thang 07 nam 2013", "ChuyÓn Sinh §¬n", 60 * 24 * 3600)
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 3000 lo¹i chuyÓn sinh ®¬n")
	end
	if nType == 3 then
		AwardGenuineQi(60000);
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 3000 lo¹i ch©n khÝ")
	end	

---phÇn th­ëng
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn th­ëng mèc 4000 thµnh c«ng")
	gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "Tæng nhËn mèc event 4000")
 end
 
function prize_max_both_event_3000_choose()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	if gf_Judge_Room_Weight(10,250) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
 	if nCheckMaxEvent1 < 1 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 3000 c¸i mçi lo¹i B¸nh Trung Thu!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0
	end
	
	gf_SetTaskByte(2731, 1, 2)
	gf_AddItemEx2({2, 95,  204, 1}, "Thiªn Cang LÖnh", "Log phu Hoat dong thang 09 nam 2013", "1 Thiªn Cang LÖnh")
	gf_AddItemEx2({2,1,30370, 1}, "Thiªn M«n Kim LÖnh", "Log phu Hoat dong thang 09 nam 2013", "1Thiªn M«n Kim LÖnh")
	Msg2Player("B¹n nhËn ®­îc 1 tû 500 triÖu ®iÓm kinh nghiÖm, 1 thiªn cang lÖnh, 1 thiªn m«n kim lÖnh")	
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + 50000)
	else
		SetTask(701,GetTask(701) - 50000)
	end
	Msg2Player("B¹n nhËn ®­îc 50000 ®iÓm c«ng tr¹ng")	
--	AwardGenuineQi(50000)
	ModifyExp(1500000000)
	Pet_AddGP(200)
	WriteLogEx("Hoat dong thang 09 nam 2013", "nhËn th­ëng mèc 3000 ®­îc 200 linh lùc ", 1, "200 ®iÓm linh lùc")
	Msg2Player("B¹n nhËn ®­îc 200 §iÓm Linh Lùc B¹n §ång Hµnh")
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn th­ëng mèc 3000 thµnh c«ng")
	gf_WriteLogEx("Hoat dong thang 09 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 3000")
 end	
function prize_max_both_event_4000_choose()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	if gf_Judge_Room_Weight(10,250) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
 	if nCheckMaxEvent1 < 3 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 4000 c¸i mçi lo¹i B¸nh Trung Thu!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 3 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0
	end
	
	gf_SetTaskByte(2731, 1, 4)
	gf_AddItemEx2({2, 95,  204, 2}, "Thiªn Cang LÖnh", "Log phu Hoat dong thang 09 nam 2013", "2 Thiªn Cang LÖnh")
	gf_AddItemEx2({2,1,30370, 2}, "Thiªn M«n Kim LÖnh", "Log phu Hoat dong thang 09 nam 2013", "2Thiªn M«n Kim LÖnh")
	Msg2Player("B¹n nhËn ®­îc 2 tû ®iÓm kinh nghiÖm, 2 thiªn cang lÖnh, 2 thiªn m«n kim lÖnh")		
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + 50000)
	else
		SetTask(701,GetTask(701) - 50000)
	end
	Msg2Player("B¹n nhËn ®­îc 50000 ®iÓm c«ng tr¹ng")	
--	AwardGenuineQi(50000)
	ModifyExp(2000000000)
	Pet_AddGP(200)
	WriteLogEx("Hoat dong thang 09 nam 2013", "nhËn th­ëng mèc 3000 ®­îc 200 linh lùc ", 1, "200 ®iÓm linh lùc")
	Msg2Player("B¹n nhËn ®­îc 200 §iÓm Linh Lùc B¹n §ång Hµnh")
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn th­ëng mèc 4000 thµnh c«ng")
	gf_WriteLogEx("Hoat dong thang 09 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 4000")
 end	
  
 function prize_max_both_event_6000_choose()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
 	if nCheckMaxEvent1 < 5 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 3000 vËt phÈm Hu©n Ch­¬ng vµ 3000 vËt phÈm B»ng Khen!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 5 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0
	end
	--SetTask(2731,1)
	gf_SetTaskByte(2731, 1, 6)
	gf_AddItemEx2({2,1,30344, 2}, "ThÇn Tµi B¶o R­¬ng", "Log phu Hoat dong thang 04 nam 2013", "2 ThÇn Tµi B¶o R­¬ng")
	AwardGenuineQi(35000)
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn th­ëng mèc 3000 thµnh c«ng")
	gf_WriteLogEx("Hoat dong thang 04 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 3000")
 end	
 	
 
 function prize_max_event_6000_choose()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 2)
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
	if nCheckMaxEvent1 < 1 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 1111 vËt phÈm Ên L·nh Thæ!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0
	end
	--SetTask(2731,2)
	gf_SetTaskByte(2731, 2, 2)
	
	--gf_AddItemEx2({2,1,30390, 1000}, "1000 M¶nh Thiªn Cang", "Log phu Hoat dong thang 03 nam 2013", "1000 M¶nh Thiªn Cang")
	--gf_AddItemEx2({2,1,30071, 10}, "10 Nh©n s©m v¹n n¨m", "Log phu Hoat dong thang 03 nam 2013", "10 Nh©n s©m v¹n n¨m")
	gf_AddItemEx2({2,95,204, 1}, "Thiªn Cang LÖnh", "Log phu Hoat dong thang 04 nam 2013", "1 Thiªn Cang LÖnh")
	gf_AddItemEx2({2,1,30344, 3}, "ThÇn Tµi B¶o R­¬ng", "Log phu Hoat dong thang 04 nam 2013", "1 ThÇn Tµi B¶o R­¬ng")
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn th­ëng mèc 1111 thµnh c«ng")
	gf_WriteLogEx("Hoat dong thang 04 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 1111")
 end
 
 function prize_max_event_1500_anlanhtho()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 2)
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
	if nCheckMaxEvent1 < 3 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 1500 vËt phÈm Ên L·nh Thæ!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 3 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0
	end
	--SetTask(2731,2)
	gf_SetTaskByte(2731, 2, 4)
	gf_AddItemEx2({2,1,30344, 3}, "ThÇn Tµi B¶o R­¬ng", "Log phu Hoat dong thang 04 nam 2013", "ThÇn Tµi B¶o R­¬ng")
	AwardGenuineQi(39000)
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn th­ëng mèc 1500 thµnh c«ng")
	gf_WriteLogEx("Hoat dong thang 04 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 1500")
 end
 

 function prize_max_event_10000_choose()
 	local nCheckMaxEvent2 = gf_GetTaskByte(2731, 1)
 	if gf_Judge_Room_Weight(12,100) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
	if nCheckMaxEvent2 < 5 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 10000 vËt phÈm Kh¨n §ãng vµ 10000 vËt phÈm Phi Phong N÷ T­íng!!!!")
		return 0
	end
	if nCheckMaxEvent2 > 5 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0
	end
	
	--SetTask(2731,4)
	gf_SetTaskByte(2731, 1, 6)
	
	local nKinhNghiem = 390000000
	ModifyExp(nKinhNghiem)
	gf_AddItemEx2({2,1,30427, 10}, "C­êng hãa quyÓn 15", "Log phu Hoat dong thang 03 nam 2013", "10 C­êng hãa quyÓn 15", 30 * 24 * 3600)
	gf_AddItemEx2({2,1,30071, 10}, "10 Nh©n s©m v¹n n¨m", "Log phu Hoat dong thang 03 nam 2013", "10 Nh©n s©m v¹n n¨m")
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn th­ëng mèc 10000 thµnh c«ng")
	gf_WriteLogEx("Hoat dong thang 03 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 10000")
 end
 function prize_max_event_lixi_choose()
 	local nCheckMaxLixi = gf_GetTaskByte(2731, 2)
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
 		return 0
 	end
	if nCheckMaxLixi < 1 then
		Talk(1,"","§¹i hiÖp ch­a sö dông ®ñ 6800 vËt phÈm L× x× n¨m míi!!!!")
		return 0
	end
	if nCheckMaxLixi > 1 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !!!!")
		return 0
	end
	if GetItemCount(2,1,539,8) < 8 then
		Talk(1,"","§¹i hiÖp kh«ng cã ®ñ 8 bao Hoµng Kim §¹i Hång Bao (chøa 999 vµng)i !!!!")
		return 0
	end
	gf_SetTaskByte(2731, 2, 2)
	DelItem(2,1,539,8)
	gf_WriteLogEx("Hoat dong thang 01 nam 2013", "nhËn th­ëng thµnh c«ng", 1, "NhËn mèc event 6800 l× x×")
	gf_AddItemEx2({0,102,8844, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Hoµng QuËt Khëi", "Log phu Hoat dong thang 01 nam 2013", "Huy Hoµng QuËt Khëi")
	gf_AddItemEx2({0,102,8845, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh Dù QuËt Khëi", "Log phu Hoat dong thang 01 nam 2013", "Vinh Dù QuËt Khëi")
	local nKinhNghiem = 666666666
	ModifyExp(nKinhNghiem)
 end
 function buy_NoelTree(nType)
 	do return 0 end
 	local tCheck = {{68, 0}, {0, 19}}
 	if GetItemCount(2,1,30230) < tCheck[nType][2] then
 		Talk(1,"","B¹n kh«ng ®ñ Xu ®Ó mua c©y th«ng !!!!")
		return 0
 	end
 	if GetCash() < tCheck[nType][1] * 10000 then
 		Talk(1,"","B¹n kh«ng ®ñ Vµng ®Ó mua c©y th«ng !!!!")
		return 0
 	end
 	if nType == 1 then
 		Pay(680000)
 		AddItem(2,1,30471,1)
 	elseif nType == 2 then
 		DelItem(2,1,30230,19)
 		AddItem(2,1,30471,1)
 	else
  		Talk(1,"","B¹n kh«ng ®ñ ®iÒu kiÖn ®Ó mua c©y th«ng !!!!")
		return 0	
 	end
 end
 
 
function EventThang8_HoTro1()
	if gf_Judge_Room_Weight(2,1) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
	end
	if GetItemCount(2,1,30132) < 100 then
		Talk(1,"","C¸c h¹ kh«ng ®ñ 100 vâ l©m b¶o h¹p.")
        	return 0
	end
	if GetCash() < 1000000 then
		Talk(1,"","C¸c h¹ kh«ng cã ®ñ 100 vµng.")
        	return 0
	end
	if DelItem(2,1,30132,100) == 1 and Pay(1000000) == 1 then
		gf_AddItemEx2({2,1,30563,1000}, "GiÊy Tr¾ng", "Hoat dong thang 08 nam 2013", "nhËn më réng event b»ng vµng + VLBH")
	end
 end
 function EventThang8_HoTro2()
 	if gf_Judge_Room_Weight(2,1) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
	end
	if GetItemCount(2,1,30230) < 39 then
		Talk(1,"","C¸c h¹ kh«ng ®ñ 39 xu vËt phÈm.")
        	return 0
	end
	if DelItem(2,1,30230,39) == 1 then
		gf_AddItemEx2({2,1,30563,1000}, "GiÊy Tr¾ng", "Hoat dong thang 08 nam 2013", "nhËn më réng event b»ng xu")
		WriteLogEx("LOG XU VAT PHAM","Më réng event th¸ng 8/2013 b»ng 39 xu")	
	end	
 end
 
 
 function EventT10_Max4000_Menu(nPos2, nPos1)
 	if VNG_GetTaskPos(2731,nPos1,nPos2) ~= 0 then
 		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
 		return 0
 	end
 	if gf_Judge_Room_Weight(1,100) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
	end
	local tbSay = {}
	tinsert(tbSay, "NhËn chuyÓn sinh ®¬n/#EventT10_Max4000_Done(1,"..nPos2..",".. nPos1..")")
	tinsert(tbSay, "NhËn 600.000.000 ®iÓm kinh nghiÖm/#EventT10_Max4000_Done(2,"..nPos2..",".. nPos1..")")
	tinsert(tbSay, "Ta muèn suy nghÜ thªm/gf_DoNothing")
	Say("C¸c h¹ h·y chän phÇn th­ëng m×nh thÝch.", getn(tbSay), tbSay)
 end
 
 
 function EventT10_Max4000_Done(nOpt,nPos2,nPos1)
 	local tbAward = {
		[1] = {item={{gdp={2,1,30345,1}, name="ChuyÓn Sinh §¬n", nExpired = 60*24*3600}}},
		[2] = {nCheck = 0, nExp = 600000000},
 	}
 	if VNG_GetTaskPos(2731,nPos2,nPos1) ~= 0 then
 		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
 		return 0
 	end
 	if gf_Judge_Room_Weight(1,100) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
	end
	VNG_SetTaskPos(2731,1,nPos1,nPos2)
	LIB_Award.szLogTitle = "EVENT THANG 10 MO RONG"
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward[nOpt])
	Talk(1,"","C¸c h¹ ®· nhËn th­ëng thµnh c«ng")
 end
 
 function get_award201403()
 	local nCheckExt = GetExtPoint(5)
 	if nCheckExt ~= 1 then
 		Talk(1, "", "B¹n kh«ng cã trong danh s¸ch nhËn th­ëng hoÆc ®· nhËn th­ëng råi !!!!")
 		return
 	end
 	if AddExtPoint(5,2) == 1 then
 		gf_WriteLogEx("NHAN LAI VAT PHAM EVENT 201403", "nhËn vËt phÈm", 1, "NhËn thµnh c«ng")
 	else
 		gf_WriteLogEx("NHAN LAI VAT PHAM EVENT 201403", "thÊt b¹i", 1, "NhËn thÊt b¹i")
 	end
 	if Vet_Activity_YaoYang_Rand() == 1 then
 		gf_WriteLogEx("NHAN LAI VAT PHAM EVENT 201403 BK", "nhËn vËt phÈm", 1, "NhËn thµnh c«ng")
 	else
 		gf_WriteLogEx("NHAN LAI VAT PHAM EVENT 201403 BK", "thÊt b¹i", 1, "NhËn thÊt b¹i")
 	end
 end
 function nguyenlieu_thang4(nType)
 	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
	end
 	if GetCash() < 790000 then
 		Talk(1, "", "§¹i hiÖp kh«ng ®ñ 79 vµng")
 		return
 	end
 	if Pay(790000) == 1 then
 		if nType == 1 then
 			gf_AddItemEx2({2,1,30638,1000}, "hå keo", "MUA NGUYEN LIEU THANG 4 bk", "mua hå keo")
 			gf_WriteLogEx("MUA NGUYEN LIEU THANG 4", "thµnh c«ng", 1, "mua hå keo")
 		elseif nType == 2 then
 			gf_AddItemEx2({2,1,30637,1000}, "giÊy ngò s¾c", "MUA NGUYEN LIEU THANG 4 bk", "mua giÊy ngò s¾c")
 			gf_WriteLogEx("MUA NGUYEN LIEU THANG 4", "thµnh c«ng", 1, "mua giÊy ngò s¾c")
 		else
 			gf_WriteLogEx("MUA NGUYEN LIEU THANG 4", "thÊt b¹i", 1, "mua vËt phÈm")
 		end
 	end
 	
 end
 