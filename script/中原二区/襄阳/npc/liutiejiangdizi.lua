--ÁõÌú½³µÄÍ½µÜ½Å±¾
--by vivi
--08/30/2007

--2008´º½Ú»î¶¯
Include("\\script\\online\\newyear08\\newyear08_head.lua");
--ÁéÊ¯Í·ÎÄ¼ş
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\weapon_upgrade\\upgrade_npc.lua");
--201403»î¶¯
Include("\\script\\online_activites\\2014_03\\task_camp.lua")


--ÁÙÊ±±äÁ¿
TT_BOX_TYPE = 123;

--ÈÎÎñ±äÁ¿
TASK_BUCHANG_ID = 1285;           --ÁõÌú½³´¦ÎïÆ·²¹³¥±äÁ¿

buchang_id 	= 20071018;				--±¾´ÎµÄ²¹³¥´úºÅ£¬´æÈë²¹³¥³õÊ¼ÈÕÆÚ
buchang_start_date 	= 2007101800;			--²¹³¥¿ªÊ¼Ê±¼ä
buchang_end_date 	= 2007102600;			--²¹³¥½áÊøÊ±¼ä

THIS_FILE = "\\script\\ÖĞÔ­¶şÇø\\ÏåÑô\\npc\\liutiejiangdizi.lua"

tZbWz = {
	[1]={0,"§Çu kh«i"},
	[2]={1,"Ngo¹i trang"},
	[3]={3,"H¹ y"}
	}

tChangeRing = {
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"§«ng Ph­¬ng Long Ch©u",0,102,24},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Lµm gi¶m néi, ngo¹i phßng cña ®èi ph­¬ng 10%",5,444},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Tµng KiÕm B¶o Ch©u",0,102,38},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Sinh lùc, néi lùc tèi ®a t¨ng 8%",1,481},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Ngäc",0,102,129},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Søc m¹nh +40",7,264},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Béi",0,102,132},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Néi c«ng +40",7,267},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Hoµn",0,102,131},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"G©n cèt +40",7,263},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn §¸i",0,102,130},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Th©n ph¸p +40",7,265},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Giíi",0,102,133},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Linh ho¹t +40",7,266},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn §¹i",0,102,134},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"TÊn c«ng kÌm ®éc s¸t 35",1,480},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Th¹ch",0,102,135},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"S¸t th­¬ng t¨ng 40",2,331},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"KhuÊt Nguyªn Béi",0,102,27},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"600 gi©y ®é bÒn vò khİ håi phôc 5",5,43},"Hiªn Viªn ChiÕn"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"§¹i Lùc ThÇn H¹ng Liªn",0,102,28},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Tèc ®é di chuyÓn t¨ng 10%",1,101},"Hiªn Viªn §Êu"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Tµng KiÕm Kim Ên",0,102,40},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"S¸t th­¬ng gi¶m 10%",3,107},"Hiªn Viªn §Êu"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Tµng KiÕm Kú Th¹ch",0,102,39},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Tû lÖ xuÊt chiªu t¨ng 3%",2,27},"Hiªn Viªn §Êu"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Ngäc",0,102,129},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Søc m¹nh +40",7,264},"Hiªn Viªn §Êu"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Béi",0,102,132},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Néi c«ng +40",7,267},"Hiªn Viªn §Êu"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Hoµn",0,102,131},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"G©n cèt +40",7,263},"Hiªn Viªn §Êu"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn §¸i",0,102,130},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Th©n ph¸p +40",7,265},"Hiªn Viªn §Êu"}, 
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Giíi",0,102,133},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Linh ho¹t +40",7,266},"Hiªn Viªn §Êu"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn §¹i",0,102,134},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"TÊn c«ng kÌm ®éc s¸t 35",1,480},"Hiªn Viªn §Êu"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"Cöu Thiªn HuyÒn Th¹ch",0,102,135},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"S¸t th­¬ng t¨ng 40",2,331},"Hiªn Viªn §Êu"},
{{"Thµnh ThÕ kim b¶o r­¬ng",2,0,1028,2},{"KhuÊt Nguyªn Béi",0,102,27},{"Tèc ®é thi triÓn vâ c«ng t¨ng 5%",1,477,"Sinh lùc tèi ®a 6%",2,253,"Søc lùc t¨ng 1000",1,479},"Hiªn Viªn §Êu"}
	}

tXuanyuanZhan = 
{
	[0] = {{"Hiªn Viªn ChiÕn",0,102,8801},{"Hiªn Viªn ChiÕn",0,102,8803},{"Hiªn Viªn ChiÕn",0,102,8805},{"Hiªn Viªn ChiÕn",0,102,8807},{"Hiªn Viªn ChiÕn",0,102,8809},{"Hiªn Viªn ChiÕn",0,102,8811},{"Hiªn Viªn ChiÕn",0,102,8813},{"Hiªn Viªn ChiÕn",0,102,8815},{"Hiªn Viªn ChiÕn",0,102,8817},{"Hiªn Viªn ChiÕn",0,102,8819},{"Hiªn Viªn ChiÕn",0,102,8821},{"Hiªn Viªn ChiÕn",0,102,8823},{"Hiªn Viªn ChiÕn",0,102,8825},{"Hiªn Viªn ChiÕn",0,102,8827}},
	[1] = {{"Hiªn Viªn ChiÕn",0,102,8801},{"Hiªn Viªn ChiÕn",0,102,8803},{"Hiªn Viªn ChiÕn",0,102,8805}},
	[2] = {{"Hiªn Viªn ChiÕn",0,102,8801}},
	[3] = {{"Hiªn Viªn ChiÕn",0,102,8803}},
	[4] = {{"Hiªn Viªn ChiÕn",0,102,8805}},
	[5] = {{"Hiªn Viªn ChiÕn",0,102,8807}},
	[6] = {{"Hiªn Viªn ChiÕn",0,102,8807}},
	[7] = {{"Hiªn Viªn ChiÕn",0,102,8809},{"Hiªn Viªn ChiÕn",0,102,8811}},
	[8] = {{"Hiªn Viªn ChiÕn",0,102,8809}},
	[9] = {{"Hiªn Viªn ChiÕn",0,102,8811}},
	[10] = {{"Hiªn Viªn ChiÕn",0,102,8813},{"Hiªn Viªn ChiÕn",0,102,8815}},
	[11] = {{"Hiªn Viªn ChiÕn",0,102,8813}},
	[12] = {{"Hiªn Viªn ChiÕn",0,102,8815}},
	[13] = {{"Hiªn Viªn ChiÕn",0,102,8817},{"Hiªn Viªn ChiÕn",0,102,8819}},
	[14] = {{"Hiªn Viªn ChiÕn",0,102,8817}},
	[15] = {{"Hiªn Viªn ChiÕn",0,102,8819}},
	[16] = {{"Hiªn Viªn ChiÕn",0,102,8821},{"Hiªn Viªn ChiÕn",0,102,8823}},
	[17] = {{"Hiªn Viªn ChiÕn",0,102,8821}},
	[18] = {{"Hiªn Viªn ChiÕn",0,102,8823}},
	[19] = {{"Hiªn Viªn ChiÕn",0,102,8825},{"Hiªn Viªn ChiÕn",0,102,8827}},
	[20] = {{"Hiªn Viªn ChiÕn",0,102,8825}},
	[21] = {{"Hiªn Viªn ChiÕn",0,102,8827}},
}
	
tXuanyuanDou = 
{
	[0] = {{"Hiªn Viªn §Êu",0,102,8802},{"Hiªn Viªn §Êu",0,102,8804},{"Hiªn Viªn §Êu",0,102,8806},{"Hiªn Viªn §Êu",0,102,8808},{"Hiªn Viªn §Êu",0,102,8810},{"Hiªn Viªn §Êu",0,102,8812},{"Hiªn Viªn §Êu",0,102,8814},{"Hiªn Viªn §Êu",0,102,8816},{"Hiªn Viªn §Êu",0,102,8818},{"Hiªn Viªn §Êu",0,102,8820},{"Hiªn Viªn §Êu",0,102,8822},{"Hiªn Viªn §Êu",0,102,8824},{"Hiªn Viªn §Êu",0,102,8826},{"Hiªn Viªn §Êu",0,102,8828}},
	[1] = {{"Hiªn Viªn §Êu",0,102,8802},{"Hiªn Viªn §Êu",0,102,8804},{"Hiªn Viªn §Êu",0,102,8806}},
	[2] = {{"Hiªn Viªn §Êu",0,102,8802}},
	[3] = {{"Hiªn Viªn §Êu",0,102,8804}},
	[4] = {{"Hiªn Viªn §Êu",0,102,8806}},
	[5] = {{"Hiªn Viªn §Êu",0,102,8808}},
	[6] = {{"Hiªn Viªn §Êu",0,102,8808}},
	[7] = {{"Hiªn Viªn §Êu",0,102,8810},{"Hiªn Viªn §Êu",0,102,8812}},
	[8] = {{"Hiªn Viªn §Êu",0,102,8810}},
	[9] = {{"Hiªn Viªn §Êu",0,102,8812}},
	[10] = {{"Hiªn Viªn §Êu",0,102,8814},{"Hiªn Viªn §Êu",0,102,8816}},
	[11] = {{"Hiªn Viªn §Êu",0,102,8814}},
	[12] = {{"Hiªn Viªn §Êu",0,102,8816}},
	[13] = {{"Hiªn Viªn §Êu",0,102,8818},{"Hiªn Viªn §Êu",0,102,8820}},
	[14] = {{"Hiªn Viªn §Êu",0,102,8818}},
	[15] = {{"Hiªn Viªn §Êu",0,102,8820}},
	[16] = {{"Hiªn Viªn §Êu",0,102,8822},{"Hiªn Viªn §Êu",0,102,8824}},
	[17] = {{"Hiªn Viªn §Êu",0,102,8822}},
	[18] = {{"Hiªn Viªn §Êu",0,102,8824}},
	[19] = {{"Hiªn Viªn §Êu",0,102,8826},{"Hiªn Viªn §Êu",0,102,8828}},
	[20] = {{"Hiªn Viªn §Êu",0,102,8826}},
	[21] = {{"Hiªn Viªn §Êu",0,102,8828}},
}

tHuangDiWeapon = 
{
	[0] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802},{"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803},{"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804},{"Hiªn Viªn Giíi Tö Kim",0,1,8805},{"Hiªn Viªn Tö Tinh KiÕm",0,2,8806},{"Hiªn Viªn Phông Hoµng CÇm",0,10,8807},{"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808},{"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809},{"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810},{"Hiªn Viªn Sinh Tö Bót",0,9,8811},{"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812},{"Hiªn Viªn Khai Thiªn Cung",0,4,8813},{"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814},{"Hiªn Viªn U Minh Tr¶o",0,11,8815}},
	[1] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802},{"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803},{"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804}},
	[2] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802}},
	[3] = {{"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803}},
	[4] = {{"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804}},
	[5] = {{"Hiªn Viªn Giíi Tö Kim",0,1,8805}},
	[6] = {{"Hiªn Viªn Giíi Tö Kim",0,1,8805}},
	[7] = {{"Hiªn Viªn Tö Tinh KiÕm",0,2,8806},{"Hiªn Viªn Phông Hoµng CÇm",0,10,8807}},
	[8] = {{"Hiªn Viªn Tö Tinh KiÕm",0,2,8806}},
	[9] = {{"Hiªn Viªn Phông Hoµng CÇm",0,10,8807}},
	[10] = {{"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808},{"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809}},
	[11] = {{"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808}},
	[12] = {{"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809}},
	[13] = {{"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810},{"Hiªn Viªn Sinh Tö Bót",0,9,8811}},
	[14] = {{"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810}},
	[15] = {{"Hiªn Viªn Sinh Tö Bót",0,9,8811}},
	[16] = {{"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812},{"Hiªn Viªn Khai Thiªn Cung",0,4,8813}},
	[17] = {{"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812}},
	[18] = {{"Hiªn Viªn Khai Thiªn Cung",0,4,8813}},
	[19] = {{"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814},{"Hiªn Viªn U Minh Tr¶o",0,11,8815}},
	[20] = {{"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814}},
	[21] = {{"Hiªn Viªn U Minh Tr¶o",0,11,8815}},
}
	

tChangeWp = {
	[1]={"Hiªn Viªn To¸i Vò §ao",0,3,8801},
	[2]={"Hiªn Viªn To¸i Vò C«n",0,5,8802},
	[3]={"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803}, 
	[4]={"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804},
	[5]={"Hiªn Viªn Giíi Tö Kim",0,1,8805},
	[6]={"Hiªn Viªn Tö Tinh KiÕm",0,2,8806},
	[7]={"Hiªn Viªn Phông Hoµng CÇm",0,10,8807},
	[8]={"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808},
	[9]={"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809},
	[10]={"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810},
	[11]={"Hiªn Viªn Sinh Tö Bót",0,9,8811},
	[12]={"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812},
	[13]={"Hiªn Viªn Khai Thiªn Cung",0,4,8813},
	[14]={"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814},
	[15]={"Hiªn Viªn U Minh Tr¶o",0,11,8815}
	}

tWpChangeRing = {
	 [1]={{"Hiªn Viªn ChiÕn",0,102,8801},{"Hiªn Viªn §Êu",0,102,8802}},
	 [2]={{"Hiªn Viªn ChiÕn",0,102,8801},{"Hiªn Viªn §Êu",0,102,8802}},
	 [3]={{"Hiªn Viªn ChiÕn",0,102,8803},{"Hiªn Viªn §Êu",0,102,8804}}, 
	 [4]={{"Hiªn Viªn ChiÕn",0,102,8805},{"Hiªn Viªn §Êu",0,102,8806}},
	 [5]={{"Hiªn Viªn ChiÕn",0,102,8807},{"Hiªn Viªn §Êu",0,102,8808}},
	 [6]={{"Hiªn Viªn ChiÕn",0,102,8809},{"Hiªn Viªn §Êu",0,102,8810}},
	 [7]={{"Hiªn Viªn ChiÕn",0,102,8811},{"Hiªn Viªn §Êu",0,102,8812}},
	 [8]={{"Hiªn Viªn ChiÕn",0,102,8813},{"Hiªn Viªn §Êu",0,102,8814}},
	 [9]={{"Hiªn Viªn ChiÕn",0,102,8815},{"Hiªn Viªn §Êu",0,102,8816}},
	[10]={{"Hiªn Viªn ChiÕn",0,102,8817},{"Hiªn Viªn §Êu",0,102,8818}},
	[11]={{"Hiªn Viªn ChiÕn",0,102,8819},{"Hiªn Viªn §Êu",0,102,8820}},
	[12]={{"Hiªn Viªn ChiÕn",0,102,8821},{"Hiªn Viªn §Êu",0,102,8822}},
	[13]={{"Hiªn Viªn ChiÕn",0,102,8823},{"Hiªn Viªn §Êu",0,102,8824}},
	[14]={{"Hiªn Viªn ChiÕn",0,102,8825},{"Hiªn Viªn §Êu",0,102,8826}},
	[15]={{"Hiªn Viªn ChiÕn",0,102,8827},{"Hiªn Viªn §Êu",0,102,8828}}
	}

tBaguaNum = {--µÚ2£¬3£¬4ÎªÎïÆ·id£¬µÚ5Î»ÎªÁéÆøÖµ81-100ĞèÒªµÄÊıÁ¿  µÚÁùÎ»ÁéÆøÖµ61-80ĞèÒªµÄÊıÁ¿
	[1]={"Kh¶m",2,1,471,10,10},
	[2]={"Kh«n",2,1,470,10,10},
	[3]={"ChÊn",2,1,474,3,2},
	[4]={"Tèn",2,1,476,3,2},
	[6]={"Cµn",2,1,469,10,10},
	[7]={"§oµi",2,1,472,10,10},
	[8]={"CÊn",2,1,475,3,3},
	[9]={"Ly",2,1,473,3,3}
	};

--°Ë¾Å¼¶ÎäÆ÷
tHighLvWp = {{"ThÇn Quy",0,0,15},{"¢m D­¬ng Ên",0,0,16},{"Häa ¶nh",0,2,37},{"Nha Cöu",0,2,38},{"Ngäc Trô",0,5,41},{"ThÇn Ch©m",0,5,42},
{"Khoa Phô",0,1,54},{"Kh«ng cã",0,1,55},{"LËu C¶nh",0,3,65},{"NghŞch L©n",0,3,66},{"§¹i Th¸nh Di ¢m",0,10,76},{"Kh« Méc Long Ng©m",0,10,77},{"Toan D­",0,9,87},
{"Th¸i H­",0,9,88},{"Môc KiÒn Liªn Tr­îng",0,8,98},{"D­îc S­ tr­îng",0,8,99},{"Cöu Long Toµn Kİch",0,6,109},{"Th­¬ng N«",0,6,110},{"Viªn §Ò",0,4,120},
{"BÊt X¹ Chi X¹",0,4,121},{"V« NgÊn",0,11,13},{"Thanh Long",0,11,14},{"Bİch Thñy",0,7,13},{"Thiªn T«n",0,7,14}}; 

--ÌìµØĞş»ÆÎäÆ÷
tTiandiWp ={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43},{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56},{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78},{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89},{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100},{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111},{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122},{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15},{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}};

--ÌìµØĞş»Æ×°±¸ ËÄ¸öÌåĞÍ
tTiandiZb = {
	[1] = {{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,85},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,86},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,87},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,88}},
	[2] = {{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,85},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,86},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,87},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,88}},
	[4] = {{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,85},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,86},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,87},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,88}},
};

tTiandi = {
	{{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,85},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,86},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,87},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,88}},
	{{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,85},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,86},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,87},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,88}},
	{{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,85},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,86},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,87},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,88}},
	{[0]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43},{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56},{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78},{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89},{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100},{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111},{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122},{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15},{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [1]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43},{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100}},
	 [2]={{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43}},
	 [3]={{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100}},
	 [4]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17}},
	 [5]={{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56}},
	 [6]={{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56}},
	 [7]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78}},
	 [8]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39}},
	 [9]={{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78}},
	 [10]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43}},
	 [11]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17}},
	 [12]={{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43}},
	 [13]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89}},
	 [14]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39}},
	 [15]={{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89}},
	 [16]={{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111},{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122}},
	 [17]={{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111}},
	 [18]={{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122}},
	 [19]={{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15},{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [20]={{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [21]={{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15}}}
	};

tHuihuang = {{"Huy Hoµng Chi Thñy",0,102,8840},{"Huy Hoµng Chi KÕ",0,102,8842},{"Huy Hoµng QuËt Khëi",0,102,8844},{"Huy Hoµng",0,102,8846}};
tRongyao = {{"Vinh Dù Chi Thñy",0,102,8841},{"Vinh Dù Chi KÕ",0	,102,8843},{"Vinh Dù QuËt Khëi",0,102,8845},{"Vinh Dù",	0,102,8847}};
tUplevel = {{"Thiªn Th¹ch Tinh Th¹ch",2,1,1009,400},{"Thiªn Th¹ch Tinh Th¹ch",2,1,1009,400},{"Thiªn Th¹ch Tinh Th¹ch",2,1,1009,1000}};

function main()
	local strtab = {
--		"ÎÒÒªÌáÉıÁéÆø×°±¸µÄµÈ¼¶/enhance_level",
--		"ÄãÄÜÌáÉıÊ²Ã´ÑùµÄÁéÆø×°±¸/about_enhance",
		"ChÕ t¹o vµ n©ng cÊp trang bŞ/npc_upgrade_talk",
		
		"Viªm §Õ/ViemDeMenu",
		"T­íng Qu©n/TuongQuanMenu",
		"Nguyªn So¸i/NguyenSoaiMenu",
		"Thiªn H¹ V« Song/VoSong_Menu",
--		"ChuyÓn ®æi trang bŞ Tèng Liªu/npc_convert_talk",
		"ChuyÓn hãa trang bŞ linh khİ/lingqi_item_change",			
--		"Ñ×»ÆµÛ×°±¸Ïà¹Ø/about_huangdi",
--		"ÎÒÒªÓÃ¸÷ÖÖ±¦Ïä¶Ò»»ÔÂ»ª/box_change_yuehua",
--		"ÌìµØĞş»Æ×°±¸Ïà¹Ø/about_tdxh",
--		"×°±¸ÁéÆø±ä»¯Ïà¹Ø/add_item_lingqi",
--		"Th¨ng cÊp trang bŞ/item_uplevel",
--		"²½·ÇÑÌ¡¢ÔÂÁÁÍÃÒ©°üµÈ»Æ½ğ×°±¸Ïà¹Ø/about_bufeiyan",
--		"»Ô»ÍÈÙÒ«Ïà¹ØÄÚÈİ/about_hhry"
		}
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20130925 then
		tinsert(strtab,1,"RÌn l¹i vò khİ/NangCapLevelVuKhi_Menu")
	end
	if nDate <= 20141012 then
		tinsert(strtab,1,"Trang bŞ L«i Hæ/LoiHo_Menu")
	end
--	local nDate = tonumber(date("%Y%m%d%H"));
--	if nDate >= buchang_start_date and nDate < buchang_end_date then
--		tinsert(strtab,"Ta muèn nhËn båi th­êng/buchang_dia");
--	end;
--	local nTime = tonumber(date("%Y%m%d%H"));
--	if nTime >= 2008091108 and nTime <= 2008101207 then
--		tinsert(strtab,1,"Mõng Tam TiÕt, miÔn phİ th¸o rêi trang bŞ B¸t Qu¸i (hÕt h¹n lóc 7h ngµy 12/10)/lingqi_item_update");
--	elseif nTime >= 2008101208 then
--		tinsert(strtab,3,"VÒ trang bŞ B¸t Qu¸i/lingqi_item_update")
--	end	
	--tinsert(strtab,"C­êng hãa may m¾n/LuckyEnhance");
	--»î¶¯
	if gf_CheckEventDateEx(WN_201403_CAMPTASK_ID) == 1 then
		tinsert(strtab, WN_201403_CAMPTASK_AWARD);
	end
	--
	tinsert(strtab,"Ta chØ ®Õn th¨m «ng th«i!/nothing")
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ta lµ ®Ö tö giái nhÊt cña thî rÌn L­u. Ta cã thÓ gióp ng­¬i th¨ng cÊp trang bŞ linh khİ cao cÊp. Ngoµi ra, nÕu ng­¬i cã trang bŞ th­îng cæ thÇn khİ Hoµng §Õ, ta còng cã thÓ thæi thÇn khİ gióp ng­¬i, lµm cho trang bŞ phï hîp víi ng­¬i h¬n. <color=red>L­u ı, nÕu vò khİ cña ng­¬i ®· kİch ho¹t Linh Ph¸ch, sau khi ta tiÕn hµnh thao t¸c, Linh Ph¸ch sÏ bŞ huû.<color>",
		getn(strtab),
		strtab);
end

function LuckyEnhance()
	Say("<color=green> §Ö tö thî rÌn L­u <color>:  C­êng hãa may m¾n cã thÓ gióp trang bŞ tõ cÊp 7 ®Õn cÊp 8 c­êng hãa ngÉu nhiªn tõ cÊp 8 ®Õn cÊp 11. Trang bŞ cÊp 7 ch­a ®Şnh hån khi thÊt b¹i quay vÒ 0.<color><color=red>  Trang bŞ ®Şnh hån cÊp 10 kh«ng thÓ sö dông chøc n¨ng nµy.<color>"
		, 2
		, "X¸c ®Şnh c­êng hãa may m¾n/TrueLuckyEnhance"
		, "Ta chØ ghĞ ch¬i/nothing"
		);
end

function TrueLuckyEnhance()
	LuckyEnhanceEquipment();
end


function about_huangdi()
	Say("NÕu ng­¬i cã kiÕm cæ Hoµng ®Õ, ta sÏ gióp ng­¬i truyÒn thÇn khİ, ®Ó nã phï hîp víi ng­¬i.",
		7,
		"Ta muèn t¨ng trŞ sè vò khİ Hoµng ®Õ/weapon_update",
		"Ta muèn ®æi trang bŞ Hoµng ®Õ cã thuéc tİnh ®Æc biÖt/change_ring",
		"Lµm thÕ nµo ®æi trang bŞ Hoµng ®Õ cã thuéc tİnh ®Æc biÖt/#how_change_ring(0)",
		"Ta muèn dïng vò khİ Hoµng ®Ó ®æi trang søc Hoµng ®Õ/weapon_change_ring",
		"Ta muèn dïng 15 R­¬ng Hoµng Kim ThŞnh ThÕ ®Ó ®æi vò khİ Hoµng §Õ/box_change_weapon",
		"Ta muèn dïng 4 R­¬ng Hoµng Kim ThŞnh ThÕ ®Ó ®æi trang søc Hoµng §Õ/jinbox_huan_ring",
		"Chän sai råi, trë l¹i/main")
end

function enhance_level()
	if GetLevel() < 80 then
		Talk(1,"","Ta chØ lµ cao thñ t¨ng ®¼ng cÊp linh khİ trang bŞ, ng­¬i ph¶i khæ luyÖn mét phen trªn giang hå n÷a, ®Õn <color=yellow>cÊp 80<color> h·y ®Õn t×m ta.");
	else
		Say("Ng­¬i muèn t¨ng ®¼ng cÊp trang bŞ cña vŞ trİ nµo",
			4,
			"§Çu kh«i/#enhance_zhuangbei(0)",
			"Ngo¹i trang/#enhance_zhuangbei(1)",
			"H¹ y/#enhance_zhuangbei(3)",
			"§îi ta mÆc trang bŞ lªn ®·./nothing"
			)
	end
end

function enhance_zhuangbei(nWz)
	local nTb = 3;
	if nWz ~= 3 then
		nTb = nWz+1;
	end
	local nIndex = GetPlayerEquipIndex(nWz);	
	local nPlayerLv = floor(GetLevel()/10);
	local nZhuangbeiLv = GetEquipLevel(nIndex); --»ñÈ¡µ±Ç°×°±¸µÈ¼¶
	local nLingqi = GetItemMaxLingQi(nIndex);   --»ñÈ¡ÁéÆøÖµ
	if nIndex	== 0 then
		Talk(1,"","Ng­¬i kh«ng mÆc theo "..tZbWz[nTb][2].." µ?");
		return
	else 
		if nLingqi == 0 or nZhuangbeiLv < 7 then
			Talk(1,"","Ta chØ t¨ng linh khİ trang bŞ cÊp 7 hoÆc cÊp 8, xin x¸c ®Şnh ®· mÆc "..tZbWz[nTb][2].."!");
			return
		end
		if nPlayerLv <= nZhuangbeiLv then
			Talk(1,"","Quy t¾c t¨ng cÊp trang bŞ lµ chØ cã thÓ t¨ng <color=yellow>®¼ng cÊp trang bŞ ph¶i nhá h¬n ®¼ng cÊp cña ng­¬i vµ chia cho 10 (lÊy ch½n)<color>, trang bŞ hiÖn t¹i cña ng­¬i <color=red>kh«ng thÓ<color> t¨ng cÊp, ®æi trang bŞ kh¸c råi ®Õn t×m ta!")
			return
		else
			Say("§iÓm linh khİ d­íi <color=yellow>80 miÔn phİ<color> t¨ng ®¼ng cÊp trang bŞ, ®iÓm linh khİ <color=yellow>80 hoÆc h¬n<color> mçi lÇn t¨ng ®¼ng cÊp trang bŞ sÏ lÊy <color=yellow>10 vµng<color>. Cã muèn t¨ng ®¼ng cÊp linh khİ trang bŞ kh«ng?",
				2,
				"§­îc, ta muèn t¨ng"..tZbWz[nTb][2].."®¼ng cÊp linh khİ trang bŞ /#confirm_enhance("..nWz..")",
				"Ta suy nghÜ l¹i/nothing")
		end		
	end
end

function confirm_enhance(nWz)
	local nTb = 3;
	if nWz ~= 3 then
		nTb = nWz+1;
	end	
	local nIndex = GetPlayerEquipIndex(nWz);
	local nLingqi = GetItemMaxLingQi(nIndex);
	local nMaxLv = floor(GetLevel()/10);
	local nBaseLv = GetEquipBaseLevel(nIndex); --»ñÈ¡×°±¸»ù´¡µÈ¼¶
	if nLingqi >= 80 then
		if GetCash() < 100000 then
			Talk(1,"","Ng­¬i kh«ng cã ®ñ <color=yellow>10 vµng<color> µ");
			return
		end
		if Pay(100000) == 1 then
			if SetItemIncreaseLevel(nIndex,(nMaxLv-nBaseLv)) == 1 then
				Talk(1,"","Chóc mõng ng­¬i, t¨ng cÊp trang bŞ <color=yellow>thµnh c«ng<color>!")
				Msg2Player("T¨ng cÊp linh khİ trang bŞ thµnh c«ng!");
				WriteLog("T¨ng cÊp linh khİ trang bŞ: Ng­êi ch¬i "..GetName().."T¨ng"..tZbWz[nTb][2].."trang bŞ thµnh c«ng.");
			else
				WriteLog("T¨ng cÊp linh khİ trang bŞ: Ng­êi ch¬i "..GetName().."T¨ng"..tZbWz[nTb][2].."trang bŞ thÊt b¹i.");
			end
		end
	else 
		if SetItemIncreaseLevel(nIndex,(nMaxLv-nBaseLv)) == 1 then
			Talk(1,"","Chóc mõng ng­¬i, t¨ng cÊp trang bŞ <color=yellow>thµnh c«ng<color>!")
			Msg2Player("T¨ng cÊp linh khİ trang bŞ thµnh c«ng!");
			WriteLog("T¨ng cÊp linh khİ trang bŞ: Ng­êi ch¬i "..GetName().."T¨ng"..tZbWz[nTb][2].."trang bŞ thµnh c«ng.");
		else
			WriteLog("T¨ng cÊp linh khİ trang bŞ: Ng­êi ch¬i "..GetName().."T¨ng"..tZbWz[nTb][2].."trang bŞ thÊt b¹i.");
		end		
	end			
end

function about_enhance()
	Talk(1,"about_enhance2","Ta lµ cao thñ vµ t¨ng linh khİ trang bŞ cao cÊp, ta chØ t¨ng cÊp <color=yellow>nãn, <color>th­îng y, <color=yellow>vµ<color> h¹ y. Khi ng­¬i ®¹t cÊp 80 trë lªn, ta sÏ gióp ng­¬i t¨ng cÊp linh khİ trang bŞ tõ <color=yellow>cÊp 7<color> lªn <color=yellow>cÊp 8<color>, nÕu ng­¬i ®¹t cÊp 90 trë lªn th× sÏ gióp ng­¬i t¨ng cÊp linh khİ trang bŞ tõ <color=yellow>cÊp 7 hoÆc cÊp 8<color> lªn <color=yellow>cÊp 9<color>.");
end

function about_enhance2()
	Talk(1,"main","§iÓm linh khİ d­íi <color=yellow>80<color>, ta sÏ <color=yellow>miÔn phİ<color> t¨ng ®¼ng cÊp trang bŞ; ®iÓm linh khİ <color=yellow>80 hoÆc h¬n<color>, th× mçi trang bŞ sÏ thu phİ lµ <color=yellow>10 vµng<color>.");
end

function weapon_update()
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i cã thÓ ®­a vò khİ Hoµng §Õ cho ta, ta sÏ gióp ng­¬i thay ®æi c¸c thuéc tİnh cña vò khİ Hoµng §Õ miÔn phİ, ng­¬i cã thÓ thay ®æi ®Õn khi nµo võa ı th× th«i. Ng­¬i x¸c nhËn muèn thay ®æi? <color=red>L­u ı, trong lóc ®æi ph¶i trang bŞ vò khİ trªn ng­êi. Kh«ng gi÷ l¹i hiÖu qu¶ c­êng ho¸ vµ ®Şnh hån cña vò khİ!<color>",
		2,
		"õ, ta muèn ®æi./confirm_weapon_update",
		"Kh«ng, ta nhÇm!/main")
end

function confirm_weapon_update()
	local nIndex = 0; --¶ÔÓ¦tChangeWp±íµÄË÷Òı
	local nIdx = GetPlayerEquipIndex(2); --ÄÃÔÚÊÖÉÏµÄÎäÆ÷Ë÷Òı
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
		Talk(1,"","VËt phÈm nµy lµ vËt phÈm khãa, më khãa råi ®æi nhĞ!");
		return
	end	
	for i = 1,getn(tChangeWp) do 
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 == tChangeWp[i][2] and nId2 == tChangeWp[i][3] and nId3 == tChangeWp[i][4] then
			nIndex = i;
			break
		end
	end
	if nIdx == 0 or nIndex == 0 then  --Ã»ÓĞÄÃÎäÆ÷»òÕßÄÃµÄ²»ÊÇ»ÆµÛÎäÆ÷
		Talk(1,"","Ng­¬i ®ang mang kh«ng ph¶i vò khİ Hoµng ®Õ, h·y mang vò khİ Hoµng ®Õ vµo ng­êi ®i!");
		return
	else
		if DelItemByIndex(nIdx,-1) == 1 then
			if AddItem(tChangeWp[nIndex][2],tChangeWp[nIndex][3],tChangeWp[nIndex][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
				Msg2Player("Ng­¬i ®· ®æi 1 vò khİ Hoµng ®Õ thµnh c«ng: "..tChangeWp[nIndex][1]);
			else
				WriteLog("§Ö tö thî rÌn L­u t¨ng cÊp trŞ sè vò khİ Hoµng ®Õ: Ng­êi ch¬i "..GetName().."®æi vò khİ Hoµng ®Õ thÊt b¹i.");
			end
		end
	end		
end

function how_change_ring(nPage)
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tChangeRing)-nPage*nPageNum;
	local nDiaNum = 6;
	if nRemaid < 6 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tChangeRing[nPage*nPageNum+i][1][5].."c¸i"..tChangeRing[nPage*nPageNum+i][1][1].." (hoÆc 1 "..tChangeRing[nPage*nPageNum+i][4]..") +1 "..tChangeRing[nPage*nPageNum+i][2][1].."--> Thuéc tİnh ®Æc biÖt"..tChangeRing[nPage*nPageNum+i][4].."/#change_ring_detail("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang tr­íc/#how_change_ring("..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"Trang kÕ/#how_change_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"trë l¹i/main");
	Say("Ng­¬i lÊy <color=yellow>"..tChangeRing[1][1][5].."c¸i"..tChangeRing[1][1][1].." hoÆc trang søc Hoµng ®Õ Hiªn Viªn chiÕn hoÆc Hiªn Viªn ®Êu <color>thªm mét trang søc Hoµng kim vèn cã cho ta, ta sÏ ®æi <color=yellow>trang bŞ Hoµng ®Õ Hiªn Viªn chiÕn hoÆc Hiªn Viªn ®Êu cã thuéc tİnh ®Æc biÖt <color>cho ng­¬i, quy t¾c ®æi cô thÓ nh­ sau, chó ı, h¹ng liªn kh¸c nhau sÏ ®æi thuéc tİnh trang bŞ Hoµng ®Õ kh¸c nhau.",
		getn(strtab),
		strtab)
end

function change_ring_detail(nIndex)
	Talk(1,"#how_change_ring(0)","…"..tChangeRing[nIndex][1][5].."c¸i"..tChangeRing[nIndex][1][1].." (hoÆc 1 "..tChangeRing[nIndex][4]..") vµ 1 "..tChangeRing[nIndex][2][1].."§æi 3 thuéc tİnh thµnh: <color=yellow>"..tChangeRing[nIndex][3][1]..","..tChangeRing[nIndex][3][4]..","..tChangeRing[nIndex][3][7].."<color> "..tChangeRing[nIndex][4]);
end

function change_ring()
	local strtab = {
		"Ta muèn dïng R­¬ng vµng ThŞnh thÕ vµ trang søc Hoµng kim ®æi trang søc Hoµng ®Õ thuéc tİnh ®Æc biÖt/#box_change_ring(0)",
		"Ta muèn dïng trang søc Hoµng ®Õ vµ trang søc Hoµng kim ®æi trang søc Hoµng ®Õ cã thuéc tİnh ®Æc biÖt/#ring_change_ring(0)",
		"Ta kh«ng ®æi/nothing"	
		}
	Say("Ng­¬i muèn dïng vËt phÈm nµo ®Ó ®æi? <color=red>Chó ı, trang søc Hoµng ®Õ vµ trang søc Hoµng kim muèn ®æi ®Òu ph¶i mang lªn ng­êi!<color>",
		getn(strtab),
		strtab)
end	

function box_change_ring(nPage)
	local strtab = {};
	local nPageNum = 7;
	local nRemaid = getn(tChangeRing)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaid < 7 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tChangeRing[nPage*nPageNum+i][1][5].."c¸i"..tChangeRing[nPage*nPageNum+i][1][1].." vµ 1 "..tChangeRing[nPage*nPageNum+i][2][1].." ®æi "..tChangeRing[nPage*nPageNum+i][4].."/#confirm_box_change_ring("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang tr­íc/#box_change_ring("..(nPage-1)..")");
	end
	if nRemaid > 7 then
		tinsert(strtab,"Trang kÕ/#box_change_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"§îi mét l¸t, ta ph¶i mang trang søc muèn ®æi lªn ng­êi/nothing");		
	Say("Chän lo¹i ng­¬i muèn ®æi. <color=red>Chó ı, ®Æt trang søc Hoµng kim ng­¬i muèn ®æi vµo vŞ trİ trang søc ®Çu tiªn trªn ng­êi!<color>",
		getn(strtab),
		strtab)
end

function confirm_box_change_ring(nIndex)
	Say("Ng­¬i chän dïng "..tChangeRing[nIndex][1][5].."c¸i"..tChangeRing[nIndex][1][1].." vµ 1 "..tChangeRing[nIndex][2][1].." ®æi 3 thuéc tİnh thµnh <color=yellow>"..tChangeRing[nIndex][3][1]..","..tChangeRing[nIndex][3][4]..","..tChangeRing[nIndex][3][7].."<color> "..tChangeRing[nIndex][4]..". X¸c ®Şnh kh«ng?",
		2,
		"§ång ı/#give_the_ring("..nIndex..")",
		"Ta chän nhÇm råi./#box_change_ring(0)")
end

function give_the_ring(nIndex)
	if GetItemCount(tChangeRing[nIndex][1][2],tChangeRing[nIndex][1][3],tChangeRing[nIndex][1][4]) < 2 then
		Talk(1,"","Ng­¬i kh«ng cã ®ñ "..tChangeRing[nIndex][1][1]);
		return
	end
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end	
	local nIdx = GetPlayerEquipIndex(4); --´÷ÔÚµÚÒ»¸öÊ×ÊÎÎ»ÖÃµÄË÷Òı 
	if nIdx == 0 then
		Talk(1,"","Ng­¬i kh«ng ®Æt trang søc muèn ®æi vµo vŞ trİ trang søc ®Çu tiªn trªn ng­êi µ!");
		return
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
		Talk(1,"","VËt phÈm ng­¬i ®Æt ë vŞ trİ trang søc ®Çu tiªn trªn ng­êi lµ vËt phÈm khãa, më khãa råi ®æi!");
		return
	end
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	if nId1 == tChangeRing[nIndex][2][2] and nId2 == tChangeRing[nIndex][2][3] and nId3 == tChangeRing[nIndex][2][4] then
		local nRoute = GetPlayerRoute();
		local nRand = 0;
		if nIndex < 11 then
			nRand = random(1,getn(tXuanyuanZhan[nRoute]));
		else
			nRand = random(1,getn(tXuanyuanDou[nRoute]));
		end 
		if DelItem(tChangeRing[nIndex][1][2],tChangeRing[nIndex][1][3],tChangeRing[nIndex][1][4],2) == 1 and DelItemByIndex(nIdx,-1) == 1 then
			local Add_flag = 0;
			if nIndex < 11 then
				Add_flag = AddItem(tXuanyuanZhan[nRoute][nRand][2],tXuanyuanZhan[nRoute][nRand][3],tXuanyuanZhan[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
			else
				Add_flag = AddItem(tXuanyuanDou[nRoute][nRand][2],tXuanyuanDou[nRoute][nRand][3],tXuanyuanDou[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
			end
			if Add_flag == 1 then
				Msg2Player("Chóc mõng ng­¬i ®æi trang søc Hoµng ®Õ thµnh c«ng!");
				WriteLog("§Ö tö thî rÌn L­u ®æi trang søc Hoµng ®Õ: Ng­êi ch¬i "..GetName().."dïng 2 "..tChangeRing[nIndex][1][1].." vµ"..tChangeRing[nIndex][2][1].." ®æi 1 trang søc Hoµng ®Õ");
			else
				WriteLog("§Ö tö thî rÌn L­u ®æi trang søc Hoµng ®Õ: Ng­êi ch¬i "..GetName().."dïng 2 "..tChangeRing[nIndex][1][1].." vµ"..tChangeRing[nIndex][2][1].."§æi trang søc Hoµng ®Õ thÊt b¹i, log: "..Add_flag);
			end
		end
	else
		Talk(1,"","ë vŞ trİ trang søc ®Çu tiªn trªn ng­êi ng­¬i kh«ng ph¶i "..tChangeRing[nIndex][2][1]);
		return
	end
end

function ring_change_ring(nPage)
	local strtab = {};
	local nPageNum = 7;
	local nRemaid = getn(tChangeRing)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaid < 7 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,"1 "..tChangeRing[nPage*nPageNum+i][4].." vµ 1 "..tChangeRing[nPage*nPageNum+i][2][1].." ®æi "..tChangeRing[nPage*nPageNum+i][4].."/#confirm_ring_change_ring("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang tr­íc/#ring_change_ring("..(nPage-1)..")");
	end
	if nRemaid > 7 then
		tinsert(strtab,"Trang kÕ/#ring_change_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"Ta kh«ng ®æi/nothing");		
	Say("Chän lo¹i ng­¬i muèn ®æi. <color=red>Chó ı, ®Æt trang søc Hoµng ®Õ ng­¬i muèn ®æi vµo vŞ trİ trang søc ®Çu tiªn trªn ng­êi, trang søc Hoµng kim ë vŞ trİ trang søc thø hai!<color>",
		getn(strtab),
		strtab)
end

function confirm_ring_change_ring(nIndex)
	Say("Ng­¬i chän dïng 1 "..tChangeRing[nIndex][4].." vµ 1 "..tChangeRing[nIndex][2][1].." ®æi 3 thuéc tİnh thµnh <color=yellow>"..tChangeRing[nIndex][3][1]..","..tChangeRing[nIndex][3][4]..","..tChangeRing[nIndex][3][7].."<color> "..tChangeRing[nIndex][4]..". X¸c ®Şnh kh«ng?",
		2,
		"§ång ı/#give_the_ring2("..nIndex..")",
		"Ta chän nhÇm råi./#ring_change_ring(0)")	
end

function give_the_ring2(nIndex)
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	local nIdx1 = GetPlayerEquipIndex(4); --µÚÒ»¸öÊ×ÊÎË÷Òı£¬¼´»ÆµÛÊ×ÊÎË÷Òı
	local nIdx2 = GetPlayerEquipIndex(5); --µÚ¶ş¸öÊ×ÊÎË÷Òı£¬¼´»Æ½ğÊ×ÊÎË÷Òı
	if nIdx1 == 0 or nIdx2 == 0 then
		Talk(1,"","§Æt trang søc Hoµng ®Õ ng­¬i muèn ®æi vµo vŞ trİ trang søc ®Çu tiªn trªn ng­êi, trang søc Hoµng kim ë vŞ trİ trang søc thø hai!")
		return
	end
	if GetItemSpecialAttr(nIdx1,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
		Talk(1,"","VËt phÈm ng­¬i ®Æt ë vŞ trİ trang søc ®Çu tiªn trªn ng­êi lµ vËt phÈm khãa, më khãa råi ®æi!");
		return
	end
	if GetItemSpecialAttr(nIdx2,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
		Talk(1,"","VËt phÈm ng­¬i ®Æt ë vŞ trİ trang søc thø hai trªn ng­êi lµ vËt phÈm khãa, më khãa råi ®æi!");
		return
	end	
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	local nFlag = 0;
	local nParticular = 0;
	if nIndex < 11 then
		for i=1,27,2 do	
			if nId1 == 0 and nId2 == 102 and nId3 == 8800+i then
				nFlag = 1;
				nParticular = 8800+i;
				break
			end
		end
	else
		for i=2,28,2 do	
			if nId1 == 0 and nId2 == 102 and nId3 == 8800+i then
				nFlag = 1;
				nParticular = 8800+i;
				break
			end
		end		
	end	
	if nFlag == 0 then
		Talk(1,"","ë vŞ trİ trang søc ®Çu tiªn trªn ng­êi ng­¬i kh«ng ph¶i "..tChangeRing[nIndex][4]);
		return
	end
	local nId4,nId5,nId6 = GetPlayerEquipInfo(5);
	if nId4 ~= tChangeRing[nIndex][2][2] or nId5 ~= tChangeRing[nIndex][2][3] or nId6 ~= tChangeRing[nIndex][2][4] then
		Talk(1,"","ë vŞ trİ trang søc thø hai trªn ng­êi ng­¬i kh«ng ph¶i "..tChangeRing[nIndex][2][1]);
		return
	end
	local nRoute = GetPlayerRoute();
	local nRand = 0;
	if nIndex < 11 then
		nRand = random(1,getn(tXuanyuanZhan[nRoute]));
	else
		nRand = random(1,getn(tXuanyuanDou[nRoute]));
	end 
	if DelItemByIndex(nIdx1,-1) == 1 and DelItemByIndex(nIdx2,-1) == 1 then
		local Add_flag = 0;
		if nIndex < 11 then
			Add_flag = AddItem(tXuanyuanZhan[nRoute][nRand][2],tXuanyuanZhan[nRoute][nRand][3],tXuanyuanZhan[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
		else
			Add_flag = AddItem(tXuanyuanDou[nRoute][nRand][2],tXuanyuanDou[nRoute][nRand][3],tXuanyuanDou[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
		end
		if Add_flag == 1 then
			Msg2Player("Chóc mõng ng­¬i ®æi trang søc Hoµng ®Õ thµnh c«ng!");
			WriteLog("§Ö tö thî rÌn L­u ®æi trang søc Hoµng ®Õ: Ng­êi ch¬i "..GetName().."Dïng thÎ"..tChangeRing[nIndex][2][1].." vµ"..tChangeRing[nIndex][4].." ®æi 1 trang søc Hoµng ®Õ");
		else
			WriteLog("§Ö tö thî rÌn L­u ®æi trang søc Hoµng ®Õ: Ng­êi ch¬i "..GetName().."Dïng thÎ"..tChangeRing[nIndex][2][1].." vµ"..tChangeRing[nIndex][4].."§æi trang søc Hoµng ®Õ thÊt b¹i, log: "..Add_flag);
		end
	end
end

function weapon_change_ring()
	Say("NÕu ng­¬i cã vò khİ Hoµng ®Õ d­, ®Õn chç ta ®æi trang søc Hoµng ®Õ l­u ph¸i t­¬ng øng. <color=red>Chó ı, mang vò khİ Hoµng ®Õ muèn ®æi vµo ng­êi. <color> Ng­¬i muèn ®æi trang søc nµo?",
		3,
		"Ta muèn lÊy vò khİ Hoµng ®Õ ®æi Hiªn Viªn chiÕn/#confirm_wp_change_ring(1)",
		"Ta muèn lÊy vò khİ Hoµng ®Õ ®æi Hiªn Viªn ®Êu/#confirm_wp_change_ring(2)",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function confirm_wp_change_ring(nType)
	local nIndex = 0; --¶ÔÓ¦tChangeWp±íµÄË÷Òı
	local nIdx = GetPlayerEquipIndex(2); --ÄÃÔÚÊÖÉÏµÄÎäÆ÷Ë÷Òı
	for i = 1,getn(tChangeWp) do 
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 == tChangeWp[i][2] and nId2 == tChangeWp[i][3] and nId3 == tChangeWp[i][4] then 
			nIndex = i;
			break
		end
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
		Talk(1,"","VËt phÈm nµy lµ vËt phÈm khãa, më khãa råi ®æi nhĞ!");
		return
	end
	if nIdx == 0 or nIndex == 0 then  --Ã»ÓĞÄÃÎäÆ÷»òÕßÄÃµÄ²»ÊÇ»ÆµÛÎäÆ÷
		Talk(1,"","Ng­¬i ®ang mang kh«ng ph¶i vò khİ Hoµng ®Õ, h·y mang vò khİ Hoµng ®Õ vµo ng­êi ®i!");
		return
	end
	Say("Ng­¬i x¸c ®Şnh dïng <color=red>"..tChangeWp[nIndex][1].."<color>®æi <color=yellow>"..tWpChangeRing[nIndex][nType][1].."<color> chø?",
		2,
		"õ, ta muèn ®æi./#give_change_ring("..nIndex..","..nType..")",
		"Kh«ng ph¶i, ta muèn x¸c ®Şnh l¹i vò khİ Hoµng ®Õ ta muèn ®æi/nothing")
end

function give_change_ring(nIndex,nType)
	if Zgc_pub_goods_add_chk(4,200) ~= 1 then
		return
	end
	local nIdx = GetPlayerEquipIndex(2);
	if DelItemByIndex(nIdx,-1) == 1 then
		local Add_flag = AddItem(tWpChangeRing[nIndex][nType][2],tWpChangeRing[nIndex][nType][3],tWpChangeRing[nIndex][nType][4],1,1,-1,-1,-1,-1,-1,-1);
		if Add_flag == 1 then
			Msg2Player("Chóc mõng ng­¬i dïng "..tChangeWp[nIndex][1].."§æi"..tWpChangeRing[nIndex][nType][1].." thµnh c«ng!");
			WriteLog("§Ö tö thî rÌn L­u-Vò khİ Hoµng ®Õ ®æi trang søc Hoµng ®Õ: Ng­êi ch¬i"..GetName().."Dïng thÎ"..tChangeWp[nIndex][1].."§æi"..tWpChangeRing[nIndex][nType][1].." thµnh c«ng!");
		else
			WriteLog("§Ö tö thî rÌn L­u-Vò khİ Hoµng ®Õ ®æi trang søc Hoµng ®Õ: Ng­êi ch¬i"..GetName().."Dïng thÎ"..tChangeWp[nIndex][1].."§æi"..tWpChangeRing[nIndex][nType][1].."thÊt b¹i! log: "..Add_flag);
		end
	end
end	

function box_change_yuehua()
	local strtab = {
		"Ta muèn dïng Giang S¬n thiÕt b¶o r­¬ng lÊy 1 NguyÖt Hoa (mçi b¶o r­¬ng t¨ng 0.1%)/#input_box_num(1)",
		"Ta muèn dïng Giang S¬n ®ång b¶o r­¬ng lÊy 1 NguyÖt Hoa (mçi b¶o r­¬ng t¨ng 0.25%)/#input_box_num(2)",
		"Ta muèn dïng Thµnh ThÕ ng©n b¶o r­¬ng lÊy 1 NguyÖt Hoa (mçi b¶o r­¬ng t¨ng 5%)/#input_box_num(3)",
		"Ta muèn dïng R­¬ng vµng ThŞnh thÕ lÊy 1 NguyÖt Hoa (mçi b¶o r­¬ng t¨ng 50%)/#input_box_num(4)",
		"Ta kh«ng ®æi/nothing"	
		}
	Say("Ta cã thÓ ®óc sè b¶o r­¬ng nµy, lÊy NguyÖt Hoa bªn trong ra, dùa vµo <color=yellow>sè b¶o r­¬ng<color> kh¸c nhau, NguyÖt Hoa nhËn ®­îc <color=yellow>sÏ<color> kh¸c nhau, ng­¬i chän ®i!",
		getn(strtab),
		strtab)	 
end

function input_box_num(nType)
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end		
	local tProb = {10,25,500,5000};
	local tId = {1025,1026,1027,1028};
	local tBox = {"Giang S¬n thiÕt b¶o r­¬ng","Giang S¬n ®ång b¶o r­¬ng","Thµnh ThÕ ng©n b¶o r­¬ng","Thµnh ThÕ kim b¶o r­¬ng"};
	local nNum = GetItemCount(2,0,tId[nType]);
	if nNum == 0 then
		Talk(1,"","Ng­¬i kh«ng cã <color=yellow>"..tBox[nType].."<color>.")
		return
	end
	if nNum > 10000/tProb[nType] then
		nNum = 10000/tProb[nType];
	end
	SetTaskTemp(TT_BOX_TYPE,nType);
	AskClientForNumber("confirm_change_yuehua", 1, tonumber(nNum), "Xin nhËp "..tBox[nType].."Chän");
end

function confirm_change_yuehua(nCount)
	local tProb = {0.1,0.25,5,50};
	local nType = GetTaskTemp(TT_BOX_TYPE);
	Say("Ng­¬i cã <color=yellow>"..format("%.2f",nCount*tProb[nType]).."%<color> nhËn ®­îc <color=yellow>1 NguyÖt Hoa<color>, ®æi thÊt b¹i sÏ kh«ng cã g× c¶, ng­¬i muèn ®æi kh«ng?",
		2,
		"õ, ta muèn ®æi./#give_yuehua("..nType..","..nCount..")",
		"T¹m thêi kh«ng ®æi/nothing")
end

function give_yuehua(nType,nCount)
	local tProb = {10,25,500,5000};
	local tId = {1025,1026,1027,1028};
	local nProb = nCount*tProb[nType];
	local nRand = random(1,10000);
	if DelItem(2,0,tId[nType],nCount) == 1 then
		if nRand <= nProb then
			AddItem(2,1,2002,1);
			Msg2Player("Chóc mõng ng­¬i nhËn ®­îc 1 NguyÖt Hoa!");
		else
			Talk(1,"","VËn khİ cña ng­¬i kh¸ ®en, kh«ng ®æi ®­îc, tiÕp tôc kiªn tr× nhĞ.");
		end
	end
end

function buchang_dia()
	Say("TrËn tr­íc trong b¶o r­¬ng Vâ L©m Minh chñ ®­a ra cã giÊu lo¹i nguyªn liÖu quı hiÕm NguyÖt Hoa nµy, nh­ng do hä gi¶i quyÕt kh«ng tháa ®¸ng, t¹o nguyªn liÖu thÇn khİ trë thµnh phÕ phÈm, l·ng phİ t©m huyÕt cña thî ®ång, v× thÕ hä nhê ta båi th­êng c¸c vŞ cao nh©n cña hÖ chÕ t¹o. Tõ 23:00 ngµy 18 th¸ng 10 ®Õn ngµy 25 th¸ng 10, chØ cÇn hÖ chÕ t¹o vò khİ cña ng­¬i, kü thuËt chÕ t¹o bÊt kú hoÆc chÕ t¹o nãn, chÕ t¹o hé gi¸p, chÕ t¹o h¹ y cÊp 70 trë lªn, sÏ nhËn mét phÇn båi th­êng ë chç ta, nh­ng mçi ng­êi chØ cã thÓ nhËn 1 lÇn, båi th­êng bao gåm 2 NguyÖt Hoa ®Æc biÖt (vËt phÈm khãa), 40 Tô linh kho¸ng (vËt phÈm khãa, thªm gi¸ trŞ vËt phÈm 250), nÕu tháa m·n ®iÒu kiÖn th× ®Õn nhËn nhĞ.",
		2,
		"NhËn båi th­êng./get_buchang",
		"LÇn sau l¹i ®Õn/nothing")
end

function get_buchang()
	if GetTask(TASK_BUCHANG_ID) == buchang_id then
		Talk(1,"","Ng­¬i ®· nhËn 1 lÇn råi. Sao tham lam vËy h¶?");
		return
	end
	local playerlevel = GetLevel();
	if playerlevel < 10 then
		Talk(1,"","Ng­¬i tõng tr¶i giang hå kh«ng nhiÒu, ®Õn cÊp <color=red>10<color> råi quay l¹i t×m ta!")
		return
	end	
	if Zgc_pub_goods_add_chk(2,42) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end	 
	if GetLifeSkillLevel(1,2) >= 70 or GetLifeSkillLevel(1,3) >= 70 or GetLifeSkillLevel(1,4) >= 70 or GetLifeSkillLevel(1,5) >= 70 or GetLifeSkillLevel(1,9) >= 70 or GetLifeSkillLevel(1,10) >= 70 then
		AddItem(2,1,1173,2);
		AddItem(2,1,1174,40);
		Msg2Player("Chóc mõng ng­¬i nhËn ®­îc 2 NguyÖt Hoa ®Æc biÖt vµ 40 Tô linh th¹ch!");
		SetTask(TASK_BUCHANG_ID,buchang_id);
	else
		Talk(1,"","HÖ chÕ t¹o vò khİ cña ng­¬i, hoÆc kü thuËt chÕ t¹o nãn, chÕ t¹o hé gi¸p, chÕ t¹o h¹ y kh«ng cã c¸i nµo ®¹t cÊp 70 c¶!");
		return
	end
end

--º¯ÊıÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êı
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕı³£Ìí¼ÓÎïÆ·½øĞĞ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end

function nothing()

end

function lingqi_item_update()
	local strtab = {
--			"ÎÒÒªÌáÉıÁéÆø×°±¸µÄÁéÆø/update_item_lingqi",
			"Ta muèn ph©n m¶nh trang bŞ b¸t qu¸t cña ta/dasan_bagua_tixing",
			"Ta muèn nhËn thiÖt h¹i cña viÖc ph©n m¶nh trang bŞ b¸t qu¸i./get_bagua_buchang",
			"Ta muèn lÊy linh th¹ch cña trang bŞ b¸t qu¸i/quchu_bagua_lingshi",
			"Chän sai råi, trë l¹i/main",
			"Ta sÏ quay l¹i sau!/nothing"
			};
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Sè ta khæ thËt, s­ phô l¹i t×m ra viÖc cho ta lµm n÷a råi. Sau nµy, nÕu ai mang 'LÖnh th¸o gì miÔn phİ' ®Õn chç ta ®Ó th¸o rêi trang bŞ B¸t Qu¸i, ®Òu cã thÓ nhËn tiÒn båi th­êng th¸o gì. <color=yellow>L­u ı, mçi lÇn nhËn tiÒn båi th­êng sÏ tiªu hao 1 lÖnh th¸o gì miÔn phİ<color>. TÊt nhiªn ng­¬i còng cã thÓ ®Õn chç ta ®Ó th¸o Linh th¹ch. <color=red>Linh th¹ch cã linh khİ 80 trë lªn cã thÓ quay vÒ vßng Th¸i H­ B¸t Qu¸i.<color>",
		getn(strtab),
		strtab);
end

function update_item_lingqi()
	Say("Chóc mäi ng­êi n¨m míi v¹n sù nh­ ı,trang bŞ linh khİ cã 91 linh khİ (bao gåm 91) trë lªn, 100 linh khİ trë xuèng bao gåm 100 linh khİ, ®Òu sÏ nhËn miÔn phİ t¨ng linh khİ ngÉu nhiªn 10, 12, 14, 16, 18, 20 ngÉu nhiªn ë chç ta, nh­ng t¨ng bao nhiªu th× ph¶i xem vËn may cña ng­¬i. §©y lµ ­u ®·i TÕt, h·y nhanh ch©n ®Õn sím. <color=yellow>Sö dông 2 V« NgÊn Thñy sÏ t¨ng 20 linh khİ.<color>",
		3,
		"Ta muèn t¨ng linh khİ trang bŞ (t¨ng ngÉu nhiªn 10, 12, 14, 16, 18, 20)/#choose_item_weizhi(0)",
		"Ta muèn dïng 2 V« NgÊn Thñy ®Ó t¨ng linh khİ trang bŞ (t¨ng 20)/#choose_item_weizhi(1)",
		"Sau nµy ta l¹i ®Õn t¨ng/nothing")
end

function choose_item_weizhi(nAddMax)
	Say("Ng­¬i muèn t¨ng linh khİ cña trang bŞ nµo, sau khi t¨ng sÏ tÆng ng­¬i mét vµi linh khİ.",
		5,
		"§Çu/#confirm_update_lingqi(0,"..nAddMax..")",
		"Ngo¹i trang/#confirm_update_lingqi(1,"..nAddMax..")",
		"H¹ y/#confirm_update_lingqi(3,"..nAddMax..")",
		"Vò khİ/#confirm_update_lingqi(2,"..nAddMax..")",
		"§îi ta mÆc trang bŞ lªn ®·./nothing")
end

function confirm_update_lingqi(nWz,nAddMax)
	local nIndex = GetPlayerEquipIndex(nWz); --»ñÈ¡×°±¸Ë÷Òı
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --»ñÈ¡×°±¸id
	local nLingqi = GetItemMaxLingQi(nIndex);   --»ñÈ¡ÁéÆøÖµ
	local nXq = GetItemAttr(nIndex,1);--»ñÈ¡µÚÒ»¸öÄ§·¨ÊôĞÔid ÅĞ¶ÏÊÇ·ñÏâÇ¶ÁËÊ¯Í·
	local nQianghua = GetEquipAttr(nIndex,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --»ñÈ¡ÊÇ·ñËø¶¨
	local nRandSeed = GetItemRandSeed(nIndex);--Ëæ»úÖÖ×Ó
	
	
	if nIndex == 0 then 
		Talk(1,"","Trªn ng­êi ng­¬i kh«ng cã trang bŞ muèn t¨ng linh khİ.");
		return
	end
	if nLingqi < 91 or nLingqi > 100 or nXq ~= 0 then
		Talk(1,"","Cho dï muèn t¨ng còng ph¶i mang trang bŞ ta cã thÓ t¨ng ®Õn, tay nghÒ ta cã h¹n, chØ cã lç ch­a kh¶m, ®ång thêi ®iÓm linh khİ lµ 91-100 míi cã thÓ t¨ng linh khİ.");
		return
	end
	
	if nWz == 0 then
		if nId1 == 0 and nId2 == 103 and nId3 >= 73 then
			Talk(1,"","ChÕ t¹o phèi hîp kü n¨ng cuéc sèng míi thªm trong ho¹t ®éng xu©n, trang bŞ cÊp 8, cÊp 9 kh«ng thÓ t¨ng.");
			return
		end
	elseif nWz == 1 then
		if nId1 == 0 and nId2 == 100 and nId3 >= 73 then
			Talk(1,"","ChÕ t¹o phèi hîp kü n¨ng cuéc sèng míi thªm trong ho¹t ®éng xu©n, trang bŞ cÊp 8, cÊp 9 kh«ng thÓ t¨ng.");
			return
		end
	elseif nWz == 3 then
		if nId1 == 0 and nId2 == 101 and nId3 >= 73 then
			Talk(1,"","ChÕ t¹o phèi hîp kü n¨ng cuéc sèng míi thªm trong ho¹t ®éng xu©n, trang bŞ cÊp 8, cÊp 9 kh«ng thÓ t¨ng.");
			return
		end
	elseif nWz == 2 then
		for i=1,getn(tHighLvWp) do
			if nId1 == tHighLvWp[i][2] and nId2 == tHighLvWp[i][3] and nId3 == tHighLvWp[i][4] then
				Talk(1,"","ChÕ t¹o phèi hîp kü n¨ng cuéc sèng míi thªm trong ho¹t ®éng xu©n, trang bŞ cÊp 8, cÊp 9 kh«ng thÓ t¨ng.");
				return
			end
		end
	end				
	
	if nLock == 1 then
		Talk(1,"","Trang bŞ trªn ng­êi ng­¬i ®· khãa, cÇn më khãa míi cã thÓ th¨ng cÊp.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó b¶o ®¶m tµi s¶n an toµn, tr­íc khi t¨ng linh khİ trang bŞ h·y më khãa r­¬ng ch­a ®å tr­íc!");
		return
	end
	if nAddMax == 1 then
		if GetItemCount(2,1,503) < 2 then
			Talk(1,"","Ng­¬i kh«ng cã ®ñ V« NgÊn Thñy.");
			return
		end
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end	
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local tLq = {10,12,14,16,18,20};
		local nRand = random(1,getn(tLq));
		local nNewLq = nLingqi+tLq[nRand]; --ÌáÉıµÄÁéÆø
		if nAddMax == 1 then
			if DelItem(2,1,503,2) == 1 then
				nNewLq = nLingqi+20;
			end
		end
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nNewLq,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			if nDing == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --¶¨»ê
			end
			local nRand = random(1,5);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
			Talk(1,"","Chóc mõng ng­¬i t¨ng linh khİ trang bŞ thµnh c«ng!");
			WriteLog("Ho¹t ®éng Xu©n-§Ö tö thî rÌn L­u: Ng­êi ch¬i"..GetName().."T¨ng linh khİ trang bŞ thµnh c«ng, id vËt phÈm gèc, ®iÓm linh khİ, ®¼ng cÊp c­êng hãa, vŞ trİ ®Şnh hån: "..nId1..", "..nId2..", "..nId3..", "..nLingqi..", "..nQianghua..", "..nDing..".");
		else
			WriteLog("Ho¹t ®éng Xu©n-§Ö tö thî rÌn L­u: Ng­êi ch¬i"..GetName().."T¨ng linh khİ trang bŞ thÊt b¹i, id vËt phÈm gèc, ®iÓm linh khİ, ®¼ng cÊp c­êng hãa, vŞ trİ ®Şnh hån: "..nId1..", "..nId2..", "..nId3..", "..nLingqi..", "..nQianghua..", "..nDing..".");
		end
	else
		Talk(1,"","H·y b¶o ®¶m ng­¬i ®· mang trang bŞ muèn t¨ng trªn ng­êi!");
	end
end

function dasan_bagua_tixing()
	Say("<color=green>§Ö tö thî rÌn L­u<color>: L­u ı ®Æc biÖt ®©y! ChØ cã bá ra <color=red>10000 gi¸ trŞ<color> míi cã thÓ ®¶m b¶o trang bŞ cña ng­¬i kh«ng bŞ biÕn mÊt trong lóc th¸o gì, <color=yellow>cã thÓ mang LÖnh th¸o gì miÔn phİ ®Õn chç ta ®Ó nhËn l¹i sè tiÒn ®· tiªu hao, gi¸ trŞ sÏ kh«ng ®­îc hoµn l¹i.<color>",
		2,
		"Më giao diÖn ®óc/dasan_bagua_item",
		"Kh«ng cã g×/nothing")
end

function dasan_bagua_item()
	BaguaDepose(); --ÖØÖı°ËØÔÌ××°½çÃæ
end

function finish_dasan_bagua(nGold)
	local nTime = tonumber(date("%Y%m%d%H"));
--	if nTime >= 2008091108 and nTime <= 2008101207 then
--		if GetTask(TASK_DASAN_NUM) < DASAN_TOTAL_NUM then
			SetTask(TASK_DASAN_NUM,GetTask(TASK_DASAN_NUM)+1);
			SetTask(TASK_BAGUA_GOLD,GetTask(TASK_BAGUA_GOLD)+nGold);
--		end
--	end
end

function get_bagua_buchang()
	local nBuchang = GetTask(TASK_DASAN_NUM)-GetTask(TASK_BAGUA_BUCHANG);
	local nGold = GetTask(TASK_BAGUA_GOLD)-GetTask(TASK_BUCHANG_GOLD);
--	if GetTask(TASK_BAGUA_BUCHANG) >= DASAN_TOTAL_NUM and nGold == 0 then
--		Talk(1,"","<color=green>ÁõÌú½³µÜ×Ó<color>£ºÃ¿¸öÈË¿ÉÒÔÁìÈ¡"..DASAN_TOTAL_NUM.."Ì×°ËØÔ×°±¸±»´òÉ¢µÄ²¹³¥£¬ÄãÒÑ¾­ÁìÍêÁË¡£");
--	else
		if nBuchang == 0 or nGold == 0 then
			Talk(1,"","HiÖn nay ng­¬i kh«ng cã båi th­êng cã thÓ l·nh.");
			return
		end		
--		if GetTask(TASK_DASAN_NUM) <= DASAN_TOTAL_NUM then
			Say("<color=green>§Ö tö thî rÌn L­u<color>: B©y giê ng­¬i cã thÓ nhËn tiÒn båi th­êng th¸o gì trang bŞ B¸t Qu¸i<color=yellow>"..nBuchang.."<color> lÇn, cÇn cã <color=yellow>LÖnh th¸o gì miÔn phİ "..nBuchang.." c¸i<color>, tiÒn båi th­êng cã thÓ nhËn ®­îc "..nGold.." §ång, ®­îc kh«ng?",
				2,
				"§­îc/confirm_get_buchang",
				"SÏ ®Õn nhËn sau/nothing");
--		end
--	end		
end

function confirm_get_buchang()
	local nBuchang = GetTask(TASK_DASAN_NUM)-GetTask(TASK_BAGUA_BUCHANG);
	local nGold = GetTask(TASK_BAGUA_GOLD)-GetTask(TASK_BUCHANG_GOLD);
	if nBuchang == 0 or nGold == 0 then
		Talk(1,"","HiÖn nay ng­¬i kh«ng cã båi th­êng cã thÓ l·nh.");
		return
	end
	if GetItemCount(2,1,3388) < nBuchang then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: B©y giê ng­¬i cã thÓ th¸o gì trang bŞ B¸t Qu¸i <color=yellow>"..nBuchang.."<color> lÇn, cÇn cã <color=yellow>LÖnh th¸o gì miÔn phİ "..nBuchang.." c¸i<color>, ng­¬i kh«ng cã ®ñ råi.");
		return
	end		
--	if GetTask(TASK_BAGUA_BUCHANG) >= DASAN_TOTAL_NUM then
--		Talk(1,"","<color=green>ÁõÌú½³µÜ×Ó<color>£ºÃ¿¸öÈË¿ÉÒÔÁìÈ¡"..DASAN_TOTAL_NUM.."Ì×°ËØÔ×°±¸±»´òÉ¢µÄ²¹³¥£¬ÄãÒÑ¾­ÁìÍêÁË¡£");
--	else
		if DelItem(2,1,3388,nBuchang) == 1 then
			SetTask(TASK_BAGUA_BUCHANG,GetTask(TASK_BAGUA_BUCHANG)+nBuchang);
			SetTask(TASK_BUCHANG_GOLD,GetTask(TASK_BUCHANG_GOLD)+nGold);
			Earn(nGold);
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i ®· nhËn tiÒn båi th­êng råi.");
			WriteLog("§Ö tö thî rÌn L­u: Ng­êi ch¬i: "..GetName().." ®· nhËn tiÒn båi th­êng th¸o gì B¸t Qu¸i, sè tiÒn: "..nGold);
		end
--	end
end

function get_bagua_lingshi(nType)
	Say("Ng­¬i muèn lÊy linh khİ cña trang bŞ nµo trªn ng­êi?",
		5,
		"§Çu/#ask_quchu_lingshi(0,"..nType..")",
		"Ngo¹i trang/#ask_quchu_lingshi(1,"..nType..")",
		"H¹ y/#ask_quchu_lingshi(3,"..nType..")",
		"Vò khİ/#ask_quchu_lingshi(2,"..nType..")",
		"§îi ta mÆc trang bŞ lªn ®·./nothing")	
end

function ask_quchu_lingshi(nWz,nType)
	local tChouqu = {"§Çu","Ngo¹i trang","Vò khİ","H¹ y"}
	Say("Ng­¬i muèn lÊy ®¸ trªn <color=yellow>"..tChouqu[nWz+1].."<color> µ?",
		3,
		"§­îc/#confirm_quchu_lingshi("..nWz..","..nType..")",
		"Ta chän nhÇm råi./#get_bagua_lingshi("..nType..")",
		"§îi ta mÆc trang bŞ lªn ®·./nothing")
end

function confirm_quchu_lingshi(nWz,nType)
	local nRoute = GetPlayerFaction();
	local tItem = {	
	[1] = {2,0,448,"Phæ HiÒn X¸ Lîi"},	--ÉÙÁÖ
	[2] = {2,0,469,"Thiªn C¬ Méc"},--Îäµ±
	[3] = {2,0,457,"Kim Liªn Hoa"},--¶ëáÒ
	[4] = {2,0,466,"Tö Kim B¸t"},--Ø¤°ï
	[5] = {2,0,454,"Bİ §éc ph­¬ng"},--ÌÆÃÅ	
	[6] = {2,0,477,"Tinh B× TiÔn §¹i"},	--ÑîÃÅ
	[7] = {2,0,484,"RÕt ®éc"},--Îå¶¾
	[8] = {2,0,491,"Mai QuÕ Lé"},--´äÑÌ
	[9] = {2,0,495,"Khu Ma H­¬ng"},--À¥ÂØ
	[10] = {2,0,499,"Th¸nh Háa LÖnh"}--Ã÷½Ì
	};
	if nType == 1 then  
		if GetItemCount(2,1,533) < 1 then
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Muèn th¸o Linh th¹ch linh khİ 80 trë xuèng ra khái trang bŞ B¸t Qu¸i, cÇn 1 Tinh luyÖn B¨ng Th¹ch, ng­¬i kh«ng cã vËt nµy.")
			return
		end
	elseif nType == 2 then	
		if GetItemCount(2,1,504) < 1 then
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Muèn th¸o Linh th¹ch linh khİ 80 trë lªn ra khái trang bŞ B¸t Qu¸i, cÇn 1 N÷ Oa Tinh Th¹ch, ng­¬i kh«ng cã vËt nµy.");
			return
		end
	elseif nType == 3 then
		if nRoute == 0 then
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­êi ch­a gia nhËp m«n ph¸i kh«ng thÓ sö dông chøc n¨ng th¸o Linh th¹ch.");
			return
		else
			if GetItemCount(tItem[nRoute][1],tItem[nRoute][2],tItem[nRoute][3]) < 100 then
				Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Muèn th¸o Linh th¹ch linh khİ 80 trë lªn ra khái trang bŞ B¸t Qu¸i cÇn 100 "..tItem[nRoute][4]..", ng­¬i kh«ng cã vËt nµy.")
				return
			end
		end
	elseif nType == 4 then	
		if GetItemCount(2,1,3388) < 1 then
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Muèn th¸o Linh th¹ch linh khİ 80 trë lªn ra khái trang bŞ B¸t Qu¸i, cÇn 1 LÖnh th¸o gì miÔn phİ, ng­¬i kh«ng cã vËt nµy.");
			return
		end			
	end
	local nIndex = GetPlayerEquipIndex(nWz); --»ñÈ¡×°±¸Ë÷Òı
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --»ñÈ¡×°±¸id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --»ñÈ¡µ±Ç°×°±¸µÈ¼¶
	local nBaseLv = GetEquipBaseLevel(nIndex); --»ñÈ¡×°±¸»ù´¡µÈ¼¶
	local nLingqi = GetItemMaxLingQi(nIndex);   --»ñÈ¡ÁéÆøÖµ
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--»ñÈ¡µÚÒ»¸öÄ§·¨ÊôĞÔid µÈ¼¶
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--»ñÈ¡µÚ¶ş¸öÄ§·¨ÊôĞÔid µÈ¼¶
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--»ñÈ¡µÚÈı¸öÄ§·¨ÊôĞÔid µÈ¼¶
	local nQianghua = GetEquipAttr(nIndex,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nGuawei = GetEquipBaGua(nIndex); --»ñÈ¡ØÔÎ»
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--ÊÇ·ñÒÑ¾­¼¤»î
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --»ñÈ¡ÊÇ·ñËø¶¨	
	local nRandSeed = GetItemRandSeed(nIndex);--Ëæ»úÖÖ×Ó
	local nMofaRand1 = mod(floor(GetItemParam(nIndex,0)/2^16),2^11); --ÊôĞÔÒ»µÄËæ»úÖÖ×Ó
	local nMofaRand2 = mod(floor(GetItemParam(nIndex,1)/2^16),2^11); --ÊôĞÔ¶şµÄËæ»úÖÖ×Ó
	local nMofaRand3 = mod(floor(GetItemParam(nIndex,2)/2^16),2^11); --ÊôĞÔÈıµÄËæ»úÖÖ×Ó
	local nMofaJiou1 = mod(floor(GetItemParam(nIndex,0)/2^14),2^2); --ÊôĞÔÒ»µÄÒõÑô£¬2ÎªÑô£¨ÆæÊı£©£¬1ÎªÒõ£¨Å¼Êı£©
	local nMofaJiou2 = mod(floor(GetItemParam(nIndex,1)/2^14),2^2); --ÊôĞÔ¶şµÄÒõÑô£¬2ÎªÑô£¬1ÎªÒõ
	local nMofaJiou3 = mod(floor(GetItemParam(nIndex,2)/2^14),2^2); --ÊôĞÔÈıµÄÒõÑô£¬2ÎªÑô£¬1ÎªÒõ
	
	if nIndex == 0 then 
		Talk(1,"","Ng­¬i kh«ng cã mang trang bŞ muèn lÊy linh khİ ra trªn ng­êi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng­¬i ®ang mang trang bŞ b¸t qu¸i µ, sau khi ph©n m¶nh ®Õn nhËn linh th¹ch.");
		return
	end
		 
	if nLingqi == 0 or nMofa1 == 0 then
		Talk(1,"","Trang bŞ nµy cña ng­¬i kh«ng cã kh¶m ®¸ lµm sao lÊy ®­îc!");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang bŞ trªn ng­êi ng­¬i ®· khãa, cÇn më khãa míi cã thÓ th¨ng cÊp.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó bµo ®¶m tµi s¶n an toµn, tr­íc khi lÊy linh th¹ch ng­¬i h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end	
	if Zgc_pub_goods_add_chk(6,200) ~= 1 then
		return
	end
	if nType == 1 then
		if nLingqi >= 80 then
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i chän trang bŞ cã linh khİ trªn 80, xin h·y dïng ®¹o cô th¸o Linh th¹ch t­¬ng øng.")
			return
		end
		if DelItem(2,1,533,1) ~= 1 then
			return
		end
	elseif nType == 2 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i chän trang bŞ cã linh khİ d­íi 80, xin h·y dïng ®¹o cô th¸o Linh th¹ch t­¬ng øng.")
			return
		end		
		if DelItem(2,1,504,1) ~= 1 then
			return
		end
	elseif nType == 3 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i chän trang bŞ cã linh khİ d­íi 80, xin h·y dïng ®¹o cô th¸o Linh th¹ch t­¬ng øng.")
			return
		end 
		if DelItem(tItem[nRoute][1],tItem[nRoute][2],tItem[nRoute][3],100) ~= 1 then
			return
		end
	elseif nType == 4 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i chän trang bŞ cã linh khİ d­íi 80, xin h·y dïng ®¹o cô th¸o Linh th¹ch t­¬ng øng.")
			return
		end 
		if DelItem(2,1,3388,1) ~= 1 then
			return
		end		
	end
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nLingqi,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
			if nDing == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --¶¨»ê
			end
			local nLingshiLingqi1 = get_lingqi_jiou(nMofa1,nWz,nLv1,nMofaJiou1) --·µ»Ø¶ÔÓ¦ÆæÅ¼ÁéÆø
			AddLingShi(nMofa1,nWz,nLv1,nLingshiLingqi1,nMofaRand1);
			if nMofa2 ~= 0 then
				local nLingshiLingqi2 = get_lingqi_jiou(nMofa2,nWz,nLv2,nMofaJiou2) --·µ»Ø¶ÔÓ¦ÆæÅ¼ÁéÆø
				AddLingShi(nMofa2,nWz,nLv2,nLingshiLingqi2,nMofaRand2);	
			end
			if nMofa3 ~= 0 then
				local nLingshiLingqi3 = get_lingqi_jiou(nMofa3,nWz,nLv3,nMofaJiou3) --·µ»Ø¶ÔÓ¦ÆæÅ¼ÁéÆø
				AddLingShi(nMofa3,nWz,nLv3,nLingshiLingqi3,nMofaRand3);								
			end
			if nGuawei == 10 then   --ÌìØÔ
				AddItem(2,0,1084,1);
			else	
				if nJihuo ~= 0 and nLingqi >= 80 then   --ÒÑ¾­¼¤»î
					if nGuawei ~= 0 and nGuawei ~= 5 then
						AddItem(tBaguaNum[nGuawei][2],tBaguaNum[nGuawei][3],tBaguaNum[nGuawei][4],tBaguaNum[nGuawei][5]);
					end
				end
			end				  
			Talk(1,"","Chóc mõng ng­¬i ®· lÊy linh th¹ch thµnh c«ng.");
			WriteLog("§Ö tö thî rÌn L­u lÊy linh th¹ch: Ng­êi ch¬i"..GetName().."Lóc th¸o Linh th¹ch thµnh c«ng, id vËt phÈm, Linh khİ, C­êng ho¸, §Şnh hån, H¹t gièng ngÉu nhiªn, thuéc tİnh Linh th¹ch 1, ®¼ng cÊp, thuéc tİnh 2, ®¼ng cÊp, thuéc tİnh 3, ®¼ng cÊp, lo¹i Linh th¹ch th¸o ra, thuéc quÎ: "..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3..","..nType..","..nGuawei);
		else
			WriteLog("§Ö tö thî rÌn L­u lÊy linh th¹ch: Ng­êi ch¬i"..GetName().."Lóc th¸o Linh th¹ch thÊt b¹i, vŞ trİ thÊt b¹i, id vËt phÈm, Linh khİ, C­êng ho¸, §Şnh hån, H¹t gièng ngÉu nhiªn, thuéc tİnh Linh th¹ch 1, ®¼ng cÊp, thuéc tİnh 2, ®¼ng cÊp, thuéc tİnh 3, ®¼ng cÊp, lo¹i Linh th¹ch th¸o ra, thuéc quÎ: "..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3..","..nType..","..nGuawei);
		end		
	end			
end

function lingqi_item_change()
	local strtab = {
			"Ta muèn chuyÓn hãa trang bŞ linh khİ cã linh khİ tõ 60-79 thµnh 5 Xİch ThiÕt Tinh (gi¸ trŞ 500)/#choose_change_wz(1)",
			"Ta muèn chuyÓn linh khİ tõ 80 ®Õn 120 cña trang bŞ Linh khİ thµnh 5 Xİch ThiÕt Tinh (500 gi¸ trŞ), 1 nguyÖt hoa (x¸c suÊt 50%)/#choose_change_wz(2)",
			"Ta muèn chuyÓn hãa trang bŞ b¸t qu¸i cã linh khİ tõ 60-79 thµnh 5 Xİch ThiÕt Tinh (gi¸ trŞ 500) vµ 2 linh th¹ch ngÉu nhiªn cÊp 1-5/#choose_change_wz(3)",
--			"ÎÒÒª°Ñ80µ½120ÁéÆøµÄ°ËØÔ×°±¸×ª»¯Îª³àÌú¾«(500¼ÛÖµÁ¿)5¸ö¡¢2¸ö1£­5¼¶Ëæ»úÁéÊ¯£¬50%¸ÅÂÊ1¸öÔÂ»ª/#choose_change_wz(4)",
			"Chän sai råi, trë l¹i/main",
			"Ta sÏ quay l¹i sau!/nothing"
			};
	Say("Cã mét sè trang bŞ linh khİ kh«ng dïng, ta gióp ng­¬i chuyÓn hãa chóng thµnh nguyªn liÖu, ng­¬i cã muèn thö kh«ng. <color=yellow>Chó ı, linh th¹ch ®· kh¶m nh­ng ch­a h×nh thµnh trang bŞ b¸t qu¸i th× dùa vµo trang bŞ linh khİ ®Ó gi¶i quyÕt. <color><color=red>Mang trang bŞ muèn chuyÓn hãa lªn ng­êi.<color>",
		getn(strtab),
		strtab);
end

function choose_change_wz(nType)
	Say("Ng­¬i muèn chuyÓn hãa <color=yellow>trang bŞ nµo<color> trªn ng­êi <color=red>Chó ı, sau khi chän trang bŞ sÏ chuyÓn hãa thµnh nguyªn liÖu.<color>",
		6,
		"§Çu/#confirm_change_cailiao("..nType..",0)",
		"Ngo¹i trang/#confirm_change_cailiao("..nType..",1)",
		"H¹ y/#confirm_change_cailiao("..nType..",3)",
		"Vò khİ/#confirm_change_cailiao("..nType..",2)",
		"Chän sai. Trë vÒ/lingqi_item_change",
		"§îi ta mÆc trang bŞ lªn ®·./nothing")		
end

function confirm_change_cailiao(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz); --»ñÈ¡×°±¸Ë÷Òı
	local nLingqi = GetItemMaxLingQi(nIndex);   --»ñÈ¡ÁéÆøÖµ
	local nGuawei = GetEquipBaGua(nIndex); --»ñÈ¡ØÔÎ»
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --»ñÈ¡ÊÇ·ñËø¶¨
	local nQianghua = GetEquipAttr(nIndex,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --»ñÈ¡×°±¸id
	
	if nIndex == 0 then 
		Talk(1,"","Ng­¬i kh«ng cã mang trang bŞ muèn chuyÓn hãa lªn ng­êi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng­¬i ®ang mang trang bŞ b¸t qu¸i µ, h·y ph©n m¶nh råi ®Õn chuyÓn hãa.");
		return
	end
	if nLingqi < 60 or nLingqi > 120 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Trang bŞ chuyÓn thµnh nguyªn liÖu ®iÓm Linh khİ ph¶i ë trong kho¶ng 60 ®Õn 120.");
		return
	end
	if nLock > 0 then
		Talk(1,"","Trang bŞ cña ng­¬i hiÖn ®ang ë tr¹ng th¸i khãa, h·y më khãa råi ®Õn chuyÓn hãa.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó b¶o ®¶m tµi s¶n an toµn, tr­íc khi chuyÓn hãa trang bŞ linh khİ ng­¬i h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end
	if nQianghua >= 5 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Xin lçi, ®é c­êng ho¸ cña trang bŞ lín h¬n 5, kh«ng thÓ chuyÓn ho¸.");
		return
	end
	--Èç¹ûÊÇÌìµØĞş»Æ×°±¸
	if is_xuanhuang_wuqi(nId1,nId2,nId3) == 1 or is_xuanhuang_zhuangbei(nId1,nId2,nId3) == 1 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Trang bŞ Thiªn §Şa HuyÒn Hoµng kh«ng thÓ chuyÓn ho¸.");
		return
	end
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end			
	if nType == 1 then
		if nGuawei ~= 0 then
			Talk(1,"","§©y lµ trang bŞ b¸t qu¸i µ, ng­¬i chän sai råi.");
		else
			if nLingqi < 60 or nLingqi >= 80  then
				Talk(1,"","§iÓm linh khİ kh«ng ®óng, ng­¬i chän sai råi.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					WriteLog("§Ö tö thî rÌn L­u-Trang bŞ chuyÓn hãa nguyªn liÖu: Ng­êi ch¬i"..GetName().."chuyÓn hãa thµnh c«ng ®iÓm linh khİ thµnh "..nLingqi.."trang bŞ linh khİ. Id "..nId1..","..nId2..","..nId3..". §é c­êng ho¸ "..nQianghua..".");
					Talk(1,"","Chóc mõng ng­¬i, chuyÓn hãa trang bŞ linh khİ thµnh nguyªn liÖu thµnh c«ng.");
				end
			end
		end
	elseif nType == 2 then
		if nGuawei ~= 0 then
			Talk(1,"","§©y lµ trang bŞ b¸t qu¸i µ, ng­¬i chän sai råi.");
		else
			if nLingqi < 80 or nLingqi > 120  then
				Talk(1,"","§iÓm linh khİ kh«ng ®óng, ng­¬i chän sai råi.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					local nRanda = random(1,100);
					if nRanda <= 50 then
						AddItem(2,1,2002,1);
					end
					WriteLog("§Ö tö thî rÌn L­u-Trang bŞ chuyÓn hãa nguyªn liÖu: Ng­êi ch¬i"..GetName().."chuyÓn hãa thµnh c«ng ®iÓm linh khİ thµnh "..nLingqi.."trang bŞ linh khİ. Id "..nId1..","..nId2..","..nId3..". §é c­êng ho¸ "..nQianghua..".");

					Talk(1,"","Chóc mõng ng­¬i, chuyÓn hãa trang bŞ linh khİ thµnh nguyªn liÖu thµnh c«ng.");
				end
			end
		end	
	elseif nType == 3 then
		if nGuawei == 0 then
			Talk(1,"","§©y kh«ng ph¶i lµ trang bŞ b¸t qu¸i, ng­¬i chän sai råi.");
		else
			if nLingqi < 60 or nLingqi >= 80  then
				Talk(1,"","§iÓm linh khİ kh«ng ®óng, ng­¬i chän sai råi.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					for i = 1,2 do
						local nRand = random(1,5);
						lspf_AddLingShiInBottle(nRand,1);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
					end						
					WriteLog("§Ö tö thî rÌn L­u-Trang bŞ chuyÓn hãa nguyªn liÖu: Ng­êi ch¬i"..GetName().."chuyÓn hãa thµnh c«ng ®iÓm linh khİ thµnh "..nLingqi.."trang bŞ B¸t Qu¸i. Id "..nId1..","..nId2..","..nId3..". §é c­êng ho¸ "..nQianghua..".");

					Talk(1,"","Chóc mõng ng­¬i, chuyÓn hãa trang bŞ linh khİ thµnh nguyªn liÖu thµnh c«ng.");
				end
			end
		end	
	elseif nType == 4 then
		if nGuawei == 0 then
			Talk(1,"","§©y kh«ng ph¶i lµ trang bŞ b¸t qu¸i, ng­¬i chän sai råi.");
		else
			if nLingqi < 80 or nLingqi > 120  then
				Talk(1,"","§iÓm linh khİ kh«ng ®óng, ng­¬i chän sai råi.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					local nRandb = random(1,100);
					if nRandb <= 50 then
						AddItem(2,1,2002,1);
					end
					for i = 1,2 do
						local nRand = random(1,5);
						lspf_AddLingShiInBottle(nRand,1);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
					end						
					WriteLog("§Ö tö thî rÌn L­u-Trang bŞ chuyÓn hãa nguyªn liÖu: Ng­êi ch¬i"..GetName().."chuyÓn hãa thµnh c«ng ®iÓm linh khİ thµnh "..nLingqi.."trang bŞ B¸t Qu¸i. Id "..nId1..","..nId2..","..nId3..". §é c­êng ho¸ "..nQianghua..".");
					Talk(1,"","Chóc mõng ng­¬i, chuyÓn hãa trang bŞ linh khİ thµnh nguyªn liÖu thµnh c«ng.");
				end
			end
		end	
	end			
end

--·µ»Ø¶ÔÓ¦ÁéÊ¯µÄÆæÅ¼ÁéÆø nNumÖµÎª£º2ÎªÆæÊı£¬1ÎªÅ¼Êı
function get_lingqi_jiou(nId,nWz,nLv,nNum)
	local nMin,nMax = GetLingShiAttrRange(nId,nWz,nLv);
	local tJishu = {};
	local tOushu = {};
	local nLingqi = 0;
	
	for i=nMin,nMax do
		if mod(i,2) == 0 then
			tinsert(tOushu,i);
		else
			tinsert(tJishu,i);
		end
	end
	
	if nNum == 1 then
		local nRand = random(1,getn(tOushu));
		nLingqi = tOushu[nRand];
	elseif nNum == 2 then
		local nRand = random(1,getn(tJishu));
		nLingqi = tJishu[nRand];
	end
	return nLingqi;
end

function about_tiandiWp()
	Say("<color=green>§Ö tö thî rÌn L­u<color>: NÕu ng­¬i kh«ng thİch lùc c«ng kİch cña vò khİ Thiªn §Şa HuyÒn Hoµng hiÖn t¹i, th× cã thÓ ®Õn chç ta, dïng <color=yellow>3 Bµn Long bİch<color> ®Ó ®óc l¹i, <color=yellow>l­u ı, lùc c«ng kİch ngÉu nhiªn. <color>SÏ l­u l¹i ®é c­êng ho¸ vµ hiÖu qu¶ ®Şnh hån cña vò khİ Thiªn §Şa HuyÒn Hoµng. <color=yellow>Vò khİ ®· kh¶m n¹m Linh th¹ch kh«ng thÓ ®óc l¹i.<color>",
		2,
		"§óc vò khİ Thiªn §Şa HuyÒn Hoµng/give_new_tiandi",
		"Ta kh«ng ®óc/nothing")
end

function give_new_tiandi()
	local nIndex = 0; --¶ÔÓ¦tTiandiWp±íµÄË÷Òı
	local nIdx = GetPlayerEquipIndex(2); --ÄÃÔÚÊÖÉÏµÄÎäÆ÷Ë÷Òı
	local nLingqi = GetItemMaxLingQi(nIdx);   --»ñÈ¡ÁéÆøÖµ
	local nQianghua = GetEquipAttr(nIdx,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nDing = GetItemSpecialAttr(nIdx,"DING7"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê	
	local nMofa,nLv = GetItemAttr(nIdx,1);--»ñÈ¡µÚÒ»¸öÄ§·¨ÊôĞÔid µÈ¼¶
	
	if GetItemCount(2,1,1000) < 3 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã ®ñ Bµn Long bİch.");
		return
	end
	if nMofa ~= 0 then
		Talk(1,"","Trang bŞ nµy ®· kh¶m linh th¹ch, kh«ng thÓ ®óc l¹i.");
		return
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
		Talk(1,"","VËt phÈm nµy lµ vËt phÈm khãa, më khãa råi ®æi nhĞ!");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó b¶o ®¶m tµi s¶n an toµn, tr­íc khi ®óc l¹i h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end			
	if Zgc_pub_goods_add_chk(1,230) ~= 1 then
		return
	end
	for i = 1,getn(tTiandiWp) do 
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 == tTiandiWp[i][2] and nId2 == tTiandiWp[i][3] and nId3 == tTiandiWp[i][4] then
			nIndex = i;
			break
		end
	end
	if nIdx == 0 or nIndex == 0 then  --Ã»ÓĞÄÃÎäÆ÷»òÕßÄÃµÄ²»ÊÇÌìµØĞş»ÆÎäÆ÷
		Talk(1,"","Ng­¬i ®ang mang kh«ng ph¶i vò khİ Thiªn §Şa HuyÒn Hoµng, h·y mang trang bŞ vò khİ Thiªn §Şa HuyÒn Hoµng muèn ®óc l¹i vµo ng­êi!");
		return
	else
		if DelItem(2,1,1000,3) == 1 and DelItemByIndex(nIdx,-1) == 1 then
			local add_flag,add_idx = AddItem(tTiandiWp[nIndex][2],tTiandiWp[nIndex][3],tTiandiWp[nIndex][4],1,1,0,0,0,0,0,0,0,nQianghua,nLingqi);
			if add_flag == 1 then
				SetEquipCanChouQu(add_idx,1);
				if nDing == 1 then
					SetItemSpecialAttr(add_idx,"DING7",1); --¶¨»ê
				end 
				Msg2Player("Ng­¬i ®· ®óc l¹i 1 vò khİ Thiªn §Şa HuyÒn Hoµng: "..tTiandiWp[nIndex][1]);
				WriteLog("§Ö tö thî rÌn L­u-Vò khİ Thiªn §Şa HuyÒn Hoµng: Ng­êi ch¬i"..GetName().."§óc l¹i"..tTiandiWp[nIndex][1].."Thµnh c«ng.")
			else
				WriteLog("§Ö tö thî rÌn L­u-Vò khİ Thiªn §Şa HuyÒn Hoµng: Ng­êi ch¬i"..GetName().."§óc l¹i"..tTiandiWp[nIndex][1].." thÊt b¹i.");
			end
		end
	end		
end

function about_tdxh()
		local strtab = {
			"Ta muèn ®iÒu chØnh vò khİ Thiªn §Şa HuyÒn Hoµng/about_tiandiWp",
			"Ta muèn thay ®æi linh khİ cña trang bŞ Thiªn §Şa HuyÒn Hoµng/add_tiandi_lingqi",
			"Thanh §ång §Ønh ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng/chang_yijiding",
			"Viªm Hoµng thiÕt hån ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng/chang_yanhuangtiehun",
			"Ta chØ ®Õn xem thö/nothing"};
		Say("<color=green>§Ö tö thî rÌn L­u<color>: S­ phô ®ang s­u tËp Thanh §ång §Ønh cÊp 1, nªn mang hÕt trang bŞ Thiªn §Şa HuyÒn Hoµng ra ®Ó ®æi. NÕu ng­¬i cã Viªm Hoµng thiÕt hån, còng cã thÓ mang ®Õn chç ta ®Ó ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng.",
			getn(strtab),
			strtab)		
end

function add_item_lingqi()
	local strtab = {
		"Ta muèn dïng V« NgÊn Thñy ®Ó ®iÒu chØnh linh khİ trang bŞ/add_lingqi_wz",
		"Ta chØ ®Õn xem thö/nothing"};
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ta cã thÓ dïng <color=yellow>1 V« NgÊn Thuû<color> ®Ó <color=yellow>h¹ 1 ®iÓm linh khİ<color> cña trang bŞ. <color=yellow>L­u ı, chØ cã trang bŞ ch­a kh¶m n¹m Linh khİ míi cã thÓ h¹ Linh khİ. <color><color=red>NÕu lµ trang bŞ Thiªn §Şa HuyÒn Hoµng 119 Linh khİ, cã thÓ dïng c¸ch kh¸c ®Ó chuyÓn thµnh 120 Linh khİ. Nh­ng trang bŞ Thiªn §Şa HuyÒn Hoµng 118 Linh khİ kh«ng thÓ kİch ho¹t bé B¸t Qu¸i Thiªn §Şa HuyÒn Hoµng.<color>",
		getn(strtab),
		strtab)
end

function add_lingqi_wz()
	local strtab = {
		"§Çu/#add_lingqi_ask(0)",
		"Ngo¹i trang/#add_lingqi_ask(1)",
		"H¹ y/#add_lingqi_ask(3)",
		"Vò khİ/#add_lingqi_ask(2)",
		"§îi ta mÆc trang bŞ lªn ®·./nothing"};
	Say("Ng­¬i muèn ®iÒu chØnh linh khİ cña trang bŞ nµo trªn ng­êi? Chó ı, chØ cã trang bŞ linh khİ ch­a kh¶m míi cã thÓ ®iÒu chØnh.",
		getn(strtab),
		strtab)
end

function add_lingqi_ask(nWz)
	local tWz = {"§Çu","Ngo¹i trang","Vò khİ","H¹ y"};
	Say("Ng­¬i cã muèn ®iÒu chØnh linh khİ cña trang bŞ <color=yellow>"..tWz[nWz+1].."<color> kh«ng?",
		3,
		"Ta muèn ®iÒu chØnh/#add_lingqi_confirm("..nWz..")",
		"Kh«ng, ta nhÇm!/add_lingqi_wz",
		"§îi ta mÆc trang bŞ lªn ®·./nothing");
end

function add_lingqi_confirm(nWz)
	if GetItemCount(2,1,503) < 1 then
		Talk(1,"","§iÒu chØnh linh khİ cÇn 1 V« NgÊn Thñy, trªn ng­êi ng­¬i kh«ng cã.");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz); --»ñÈ¡×°±¸Ë÷Òı
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --»ñÈ¡×°±¸id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --»ñÈ¡µ±Ç°×°±¸µÈ¼¶
	local nBaseLv = GetEquipBaseLevel(nIndex); --»ñÈ¡×°±¸»ù´¡µÈ¼¶
	local nLingqi = GetItemMaxLingQi(nIndex);   --»ñÈ¡ÁéÆøÖµ
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--»ñÈ¡µÚÒ»¸öÄ§·¨ÊôĞÔid µÈ¼¶
	local nQianghua = GetEquipAttr(nIndex,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --»ñÈ¡ÊÇ·ñËø¶¨	
	local nRandSeed = GetItemRandSeed(nIndex);--Ëæ»úÖÖ×Ó
	
	if nIndex == 0 then 
		Talk(1,"","Ng­¬i kh«ng mang trang bŞ muèn ®iÒu chØnh linh khİ trªn ng­êi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng­¬i ®ang mang trang bŞ b¸t qu¸i µ, sau khi ph©n m¶nh råi ®Õn ®iÕu chØnh linh khİ.");
		return
	end
		 
	if nLingqi == 0 or nMofa1 ~= 0 then
		Talk(1,"","ChØ cã trang bŞ linh khİ ch­a kh¶m míi ®iÒu chØnh ®­îc!");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang bŞ cña ng­¬i hiÖn ®ang ë tr¹ng th¸i khãa, h·y më khãa råi ®Õn ®iÒu chØnh.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó b¶o ®¶m tµi s¶n an toµn, tr­íc khi ®iÒu chØnh linh khİ trang bŞ ng­¬i h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end	
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return
	end
	if DelItem(2,1,503,1) == 1 then
		local del_flag = DelItemByIndex(nIndex,-1);
		if del_flag == 1 then
			local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nLingqi-1,nRandSeed);
			if add_flag == 1 then
				SetEquipCanChouQu(nNewIndex,1);
				SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
				if nDing == 1 then
					SetItemSpecialAttr(nNewIndex,"DING7",1); --¶¨»ê
				end			  
				Talk(1,"","Chóc mõng ng­¬i ®· ®iÒu chØnh linh khİ trang bŞ thµnh c«ng.");
				WriteLog("§Ö tö thî rÌn L­u-§iÒu chØnh linh khİ: Ng­êi ch¬i "..GetName().."®iÒu chØnh linh khİ trang bŞ thµnh c«ng, id vËt phÈm, linh khİ, c­êng hãa, ®Şnh hån, h¹t gièng ngÉu nhiªn: "..nId1..","..nId2..","..nId3..","..(nLingqi-1)..","..nQianghua..","..nDing..","..nRandSeed);
			else
				WriteLog("§Ö tö thî rÌn L­u-§iÒu chØnh linh khİ: Ng­êi ch¬i "..GetName().."®iÒu chØnh linh khİ trang bŞ thÊt b¹i, vŞ trİ thÊt b¹i, id vËt phÈm, linh khİ, c­êng hãa, ®Şnh hån, h¹t gièng ngÉu nhiªn: "..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed);
			end
		end
	end	
end

function quchu_bagua_lingshi()
	local strtab = {
		"Dïng 1 Tinh LuyÖn B¨ng Th¹ch ®Ó gì Linh th¹ch trang bŞ B¸t Qu¸i tõ 0-79 Linh khİ/#get_bagua_lingshi(1)",
		"Dïng 1 N÷ Oa Tinh Th¹ch ®Ó gì Linh th¹ch trang bŞ B¸t Qu¸i tõ 80-120/#get_bagua_lingshi(2)",
		"Dïng 100 bé tİn vËt trang bŞ s­ m«n 4 ®Ó gì Linh th¹ch trang bŞ B¸t Qu¸i tõ 80-120/#get_bagua_lingshi(3)",
		"Dïng 1 LÖnh th¸o gì miÔn phİ ®Ó gì Linh th¹ch trang bŞ B¸t Qu¸i tõ 80-120/#get_bagua_lingshi(4)",
		"§Ó ta suy nghÜ l¹i/nothing"};
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i cã thÓ ®Õn chç ta, dùa vµo Linh khİ trang bŞ B¸t Qu¸i cña ng­¬i, dïng <color=yellow>1 Tinh LuyÖn B¨ng Th¹ch hoÆc 1 N÷ Oa Tinh Th¹ch<color>, hoÆc <color=yellow>100<color> bé tİn vËt trang bŞ s­ m«n 4 ®Ó gì Linh th¹ch. §é c­êng ho¸, ®Şnh hån vµ ®¼ng cÊp cña trang bŞ sÏ ®­îc gi÷ l¹i, kİch ho¹t trang bŞ Linh khİ tõ 0-79, sÏ kh«ng quay vÒ vßng Th¸i H­, trang bŞ Linh khİ tõ 80-120, sÏ quay vÒ vßng Th¸i H­. <color=red>Lóc gì bá trang bŞ Thiªn Qu¸i, sÏ quay vÒ Thiªn Qu¸i th¹ch, Linh th¹ch vµ trang bŞ kh«ng cã vŞ trİ quÎ sÏ ®­îc gi÷ l¹i ®é c­êng ho¸, ®Şnh hån vµ ®¼ng cÊp, nh­ng kh«ng thÓ quay l¹i B¸t Qu¸i Bµi.<color>",
		getn(strtab),
		strtab)
end

function add_tiandi_lingqi()
	local strtab = {
		"Ta muèn ®óc trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh 120 linh khİ/add_tiandi_wz",
		"Ta chØ ®Õn xem thö/nothing"
	}
	Say("Ta cã thÓ gióp ng­¬i ®óc trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh 120 linh khİ, ng­¬i chØ cÇn tèn <color=yellow>1 N÷ Oa tinh th¹ch<color> ë chç ta th«i.",
		getn(strtab),
		strtab)
end

function add_tiandi_wz()
	local strtab = {
		"§Çu/#add_tiandi_ask(0)",
		"Ngo¹i trang/#add_tiandi_ask(1)",
		"H¹ y/#add_tiandi_ask(3)",
		"Vò khİ/#add_tiandi_ask(2)",
		"§îi ta mÆc trang bŞ lªn ®·./nothing"};
	Say("Ng­¬i muèn ®óc linh khİ cña trang bŞ Thiªn §Şa HuyÒn Hoµng nµo trªn ng­êi? Chó ı, chØ cã trang bŞ Thiªn §Şa HuyÒn Hoµng ch­a kh¶m míi ®óc ®­îc.",
		getn(strtab),
		strtab)	
end

function add_tiandi_ask(nWz)
	local tWz = {"§Çu","Ngo¹i trang","Vò khİ","H¹ y"};
	Say("Ng­¬i muèn ®óc Thiªn §Şa HuyÒn Hoµng <color=yellow>"..tWz[nWz+1].."<color> kh«ng?",
		3,
		"Ta muèn ®iÒu chØnh/#add_tiandi_confirm("..nWz..")",
		"Kh«ng, ta nhÇm!/add_tiandi_wz",
		"§îi ta mÆc trang bŞ lªn ®·./nothing");		
end

function add_tiandi_confirm(nWz)
	if GetItemCount(2,1,504) < 1 then
		Talk(1,"","§iÒu chØnh linh khİ trang bŞ Thiªn §Şa HuyÒn Hoµng cÇn 1 N÷ Oa tinh th¹ch, trªn ng­êi ng­¬i kh«ng cã.");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz); --»ñÈ¡×°±¸Ë÷Òı
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --»ñÈ¡×°±¸id
	local nLingqi = GetItemMaxLingQi(nIndex);   --»ñÈ¡ÁéÆøÖµ
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--»ñÈ¡µÚÒ»¸öÄ§·¨ÊôĞÔid µÈ¼¶
	local nQianghua = GetEquipAttr(nIndex,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --»ñÈ¡ÊÇ·ñËø¶¨	
	local nRandSeed = GetItemRandSeed(nIndex);--Ëæ»úÖÖ×Ó
	local nBody = GetBody();
	
	if nIndex == 0 then 
		Talk(1,"","Ng­¬i kh«ng mang trang bŞ Thiªn §Şa HuyÒn Hoµng muèn ®iÒu chØnh linh trİ trªn ng­êi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng­¬i ®ang mang trang bŞ b¸t qu¸i µ, sau khi ph©n m¶nh råi ®Õn ®iÕu chØnh linh khİ.");
		return
	end
	
	if nWz ~= 2 then		
		if nId1 ~= tTiandiZb[nWz+1][nBody][2] or nId2 ~= tTiandiZb[nWz+1][nBody][3] or nId3 ~= tTiandiZb[nWz+1][nBody][4] then
			Talk(1,"","Ng­¬i ®ang mang kh«ng ph¶i trang bŞ Thiªn §Şa HuyÒn Hoµng.");
			return
		end
	else
		local nWpIdx = 0;
		for i = 1,getn(tTiandiWp) do 
			if nId1 == tTiandiWp[i][2] and nId2 == tTiandiWp[i][3] and nId3 == tTiandiWp[i][4] then
				nWpIdx = i;
				break
			end
		end
		if nWpIdx == 0 then
			Talk(1,"","Ng­¬i ®ang mang kh«ng ph¶i trang bŞ Thiªn §Şa HuyÒn Hoµng.");
			return		
		end
	end
		 
	if nLingqi == 0 or nMofa1 ~= 0 then
		Talk(1,"","ChØ cã trang bŞ Thiªn §Şa HuyÒn Hoµng ch­a kh¶m míi cã thÓ ®iÒu chØnh ®­îc!");
		return
	end
	if nLingqi == 120 then
		Talk(1,"","Trang bŞ Thiªn §Şa HuyÒn Hoµng cña ng­¬i ®· lµ 120 linh khİ råi.");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang bŞ cña ng­¬i hiÖn ®ang ë tr¹ng th¸i khãa, h·y më khãa råi ®Õn ®iÒu chØnh.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó b¶o ®¶m tµi s¶n an toµn, tr­íc khi ®iÒu chØnh linh khİ trang bŞ ng­¬i h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end	
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return
	end
	if DelItem(2,1,504,1) == 1 then
		local del_flag = DelItemByIndex(nIndex,-1);
		if del_flag == 1 then
			local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,120,nRandSeed);
			if add_flag == 1 then
				SetEquipCanChouQu(nNewIndex,1);
				if nDing == 1 then
					SetItemSpecialAttr(nNewIndex,"DING7",1); --¶¨»ê
				end			  
				Talk(1,"","Chóc mõng ng­¬i ®· ®iÒu chØnh linh khİ cña trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh c«ng.");
				WriteLog("§Ö tö thî rÌn L­u-Thiªn §Şa HuyÒn Hoµng: Ng­êi ch¬i"..GetName().."§iÒu chØnh linh khİ trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh c«ng, id vËt phÈm, c­êng hãa, ®Şnh hån, h¹t gièng ngÉu nhiªn:"..nId1..","..nId2..","..nId3..","..nQianghua..","..nDing..","..nRandSeed);
			else
				WriteLog("§Ö tö thî rÌn L­u-Thiªn §Şa HuyÒn Hoµng: Ng­êi ch¬i"..GetName().."§iÒu chØnh linh khİ trang bŞ thÊt b¹i, vŞ trİ thÊt b¹i, id vËt phÈm, c­êng hãa, ®Şnh hån, h¹t gièng ngÉu nhiªn:"..add_flag..","..nId1..","..nId2..","..nId3..","..nQianghua..","..nDing..","..nRandSeed);
			end
		end
	end		
end

function item_uplevel()
	local strtab = {
		"Ta muèn th¨ng cÊp trang bŞ B¸t Qu¸i Linh khİ 40-79 (tiªu hao 1 Tinh LuyÖn B¨ng Th¹ch)/#item_uplevel_wz(1)",
		"Ta muèn th¨ng cÊp trang bŞ B¸t Qu¸i Linh khİ 80-100 (tiªu hao 1 V« NgÊn Thuû)/#item_uplevel_wz(2)",
--		"ÎÒÒª°Ñ101-120ÁéÆøµÄ°ËØÔ×°±¸ÌáÉıÒ»¼¶£¨ÏûºÄÒ»¸öÅ®æ´¾«Ê¯£©/#item_uplevel_wz(3)",
--		"ÎÒÒª°Ñ·Ç°ËØÔ×°±¸ÌáÉıÒ»¼¶£¨ÏûºÄÒ»¸öÅ®æ´¾«Ê¯£©/#item_uplevel_wz(4)",
		"Ta muèn th¨ng cÊp trang bŞ ®Õn cÊp 9 (tiªu hao 1 N÷ Oa Tinh Th¹ch)/#item_uplevel_wz(5)",
		"Ta chØ ®Õn xem thö/nothing"
		}
	Say("<color=green>§Ö tö thî rÌn L­u<color>: HiÖn nay ta nhËn th¨ng cÊp trang bŞ cã thu phİ, nÕu cã nhu cÇu cø ®Õn t×m ta, <color=red>l­u ı, mçi trang bŞ chØ cã thÓ th¨ng cÊp 1 lÇn<color>.",
		getn(strtab),
		strtab)
end

function item_uplevel_wz(nType)
	local tItem = {"1 Tinh LuyÖn B¨ng Th¹ch","1 V« NgÊn Thuû","1 N÷ Oa Tinh Th¹ch","1 N÷ Oa Tinh Th¹ch","1 N÷ Oa Tinh Th¹ch"}
	local strtab = {
		"§Çu/#confirm_item_uplevel("..nType..",0)",
		"Ngo¹i trang/#confirm_item_uplevel("..nType..",1)",
		"H¹ y/#confirm_item_uplevel("..nType..",3)",
		"trë l¹i/item_uplevel"
		}
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i muèn th¨ng cÊp trang bŞ nµy, cÇn ph¶i cã <color=yellow>"..tItem[nType].."<color>, ng­¬i muèn th¨ng cÊp trang bŞ ë vŞ trİ nµo?",
		getn(strtab),
		strtab)
end

function confirm_item_uplevel(nType,nWz)
	local tItem = {{"Tinh luyÖn B¨ng Th¹ch",2,1,533,1,40,79},
								 {"V« NgÊn Thñy",2,1,503,1,80,100},
								 {"N÷ Oa Tinh Th¹ch",2,1,504,1,101,120},
								 {"N÷ Oa Tinh Th¹ch",2,1,504,1,0,0},
								 {"N÷ Oa Tinh Th¹ch",2,1,504,1}};
	if GetItemCount(tItem[nType][2],tItem[nType][3],tItem[nType][4]) < tItem[nType][5] then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i muèn th¨ng cÊp trang bŞ nµy, cÇn ph¶i cã <color=yellow>"..tItem[nType][5].."c¸i"..tItem[nType][1].."<color>, ng­¬i kh«ng ®ñ ®iÒu kiÖn.");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz);	
	local nZhuangbeiLv = GetEquipLevel(nIndex); --»ñÈ¡µ±Ç°×°±¸µÈ¼¶
	local nLingqi = GetItemMaxLingQi(nIndex);   --»ñÈ¡ÁéÆøÖµ
	local nBaseLv = GetEquipBaseLevel(nIndex); --»ñÈ¡×°±¸»ù´¡µÈ¼¶
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --»ñÈ¡ÊÇ·ñËø¶¨	
	if nIndex == 0 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i ch­a mÆc trang bŞ muèn th¨ng cÊp lªn ng­êi.");
		return
	end
	if nZhuangbeiLv > nBaseLv then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Trang bŞ nµy ®· th¨ng cÊp råi, kh«ng thÓ th¨ng cÊp thªm n÷a.");
		return
	end
	if nZhuangbeiLv >= 9 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Trang bŞ ®· ®¹t ®Õn cÊp cao nhÊt, kh«ng thÓ th¨ng cÊp thªm n÷a.");
		return
	end
	if nLock == 1 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Trang bŞ ®ang kho¸, xin h·y më kho¸ råi ®Õn gÆp ta sau.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: §Ó b¶o vÖ an toµn cho tµi kho¶n, xin h·y më r­¬ng chøa ®å tr­íc khi ®æi trang bŞ, c¶m ¬n!");
		return
	end	
	if nType ~= 5 then
		if nLingqi >= tItem[nType][6] and nLingqi <= tItem[nType][7] then	
			if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
				SetItemIncreaseLevel(nIndex,1);
				Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: B¹n ®· th¨ng cÊp trang bŞ thµnh c«ng.");
				WriteLog("[§Ö tö thî rÌn L­u, th¨ng cÊp trang bŞ]: Ng­êi ch¬i "..GetName().." ®· th¨ng cÊp trang bŞ thµnh c«ng, lo¹i vµ vŞ trİ: "..nType..", "..nWz);
			end
		else
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Lo¹i trang bŞ b¹n chän kh«ng phï hîp, cã ph¶i chän nhÇm kh«ng?")
			return
		end
	else
		if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
			if nZhuangbeiLv < 9 then
				SetItemIncreaseLevel(nIndex,9-nBaseLv);
				Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: B¹n ®· th¨ng cÊp trang bŞ thµnh c«ng.");
				WriteLog("[§Ö tö thî rÌn L­u, th¨ng cÊp trang bŞ]: Ng­êi ch¬i "..GetName().." ®· th¨ng cÊp trang bŞ thµnh c«ng, lo¹i vµ vŞ trİ: "..nType..", "..nWz);
			end
		end 
	end
end

function about_bufeiyan()
	local strtab = {
		"Ta muèn dïng [Vò khİ Bé Phi Yªn] ®Ó ®æi 2 Linh th¹ch cÊp 7 ngÉu nhiªn/#ask_bufeiyan(1)",
		"Ta muèn dïng [Vò khİ Bé Phi Yªn] ®Ó ®æi 5 Linh th¹ch cÊp 6 ngÉu nhiªn/#ask_bufeiyan(2)",
		"Ta muèn dïng [Ngäc Thè D­îc Bao] vµ 500 vµng ®Ó ®æi 1 Linh th¹ch cÊp 7/#ask_bufeiyan(3)",
		"Ta muèn dïng [Ngäc Thè D­îc Bao] vµ 500 vµng ®Ó ®æi 3 Linh th¹ch cÊp 6/#ask_bufeiyan(4)",
		"Ta chØ ®Õn xem thö/nothing"}
	Say("<color=green>§Ö tö thî rÌn L­u<color>: GÇn ®©y s­ phô muèn thö n©ng cÊp linh khİ cña c¸c vò khİ quı hiÕm, cho nªn ta ®ang s­u tËp c¸c trang bŞ Hoµng Kim nh­ Bé Phi Yªn, Ngäc Thè D­îc Bao. NÕu ng­¬i cã th× ta cã thÓ dïng Linh th¹ch ®Ó ®æi víi ng­¬i.",
		getn(strtab),
		strtab)
end

function ask_bufeiyan(nType)
	if nType == 1 then
		PutinItemBox("Vò khİ Bé Phi Yªn ®æi Linh th¹ch" ,1 , "Ng­¬i muèn dïng 1 <color=yellow>vò khİ Bé Phi Yªn Hoµng Kim<color> ®Ó ®æi <color=yellow>2 Linh th¹ch cÊp 7<color>, sau khi ®æi Linh th¹ch sÏ ®­îc ®Æt vµo Tô Linh ®Ønh. X¸c nhËn muèn ®æi?", THIS_FILE, 1617)
	elseif nType == 2 then
		PutinItemBox("Vò khİ Bé Phi Yªn ®æi Linh th¹ch" ,1 , "Ng­¬i muèn dïng 1 <color=yellow>vò khİ Bé Phi Yªn Hoµng Kim<color> ®Ó ®æi <color=yellow>5 Linh th¹ch cÊp 6<color>, sau khi ®æi Linh th¹ch sÏ ®­îc ®Æt vµo Tô Linh ®Ønh. X¸c nhËn muèn ®æi?", THIS_FILE, 1619)
	elseif nType == 3 then
		if GetCash() < 5000000 then
			Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã ®ñ 500 vµng, kh«ng thÓ ®æi.", 0)
			return
		end
		PutinItemBox("Ngäc Thè D­îc Bao ®æi Linh th¹ch" ,1 , "Ng­¬i muèn dïng 1 <color=yellow>Ngäc Thè D­îc Bao vµ 500 vµng<color> ®Ó ®æi <color=yellow>1 Linh th¹ch cÊp 7<color>, sau khi ®æi Linh th¹ch sÏ ®­îc ®Æt vµo Tô Linh ®Ønh. X¸c nhËn muèn ®æi?", THIS_FILE, 1621)
	elseif nType == 4 then
		if GetCash() < 5000000 then
			Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã ®ñ 500 vµng, kh«ng thÓ ®æi.", 0)
			return
		end
		PutinItemBox("Ngäc Thè D­îc Bao ®æi Linh th¹ch" ,1 , "Ng­¬i muèn dïng 1 <color=yellow>Ngäc Thè D­îc Bao vµ 500 vµng<color> ®Ó ®æi <color=yellow>3 Linh th¹ch cÊp 6<color>, sau khi ®æi Linh th¹ch sÏ ®­îc ®Æt vµo Tô Linh ®Ønh. X¸c nhËn muèn ®æi?", THIS_FILE, 1623)
	else
		return
	end
	
	if GetTask(805) == 2 then
		OpenBox()
	end
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local tItem =
	{
		["Ph¸ Yªn ®ao"] = {0,3,6001,},
		["Ph¸ Yªn c«n"] = {0,5,6002,},
		["Phï Yªn tr­îng"] = {0,8,6003,},
		["Hµm Yªn thñ"] = {0,0,6004,},
		["Tµng Yªn ch©m"] = {0,1,6005,},
		["Phi Yªn kiÕm"] = {0,2,6006,},
		["VËn Yªn cÇm"] = {0,10,6007,},
		["V©n Yªn thñ"] = {0,0,6008,},
		["L­u Yªn c«n"] = {0,5,6009,},
		["HuyÒn Yªn kiÕm"] = {0,2,6010,},
		["Vò Yªn bót"] = {0,9,6011,},
		["Hµ Tiªm Th­¬ng"] = {0,6,6012,},
		["Hµnh Yªn Cung"] = {0,4,6013,},
		["Träc Yªn nhÉn"] = {0,7,6014,},
		["Yªu Yªn tr¶o"] = {0,11,6015,},
	}
	
	-- Ëø¶¨µÄ²»ÈÃ½»
	if GetItemSpecialAttr(idx, "LOCK") > 0 then
		Say("<color=green>§Ö tö thî rÌn L­u<color>: §©y lµ vËt quı gi¸, thiÕu hiÖp ®· kho¸ l¹i, kh«ng thÓ ®æi ®­îc. NÕu muèn ®æi xin h·y më kho¸ råi ®Õn gÆp ta.", 0)
		return 0
	end

	local allow_item = 0
	if param == 1617 or param == 1619 then
		for i, v in tItem do
			if v[1] == genre and v[2] == detail and v[3] == particular then
				allow_item = 1
				break
			end
		end
		
		if allow_item == 1 then
			return 1
		else
			Say("<color=green>§Ö tö thî rÌn L­u<color>: §©y kh«ng ph¶i lµ vËt ta cÇn.", 0)
			return 0
		end
	elseif param == 1621 or param == 1623 then
		if GetCash() < 5000000 then
			Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã ®ñ 500 vµng, kh«ng thÓ ®æi.", 0)
			return 0
		end
		
		if genre == 0 and detail == 102 and particular == 41 then
			return 1
		else
			Say("<color=green>§Ö tö thî rÌn L­u<color>: §©y kh«ng ph¶i lµ vËt ta cÇn.", 0)
			return 0
		end
	end
	return 0
end


function OnPutinComplete(param)
	if param ~= 1617 and param ~= 1619 and param ~= 1621 and param ~= 1623 then		-- ·Ç·¨»Øµ÷
		return
	end
	
	if (param == 1621 or param == 1623) and Pay(5000000) ~= 1 then
		Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã ®ñ 500 vµng, kh«ng thÓ ®æi.", 0)
		return
	end

	local t = GetPutinItem()
	if getn(t) > 1 then		-- ¶îÍâ¼ì²â
		return
	end
	local ItemName = t[1][5]

	if DelItemByIndex(t[1][1], -1) == 1 then
		if param == 1617 then
			lspf_AddLingShiInBottle(7,2);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 2 Linh th¹ch cÊp 7, Linh th¹ch ®· ®­îc ®Æt vµo Tô Linh ®Ønh.");
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i ®· dïng trang bŞ ®æi Linh th¹ch thµnh c«ng!");
			WriteLog("[§Ö tö thî rÌn L­u Bé Phi Yªn]: Name="..GetName().." Result=Success Event=UseBFY(7,2) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		elseif param == 1619 then
			lspf_AddLingShiInBottle(6,5);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 5 Linh th¹ch cÊp 6, Linh th¹ch ®· ®­îc ®Æt vµo Tô Linh ®Ønh.");
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i ®· dïng trang bŞ ®æi Linh th¹ch thµnh c«ng!");
			WriteLog("[§Ö tö thî rÌn L­u Bé Phi Yªn]: Name="..GetName().." Result=Success Event=UseBFY(6,5) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		elseif param == 1621 then
			lspf_AddLingShiInBottle(7,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 7, Linh th¹ch ®· ®­îc ®Æt vµo Tô Linh ®Ønh.");
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i ®· dïng trang bŞ ®æi Linh th¹ch thµnh c«ng!");
			WriteLog("[§Ö tö thî rÌn L­u Bé Phi Yªn]: Name="..GetName().." Result=Success Event=UseYLT(7,1) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		elseif param == 1623 then
			lspf_AddLingShiInBottle(6,3);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 3 Linh th¹ch cÊp 6, Linh th¹ch ®· ®­îc ®Æt vµo Tô Linh ®Ønh.");
			Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i ®· dïng trang bŞ ®æi Linh th¹ch thµnh c«ng!");
			WriteLog("[§Ö tö thî rÌn L­u Bé Phi Yªn]: Name="..GetName().." Result=Success Event=UseYLT(6,3) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		else
			WriteLog("[§Ö tö thî rÌn L­u Bé Phi Yªn]: Name="..GetName().." Result=fail Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		end
	else
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã <color=yellow>"..ItemName.."<color>!")
		if param == 1621 or param == 1623 then
			Earn(5000000)	-- °Ñ¿Û³ıµÄÇ®²¹»ØÀ´
		end
	end
end

function chang_yijiding()
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã Thanh §ång §Ønh cÊp 1.");	
	else
		Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i muèn ®æi trang bŞ nµo?",
			5,
			"Thiªn §Şa HuyÒn Hoµng Kh«i/#choose_tiandi_lingqi(1,0)",
			"Thiªn §Şa HuyÒn Hoµng Gi¸p /#choose_tiandi_lingqi(2,0)",
			"GiÇy Thiªn §Şa HuyÒn Hoµng/#choose_tiandi_lingqi(3,0)",
			"Vò khİ Thiªn §Şa HuyÒn Hoµng/choose_tiandi_weapon",
			"T¹m thêi kh«ng ®æi. /nothing")
	end
end

function choose_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i muèn ®æi vò khİ nµo?",
			3,
			"Thiªn §Şa HuyÒn Hoµng Dao/#choose_tiandi_lingqi(4,1)",
			"Thiªn §Şa HuyÒn Hoµng C«n/#choose_tiandi_lingqi(4,2)",
			"T¹m thêi kh«ng ®æi. /nothing")
	else
		choose_tiandi_lingqi(4,0);
	end
end

function choose_tiandi_lingqi(nType,nWp)
	Say("<color=green>§Ö tö thî rÌn L­u<color>: H·y chän ®iÓm linh khİ cña trang bŞ nµy.",
		3,
		"119 linh khİ [Cµn Kh¶m ChÊn CÊn]/#ask_is_duihuan("..nType..","..nWp..",119)",
		"120 linh khİ [Kh«n §oµi Ly Tèn]/#ask_is_duihuan("..nType..","..nWp..",120)",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function ask_is_duihuan(nType,nWp,nLingqi)
	local tTiandiName = {"Thiªn §Şa HuyÒn Hoµng Kh«i","Thiªn §Şa HuyÒn Hoµng Gi¸p ","GiÇy Thiªn §Şa HuyÒn Hoµng","Vò khİ Thiªn §Şa HuyÒn Hoµng"};
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i muèn dïng Thanh §ång ®Ønh cÊp 1 ®æi linh khİ <color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> chø?",
		3,
		"õ, ta muèn ®æi./#confirm_change_yijiding("..nType..","..nWp..","..nLingqi..")",
		"Kh«ng, ta nhÇm!/chang_yijiding",
		"T¹m thêi kh«ng ®æi. /nothing"
		)
end

function confirm_change_yijiding(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã Thanh §ång §Ønh cÊp 1.");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,3213,1) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i dïng Thanh §ång ®Ønh cÊp 1 ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Sö dông Thanh §ång ®Ønh cÊp 1 thÊt b¹i, log:"..add_flag);
				end
			end
		else
			if DelItem(2,1,3213,1) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i dïng Thanh §ång ®Ønh cÊp 1 ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Sö dông Thanh §ång ®Ønh cÊp 1 thÊt b¹i, log:"..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,3213,1) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
			  SetEquipCanChouQu(add_idx,1);
				Msg2Player("Chóc mõng ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i dïng Thanh §ång ®Ønh cÊp 1 ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
			else
				WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Sö dông Thanh §ång ®Ønh cÊp 1 thÊt b¹i, log:"..add_flag);
			end	
		end
	end				
end

function chang_yanhuangtiehun()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã Viªm Hoµng ThiÕt Hån.");	
	else
		Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i muèn ®æi trang bŞ nµo?",
			5,
			"Thiªn §Şa HuyÒn Hoµng Kh«i/#yanhuang_tiandi_lingqi(1,0)",
			"Thiªn §Şa HuyÒn Hoµng Gi¸p /#yanhuang_tiandi_lingqi(2,0)",
			"GiÇy Thiªn §Şa HuyÒn Hoµng/#yanhuang_tiandi_lingqi(3,0)",
			"Vò khİ Thiªn §Şa HuyÒn Hoµng/yanhuang_tiandi_weapon",
			"T¹m thêi kh«ng ®æi. /nothing")
	end
end

function yanhuang_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i muèn ®æi vò khİ nµo?",
			3,
			"Thiªn §Şa HuyÒn Hoµng Dao/#yanhuang_tiandi_lingqi(4,1)",
			"Thiªn §Şa HuyÒn Hoµng C«n/#yanhuang_tiandi_lingqi(4,2)",
			"T¹m thêi kh«ng ®æi. /nothing")
	else
		yanhuang_tiandi_lingqi(4,0);
	end
end

function yanhuang_tiandi_lingqi(nType,nWp)
	Say("<color=green>§Ö tö thî rÌn L­u<color>: H·y chän ®iÓm linh khİ cña trang bŞ nµy.",
		3,
		"119 linh khİ [Cµn Kh¶m ChÊn CÊn]/#ask_yanhuang_duihuan("..nType..","..nWp..",119)",
		"120 linh khİ [Kh«n §oµi Ly Tèn]/#ask_yanhuang_duihuan("..nType..","..nWp..",120)",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function ask_yanhuang_duihuan(nType,nWp,nLingqi)
	local tTiandiName = {"Thiªn §Şa HuyÒn Hoµng Kh«i","Thiªn §Şa HuyÒn Hoµng Gi¸p ","GiÇy Thiªn §Şa HuyÒn Hoµng","Vò khİ Thiªn §Şa HuyÒn Hoµng"};
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i muèn dïng Viªm Hoµng ThiÕt Hån ®æi ®iÓm linh khİ <color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> chø?",
		3,
		"õ, ta muèn ®æi./#confirm_change_yanhuang("..nType..","..nWp..","..nLingqi..")",
		"Kh«ng, ta nhÇm!/chang_yanhuang",
		"T¹m thêi kh«ng ®æi. /nothing"
		)
end

function confirm_change_yanhuang(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã Viªm Hoµng ThiÕt Hån.");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,1146,1) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng ng­¬i dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."Dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Dïng Viªm Hoµng ThiÕt Hån ®æi thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flag);
				end
			end
		else
			if DelItem(2,1,1146,1) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng ng­¬i dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."Dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Dïng Viªm Hoµng ThiÕt Hån ®æi thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,1146,1) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
			  SetEquipCanChouQu(add_idx,1);
				Msg2Player("Chóc mõng ng­¬i dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Chóc mõng ng­¬i dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."Dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Dïng Viªm Hoµng ThiÕt Hån ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
			else
				WriteLog("[§Ö tö thî rÌn L­u Thiªn §Şa HuyÒn Hoµng]: Ng­êi ch¬i "..GetName().."Dïng Viªm Hoµng ThiÕt Hån ®æi thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flag);
			end	
		end
	end				
end

function get_bagua_lingshi_mianfei()
	Say("Ng­¬i muèn lÊy linh khİ cña trang bŞ nµo trªn ng­êi?",
		5,
		"§Çu/#ask_quchu_lingshi_mianfei(0)",
		"Ngo¹i trang/#ask_quchu_lingshi_mianfei(1)",
		"H¹ y/#ask_quchu_lingshi_mianfei(3)",
		"Vò khİ/#ask_quchu_lingshi_mianfei(2)",
		"§îi ta mÆc trang bŞ lªn ®·./nothing")	
end

function ask_quchu_lingshi_mianfei(nWz)
	local tChouqu = {"§Çu","Ngo¹i trang","Vò khİ","H¹ y"}
	Say("Ng­¬i muèn lÊy ®¸ trªn <color=yellow>"..tChouqu[nWz+1].."<color> µ?",
		3,
		"§­îc/#confirm_quchu_lingshi_mianfei("..nWz..")",
		"Ta chän nhÇm råi./get_bagua_lingshi_mianfei",
		"§îi ta mÆc trang bŞ lªn ®·./nothing")
end

function confirm_quchu_lingshi_mianfei(nWz)
	local nIndex = GetPlayerEquipIndex(nWz); --»ñÈ¡×°±¸Ë÷Òı
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --»ñÈ¡×°±¸id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --»ñÈ¡µ±Ç°×°±¸µÈ¼¶
	local nBaseLv = GetEquipBaseLevel(nIndex); --»ñÈ¡×°±¸»ù´¡µÈ¼¶
	local nLingqi = GetItemMaxLingQi(nIndex);   --»ñÈ¡ÁéÆøÖµ
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--»ñÈ¡µÚÒ»¸öÄ§·¨ÊôĞÔid µÈ¼¶
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--»ñÈ¡µÚ¶ş¸öÄ§·¨ÊôĞÔid µÈ¼¶
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--»ñÈ¡µÚÈı¸öÄ§·¨ÊôĞÔid µÈ¼¶
	local nQianghua = GetEquipAttr(nIndex,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
	local nGuawei = GetEquipBaGua(nIndex); --»ñÈ¡ØÔÎ»
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--ÊÇ·ñÒÑ¾­¼¤»î
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --»ñÈ¡ÊÇ·ñËø¶¨	
	local nRandSeed = GetItemRandSeed(nIndex);--Ëæ»úÖÖ×Ó
	local nMofaRand1 = mod(floor(GetItemParam(nIndex,0)/2^16),2^11); --ÊôĞÔÒ»µÄËæ»úÖÖ×Ó
	local nMofaRand2 = mod(floor(GetItemParam(nIndex,1)/2^16),2^11); --ÊôĞÔ¶şµÄËæ»úÖÖ×Ó
	local nMofaRand3 = mod(floor(GetItemParam(nIndex,2)/2^16),2^11); --ÊôĞÔÈıµÄËæ»úÖÖ×Ó
	local nMofaJiou1 = mod(floor(GetItemParam(nIndex,0)/2^14),2^2); --ÊôĞÔÒ»µÄÒõÑô£¬2ÎªÑô£¨ÆæÊı£©£¬1ÎªÒõ£¨Å¼Êı£©
	local nMofaJiou2 = mod(floor(GetItemParam(nIndex,1)/2^14),2^2); --ÊôĞÔ¶şµÄÒõÑô£¬2ÎªÑô£¬1ÎªÒõ
	local nMofaJiou3 = mod(floor(GetItemParam(nIndex,2)/2^14),2^2); --ÊôĞÔÈıµÄÒõÑô£¬2ÎªÑô£¬1ÎªÒõ
	
	if nIndex == 0 then 
		Talk(1,"","Ng­¬i kh«ng cã mang trang bŞ muèn lÊy linh khİ ra trªn ng­êi.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng­¬i ®ang mang trang bŞ b¸t qu¸i µ, sau khi ph©n m¶nh ®Õn nhËn linh th¹ch.");
		return
	end
		 
	if nLingqi == 0 or nMofa1 == 0 then
		Talk(1,"","Trang bŞ nµy cña ng­¬i kh«ng cã kh¶m ®¸ lµm sao lÊy ®­îc!");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang bŞ trªn ng­êi ng­¬i ®· khãa, cÇn më khãa míi cã thÓ th¨ng cÊp.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó bµo ®¶m tµi s¶n an toµn, tr­íc khi lÊy linh th¹ch ng­¬i h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end	
	if Zgc_pub_goods_add_chk(4,200) ~= 1 then
		return
	end
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nLingqi,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
			if nDing == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --¶¨»ê
			end
			local nLingshiLingqi1 = get_lingqi_jiou(nMofa1,nWz,nLv1,nMofaJiou1) --·µ»Ø¶ÔÓ¦ÆæÅ¼ÁéÆø
			AddLingShi(nMofa1,nWz,nLv1,nLingshiLingqi1,nMofaRand1);
			if nMofa2 ~= 0 then
				local nLingshiLingqi2 = get_lingqi_jiou(nMofa2,nWz,nLv2,nMofaJiou2) --·µ»Ø¶ÔÓ¦ÆæÅ¼ÁéÆø
				AddLingShi(nMofa2,nWz,nLv2,nLingshiLingqi2,nMofaRand2);	
			end
			if nMofa3 ~= 0 then
				local nLingshiLingqi3 = get_lingqi_jiou(nMofa3,nWz,nLv3,nMofaJiou3) --·µ»Ø¶ÔÓ¦ÆæÅ¼ÁéÆø
				AddLingShi(nMofa3,nWz,nLv3,nLingshiLingqi3,nMofaRand3);								
			end
			if nJihuo ~= 0 and nLingqi >= 80 then   --ÒÑ¾­¼¤»î
				if nGuawei ~= 0 and nGuawei ~= 5 then
					AddItem(tBaguaNum[nGuawei][2],tBaguaNum[nGuawei][3],tBaguaNum[nGuawei][4],tBaguaNum[nGuawei][5]);
				end
			end				  
			Talk(1,"","Chóc mõng ng­¬i ®· lÊy linh th¹ch thµnh c«ng.");
			WriteLog("§Ö tö thî rÌn L­u lÊy linh th¹ch: Ng­êi ch¬i"..GetName().."Thµnh c«ng khi lÊy linh th¹ch t¨ng trang bŞ, id vËt phÈm, linh khİ, c­êng hãa, ®Şnh hån, h¹t gièng ngÉu nhiªn, linh th¹ch thuéc tİnh 1, ®¼ng cÊp, thuéc tİnh 2, ®¼ng cÊp, thuéc tİnh 3, ®¼ng cÊp:"..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3);
		else
			WriteLog("§Ö tö thî rÌn L­u lÊy linh th¹ch: Ng­êi ch¬i"..GetName().."ThÊt b¹i khi lÊy linh th¹ch t¨ng trang bŞ, vŞ trİ thÊt b¹i, id vËt phÈm, linh khİ, c­êng hãa, ®Şnh hån, h¹t gièng ngÉu nhiªn, linh th¹ch thuéc tİnh 1, ®¼ng cÊp, thuéc tİnh 2, ®¼ng cÊp, thuéc tİnh 3, ®¼ng cÊp:"..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3);
		end		
	end			
end

function box_change_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		Say("<color=green>§Ö tö thî rÌn L­u<color>: Dïng 15 R­¬ng vµng ThŞnh ThÕ ®æi 1 vò khİ Hoµng §Õ <color=yellow>cña l­u ph¸i<color> t­¬ng øng. Ng­¬i cã muèn ®æi kh«ng?",
			3,
			"Ph¶i, ta muèn ®æi Hiªn Viªn To¸i Vò §ao/#confirm_box_change_weapon(1)",
			"Ph¶i, ta muèn ®æi Hiªn Viªn To¸i Vò C«n/#confirm_box_change_weapon(2)",
			"ChØ xem thö!/nothing")		
	else
		Say("<color=green>§Ö tö thî rÌn L­u<color>: Dïng 15 R­¬ng vµng ThŞnh ThÕ ®æi 1 vò khİ Hoµng §Õ <color=yellow>cña l­u ph¸i<color> t­¬ng øng. Ng­¬i cã muèn ®æi kh«ng?",
			2,
			"õ, ta muèn ®æi./#confirm_box_change_weapon(0)",
			"ChØ xem thö!/nothing")
	end
end

function confirm_box_change_weapon(nType)
	if GetItemCount(2,0,1028) < 15 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã 15 R­¬ng vµng ThŞnh ThÕ.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó bµo ®¶m tµi s¶n an toµn, tr­íc khi lÊy linh th¹ch ng­¬i h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end		
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end		
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: H·y vµo m«n ph¸i råi h·y ®æi.");
		return
	end
	if DelItem(2,0,1028,15) == 1 then
		local nRand = random(1,getn(tHuangDiWeapon[nRoute]));
		if nRoute == 2 then
			local nAddFlag = AddItem(tHuangDiWeapon[nRoute][nType][2],tHuangDiWeapon[nRoute][nType][3],tHuangDiWeapon[nRoute][nType][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Chóc mõng ng­¬i nhËn ®­îc 1  "..tHuangDiWeapon[nRoute][nType][1]);
				WriteLog("[R­¬ng vµng ThŞnh ThÕ ®æi vò khİ Hoµng §Õ]: Ng­êi ch¬i "..GetName().."Dïng 15 R­¬ng vµng ThŞnh ThÕ ®æi 1 "..tHuangDiWeapon[nRoute][nType][1]);
			else
				WriteLog("[R­¬ng vµng ThŞnh ThÕ ®æi vò khİ Hoµng §Õ]: Ng­êi ch¬i "..GetName().."Dïng 15 R­¬ng vµng ThŞnh ThÕ ®æi 1 "..tHuangDiWeapon[nRoute][nType][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
			end		
		else
			local nAddFlag = AddItem(tHuangDiWeapon[nRoute][nRand][2],tHuangDiWeapon[nRoute][nRand][3],tHuangDiWeapon[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Chóc mõng ng­¬i nhËn ®­îc 1  "..tHuangDiWeapon[nRoute][nRand][1]);
				WriteLog("[R­¬ng vµng ThŞnh ThÕ ®æi vò khİ Hoµng §Õ]: Ng­êi ch¬i "..GetName().."Dïng 15 R­¬ng vµng ThŞnh ThÕ ®æi 1 "..tHuangDiWeapon[nRoute][nRand][1]);
			else
				WriteLog("[R­¬ng vµng ThŞnh ThÕ ®æi vò khİ Hoµng §Õ]: Ng­êi ch¬i "..GetName().."Dïng 15 R­¬ng vµng ThŞnh ThÕ ®æi 1 "..tHuangDiWeapon[nRoute][nRand][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
			end		
		end
	else
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã 15 R­¬ng vµng ThŞnh ThÕ.");
	end
end

function jinbox_huan_ring()
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Dïng 4 R­¬ng vµng ThŞnh ThÕ ®æi trang søc Hoµng §Õ <color=yellow> cña l­u ph¸i<color> t­¬ng øng, ng­¬i muèn ®æi trang søc Hoµng §Õ nµo?",
		3,
		"Ta muèn ®æi Hiªn Viªn ChiÕn/#choose_xuanyuan(1)",
		"Ta muèn ®æi Hiªn Viªn §Èu/#choose_xuanyuan(2)",
		"Kh«ng cã g×!/nothing")
end

function choose_xuanyuan(nType)
	local tRing = {"Hiªn Viªn ChiÕn","Hiªn Viªn §Êu"};
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Dïng 4 R­¬ng vµng ThŞnh ThÕ ®æi 1 <color=yellow>"..tRing[nType].."<color> chø?",
		2,
		"õ, ta muèn ®æi./#confirm_jinbox_xuanyuan("..nType..")",
		"Ta chän nhÇm råi./jinbox_huan_ring")
end

function confirm_jinbox_xuanyuan(nType)
	if GetItemCount(2,0,1028) < 4 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã 4 R­¬ng vµng ThŞnh ThÕ.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","§Ó bµo ®¶m tµi s¶n an toµn, tr­íc khi lÊy linh th¹ch ng­¬i h·y më khãa r­¬ng chøa ®å tr­íc!");
		return
	end		
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â
		return
	end		
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: H·y vµo m«n ph¸i råi h·y ®æi.");
		return
	end
	if DelItem(2,0,1028,4) == 1 then
		if nType == 1 then
			local nRand = random(1,getn(tXuanyuanZhan[nRoute]));
			local nAddFlag = AddItem(tXuanyuanZhan[nRoute][nRand][2],tXuanyuanZhan[nRoute][nRand][3],tXuanyuanZhan[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Chóc mõng ng­¬i nhËn ®­îc 1 "..tXuanyuanZhan[nRoute][nRand][1]);
				WriteLog("[R­¬ng vµng ThŞnh ThÕ ®æi trang søc Hoµng §Õ]: Ng­êi ch¬i "..GetName().."Dïng 4 R­¬ng vµng ThŞnh ThÕ ®æi 1 "..tXuanyuanZhan[nRoute][nRand][1]);
			else
				WriteLog("[R­¬ng vµng ThŞnh ThÕ ®æi trang søc Hoµng §Õ]: Ng­êi ch¬i "..GetName().."Dïng 4 R­¬ng vµng ThŞnh ThÕ ®æi 1"..tXuanyuanZhan[nRoute][nRand][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
			end		
		elseif nType == 2 then
			local nRand = random(1,getn(tXuanyuanDou[nRoute]));
			local nAddFlag = AddItem(tXuanyuanDou[nRoute][nRand][2],tXuanyuanDou[nRoute][nRand][3],tXuanyuanDou[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Chóc mõng ng­¬i nhËn ®­îc 1 "..tXuanyuanDou[nRoute][nRand][1]);
				WriteLog("[R­¬ng vµng ThŞnh ThÕ ®æi trang søc Hoµng §Õ]: Ng­êi ch¬i "..GetName().."Dïng 4 R­¬ng vµng ThŞnh ThÕ ®æi 1 "..tXuanyuanDou[nRoute][nRand][1]);
			else
				WriteLog("[R­¬ng vµng ThŞnh ThÕ ®æi trang søc Hoµng §Õ]: Ng­êi ch¬i "..GetName().."Dïng 4 R­¬ng vµng ThŞnh ThÕ ®æi 1"..tXuanyuanDou[nRoute][nRand][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
			end			
		end
	else
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i kh«ng cã 4 R­¬ng vµng ThŞnh ThÕ.");
	end		

end

function is_xuanhuang_wuqi(nIdbig,nIdmid,nIdsmall)
	for p,v in tTiandi[4] do
		for a,b in v do
			
			if b[2] == nIdbig and b[3] == nIdmid and b[4] == nIdsmall then
				return 1
			end
			
		end
	end
	return 0
end

function is_xuanhuang_zhuangbei(nIdbig,nIdmid,nIdsmall)
	for p,v in tTiandiZb do
		for a,b in v do
			
			if b[2] == nIdbig and b[3] == nIdmid and b[4] == nIdsmall then
				return 1
			end
			
		end
	end
	
	return 0
end

function about_hhry()
	local strtab = {
		"Huy Hoµng Chi Thñy, Vinh Dù Chi Thñy th¨ng cÊp thµnh Huy Hoµng Chi KÕ, Vinh Dù Chi KÕ (400 Thiªn Th¹ch Tinh Th¹ch)/#uplevel_hhry(1)",
		"Huy Hoµng Chi KÕ, Vinh Dù Chi KÕ th¨ng cÊp thµnh Huy Hoµng QuËt Khëi, Vinh Dù QuËt Khëi (400 Thiªn Th¹ch Tinh Th¹ch)/#uplevel_hhry(2)",
		"Huy Hoµng QuËt Khëi, Vinh Dù QuËt Khëi th¨ng cÊp thµnh Huy Hoµng, Vinh Dù (1000 Thiªn Th¹ch Tinh Th¹ch1000)/#uplevel_hhry(3)",
		"Xem c¸c thuéc tİnh cÊp cña huy hoµng, vinh dù (kh«ng thÓ mua)/ring_Sale",
		"Kh«ng cã g×!/nothing"
		}
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Huy hoµng, vinh dù tæng céng cã 4 cÊp, ng­¬i cã thÓ xem c¸c thuéc tİnh cÊp cña huy hoµng, vinh dù bªn d­íi, nÕu muèn th¨ng cÊp t×m hiÓu néi dung ®i!",
		getn(strtab),
		strtab)
end

function ring_Sale()
	Sale(100,100,1);
end 

function uplevel_hhry(nType)
	Say("<color=green>§Ö tö thî rÌn L­u<color>: Ng­¬i muèn lÊy <color=yellow>"..tHuihuang[nType][1].." vµ"..tRongyao[nType][1].."<color> th¨ng cÊp thµnh <color=yellow>"..tHuihuang[nType+1][1].." vµ"..tRongyao[nType+1][1].."<color> kh«ng? CÇn thu thËp <color=yellow>"..tUplevel[nType][1]..tUplevel[nType][5].." <color>. <color=yellow>Chó ı, mang 2 trang søc muèn th¨ng cÊp lªn ng­êi. <color>",
		3,
		"§­îc, ta muèn th¨ng cÊp /#confirm_uplevel_hhry("..nType..")",
		"Xem c¸c thuéc tİnh cÊp cña huy hoµng, vinh dù (kh«ng thÓ mua)/ring_Sale",
		"§îi chót, ta mang trang søc lªn ng­êi tr­íc/nothing")
end

function confirm_uplevel_hhry(nType)
	if Zgc_pub_goods_add_chk(2,100) ~= 1 then
		return
	end
	local nIdx1 = GetPlayerEquipIndex(4); --µÚÒ»¸öÊ×ÊÎË÷Òı
	local nIdx2 = GetPlayerEquipIndex(5); --µÚ¶ş¸öÊ×ÊÎË÷Òı
	
	if nIdx1 == 0 or nIdx2 == 0 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: LÊy trang søc Huy Hoµng ng­¬i muèn ®æi cµi lªn vŞ trİ trang søc thø nhÊt, trang søc vinh dù cµi lªn vŞ trİ trang søc thø hai!")
		return
	end
	if GetItemSpecialAttr(nIdx1,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
		Talk(1,"","VËt phÈm ng­¬i ®Æt ë vŞ trİ trang søc ®Çu tiªn trªn ng­êi lµ vËt phÈm khãa, më khãa råi ®æi!");
		return
	end
	if GetItemSpecialAttr(nIdx2,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
		Talk(1,"","VËt phÈm ng­¬i ®Æt ë vŞ trİ trang søc thø hai trªn ng­êi lµ vËt phÈm khãa, më khãa råi ®æi!");
		return
	end		
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: §Ó b¶o ®¶m cña c¶i an toµn, tr­íc khi th¨ng cÊp trang bŞ h·y më khãa r­¬ng tr­íc, ®a t¹!");
		return
	end	
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	if nId1 ~= tHuihuang[nType][2] or nId2 ~= tHuihuang[nType][3] or nId3 ~= tHuihuang[nType][4] then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: LÊy trang søc Huy Hoµng muèn th¨ng cÊp cµi lªn vŞ trİ trang søc thø nhÊt, trang søc vinh dù muèn th¨ng cÊp cµi lªn vŞ trİ trang søc thø hai.");
		return
	end
	local nId4,nId5,nId6 = GetPlayerEquipInfo(5);
	if nId4 ~= tRongyao[nType][2] or nId5 ~= tRongyao[nType][3] or nId6 ~= tRongyao[nType][4] then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: LÊy trang søc Huy Hoµng muèn th¨ng cÊp cµi lªn vŞ trİ trang søc thø nhÊt, trang søc vinh dù muèn th¨ng cÊp cµi lªn vŞ trİ trang søc thø hai.");
		return
	end
	if GetItemCount(tUplevel[nType][2],tUplevel[nType][3],tUplevel[nType][4]) < tUplevel[nType][5] then
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Th¨ng cÊp cÇn thu thËp <color=yellow>"..tUplevel[nType][1]..tUplevel[nType][5].."<color> , ng­¬i kh«ng cã ®ñ.");
		return
	end
	if DelItem(tUplevel[nType][2],tUplevel[nType][3],tUplevel[nType][4],tUplevel[nType][5]) == 1 then
		if DelItemByIndex(nIdx1,-1) == 1 and DelItemByIndex(nIdx2,-1) == 1 then
			local nAddFlag = AddItem(tHuihuang[nType+1][2],tHuihuang[nType+1][3],tHuihuang[nType+1][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("B¹n ®Æt thµnh c«ng "..tHuihuang[nType][1].."T¨ng cÊp thµnh "..tHuihuang[nType+1][1]);
				Msg2Global("Qua t«i luyÖn,"..GetName().." thµnh c«ng më tiÒm n¨ng cña "..tHuihuang[nType][1]..", hãa thµnh "..tHuihuang[nType+1][1].."!");
				WriteLog("[Huy hoµng vinh dù]: Ng­êi ch¬i "..GetName().." thµnh c«ng ®em "..tHuihuang[nType][1].."T¨ng cÊp thµnh "..tHuihuang[nType+1][1]);
			else
				WriteLog("[Huy hoµng vinh dù]: Ng­êi ch¬i "..GetName().." ®em "..tHuihuang[nType][1].."T¨ng cÊp thµnh "..tHuihuang[nType+1][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
			end
			nAddFlag = AddItem(tRongyao[nType+1][2],tRongyao[nType+1][3],tRongyao[nType+1][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("B¹n ®Æt thµnh c«ng "..tRongyao[nType][1].."T¨ng cÊp thµnh "..tRongyao[nType+1][1]);
				Msg2Global("Qua t«i luyÖn,"..GetName().." thµnh c«ng më tiÒm n¨ng cña "..tRongyao[nType][1]..", hãa thµnh "..tRongyao[nType+1][1].."!");
				WriteLog("[Huy hoµng vinh dù]: Ng­êi ch¬i "..GetName().." thµnh c«ng ®em "..tRongyao[nType][1].."T¨ng cÊp thµnh "..tRongyao[nType+1][1]);
			else
				WriteLog("[Huy hoµng vinh dù]: Ng­êi ch¬i "..GetName().." ®em "..tRongyao[nType][1].."T¨ng cÊp thµnh "..tRongyao[nType+1][1].." thÊt b¹i, kı hiÖu:"..nAddFlag);
			end
		else
			WriteLog("[Huy hoµng vinh dù]: Ng­êi ch¬i "..GetName().."T¨ng"..tHuihuang[nType][1]..", khÊu trõ trang søc thÊt b¹i.");
		end		
	else
		Talk(1,"","<color=green>§Ö tö thî rÌn L­u<color>: Th¨ng cÊp cÇn thu thËp <color=yellow>"..tUplevel[nType][1]..tUplevel[nType][5].."<color> , ng­¬i kh«ng cã ®ñ.");
	end
end