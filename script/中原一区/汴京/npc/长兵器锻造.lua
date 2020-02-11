-- =========================================
-- File : ÖĞÔ­Ò»Çø£¬ãê¾©£¬³¤±øÆ÷¶ÍÔì.lua
-- Name : Äª´ó
-- ID   : 1, 2

--´å³¤ÓÚ2007-06-25Ôö¼ÓIB°æ±¾£ºÑ×µÛÌ××°×ª»»Ïà¹Ø¹¦ÄÜ
--²ß»®ÈË£ºĞ¡ÌìÌì
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂëĞŞ¸Ä¼ÇÂ¼£º2008-02-26½«Ñ×µÛ×°×ª»»ĞŞ¸ÄÎ»ÓÀ¾Ã¿ª·Å

-- =========================================
Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua")
Include("\\script\\task\\lingshi_task.lua")
--==============================Ñ×µÛÌ××°Ïà¹Ø===============================
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
task_start_date = 20080128				--¶Ò»»»î¶¯¿ªÊ¼ÈÕÆÚ
task_end_date = 20080218					--¶Ò»»½áÊøÈÕÆÚ
TaskID_yandi_chg_num = 1288
--ÖØÖıĞèÒª²ÄÁÏÁĞ±í
Tb_refound_mertiral = {
	{
	{2,1,504,4,"N÷ Oa Tinh Th¹ch"},
	{2,0,555,2,"Cµn Kh«n phï"},
	{2,1,503,5,"V« NgÊn Thñy"},
	{2,1,1009,100,"Thiªn Th¹ch Tinh Th¹ch"},
	{2,1,1145,1,"B¶n vÏ ChÕ t¹o Viªm §Õ"},
	},
	{
		{2,1,504,4,"N÷ Oa Tinh Th¹ch"},
		{2,0,555,2,"Cµn Kh«n phï"},
		{2,1,503,5,"V« NgÊn Thñy"},
		{2,1,1009,200,"Thiªn Th¹ch Tinh Th¹ch"},
		{2,1,1190,1,"B¶n vÏ ChÕ t¹o Hoµng §Õ"},
	},
}
--ÖØÖıĞèÒª×°±¸ÁĞ±í
Tb_refound_att = {}
Tb_refound_att[0]	= {0,103,8000,"Viªm §Õ kh«i"}
Tb_refound_att[1]	= {0,100,8000,"Viªm §Õ gi¸p"}
Tb_refound_att[3]	= {0,101,8000,"Viªm §Õ trang"}
--Ñ×»ÆÌú»êĞÅÏ¢
Tb_yanhuang_stone = {2,1,1146,"Viªm Hoµng ThiÕt Hån"}
--ÖıÔì¶ÔÓ¦µÄ¶Ô»°ĞÅÏ¢
Tb_refound_get_dia = {
	{
		"Viªm §Õ gi¸p","","Viªm §Õ trang"
	},
	{	
		"","Hiªn Viªn vò khİ","","Hiªn Viªn ChiÕn","Hiªn Viªn §Êu",
	}
}
Tb_refound_get_dia[1][0] = "Viªm §Õ kh«i"
--»ÆµÛ×°¶ÔÓ¦×°±¸
Tb_huandi_position = {1,2,3}
Tb_huandi_equip = {}
Tb_huandi_equip[2] = {
	{},
	{},
	{0,8,8803,"Hiªn Viªn Cöu Nh­ Tr­îng"},
	{0,0,8804,"Hiªn Viªn H¹o Nhiªn Thñ"},
	{},
	{0,1,8805,"Hiªn Viªn ch©m v« h×nh"},
	{},
	{0,2,8806,"Hiªn Viªn Tö Tinh KiÕm"},
	{0,10,8807,"Hiªn Viªn Phông Hoµng CÇm"},
	{},
	{0,0,8808,"Hiªn Viªn Ngò Nh¹c Thñ"},
	{0,5,8809,"Hiªn Viªn Ph¸ Thiªn C«n"},
	{},
	{0,2,8810,"Hiªn Viªn Hång Qu©n KiÕm"},
	{0,9,8811,"Hiªn Viªn Sinh Tö Bót"},
	{},
	{0,6,8812,"Hiªn Viªn Ph¸ Qu©n Th­¬ng"},
	{0,4,8813,"Hiªn Viªn Khai Thiªn Cung"},
	{},
	{0,7,8814,"Hiªn Viªn ¢m D­¬ng NhÉn"},
	{0,11,8815,"Hiªn Viªn U Minh Tr¶o"},
}
Tb_huandi_equip[4] = {
	{},
	{0,102,8801,"Hiªn Viªn ChiÕn"},
	{0,102,8803,"Hiªn Viªn ChiÕn"},
	{0,102,8805,"Hiªn Viªn ChiÕn"},
	{},
	{0,102,8807,"Hiªn Viªn ChiÕn"},
	{},
	{0,102,8809,"Hiªn Viªn ChiÕn"},
	{0,102,8811,"Hiªn Viªn ChiÕn"},
	{},
	{0,102,8813,"Hiªn Viªn ChiÕn"},
	{0,102,8815,"Hiªn Viªn ChiÕn"},
	{},
 	{0,102,8817,"Hiªn Viªn ChiÕn"},
	{0,102,8819,"Hiªn Viªn ChiÕn"},
	{},
	{0,102,8821,"Hiªn Viªn ChiÕn"},
	{0,102,8823,"Hiªn Viªn ChiÕn"},
	{},
	{0,102,8825,"Hiªn Viªn ChiÕn"},
	{0,102,8827,"Hiªn Viªn ChiÕn"},
} 
Tb_huandi_equip[5] = {
  {},
  {0,102,8802,"Hiªn Viªn §Êu"},
  {0,102,8804,"Hiªn Viªn §Êu"},
  {0,102,8806,"Hiªn Viªn §Êu"},
  {},
  {0,102,8808,"Hiªn Viªn §Êu"},
  {},
  {0,102,8810,"Hiªn Viªn §Êu"},
  {0,102,8812,"Hiªn Viªn §Êu"},
  {},
  {0,102,8814,"Hiªn Viªn §Êu"},
  {0,102,8816,"Hiªn Viªn §Êu"},
  {},
  {0,102,8818,"Hiªn Viªn §Êu"},
  {0,102,8820,"Hiªn Viªn §Êu"},
  {},
  {0,102,8822,"Hiªn Viªn §Êu"},
  {0,102,8824,"Hiªn Viªn §Êu"},
  {},
  {0,102,8826,"Hiªn Viªn §Êu"},
  {0,102,8828,"Hiªn Viªn §Êu"},
}
Tb_huandi_sushao_weapon = {
	{0,3,8801,"Hiªn Viªn To¸i Vò §ao"},
	{0,5,8802,"Hiªn Viªn To¸i Vò C«n"},
}
Tb_equip_position_info = {}
Tb_equip_position_info[0] = {"Viªm §Õ kh«i",1}
Tb_equip_position_info[1] = {"Viªm §Õ gi¸p",1}
Tb_equip_position_info[2] = {"Hiªn Viªn vò khİ",2}
Tb_equip_position_info[3] = {"Viªm §Õ trang",1}
Tb_equip_position_info[4] = {"Hiªn Viªn ChiÕn",2}
Tb_equip_position_info[5] = {"Hiªn Viªn §Êu",2}
Refound_level_max = 15			--ÖØÖıºóµÄ×î¸ßÇ¿»¯¶È
--2007-11-19
--Ôö¼Ó»ÆµÛ×°±¸µÄÖØÖı¹¦ÄÜ£º
Tb_refound_att_name ={"Trang bŞ Viªm ®Õ","Trang bŞ Hoµng §Õ"}
Tb_refound_paper_info = {
	{1145,"B¶n vÏ ChÕ t¹o Viªm §Õ"},
	{1190,"B¶n vÏ ChÕ t¹o Hoµng §Õ"}
}
--================================½áÊø====================================
--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL		= 1925		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
LEVELTASKID49			= 517		-- ÍÌÁú±¦µ¶ÈÎÎñ
TASK49_BEGGING			= 1933		-- 49¼¶½ú¼¶ÈÎÎñ¿ªÊ¼±êÊ¾
FORGETMAIN_NUM			= 1940		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
FORGETOHTER_NUM			= 1941		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
LEV_LEARNRECIPE			= 1926
HaveWeekend				= 9001		-- ÖÜÄ©Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
strName = "";
strTitle = "";

--*****************************************MAINº¯Êı*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Tuy ng­¬i cã thÓ theo ta häc c¸ch chÕ t¹o trang bŞ cã linh khİ, nh­ng muèn t×m hiÓu trang bŞ B¸t Qu¸i, ng­¬i nªn ®i t×m ng­êi cña C«ng D· ThÕ Gia!");
	end;
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	-----------------------------------------ĞÂÊÖÈÎÎñ-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
		Say(strTitle.."§Õn <color=yellow>CÊp 10<color> cã thÓ ®Õn <color=yellow>Thµnh §«<color> gÆp <color=yellow>Du Ph­¬ng ®¹i phu<color> t×m hiÓu <color=yellow>kü n¨ng sèng<color>!",0)
		TaskTip("§Õn cÊp 10 cã thÓ ®Õn Thµnh §« t×m Du Ph­¬ng ®¹i phu.")        
		return 
	end
	---------------------------------------------Ö÷¶Ô»°-------------------------------------------
	--local date_now = zgc_pub_date_num()
	--if date_now >= task_start_date and date_now <= task_end_date then
		local strtab = {
--		"Ñ×µÛ×°±¸ºÍ»ÆµÛ×°±¸µÄÏà¹ØÊÂÏî/yandi_chg_dia_main",
		"Nh÷ng ®iÒu liªn quan vÒ rÌn binh khİ dµi/old_dia",
--		"Nh÷ng ®iÒu liªn quan vÒ trang bŞ B¸t Qu¸i/bagua",
		"Häc c¸ch lµm vò khİ linh khİ cÊp 76/xinwuqi"
		}
		if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
			tinsert(strtab,"tiÕp tôc nhiÖm vô häc tËp Linh Th¹ch B¸t Qu¸i/task_new3");
		end
		if GetLifeSkillMaxLevel(1, 2) == 79 then
			tinsert(strtab, "Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level");
		end 
		tinsert(strtab,"Rêi khái/SayHello")
		Say("Ta tªn M¹c §¹i, truyÒn nh©n ®êi thø 73 cña Can T­íng M¹c Tµ, së tr­êng rÌn c¸c lo¹i vò khİ ThÇn Binh, nhÊt lµ nh÷ng binh khİ dµi nh­: c«n, tr­îng. Trong thiªn h¹ kh«ng thÓ t×m ra ng­êi thø hai. Víi l¹i gÇn ®©y ta ph¸t hiÖn ra ph­¬ng ph¸p chÕ t¹o <color=red>trang bŞ Viªm §Õ<color> nh­ trong truyÒn thuyÕt nãi, ng­¬i cã muèn nghe kh«ng?",
			getn(strtab),
			strtab)
	--else
	--	Say("<color=green>Äª´ó<color>£ºÎÒÊÇ¸É½«ÄªĞ°µÄµÚÆßÊ®Èı´ú´«ÈË£­Äª´ó£¬ÉÃ³¤¶ÍÔì¸÷ÖÖÉñ±øÀûÆ÷£¬ÓÈÆäÊÇ³¤±øÆ÷¶ÍÔì£¬±ÈÈç¹÷¡¢ÕÈ¡£ÌìÏÂÎŞ³öÆäÓÒ£¬ÓĞÊ²Ã´ÎÒÄÜ°ïÃ¦ÄãµÄ£¿ÎÒ×î½üÓĞÁËĞ©¿ÕÏĞ£¬¿ÉÒÔ°ï´ó¼Ò×öĞ©Ñ×µÛ×°±¸µÄĞŞÕû£¬Èç¹ûÓĞĞèÒªµÄ»°£¬¾Í×ĞÏ¸¿´¿´°É¡£",
	--	    3,
	--	    "Ñ×µÛ×°±¸µÄÏà¹ØÊÂÏî/yandi_att_chg",
	--	    "³¤±øÆ÷¶ÍÔìµÃÏà¹ØÊÂÏî/old_dia",
	--	    "Àë¿ª/SayHello")
	--end
end

--============================================Ñ×µÛ×°×ª»»¶Ô»°Ôö¼Ó====================================
--Ñ×µÛ×°µÄÖ÷¶Ô»°
function yandi_chg_dia_main()
	Say("<color=red>Trang bŞ Viªm §Õ vµ trang bŞ Hoµng §Õ<color> lµ vËt phÈm phi phµm, ta nghiªn cøu c¶ ®êi ph¸t hiÖn ra nÕu thªm 1 vµi nguyªn liÖu, sÏ ®óc 1 <color=yellow>trang bŞ Viªm §Õ hoÆc trang bŞ Hoµng §Õ<color> thµnh 1 <color=yellow>trang bŞ Viªm §Õ hoÆc trang bŞ Hoµng §Õ<color> kh¸c, tİnh n¨ng ®­îc t¨ng cÊp. NÕu kh«ng muèn tiªu hao<color=yellow>trang bŞ Viªm §Õ hoÆc trang bŞ Hoµng §Õ<color>, th× cã thÓ xem qua, cã mét sè<color=yellow>Viªm Hoµng ThiÕt Hån<color> trong cung. Ta ®· t×m ra c¸ch thay ®æi<color=yellow>thuéc tİnh trang bŞ Viªm §Õ<color>, cã thÓ chuyÓn t¨ng néi ngo¹i c«ng cña<color=yellow>trang bŞ Viªm §Õ<color> thµnh t¨ng s¸t th­¬ng, nh­ng mçi ng­êi chØ ®æi ®­îc <color=red>1<color> lÇn.",
	7,
	"Ta ®· t×m ®ñ nguyªn liÖu, ta muèn ®óc trang bŞ Viªm §Õ/#yandi_att_chk(1)",
	"Ta ®· t×m ®ñ nguyªn liÖu, ta muèn ®óc trang bŞ Hoµng §Õ/#yandi_att_chk(2)",
	"Ta muèn lÊy Viªm §Õ Trang vÒ t¨ng tÊn c«ng gia c«ng thµnh t¨ng s¸t th­¬ng/yandi_att_chg",
	"Ta muèn lÊy 1 b¶n vÏ ChÕ t¹oViªm §Õ/#refound_paper_chg(1)",
	"Ta muèn lÊy 1 b¶n vÏ ChÕ t¹o Hoµng §Õ/#refound_paper_chg(2)",
	"Sau khi chÕ t¹o cã g× thay ®æi/refuond_info",
	"§Õn hái th¨m th«i mµ!/SayHello"
	)
end
-----------------------------------×°±¸×ª»»----------------------------
--²ÄÁÏ¼ì²é
function yandi_att_chk(equip_diff)
	if equip_diff == 2 then
		if GetPlayerRoute() == 0 then
			Talk(1,"","Ta kh«ng thÓ gióp ng­êi ch­a nhËp m«n ph¸i nµo chÕ t¹o <color=red>trang bŞ Hoµng §Õ<color>!")
			return
		end
		if Tb_huandi_equip[4][GetPlayerRoute()] [1]== nil  then
		Talk(1,"","Ta kh«ng thÓ gióp ng­êi ch­a nhËp m«n ph¸i nµo chÕ t¹o <color=red>trang bŞ Hoµng §Õ<color>!")
		return
		end
	end
	--²ÄÁÏĞ¯´ø¼ì²â
	if refound_mertiral_chk(equip_diff,1) ~= 1 then
		return
	end
	local equipment_num = 0
	local equipment_position = 0
	local yanhuang_stone_chk_flag = GetItemCount(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3])
	if yanhuang_stone_chk_flag ~= 0 then
		if equip_diff == 1 then
			Say("Ng­¬i muèn dïng <color=yellow>Viªm Hoµng ThiÕt Hån<color> ®óc thµnh g×?"..Tb_refound_att_name[equip_diff].."?",
			4,
			"Ta muèn ®óc"..Tb_refound_get_dia[equip_diff][0].."/#stone_chg_dtm("..equip_diff..",0)",
			"Ta muèn ®óc"..Tb_refound_get_dia[equip_diff][1].."/#stone_chg_dtm("..equip_diff..",1)",
			"Ta muèn ®óc"..Tb_refound_get_dia[equip_diff][3].."/#stone_chg_dtm("..equip_diff..",3)",
			"§Ó ta suy nghÜ l¹i/end_dialog"
			)
		else
			Say("Ng­¬i muèn dïng <color=yellow>Viªm Hoµng ThiÕt Hån<color> ®óc thµnh g×?"..Tb_refound_att_name[equip_diff].."?",
			4,
			"Ta muèn ®óc"..Tb_refound_get_dia[equip_diff][2].."/#stone_chg_dtm("..equip_diff..",2)",
			"Ta muèn ®óc"..Tb_refound_get_dia[equip_diff][4].."/#stone_chg_dtm("..equip_diff..",4)",
			"Ta muèn ®óc"..Tb_refound_get_dia[equip_diff][5].."/#stone_chg_dtm("..equip_diff..",5)",
			"§Ó ta suy nghÜ l¹i/end_dialog"
			)
		end
	else
		local sel_dia = {}
		for i = 0 ,getn(Tb_equip_position_info) do
			if Tb_equip_position_info[i][2] == equip_diff then
				tinsert(sel_dia,"Ta muèn lÊy  "..Tb_equip_position_info[i][1].." ®óc/#refoud_dia("..i..")")
			end
		end
		tinsert(sel_dia,"§Ó ta suy nghÜ l¹i/end_dialog")
		Say("B¹n muèn lÊy trang bŞ nµo <color=red>®ang mang trªn ng­êi<color> ®Ó chÕ t¹o?",
			getn(sel_dia),
			sel_dia
		)
	end
end
--Ñ×»ÆÌú»ê×ª»»È·ÈÏ¶Ô»°
function stone_chg_dtm(equip_diff,part_diff)
	Say("B¹n x¸c nhËn muèn lÊy <color=yellow>Viªm HoµngThiÕt Hån<color> ®óc 1 <color=red>"..Tb_refound_get_dia[equip_diff][part_diff].."<color> chø?",
	2,
	"Ta x¸c nhËn/#stone_chg("..equip_diff..","..part_diff..")",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--Ñ×»ÆÌú»ê»»
function stone_chg(equip_diff,part_diff)
	if refound_mertiral_chk(equip_diff,1) ~= 1 then
		return
	end
	--Ñ×»ÆÌú»êĞ¯´ø¼ì²â
	if GetItemCount(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3]) == 0 then
		Talk(1,"","H·y x¸c nhËn ng­¬i cã ®em <color=yellow>Viªm HoµngThiÕt Hån<color> theo!")
		return
	end
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end	
	--Ë×ÉÙÌØÊâ´¦Àí
	if GetPlayerRoute() == 2 and part_diff == 2 then
		Say("Ng­¬i muèn ®óc ®ao hay ®óc c«n?",
		3,
		"Ta muèn ®óc ®ao/#huangdi_ws_weapon(1)",
		"Ta muèn ®óc c«n/#huangdi_ws_weapon(2)",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
		return
	end
	--²ÄÁÏĞ¯´ø¼ì²â
	if refound_mertiral_chk(equip_diff,2) ~= 1 then
		return
	end
	--Ñ×»ÆÌú»êÉ¾³ı¼ì²â
	if DelItem(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3],1) ~= 1 then
		Talk(1,"","H·y x¸c nhËn ng­¬i cã ®em <color=yellow>Viªm HoµngThiÕt Hån<color> theo!")
		WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."Khi ®ang xãa Viªm Hoµng ThiÕt Hån nguyªn liÖu kh«ng ®ñ!")
		return
	end	
	--Ôö¼Ó×°±¸
	local add_flag = 0
	if equip_diff == 1 then		--Ñ×µÛ
		add_flag =AddItem(Tb_refound_att[part_diff][1],Tb_refound_att[part_diff][2],(Tb_refound_att[part_diff][3]+GetBody()),1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Talk(1,"","<color=yellow>"..Tb_refound_att[part_diff][4].."<color> ®óc xong råi, ng­¬i cã thÓ cÇm vÒ!")
			WriteLog("§óc trang bŞ Viªm Hoµng:"..GetName().."§· ®óc xong 1 "..Tb_refound_att[part_diff][4])
		else
			WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."T¨ng"..Tb_refound_att[part_diff][4].." thÊt b¹i, kı hiÖu:"..add_flag)
		end
	else		--»ÆµÛ
		add_flag =AddItem(Tb_huandi_equip[part_diff][GetPlayerRoute() ][1],Tb_huandi_equip[part_diff][GetPlayerRoute() ][2],Tb_huandi_equip[part_diff][GetPlayerRoute() ][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Talk(1,"","<color=yellow>"..Tb_huandi_equip[part_diff][GetPlayerRoute() ][4].."<color> ®óc xong råi, ng­¬i cã thÓ cÇm vÒ!")
			WriteLog("§óc trang bŞ Viªm Hoµng:"..GetName().."§· ®óc xong 1 "..Tb_huandi_equip[part_diff][GetPlayerRoute() ][4])
		else
			WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."T¨ng"..Tb_huandi_equip[part_diff][GetPlayerRoute() ][4].." thÊt b¹i, kı hiÖu:"..add_flag)
		end	end
end
--WSµÄÎäÆ÷Ñ¡Ôñ£¨ÌØÊâ´¦Àí£©
function huangdi_ws_weapon(weapon_diff)
	--²ÄÁÏĞ¯´ø¼ì²â
	if refound_mertiral_chk(2,2) ~= 1 then
		return
	end
	--Ñ×»ÆÌú»êÉ¾³ı¼ì²â
	if DelItem(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3],1) ~= 1 then
		Talk(1,"","H·y x¸c nhËn ng­¬i cã ®em <color=yellow>Viªm HoµngThiÕt Hån<color> theo!")
		WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."Khi ®ang xãa Viªm Hoµng ThiÕt Hån nguyªn liÖu kh«ng ®ñ!")
		return
	end
	local add_flag = AddItem(Tb_huandi_sushao_weapon[weapon_diff][1],Tb_huandi_sushao_weapon[weapon_diff][2],Tb_huandi_sushao_weapon[weapon_diff][3],1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
		Talk(1,"","<color=yellow>"..Tb_huandi_sushao_weapon[weapon_diff][4].."<color> ®óc xong råi, ng­¬i cã thÓ cÇm vÒ!")
		WriteLog("§óc trang bŞ Viªm Hoµng:"..GetName().."§· ®óc xong 1 "..Tb_huandi_sushao_weapon[weapon_diff][4])
		return
	else
		WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."T¨ng"..Tb_huandi_sushao_weapon[weapon_diff][4].." thÊt b¹i, kı hiÖu:"..add_flag)
	end
end
--×ª»»È·ÈÏ
function refoud_dia(equip_seq)
	--¼ì²âÊÇ·ñ´©×Å
	if equipmen_deal_chk(equip_seq,1) ~= 1 then
		return
	end
	local tb_dia = {}
	for i = 0 ,5 do
		if strsub(Tb_equip_position_info[equip_seq][1],1,2) == strsub(Tb_equip_position_info[i][1],1,2) and equip_seq ~= i then
			tinsert(tb_dia,"Ta muèn ®óc "..Tb_equip_position_info[i][1].."/#refound_dtm("..equip_seq..","..i..")")
		end
	end
	tinsert(tb_dia,"§Ó ta suy nghÜ l¹i/end_dialog")
	Say("Ng­¬i muèn lÊy trang bŞ ®ang mÆc <color=red>"..Tb_equip_position_info[equip_seq][1].."<color> chÕ t¹o thµnh c¸i nµo <color=yellow>"..Tb_refound_att_name[Tb_equip_position_info[equip_seq][2]].."<color>?",
	getn(tb_dia),
	tb_dia
	)
end
--Ñ×µÛ×°µÄ×ª»»
function refound_dtm(old_seq,new_seq)
	if GetPlayerRoute() == 2 and new_seq == 2 then		--ssÊÇbug£¬Ò»¶¨Òª½â¾öÑ½¡£
		Say("§¹i hiÖp lµ ®Ö tö thiÕu l©m, kh«ng biÕt §¹i hiÖp muèn lÊy <color=red>"..Tb_equip_position_info[old_seq][1].."<color> lµ vò khİ Hiªn Viªn nµo?",
		3,
		"Ta muèn Hiªn Viªn To¸i Vò §ao/#ss_refoud_dtm("..old_seq..",1)",
		"Ta muèn Hiªn Viªn To¸i Vò C«n/#ss_refoud_dtm("..old_seq..",2)",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	else
		Say("Ng­¬i muèn lÊy trang bŞ ®ang mÆc <color=red>"..Tb_equip_position_info[old_seq][1].."<color> chÕ t¹o thµnh <color=red>"..Tb_equip_position_info[new_seq][1].."<color> chø?",
		2,
		"Ta x¸c nhËn muèn chÕ t¹o/#refound_deal("..old_seq..","..new_seq..")",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	end
end
--ssÎäÆ÷×ª»¯È·ÈÏ
function ss_refoud_dtm(old_seq,weapon_diff)
	Say("§¹i hiÖp x¸c nhËn muèn lÊy <color=red>"..Tb_equip_position_info[old_seq][1].."<color> chÕ t¹o thµnh <color=red>"..Tb_huandi_sushao_weapon[weapon_diff][4].."<color> chø?",
	2,
	"Ta x¸c nhËn muèn chÕ t¹o/#ss_refoud_deal("..old_seq..","..weapon_diff..")",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
	end
--ssÖØÖıÎäÆ÷´¦Àí
function ss_refoud_deal(old_seq,weapon_diff)
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	--²ÄÁÏĞ¯´ø¼ì²â
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],1) ~= 1 then
		return
	end
	--×°±¸´©×Å¼ì²â
	if equipmen_deal_chk(old_seq,1) ~= 1 then
		return
	end
	--×°±¸ĞÅÏ¢»ñÈ¡
	local att_step = 1
	if old_seq < 4 then
		att_step = (GetEquipAttr(GetPlayerEquipIndex(old_seq),2)+1)
	end
	if att_step > Refound_level_max then
		att_step = Refound_level_max
	end
	--²ÄÁÏÉ¾³ı¼ì²â
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],2) ~= 1 then
		return
	end
	--×°±¸É¾³ı¼ì²â
	if equipmen_deal_chk(old_seq,2) ~=1 then
		return
	end
	local add_flag = 0
	local equip_index = 0
	add_flag,equip_index = AddItem(Tb_huandi_sushao_weapon[weapon_diff][1],Tb_huandi_sushao_weapon[weapon_diff][2],Tb_huandi_sushao_weapon[weapon_diff][3],1,1,-1,-1,-1,-1,-1,-1,0,att_step)
	if ding_flag == 1 then
		SetItemSpecialAttr(equip_index,"DING7",1)
	end
	if add_flag == 1 then
		Talk(1,"","Cuèi cïng ®· thµnh c«ng, vËt nµy kh«ng b×nh th­êng ®©u, "..Zgc_pub_sex_name().."h·y dïng vËt nµy hµnh hiÖp tr­îng nghÜa!")
	else
		WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."Dïng thÎ"..Tb_equip_position_info[old_seq][1].."ChÕ t¹o "..Tb_equip_position_info[new_seq][1].." thÊt b¹i, kı hiÖu:"..add_flag)
	end
end
--×°±¸Ôö¼Ó
function refound_deal(old_seq,new_seq)
	local player_route = GetPlayerRoute()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	--²ÄÁÏĞ¯´ø¼ì²â
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],1) ~= 1 then
		return
	end
	--×°±¸´©×Å¼ì²â
	if equipmen_deal_chk(old_seq,1) ~= 1 then
		return
	end
	--×°±¸ĞÅÏ¢»ñÈ¡
	local att_step = 1
	local ding_flag = 0
	if old_seq < 4 then 
		att_step = (GetEquipAttr(GetPlayerEquipIndex(old_seq),2)+1)
		ding_flag = GetItemSpecialAttr(GetPlayerEquipIndex(old_seq),"DING7")
end
	if att_step > Refound_level_max then
		att_step = Refound_level_max
	end
	--²ÄÁÏÉ¾³ı¼ì²â
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],2) ~= 1 then
		return
	end
	--×°±¸É¾³ı¼ì²â
	if equipmen_deal_chk(old_seq,2) ~=1 then
		return
	end
	--¿ªÊ¼Ôö¼ÓÎïÆ·
	local add_flag = 0
	local equip_index = 0
	if new_seq < 4 then	--·ÇÊ×ÊÎÀà×°±¸£¬ÓĞÇ¿»¯¶È
		if Tb_equip_position_info[old_seq][2] == 1 then	--Ñ×µÛ
			add_flag,equip_index = AddItem(Tb_refound_att[new_seq][1],Tb_refound_att[new_seq][2],(Tb_refound_att[new_seq][3]+GetBody()),1,1,-1,-1,-1,-1,-1,-1,0,att_step)
		else	--»ÆµÛ
			add_flag,equip_index = AddItem(Tb_huandi_equip[new_seq][player_route][1],Tb_huandi_equip[new_seq][player_route][2],Tb_huandi_equip[new_seq][player_route][3],1,1,-1,-1,-1,-1,-1,-1,0,att_step)
		end
	else	--Ê×ÊÎÀà£¬ÎŞÇ¿»¯¶È
		add_flag = AddItem(Tb_huandi_equip[new_seq][player_route][1],Tb_huandi_equip[new_seq][player_route][2],Tb_huandi_equip[new_seq][player_route][3],1,1,-1,-1,-1,-1,-1,-1)
	end
	if add_flag == 1 then
		Talk(1,"","Cuèi cïng ®· thµnh c«ng, vËt nµy kh«ng b×nh th­êng ®©u, "..Zgc_pub_sex_name().."h·y dïng vËt nµy hµnh hiÖp tr­îng nghÜa!")
		if ding_flag == 1 then
			SetItemSpecialAttr(equip_index,"DING7",1)
		end
		WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."Thµnh c«ng nhËn ®­îc møc t¨ng cÊp lµ:"..att_step.."-"..Tb_equip_position_info[new_seq][1].."Trang bŞ")
	else
		WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."Dïng thÎ"..Tb_equip_position_info[old_seq][1].."ChÕ t¹o "..Tb_equip_position_info[new_seq][1].." thÊt b¹i, kı hiÖu:"..add_flag)
	end
end
--×°±¸´©×Å¡¢É¾³ı¼ì²â
function equipmen_deal_chk(equip_seq,deal_diff)
	local player_route = GetPlayerRoute()
	local equip_id ={}
	equip_id[1],equip_id[2],equip_id[3]= GetPlayerEquipInfo(equip_seq)
	if deal_diff == 1 then		--´©×Å¼ì²â
		if Tb_equip_position_info[equip_seq][2] == 1 then		--Ñ×µÛ
			if equip_id[1] == Tb_refound_att[equip_seq][1]  and  equip_id[2] == Tb_refound_att[equip_seq][2] and (equip_id[3] == Tb_refound_att[equip_seq][3]+GetBody()) then
				return 1
			else
				Talk(1,"","H·y x¸c nhËn ng­¬i ®ang mÆc <color=red>"..Tb_equip_position_info[equip_seq][1].."<color>!")
				return 0
			end
		else
			if player_route == 2 and equip_seq == 2then
				if (equip_id[1] ==Tb_huandi_sushao_weapon[1][1] and equip_id[2] ==Tb_huandi_sushao_weapon[1][2] and equip_id[3] ==Tb_huandi_sushao_weapon[1][3] ) or 
					(equip_id[1] ==Tb_huandi_sushao_weapon[2][1] and equip_id[2] ==Tb_huandi_sushao_weapon[2][2] and equip_id[3] ==Tb_huandi_sushao_weapon[2][3] ) then
					return 1
				else
					Talk(1,"","H·y x¸c nhËn ng­¬i ®ang mÆc <color=red>vò khİ Hiªn Viªn<color>!")
					return 0
				end
			elseif equip_seq == 4 or equip_seq == 5 then
				equip_id[1],equip_id[2],equip_id[3]= GetPlayerEquipInfo(4)
				equip_id[11],equip_id[12],equip_id[13]= GetPlayerEquipInfo(5)
				if (equip_id[1] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[2] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[3] == Tb_huandi_equip[equip_seq][player_route][3])
				or (equip_id[11] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[12] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[13] == Tb_huandi_equip[equip_seq][player_route][3])
				then
					return 1
				else
					Talk(1,"","H·y x¸c nhËn ng­¬i ®ang mÆc <color=red>"..Tb_equip_position_info[equip_seq][1].."<color>!")
				end
			else
				if equip_id[1] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[2] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[3] == Tb_huandi_equip[equip_seq][player_route][3] then
					return 1
				else
					Talk(1,"","H·y x¸c nhËn ng­¬i ®ang mÆc <color=red>".. Tb_huandi_equip[equip_seq][player_route][4] .."<color>!")
					return 0
				end
			end
		end
	else							--É¾³ı¼ì²â
		local equip_index = 0
		if equip_seq == 4 or equip_seq == 5 then
			equip_id[1],equip_id[2],equip_id[3]= GetPlayerEquipInfo(4)
			equip_id[11],equip_id[12],equip_id[13]= GetPlayerEquipInfo(5)
			if (equip_id[1] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[2] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[3] == Tb_huandi_equip[equip_seq][player_route][3]) then
				equip_index = GetPlayerEquipIndex(4)
			elseif (equip_id[11] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[12] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[13] == Tb_huandi_equip[equip_seq][player_route][3]) then
				equip_index = GetPlayerEquipIndex(5)
			else
				Talk(1,"","H·y x¸c nhËn ng­¬i ®ang mÆc trang bŞ muèn chÕ t¹o!")
				return 0
			end
		else
			equip_index = GetPlayerEquipIndex(equip_seq)
		end
		if equip_index == 0 then
			Talk(1,"","H·y x¸c nhËn ng­¬i ®ang mÆc trang bŞ muèn chÕ t¹o!")
			return 0
		else
			local del_flag = DelItemByIndex(equip_index,-1)
			if del_flag == 1 then
				return 1
			else
				Talk(1,"","H·y x¸c nhËn ng­¬i ®ang mÆc trang bŞ muèn chÕ t¹o!")
				WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."Xãa:"..equip_id[1]..":"..equip_id[2]..":"..equip_id[3].." thÊt b¹i, kı hiÖu:"..del_flag)
				return 0
			end
		end
	end
end
--²ÄÁÏĞ¯´ø¼ì²â
function refound_mertiral_chk(equip_diff,deal_flag)
	for i = 1, getn(Tb_refound_mertiral[equip_diff]) do
		if deal_flag == 1 then	--Ğ¯´ø¼ì²â
			if GetItemCount(Tb_refound_mertiral[equip_diff][i][1],Tb_refound_mertiral[equip_diff][i][2],Tb_refound_mertiral[equip_diff][i][3]) < Tb_refound_mertiral[equip_diff][i][4] then
				Talk(1,"","ChÕ t¹o <color=yellow>"..Tb_refound_att_name[equip_diff].."<color> cÇn <color=yellow>"..Tb_refound_mertiral[equip_diff][i][4].."<color> <color=yellow>"..Tb_refound_mertiral[equip_diff][i][5].."<color> Ng­¬i mang theo kh«ng ®ñ, tr­íc tiªn ng­¬i më b¶n vÏ ra xem cßn cÇn nguyªn liÖu g× sau ®ã thö l¹i.")
				return 0
			end
		else 	--É¾³ı¼ì²â
			if DelItem(Tb_refound_mertiral[equip_diff][i][1],Tb_refound_mertiral[equip_diff][i][2],Tb_refound_mertiral[equip_diff][i][3] ,Tb_refound_mertiral[equip_diff][i][4]) ~= 1 then
				Talk(1,"","ChÕ t¹o <color=yellow>"..Tb_refound_att_name[equip_diff].."<color> cÇn <color=yellow>"..Tb_refound_mertiral[equip_diff][i][4].."<color> <color=yellow>"..Tb_refound_mertiral[equip_diff][i][5].."<color> Ng­¬i mang theo kh«ng ®ñ, tr­íc tiªn ng­¬i më b¶n vÏ ra xem cßn cÇn nguyªn liÖu g× sau ®ã thö l¹i.")
				WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."§ang xãa"..Tb_refound_mertiral[equip_diff][i][5].." nguyªn liÖu kh«ng ®ñ!")
				return 0
			end
		end
	end
	return 1
end
------------------------------------------------ÊôĞÔ×ª»»--------------------------------
--2007-12-11ÔÙ´Îµ÷Õû
TaskID_yandi_att_chg_num = 1289
function yandi_att_chg()
	Say("B©y giê ta kh«ng cßn ®ñ Tinh Lùc ®Ó lµm <color=yellow>trang bŞ Viªm §Õ<color>, cã ®iÒu ta cã thÓ gióp c¸c ng­¬i chØnh söa nh÷ng trang bŞ nµy, ta cã thÓ ®æi víi gi¸ thÊp cho ng­¬i <color=yellow>3<color> lÇn <color=yellow>trang bŞ Viªm §Õ<color>, mçi lÇn chØ thu <color=yellow>1 V« NgÊn Thñy<color>, nÕu thay ®æi tiÕp, mçi lÇn ®Òu cÇn <color=yellow>1 N÷ Oa tinh th¹ch<color> míi cã thÓ ®æi cho ng­¬i. Kh«ng biÕt "..Zgc_pub_sex_name().."Muèn ®æi thuéc tİnh nµo cña <color=yellow>trang bŞ Viªm §Õ<color>?? (<color=yellow>Viªm §Õ Gi¸p<color> chuyÓn ®æi thµnh t¨ng <color=red>100<color> ®iÓm s¸t th­¬ng, <color=yellow>Viªm §Õ Trang<color> chuyÓn ®æi thµnh t¨ng <color=red>60<color> ®iÓm s¸t th­¬ng)",
	6,
	"Ta muèn t¨ng ®iÓm tÊn c«ng cña Viªm §Õ Gi¸p/#yandi_atti_chg(1,1)",
	"Ta muèn t¨ng ®iÓm s¸t th­¬ng cña Viªm §Õ Gi¸p/#yandi_atti_chg(1,2)",
	"Ta muèn t¨ng ®iÓm tÊn c«ng cña Viªm §Õ Trang/#yandi_atti_chg(3,1)",
	"Ta muèn t¨ng ®iÓm s¸t th­¬ng cña Viªm §Õ Trang/#yandi_atti_chg(3,2)",
	"§æi trang bŞ Viªm §Õ cã g× kh¸c/chg_atti_info",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--×ª»»ÒÔºóµÄÊôĞÔ±ä»¯
function chg_atti_info()
	Talk(1,"yandi_att_chg","Khi ng­¬i kh«ng hµi lßng thuéc tİnh cña <color=yellow>trang bŞ Viªm §Õ<color> cã thÓ ®Õn chç ta ®æi. T¨ng tÊn c«ng lµ thuéc tİnh ngo¹i c«ng/ néi c«ng t¨ng##? (<color=red>Viªm §Õ Gi¸p<color> t¨ng néi ngo¹i c«ng <color=yellow>11%<color>, <color=red>Viªm §Õ Trang<color> t¨ng néi ngo¹i c«ng <color=yellow>5%<color>), t¨ng s¸t th­¬ng lµ t¨ng thuéc tİnh s¸t th­¬ng? (<color=red>Viªm §Õ Gi¸p<color> t¨ng <color=yellow>100<color> ®iÓm s¸t th­¬ng, <color=red>Viªm §Õ Trang<color> t¨ng <color=yellow>60<color> ®iÓm s¸t th­¬ng). Nh­ng ta nãi tr­íc, sau khi ®æi<color=yellow>thuéc tİnh phßng ngù<color> ®iÓm phßng thñ sÏ thay ®æi, tr­íc khi ®æi ph¶i c©n nh¾c cÈn thËn. Nh­ng ®æi trang bŞ <color=yellow>®é c­êng hãa<color> vÉn gi÷ nguyªn, vÒ ®iÓm nµy ng­¬i cø yªn t©m.")
end
Tb_attitude_chg_info = {
	{2,268},
	{},
	{4,331}
}
--Ñ×µÛ×°±¸ÊôĞÔ×ª»»¶Ô»°
function yandi_atti_chg(equip_diff,chg_flag)
	local chg_att = {
		{"T¨ng thuéc tİnh s¸t th­¬ng","T¨ng tÊn c«ng"},
		{"T¨ng thuéc tİnh tÊn c«ng","T¨ng s¸t th­¬ng"},
	}
	local chg_num  = GetTask(TaskID_yandi_att_chg_num)
	local need_goods = ""
	if chg_num < 3 then
		need_goods = "V« NgÊn Thñy"
	else
		need_goods = "N÷ Oa Tinh Th¹ch"
	end
	Say("B©y giê ng­¬i cÇn ®æi 1<color=yellow>"..need_goods.."<color> vµo,"..Zgc_pub_sex_name().."X¸c nhËn muèn ng­êi mÆc <color=yellow>"..Tb_refound_att[equip_diff][4].."<color> thuéc tİnh thø nhÊt chuyÓn thµnh <color=yellow>"..chg_att[chg_flag][2].."<color> ®óng kh«ng?",
		2,
		"Ta muèn ®æi/#yandi_atti_chg_deal("..equip_diff..","..chg_flag..")",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)

end
--Ñ×µÛ×°±¸ÊôĞÔ×ª»»´¦Àí
function yandi_atti_chg_deal(equip_diff,chg_flag)
	local chg_num  = GetTask(TaskID_yandi_att_chg_num)
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	--×°±¸´©×Å¼ì²â
	if equipmen_deal_chk(equip_diff,1) ~= 1 then
		return
	end
	--×°±¸ÊÇ·ñËø¶¨
	local equip_index = GetPlayerEquipIndex(equip_diff)
	local equip_level = GetEquipAttr(equip_index,2)
	if GetItemSpecialAttr(equip_index,"LOCK") == 1 then
		Talk(1,"","Trang bŞ ®ang khãa kh«ng thÓ ®æi thuéc tİnh, sau khi më khãa h·y thö l¹i.")
		return
	end
	if chg_num < 3 then
		if GetItemCount(2,1,503) == 0 then
			Talk(1,"","§æi thuéc tİnh cña <color=yellow>Viªm §Õ Thao Trang<color> sÏ tèn mét İt nguyªn liÖu, lÇn nµy thu <color=yellow>"..Zgc_pub_sex_name().."<color> B¹n cã mét <color=yellow>V« NgÊn Thñy<color> ®ang cÇn thanh lı!")
			return
		end
		if DelItem(2,1,503,1) ~= 1 then
			Talk(1,"","§æi thuéc tİnh cña <color=yellow>Viªm §Õ Thao Trang<color> sÏ tèn mét İt nguyªn liÖu, lÇn nµy thu <color=yellow>"..Zgc_pub_sex_name().."<color> B¹n cã mét <color=yellow>V« NgÊn Thñy<color> ®ang cÇn thanh lı!")
			return
		end
	else
		if GetItemCount(2,1,504) == 0 then
			Talk(1,"","§æi thuéc tİnh cña <color=yellow>Viªm §Õ Thao Trang<color> sÏ tèn mét İt nguyªn liÖu, lÇn nµy thu <color=yellow>"..Zgc_pub_sex_name().."<color> B¹n cã mét <color=yellow>N÷ Oa tinh th¹ch<color> ®ang cÇn thanh lı!")
			return
		end
		if DelItem(2,1,504,1) ~= 1 then
			Talk(1,"","§æi thuéc tİnh cña <color=yellow>Viªm §Õ Thao Trang<color> sÏ tèn mét İt nguyªn liÖu, lÇn nµy thu <color=yellow>"..Zgc_pub_sex_name().."<color> B¹n cã mét <color=yellow>N÷ Oa tinh th¹ch<color> ®ang cÇn thanh lı!")
			return
		end
	end	
	--×°±¸ÊÇ·ñ¶¨»ê
	local ding_flag = GetItemSpecialAttr(equip_index,"DING7")
	--×°±¸É¾³ı¼ì²â
	if equipmen_deal_chk(equip_diff,2) ~= 1 then
		return
	else
		WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."Xãa 1 ®é c­êng hãa lµ:"..equip_level.."-"..Tb_refound_att[equip_diff][4])
	end
	--×°±¸Ôö¼Ó
	local add_flag = 0
	local new_equip_index = 0
	local attribute_level = 5
	if equip_diff == 3 then
		attribute_level = 1
	end
	if chg_flag == 2 then
		add_flag,new_equip_index = AddItem(Tb_refound_att[equip_diff][1],Tb_refound_att[equip_diff][2],(Tb_refound_att[equip_diff][3]+GetBody()),1,1,Tb_attitude_chg_info[equip_diff][1],Tb_attitude_chg_info[equip_diff][2],-1,-1,-1,-1,0,equip_level)
	else
		add_flag,new_equip_index = AddItem(Tb_refound_att[equip_diff][1],Tb_refound_att[equip_diff][2],(Tb_refound_att[equip_diff][3]+GetBody()),1,1,-1,-1,-1,-1,-1,-1,0,equip_level)
	end
	if add_flag == 1 then
		local dialog_remain_time = ""
		local remain_time = 2 - chg_num
		if remain_time <= 0 then
			dialog_remain_time = "B¹n kh«ng cßn c¬ héi sö dông <color=yellow>V« NgÊn Thñy<color> ®Ó ®æi n÷a, lÇn sau muèn ®æi cÇn ph¶i cã 1 <color=yellow>N÷ Oa tinh th¹ch<color>!"
		else
			dialog_remain_time = "B¹n vÉn cßn <color=yellow>"..remain_time.."<color> lÇn sö dông <color=yellow>V« NgÊn Thñy<color> ®æi, lÇn sau muèn ®æi cÇn ph¶i cã 1 <color=yellow>N÷ Oa tinh th¹ch<color>!"
		end
		if ding_flag == 1 then
			SetItemSpecialAttr(new_equip_index,"DING7",1)
		end
		Talk(1,"","§æi ®­îc råi, "..Zgc_pub_sex_name().."CÇm lÊy!"..dialog_remain_time)
		WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."NhËn ®­îc 1 ®é c­êng hãa:"..equip_level.."-"..Tb_refound_att[equip_diff][4])
	else
		WriteLog("§óc trang bŞ Viªm Hoµng: Ng­êi ch¬i"..GetName().."§ang thay ®æi c­êng ®é"..equip_level.."-"..Tb_refound_att[equip_diff][3].."Khi thuéc tİnh t¨ng trang bŞ thÊt b¹i, kı hiÖu thÊt b¹i:"..add_flag)
	end
	SetTask(TaskID_yandi_chg_num,(GetTask(TaskID_yandi_chg_num)+equip_diff))
	SetTask(TaskID_yandi_att_chg_num,(GetTask(TaskID_yandi_att_chg_num)+1))
end
-----------------------------------------------Í¼Ö½½»»»---------------------------------
--¸øÎÒ10¿éÇ®£¬¸øÄãÒ»ÕÅpaper
function refound_paper_chg(paper_diff)
	if paper_diff == 2 then
		if GetPlayerRoute() == 0 then
			Talk(1,"","Ta kh«ng thÓ gióp ng­êi ch­a nhËp m«n ph¸i nµo chÕ t¹o <color=red>trang bŞ Hoµng §Õ<color>!")
			return
		end
		if Tb_huandi_equip[4][GetPlayerRoute()] [1]== nil  then
		Talk(1,"","Ta kh«ng thÓ gióp ng­êi ch­a nhËp m«n ph¸i nµo chÕ t¹o <color=red>trang bŞ Hoµng §Õ<color>!")
		return
		end
	end
	Say("Ng­¬i muèn chÕ t¹o <color=red>"..Tb_refound_att_name[paper_diff].."<color>? Kü n¨ng phèi chÕ nµy ta cùc khæ t×m ra, muèn ta chØ kh«ng ng­¬i sao, cßn muèn ta gióp ng­¬i chÕ t¹o n÷a µ? Kh«ng dÔ thÕ ®©u. Ta cÇn <color=yellow>10<color> viªn <color=yellow>B¨ng th¹ch tinh luyÖn<color> ®Ó chÕ t¹o, ng­¬i h·y ®em ®Õn ®©y ta míi cho ng­¬i kü n¨ng phèi chÕ. ThÕ nµo, ng­¬i cÇn tÊm <color=yellow>kü n¨ng phèi chÕ<color> nµy kh«ng? Qua khái th«n nµy kh«ng cßn qu¸n trä nµo ®©u.",
	2,
	"Ta cÇn 1 tÊm b¶n vÏ/#paper_chg("..paper_diff..")",
	"M¾c thÕ, th«i, ta kh«ng cÇn n÷a/end_dialog"
	)
end
--¸øÇ®
function paper_chg(paper_diff)
	--ÎïÆ·Ğ¯´ø¼ì²â
	if GetItemCount(2,1,533) < 10 then
		Talk(1,"","Chí cã nghÜ ®Õn chuyÖn lõa ta <color=yellow>b¶n vÏ<color>, ta tèn rÊt nhiÒu c«ng søc míi nghiªn cøu ra.")
		return
	end
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if DelItem(2,1,533,10) ~= 1 then
		Talk(1,"","Chí cã nghÜ ®Õn chuyÖn lõa ta <color=yellow>b¶n vÏ<color>, ta tèn rÊt nhiÒu c«ng søc míi nghiªn cøu ra.")
		return
	else
		local add_flag = AddItem(2,1,Tb_refound_paper_info[paper_diff][1],1)
		if add_flag == 1 then
			Talk(1,"","CÇm lÊy, ®©y lµ <color=yellow>b¶n vÏ chÕ t¹o<color> ng­¬i cÇn, t×m ®ñ <color=yellow>nguyªn liÖu<color> ghi trªn b¶n vÏ, mang theo b¶n vÏ, mÆc <color=red> muèn chÕ t¹o lªn ng­êi"..Tb_refound_att_name[paper_diff].."<color> hoÆc mang <color=yellow>Viªm Hoµng ThiÕt Hån<color>, ®Õn t×m ta lµ chÕ t¹o ®­îc!")
			return
		else
			WriteLog("Th¨ng cÊp Viªm §Õ Trang: Ng­êi ch¬i "..GetName().."NhËn b¶n vÏ thÊt b¹i, kı hiÖu thÊt b¹i:"..add_flag)
		end
	end
end
function refuond_info()
	Talk(1,"","<color=green>M¹c §¹i<color>: Ta cã thÓ gióp ng­¬i chuyÓn ho¸ <color=yellow>trang bŞ Viªm §Õ hoÆc trang bŞ Hoµng §Õ<color> thµnh <color=red><color><color=yellow>trang bŞ Viªm §Õ hoÆc trang bŞ Hoµng §Õ<color> t­¬ng øng<color=red><color> bÊt kú. Sau khi suy nghÜ xong, h·y mang 1 b¶n vÏ ®Õn chç ta, chuÈn bŞ ®óc <color=yellow>trang bŞ Viªm §Õ hoÆc trang bŞ Hoµng §Õ<color>. NÕu ng­¬i kh«ng cã <color=yellow>trang bŞ Viªm §Õ hoÆc trang bŞ Hoµng §Õ<color>, th× còng cã thÓ ®Õn <color=yellow>Ngù C¸c<color> thö vËn may, råi mang <color=yellow>Viªm Hoµng thiÕt hån<color> ®Õn cho ta còng ®­îc. Nh­ng nÕu nh­ vËy, th× trang bŞ chÕ t¹o ra <color=yellow>sÏ kh«ng cã hiÖu qu¶ c­êng ho¸<color> ®©u.")
end
--ÀÏµÄ¶Ô»°
function old_dia()
	local strtab = {
		"Häc kü n¨ng chÕ t¹o binh khİ dµi/luaLearnLifeSkill",
		"Häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ/learn_all_recipe",
		"Quªn kü n¨ng chÕ t¹o binh khİ dµi/forget_life_skill",
--		"Nh÷ng ®iÒu liªn quan vÒ trang bŞ B¸t Qu¸i/bagua",
		"Häc c¸ch lµm vò khİ linh khİ cÊp 76/xinwuqi",
		"T×m hiÓu vËt phô gia/Dating",
	}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"tiÕp tôc nhiÖm vô häc tËp Linh Th¹ch B¸t Qu¸i/task_new3");
	end
	tinsert(strtab,"Rêi khái/SayHello")
    Say(strTitle.."Kü n¨ng chÕ t¹o vò khİ cña ta vïng nµy cã mét kh«ng hai, ®Æc biÖt lµ binh khİ dµi, thÕ nµo cã muèn mua mét c¸i kh«ng?",
    getn(strtab),strtab)
end
--============================================Ñ×µÛ×°×ª»»¶Ô»°½áÊø====================================
-- ËùÓĞÅä·½Ïà¹ØµÄÊÂÇé
function learn_all_recipe()
	Say(strTitle.."Ng­¬i muèn häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ?",
		7,
			"Häc c¸ch phèi chÕ míi/luaLearnRecipe",
			"Häc phèi chÕ trang bŞ Linh §å/learnLtEquip",
    	"Häc c¸ch phèi chÕ dµnh cho ho¹t ®éng cuèi tuÇn/Weekend",
    	"Xem nhËn ®­îc nhiÖm vô vò khİ cÊp 76 kh«ng/get_76_task",
    	"Häc c¸ch phèi chÕ cÊp 76/relearn_76_recipe",
    	"Kh«ng häc ®­îc söa c¸ch ghĞp/LearnRecipe",
    	"Rêi khái/SayHello")
end;


-- ½ÓÊÜ76¼¶Åä·½ÈÎÎñ
function get_76_task()
 	-------------------------------------76¼¶ÎäÆ÷Åä·½ÈÎÎñ-------------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_76 = GetTask(TASK_76WEAPON);
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU);
		
	--³¤±øÆ÷ÖÆÔìÏµÅä·½ÈÎÎñ
	if (nSkillGenre == 1 and nSkillDetail == 2 and nSkillLevel >= 79) then
		--ÉĞÎ´´¥·¢Åä·½ÈÎÎñ
		if nTaskState_76 == 0 then
			weapon_76_001(1)
			return
		--ÉÏ½»ÎäÆ÷
		elseif nTaskState_76 == 1 then
			weapon_76_002(1)
			return
		--Î´ÓëÎåÎ»ÕÆÃÅ¶Ô»°
		elseif nTaskState_76 == 2 then
			weapon_76_004(1)
			return
		--ÒÑ¾­ÓëÎåÎ»ÕÆÃÅ¶Ô»°
		elseif nTaskState_76 == 3 then
			weapon_76_005(1)
			return
		--Ñ¡ÔñÑ§Ï°Éñ±øµÄ·½Ïò
		elseif nTaskState_76 == 4 then
			weapon_76_choice(1)
			return
		end			
	end
	
	--ÖÆÒ©ÏµºÚÎÙ¾«Ê¯Åä·½ÈÎÎñ
	if nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79 then
		--È¡µÃĞşÊ¯
		if nTaskState_heiwu == 3 then
			medicine_heiwu_007()
			return
		--Î´½«ĞşÊ¯½»ÓèÓÎ·½Ò½Éú
		elseif nTaskState_heiwu == 4 then
			medicine_heiwu_008()
			return
		end
	end
		
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	if nSkillGenre == 1 and nSkillDetail ~= 2 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("B¹n ch­a ®ñ ®iÒu kiÖn nhËn nhiÖm vô phèi chÕ cÊp 76.", 0)
end;

-- ²¹Ñ§76¼¶Åä·½
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 2)
	if (nGene == 1 and nSkillID == 2) then
		if (GetTask(1600) == 5 and nLevel >= 79) then
			if (HaveLearnRecipe(795) == 0 and HaveLearnRecipe(800) == 0 and HaveLearnRecipe(801) == 0) then
				Say("H·y chän 1 lo¹i vò khİ b¹n muèn häc c¸ch chÕ t¹o:",
					4,
					"Tr­îng/learn_long_1",   
					"c«n bæng/learn_long_2",  
					"Th­¬ng/learn_long_3",    
					"Ta suy nghÜ l¹i/SayHello")
			else
				Say("B¹n ®· häc ®­îc ph­¬ng ph¸p phèi chÕ míi!", 0)
			end
		else
			Say("Ng­¬i vÉn ch­a hoµn thµnh nhiÖm vô chÕ t¹o binh khİ dµi cÊp 67", 0)
		end
	else
		Say("B¹n vÉn ch­a hoµn thµnh kü n¨ng: <color=yellow>ChÕ t¹o Binh khİ dµi<color>!", 0)
	end
end;
-- ÕÈ
function learn_long_1()
	AddRecipe(800)
	Msg2Player("B¹n häc ®­îc phèi chÕ: A La H¸n Tr­îng")
end;
-- ¹÷°ô
function learn_long_2()
	AddRecipe(795)
	Msg2Player("B¹n häc ®­îc phèi chÕ: LiÖt DiÖm")
end;
-- Ç¹
function learn_long_3()
	AddRecipe(801)
	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i Hµo L«i Th­¬ng")
end;


-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 2) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- Ö÷¼¼ÄÜ
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."§©y lµ lÇn thø "..(nForgetTimes + 1).." lÇn bá kü n¨ng s¶n xuÊt, mÊt "..nShouldPay.." l­îng, ng­¬i suy nghÜ kü ch­a?",
			2,
			"Ta ®· quyÕt ®Şnh råi!/forget_now",
			"Khoan ®·! Chê ta suy nghÜ l¹i!/SayHello")
	else
		Say(strTitle.."Kü n¨ng chÕ t¹o binh khİ dµi ng­¬i vÉn ch­a häc, ta sÏ gióp ng­¬i.", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- Ö÷¼¼ÄÜ
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 2) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 2)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(1600,0);--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
				SetTask(1601,0);--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
				Msg2Player("Ng­¬i quªn kü n¨ng chÕ t¹o binh khİ dµi råi")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhĞ!", 0)
		end
	end
end;


------------------------------------------Ê±¼äÅĞ¶¨--------------------------------------------
 --·µ»ØĞÇÆÚ¼¸£¬0´ú±íĞÇÆÚÌì
function GetWeekDay()
	return tonumber(date("%w"))
end;

--·µ»Øµ±Ç°Ğ¡Ê±ºÍ·ÖÖÓ
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23µã59·Ö
function CheckTime(day)
	if WEEKEND_SWITCH == 0 then
		return 0
	end;
	if day ~= GetWeekDay() then
		return 0
	end;

	--»»Ëã19:00 - 24:00ÊÇÊ²Ã´Çø¼ä
	local nBegin = 19 * 60;
	local nEnd = 24 * 60;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end;
end;




--**********************************************¼¼ÄÜÑ§Ï°²¿·Ö***************************************
--¼¼ÄÜÑ§Ï°Ñ¡Ôñ
function luaLearnLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."B¹n kh«ng ®ñ <color=yellow>cÊp 10<color> chø?thÓ häc kü n¨ng sèng.", 0)
    	return
	end

    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."Ng­¬i cÇn hñy kü n¨ng s¶n xuÊt míi häc tiÕp kü n¨ng chÕ t¹o binh khİ dµi.", 0)
		return
	end
    
	Say(strTitle.."<color=yellow>ChÕ t¹o Binh khİ dµi<color> sÏ thay thÕ kü n¨ng s¶n xuÊt, cã muèn häc kh«ng?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end

--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 2, 1, 79, 1)) then
        	Msg2Player("B¹n häc ®­îc kü n¨ng chÕ t¹o binh khİ dµi, nhËn ®­îc 3 H¾c Kim PhÊn.")
        	AddItem(2, 2, 59, 3)
    	end
    	
    	AddRecipe(86)
        Msg2Player("B¹n häc ®­îc phèi chÕ: Thñy Háa C«n")
    	AddRecipe(87)
    	Msg2Player("B¹n häc ®­îc phèi chÕ: Tø B×nh C«n")
    	AddRecipe(97)
    	Msg2Player("B¹n häc ®­îc phèi chÕ: Tİch Tr­îng")
    	AddRecipe(98)
    	Msg2Player("B¹n häc ®­îc phèi chÕ: Ho»ng Ph¸p Tr­îng")
        AddRecipe(749)
        Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
    	AddRecipe(750)
    	Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
    	SetTask(LEV_LEARNRECIPE, 10)
    	
	else
		Say (strTitle.."B¹n ®· häc kü n¨ng sèng, kh«ng thÓ häc thªm kü n¨ng kh¸c.",0)
	end
end;

--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say(strTitle.."H·y suy nghÜ kü råi quay l¹i ®©y nhĞ!", 0)
end
--³¤±øÆ÷Åä·½²»ÄÜÑ§Ï°µÄ´íÎóĞŞ¸´
function LearnRecipe()
    SetTask(LEV_LEARNRECIPE, 0)
end


--**********************************************Åä·½Ñ§Ï°²¿·Ö***************************************
--Ñ§Ï°ĞÂµÄÅä·½
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 2)
	if (GetLifeSkillLevel(1, 2) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 10 and HaveLearnRecipe(749) == 0) then
        	AddRecipe(749)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        	AddRecipe(750)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        	AddRecipe(751)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        	AddRecipe(752)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
       	elseif (GetTask(LEV_LEARNRECIPE) == 20 and HaveLearnRecipe(749) == 0) then
        	AddRecipe(749)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        	AddRecipe(750)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        	AddRecipe(751)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        	AddRecipe(752)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        	AddRecipe(753)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
       elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(749)==0 then
       		AddRecipe(749)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        	AddRecipe(750)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        	AddRecipe(751)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        	AddRecipe(752)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        	AddRecipe(753)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        	AddRecipe(754)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        	AddRecipe(755)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
       	elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        	AddRecipe(750)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        	AddRecipe(751)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        	AddRecipe(752)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        	AddRecipe(753)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        	AddRecipe(754)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        	AddRecipe(755)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        	AddRecipe(756)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
       	elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        	AddRecipe(750)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        	AddRecipe(751)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        	AddRecipe(752)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        	AddRecipe(753)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        	AddRecipe(754)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        	AddRecipe(755)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        	AddRecipe(756)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
        	AddRecipe(757)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tiªm Th­¬ng")
       	elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
        	AddRecipe(750)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        	AddRecipe(751)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        	AddRecipe(752)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        	AddRecipe(753)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        	AddRecipe(754)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        	AddRecipe(755)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        	AddRecipe(756)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
        	AddRecipe(757)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tiªm Th­¬ng")
        	AddRecipe(758)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tr­îng B¸t Xµ M©u")
       	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
	        Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
    	    AddRecipe(750)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
        	AddRecipe(751)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        	AddRecipe(752)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        	AddRecipe(753)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        	AddRecipe(754)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        	AddRecipe(755)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        	AddRecipe(756)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
        	AddRecipe(757)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tiªm Th­¬ng")
        	AddRecipe(758)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tr­îng B¸t Xµ M©u")
        	AddRecipe(759)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ Thiªn Kİch")
      	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(749)==1 and HaveLearnRecipe(759)==0 then
        	AddRecipe(759)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ Thiªn Kİch")
        elseif (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
			AddRecipe(86)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thñy Háa C«n")
    		AddRecipe(87)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Tø B×nh C«n")
    		AddRecipe(97)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Tİch Tr­îng")
    		AddRecipe(98)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Ho»ng Ph¸p Tr­îng")
        	AddRecipe(749)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt Th­¬ng")
    		AddRecipe(750)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: §iÓm Cang Th­¬ng")
    		SetTask(LEV_LEARNRECIPE, 10)
    	elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(88)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Phæ §é C«n")
        	AddRecipe(89)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: H¹c Vò C«n")
        	AddRecipe(99)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tam B¶o Tr­îng")
        	AddRecipe(100)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Phôc Ma Tr­îng")
        	AddRecipe(751)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L¨ng Th­¬ng")
        	AddRecipe(752)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C©u Liªm Th­¬ng")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(90)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ph©n Thñy C«n")
        	AddRecipe(101)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Phæ §é Tr­îng")
        	AddRecipe(753)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy Hån Th­¬ng")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(91)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: TiÒm Long C«n")
        	AddRecipe(92)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim L­¬ng")
        	AddRecipe(102)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Lu©n Tr­îng")
        	AddRecipe(103)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Kh«ng Minh Tr­îng")
        	AddRecipe(754)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tó Cèt Th­¬ng")
        	AddRecipe(755)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch NguyÖt Th­¬ng")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(93)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §¶ CÈu Bæng")
        	AddRecipe(94)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: KhÈn Na La Bæng")
        	AddRecipe(104)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B¶o Quang Tr­îng")
        	AddRecipe(105)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i Tù T¹i Tr­îng")
        	AddRecipe(756)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Xµ Th­¬ng")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
	        AddRecipe(95)
    	    Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Xµ C«n")
        	AddRecipe(106)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i B¸t Nh· Tr­îng")
        	AddRecipe(757)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tiªm Th­¬ng")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(96)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh Long C«n")
        	AddRecipe(107)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn PhËt Tr­îng")
        	AddRecipe(758)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tr­îng B¸t Xµ M©u")
        	SetTask(LEV_LEARNRECIPE,70)
      elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
        	AddRecipe(759)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ Thiªn Kİch")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
    	end
    end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 2)
	if nLevel >= 79 then
    	AddRecipe(1115)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å C¸i Bang C«n"))
    	AddRecipe(1121)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å ThiÕu L©m Tr­îng"))
    	AddRecipe(1124)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å D­¬ng M«n Th­¬ng"))
	else
    	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
	end
end

--»î¶¯º¯Êı
function Weekend()
	if (GetLifeSkillLevel(1, 2) >= 1) then
    	if GetTask(HaveWeekend)==1 then
        	Say(strTitle.."Ng­¬i ®· häc hÕt c¸c kü n¨ng ë chç ta råi!", 0)
		elseif (CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1) then
    		Talk(1,"",strTitle.."TiÒn tuyÕn chiÕn tranh ¸c liÖt, ta cã 1 c¸ch chÕ t¹o vò khİ ®éc ®¸o muèn truyÒn thô cho ng­¬i. H·y chÕ t¹o tr­êng m©u cho c¸c binh sÜ ra chi viÖn cho tiÒn tuyÕn!")
    		AddRecipe(227)
    		Msg2Player("B¹n häc ®­îc phèi chÕ-- Tr­êng m©u qu©n dông!")
    		SetTask(HaveWeekend,1)
    	end
    else
    	Say(strTitle.."B¹n ch­a häc qua c¸ch chÕ t¹o binh khİ dµi hoÆc thêi gian ch­a ®Õn! Ta kh«ng thÓ truyÒn thô cho ng­¬i!", 0)
    end
end;

--Ìí¼ÓÎïĞÅÏ¢
function Dating()
	Talk(1,
		 "",
		 strTitle.."Muèn chÕ t¹o 1 binh khİ tuyÖt thÕ v« song, cÇn ph¶i bá thªm nhiÒu vËt phô gia, ng­¬i h·y thö bá thªm 1 sè vËt liÖu tèt, cã thÓ sÏ rÌn ®­îc nh÷ng vò khİ cã mét kh«ng hai.")
end;

--È¡Ïûº¯Êı
function SayHello()

end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>Trang bŞ B¸t Qu¸i<color> lµ t©m huyÕt c¶ ®êi cña huynh ®Ö M¹c gia chóng ta vµ T­¬ng D­¬ng L·o L­u, C«ng D· ThÕ Gia, CÈm N­¬ng cïng nhau nghiªn cøu ra. NÕu nhËn ®­îc vµi mãn ®å cña Linh Th¹ch ng­¬i ®i hái con ch¸u cña C«ng D· ThÕ Gia, nÕu ng­¬i muèn t×m hiÓu lµm thÕ nµo ®Ó chÕ t¹o 1 trang bŞ cã thÓ<color=yellow>Kh¶m n¹m linh th¹ch<color>, th× ®Õn chç ta ®©y.",
	4,
	"Lµm sao chÕ t¹o trang bŞ cã lç kh¶m n¹m/kongzhuangbeizhizuo",
	"VËt phÈm thªm vµo cã t¸c dông g×/tianjiawu",
	"Lµm sao trang bŞ ®­îc chÕ t¹o thµnh trang bŞ B¸t Qu¸i/xiangqianzhuyi",
	"§Õn hái th¨m th«i mµ!/SayHello"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."RÊt ®¬n gi¶n, qua nghiªn cøu cña bän ta, c¶i tiÕn ph­¬ng ph¸p chÕ t¹o ta truyÒn thô cho c¸c ng­¬i, b©y giê ng­¬i ®ang thu thËp nguyªn liÖu ë khu vùc thu thËp, nh÷ng trang bŞ chÕ t¹o ra cã møc linh khİ tèi ®a vµ cã thÓ cã lç kh¶m n¹m, nh­ng mµ còng chİnh v× vËy, nh÷ng trang bŞ cã thuéc tİnh linh khİ kh«ng cßn chÕ t¹o ®­îc n÷a.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V¹n vËt trªn thÕ gian ®Òu cã gi¸ trŞ riªng, gi¸ trŞ tïy vµo linh khİ İt hay nhiÒu, khi chÕ t¹o trang bŞ t¨ng vËt phÈm thªm vµo, cã thÓ t¨ng møc linh khİ tèi ®a vµ t¨ng sè lç kh¶m n¹m linh th¹ch trªn trang bŞ. Møc linh khİ tèi ®a cña trang bŞ quyÕt ®Şnh møc linh khİ ®Ó kh¶m n¹m linh th¹ch, vµ sè lç quyÕt ®Şnh nã cã thÓ kh¶m bao nhiªu linh th¹ch, cã thÓ thµnh thuéc tİnh b¸t qu¸i hay kh«ng, cho nªn nÕu ®­îc th× cè g¾ng thªm vµi vËt cã gi¸ trŞ.")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."ë trªn ®· nh¾c ®Õn råi, trªn trang bŞ cã møc linh khİ tèi ®a vµ lç kh¶m n¹m, 1 trang bŞ kh¶m <color=yellow>3 viªn<color> linh th¹ch, khi møc linh khİ cña 3 viªn linh th¹ch b»ng víi møc linh khİ tèi ®a cña trang bŞ, sÏ h×nh thµnh trang bŞ thuéc tİnh b¸t qu¸i. Linh th¹ch lµ sè lÎ th× møc linh khİ ©m, Linh th¹ch lµ sè ch½n th× møc linh khİ d­¬ng, nÕu thø tù Linh Th¹ch ®­îc kh¶m kh«ng gièng nhau, th× trang bŞ cã thuéc tİnh b¸t qu¸i kh¸c nhau, trªn \'B¸t qu¸i B¶o §iÓn\' dµnh cho hËu duÖ cña C«ng D· ThÕ Gian cã ghi rÊt râ lµm thÕ nµo ®Ó chÕ t¹o 1 trang bŞ cã thuéc tİnh b¸t qu¸i mong muèn, cã thêi gian th× xem.")
end

function xinwuqi()
	local nLevel = GetLifeSkillLevel(1, 2)
	if (GetLifeSkillLevel(1, 2) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 80 and HaveLearnRecipe(1010) == 0) then
        	AddRecipe(1011)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i Hµo L«i Th­¬ng")
        	AddRecipe(1005)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: LiÖt DiÖm")
        	AddRecipe(1010)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: A La H¸n Tr­îng")
       else
        	Say(strTitle.."Nµy, ng­êi thanh niªn, ®õng sèt ruét, tè chÊt cña ng­¬i b©y giê cßn kĞm l¾m, ®îi ng­¬i sö dông thµnh th¹o tÊt c¶ c¸c lo¹i binh khİ dµi th«ng th­êng, lóc ®ã ®Õn t×m ta.",0)
		end
	else
		Talk(1,"","Ng­êi vÉn ch­a häc kü n¨ng nµy!")
	end
end

function update_max_skill_level()
	Say(strTitle..format("Më réng cÊp kü n¨ng s¶n xuÊt cÇn kü n¨ng thu thËp ®¹t cÊp 79 ®ång thêi tiªu hao %d Vµng", 1000), 
		2, "§ång ı/update_max_skill_level_ensure", "T¹i h¹ chØ xem qua th«i/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 2) < 79 then
		Talk(1,"",format("HiÖn t¹i cÊp kü n¨ng s¶n xuÊt ch­a ®¹t cÊp %d, kh«ng thÓ më réng cÊp giíi h¹n kü n¨ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng©n l­îng kh«ng ®ñ %d vµng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 2, 99);
	Msg2Player("Chóc mõng cÊp giíi h¹n kü n¨ng s¶n xuÊt ®· ®¹t cÊp 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end
