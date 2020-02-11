--³ş¹úÉñ±øÏ»½Å±¾
--by vivi 
--07/12/2007

--ÁÙÊ±±äÁ¿
TT_ATTRI_ONE = 180; --¼ÇÂ¼µÚÒ»ÌõÊôĞÔ
TT_ATTRI_TWO = 181; --¼ÇÂ¼µÚ¶şÌõÊôĞÔ
TT_ATTRI_THREE = 182; --¼ÇÂ¼µÚÈıÌõÊôĞÔ
TT_ATTRI_TYPE = 183; --¼ÇÂ¼Íæ¼ÒÑ¡ÔñµÄÊôĞÔÀàĞÍ
TT_SHAOLIN_WEAPON = 184; --¼ÇÂ¼µ±Íæ¼ÒÂ·ÏßÎªÉÙÁÖÊ±£¬Ñ¡ÔñµÄÎäÆ÷ÀàĞÍ£¨µ¶»òÕß¹÷£©

--ÈÎÎñ±äÁ¿
TASK_PROB_ONE = 2385;  --¼ÇÂ¼ÊôĞÔÒ»ÉÏ½»ÌìµØĞş»ÆÊ¯µÄ´ÎÊı
TASK_PROB_TWO = 2386;  --¼ÇÂ¼ÊôĞÔ¶şÉÏ½»ÌìµØĞş»ÆÊ¯µÄ´ÎÊı
TASK_PROB_THREE = 2387; --¼ÇÂ¼ÊôĞÔÈıÉÏ½»ÌìµØĞş»ÆÊ¯µÄ´ÎÊı

--ÌìµØĞş»ÆÊ¯Ã¿´ÎĞèÒªÌá½»µÄ¿éÊı
tTiandiNum = {1,6,20};

--Õâ¸ötableÖ÷ÒªÊÇ¶ÔÓ¦ÏÂÃæµÄtAttriÀïÈı¸öÊôĞÔÀà±ğ´ÓµÚ¼¸Ïî¿ªÊ¼£¬µÚ4¸öÊıÒ²ĞèÒª¡£
tAttriNum = {1,13,25,40};

--ÊôĞÔtable ĞŞ¸Ä´Ë±íÒ»¶¨ÒªĞŞ¸Ägive_weapon()ÏÂµÄtInitAttri±í£¬ÇĞ¼Ç
tAttri = {--   1		 2     3             4            5          6          7            8         9-15 
					 --ÊôĞÔÃû id »ù´¡³É¹¦¸ÅÂÊ ³öÏÖ×îµÍµÈ¼¶ ×îµÍµÈ¼¶ÊıÖµ Ã¿¼¶ÔöÁ¿ ×î¸ßµÈ¼¶ÊıÖµ °Ù·Ö±È±êÖ¾ ÒÀ´Î³öÏÖ¸ÅÂÊ(²»ÊÇ´Ó1lv¿ªÊ¼µÄ²¹0) 
					 --°Ù·Ö±È±êÖ¾£¬0±íÊ¾Õâ¸öÊôĞÔÊıÖµÊÇ°Ù·Ö±ÈµÄ£¬1±íÊ¾Õâ¸öÊôĞÔÊıÖµ²»ÊÇ°Ù·Ö±ÈµÄ¡£
--¹¥»÷Ôö¼ÓÀàÊôĞÔ 12Ìõ
	{"Ngo¹i kİch + ",368,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"Néi kİch t¨ng ",369,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"Tû lÖ xuÊt chiªu t¨ng",370,25,4,2,1,5,0,0,0,0,9789,200,10,1},
	{"S¸t th­¬ng t¨ng ",372,25,4,30,30,150,1,0,0,0,9789,200,10,1},      
	{"Ph¸ phßng thñ ®èi ph­¬ng",362,40,5,4,3,10,0,0,0,0,0,9895,100,5},
	{"TÊn c«ng t¨ng ",77,60,1,10,5,40,0,2250,2250,2250,2250,600,300,100},
	{"Ph¸t huy c«ng kİch lín nhÊt",346,60,2,5,3,20,0,0,3500,3500,2000,600,300,100},
	{"Tû lÖ ®¸nh ph¹m vi",335,80,1,6,4,30,0,2000,1500,1500,1500,1500,1000,1000},
	{"Vò khİ ®¸nh ngo¹i lín nhÊt t¨ng ",65,80,1,8,7,50,1,2000,1500,1500,1500,1500,1000,1000},
	{"Vò khİ ®¸nh ngo¹i thÊp nhÊt t¨ng ",66,80,1,6,4,30,1,2000,1500,1500,1500,1500,1000,1000},
	{"Vò khİ ®¸nh néi lín nhÊt t¨ng",67,80,1,10,5,40,1,2000,1500,1500,1500,1500,1000,1000},
	{"Vò khİ ®¸nh néi thÊp nhÊt t¨ng ",68,80,1,7,3,25,1,2000,1500,1500,1500,1500,1000,1000},
--Ï÷ÈõµĞÈËÀàÊôĞÔ 12Ìõ 
	{"TÊn c«ng lµm søc m¹nh ®èi ph­¬ng gi¶m",348,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"TÊn c«ng lµm g©n cèt ®èi ph­¬ng gi¶m",349,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"TÊn c«ng lµm néi c«ng ®èi ph­¬ng gi¶m",350,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"KhiÕn ®èi ph­¬ng gi¶m Linh ho¹t ",351,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"TÊn c«ng lµm th©n ph¸p ®èi ph­¬ng gi¶m",352,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"TÊn c«ng lµm phßng ngo¹i ®èi ph­¬ng gi¶m",353,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"TÊn c«ng lµm gi¶m néi phßng ®èi ph­¬ng",354,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"Tû lÖ nhÊt ®Şnh lµm ®èi ph­¬ng khİ huyÕt hao tæn",53,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"Tû lÖ nhÊt ®Şnh lµm ®èi ph­¬ng ch©n nguyªn hao tæn",54,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"C«ng kİch khiÕn ngo¹i phßng cña ®èi ph­¬ng gi¶m",382,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"C«ng kİch khiÕn néi lùc cña ®èi ph­¬ng gi¶m ",383,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"TÊn c«ng lµm ®èi ph­¬ng hao tæn néi lùc",49,40,5,2,2,6,0,0,0,0,0,9895,100,5},
--ÔöÇ¿×ÔÉíÀàÊôĞÔ 15Ìõ
	{"H¹ gôc ®èi ph­¬ng sinh lùc håi phôc ",333,80,1,30,25,180,1,2000,1500,1500,1500,1500,1000,1000},
	{"Tû lÖ mµi mßn vò khİ gi¶m",9,80,1,10,5,40,0,2000,1500,1500,1500,1500,1000,1000},
	{"Søc lùc t¨ng",110,80,1,40,30,220,1,2000,1500,1500,1500,1500,1000,1000},
	{"§¸nh tËp trung t¨ng",342,60,1,3,2,15,0,2250,2250,2250,2250,600,300,100},
	{"Chİnh x¸c t¨ng",337,60,1,30,20,150,1,2250,2250,2250,2250,600,300,100},
	{"G©n cèt t¨ng",357,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Søc m¹ng t¨ng",358,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Th©n ph¸p t¨ng",359,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Linh ho¹t t¨ng",360,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Néi c«ng t¨ng ",361,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Sinh lùc tèi ®a t¨ng",79,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"Néi lùc + ",80,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"TÊt c¶ thuéc tİnh t¨ng",367,25,3,4,4,20,1,0,0,9489,400,100,10,1},
	{"Hç trî tÊn c«ng  duy tr× ",41,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},
	{"Hç trî phßng thñ duy tr× ",42,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},	
	};
	
--ÊôĞÔµÈ¼¶¸ÅÂÊÈ¨Öµ±í1-7
tLvProb = {
	[1] = {0,0,400000,300000,200000,10000,5000},
	[2] = {0,0,350000,350000,200000,20000,10000},
	[3] = {0,0,0,470000,470000,30000,15000},
	[4] = {0,0,0,430000,500000,40000,20000},
	[5] = {0,0,0,400000,515000,50000,25000},	
	[6] = {0,0,0,380000,540000,40000,30000},
	[7] = {0,0,0,350000,555000,50000,35000},
	[8] = {0,0,0,340000,550000,60000,40000},
	[9] = {0,0,0,150000,300000,50000,30000},
	[10] = {0,0,0,0,1500000,300000,200000},
	[11] = {0,0,0,0,3800000,700000,500000},
	[12] = {0,0,0,0,1800000,400000,300000},
	[13] = {0,0,0,0,1300000,400000,300000},
	[14] = {0,0,0,0,2200000,1000000,800000}
	}
	
	
--76¼¶ÎäÆ÷table
tWeapon = {
	[2]= {"Cæ §İnh",0,3,64,200},
	[3]= {"A La H¸n Tr­îng",0,8,97,100},
	[4]= {"V¹n NhÉn",0,0,14,220},
	[6]= {"M·n Thiªn Hoa Vò",0,1,53,130},	
	[8]= {"Háa Tinh",0,2,36,90},	
	[9]= {"Hi Nh©n CÇm",0,10,75,140},
	[11]= {"V¹n NhÉn",0,0,14,220},
	[12]= {"LiÖt DiÖm",0,5,40,200},
	[14]= {"Háa Tinh",0,2,36,90},	
	[15]= {"ThÇn Hµnh",0,9,86,130},	
	[17]= {"§¹i Hµo L«i Th­¬ng",0,6,108,130},	
	[18]= {"ThÇn Cung",0,4,119,130},
	[20]= {"L¨ng Phong",0,7,12,200},
	[21]= {"M·nh hæ",0,11,12,200},
	};

--¸øËæ»ú76¼¶ÎäÆ÷table
tRandomW = {
	[1]= {"Cæ §İnh",0,3,64,200},
	[2]= {"A La H¸n Tr­îng",0,8,97,100},
	[3]= {"V¹n NhÉn",0,0,14,220},
	[4]= {"M·n Thiªn Hoa Vò",0,1,53,130},	
	[5]= {"Háa Tinh",0,2,36,90},	
	[6]= {"Hi Nh©n CÇm",0,10,75,140},
	[7]= {"V¹n NhÉn",0,0,14,220},
	[8]= {"LiÖt DiÖm",0,5,40,200},
	[9]= {"Háa Tinh",0,2,36,90},	
	[10]= {"ThÇn Hµnh",0,9,86,130},	
	[11]= {"§¹i Hµo L«i Th­¬ng",0,6,108,130},	
	[12]= {"ThÇn Cung",0,4,119,130},
	[13]= {"L¨ng Phong",0,7,12,200},
	[14]= {"M·nh hæ",0,11,12,200},
	};
		
function GetPlayerSex()	
	local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û
	if (GetSex() == 1) then
		mySex = "ThiÕu hiÖp";
	elseif (GetSex() == 2) then
		mySex = "C« n­¬ng";
	end;
	return mySex;
end

--º¯ÊıÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êı
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕı³£Ìí¼ÓÎïÆ·½øĞĞ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"cancel","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"cancel","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end

function OnUse()
	local strtab = {
	"Rèt cuéc lµ lo¹i thÇn binh g× ®©y?.../choose_attribute",
	"¸i cha, thÇn binh v« chñ, ch­a thÓ giao hép ra./nothing"
	}
  Say("ThÇn Binh xuÊt h¹p ¾t ph¶i cã c¸c thuéc tİnh"..GetPlayerSex().."H·y chän ®Æc s¾c ThÇn binh mong muèn.",getn(strtab),strtab);
end

function choose_attribute()	
	local strtab = {
	"Thuéc tİnh ThÇn Binh 1 /#attri_type()",
	"¸i cha, t¹m thêi ch­a nghÜ ra./nothing",
	}
	
	Say("…"..GetPlayerSex().."TËp trung tinh thÇn, h·y ®Æt tÊt c¶ t©m niÖm cña m×nh vµo thÇn binh.",getn(strtab),strtab);
end

function attri_type()
	local strtab = {
	"Lo¹i t¨ng c«ng kİch/#choose_attri(1)",
	"Lo¹i lµm gi¶m søc chiÕn ®Êu ®èi ph­¬ng/#choose_attri(2)",
	"Lo¹i t¨ng n¨ng lùc b¶n th©n/#choose_attri(3)",
	"Ta ph¶i suy nghÜ kü ®·./cancel"
	}
	Say("…"..GetPlayerSex().."Hy väng thuéc tİnh ThÇn binh 1 xuÊt hiÖn ",getn(strtab),strtab);
end

function choose_attri(tNum)
	SetTaskTemp(TT_ATTRI_TYPE,tNum); --´æ´¢tNum£¬ºóÃæ»áÓÃµ½Õâ¸ö±äÁ¿
	dia_page(0);
end	

function dia_page(nPage)
	local page_num = 7;   --Ã¿Ò³¶Ô»°ÏÔÊ¾µÄÊôĞÔÊı 
	local dia_attri = {};  --ÏÔÊ¾¶Ô»°±í
	local attri_start = tAttriNum[GetTaskTemp(TT_ATTRI_TYPE)]-1;	
	local total_num = tAttriNum[GetTaskTemp(TT_ATTRI_TYPE)+1]-tAttriNum[GetTaskTemp(TT_ATTRI_TYPE)]; --ÕâÀàÊôĞÔ×ÜµÄÊıÄ¿
	local attri_remain_num = total_num - (nPage*page_num);	--ÕâÒ»Ò³ºó»¹Ê£ÏÂ¶àÉÙÌõÊôĞÔÊı
	local num_this_dia = 7;
	if attri_remain_num <= 7 then
		num_this_dia = attri_remain_num;
	end
	for i=1,num_this_dia do                                                                                                                                   
		if tAttri[attri_start+(page_num*nPage)+i][8] == 0 then                                                                                                     
			tinsert(dia_attri,tAttri[attri_start+(page_num*nPage)+i][1].." gi¸ trŞ thuéc tİnh: "..floor(tAttri[attri_start+(page_num*nPage)+i][5]/2).."%-"..tAttri[attri_start+(page_num*nPage)+i][7].."%/#get_attri("..(attri_start+(page_num*nPage)+i)..")");        
		else                                                                                                                                                                         	
	 		tinsert(dia_attri,tAttri[attri_start+(page_num*nPage)+i][1].." gi¸ trŞ thuéc tİnh: "..floor(tAttri[attri_start+(page_num*nPage)+i][5]/2).."-"..tAttri[attri_start+(page_num*nPage)+i][7].."/#get_attri("..(attri_start+(page_num*nPage)+i)..")");                                                         
		end                                                                                                                                                                       	
	end
	if nPage ~= 0 then
		tinsert(dia_attri,"Trang tr­íc/#dia_page("..(nPage-1)..")");
	end
	if attri_remain_num > page_num then
		tinsert(dia_attri,"Trang kÕ/#dia_page("..(nPage+1)..")");
	end
	if GetTaskTemp(TT_ATTRI_ONE) == 0 then
		tinsert(dia_attri,"Trë vÒ trang chän lo¹i thuéc tİnh./attri_type");
	elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) == 0 then
		tinsert(dia_attri,"Trë vÒ trang chän lo¹i thuéc tİnh./#make_attri(1,GetTaskTemp(TT_ATTRI_ONE))");
	elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) ~= 0 and GetTaskTemp(TT_ATTRI_THREE) == 0 then
		tinsert(dia_attri,"Trë vÒ trang chän lo¹i thuéc tİnh./#make_attri(2,GetTaskTemp(TT_ATTRI_TWO))");
	end	
	Say("Xin h·y chän mét thuéc tİnh ®i.",
		getn(dia_attri),
		dia_attri
		)                                                                                                                                                                             
end 
	
function get_attri(aType)
	if aType ~= 0 then                                                                                                                   
		if GetTaskTemp(TT_ATTRI_ONE) == aType or GetTaskTemp(TT_ATTRI_TWO) == aType or GetTaskTemp(TT_ATTRI_THREE) == aType then 
			if GetTaskTemp(TT_ATTRI_TWO) == 0 then
				Talk(1,"#make_attri(1,GetTaskTemp(TT_ATTRI_ONE))","Huynh ®· chän qua thuéc tİnh nµy råi, h·y chän thuéc tİnh kh¸c.");                                        
			else
				Talk(1,"#make_attri(2,GetTaskTemp(TT_ATTRI_TWO))","Huynh ®· chän qua thuéc tİnh nµy råi, h·y chän thuéc tİnh kh¸c.");
			end
		else                                                                                                                                    
			if GetTaskTemp(TT_ATTRI_ONE) == 0 then                                                                                                 
				Say("C¸c h¹ chän thuéc tİnh lµ <color=yellow>"..tAttri[aType][1].."<color>",
					2,
					"§ång ı/#make_attri(1,"..aType..")",
					"Chän sai råi. Xin chän l¹i /#choose_attri("..GetTaskTemp(TT_ATTRI_TYPE)..")"
					);                           
			elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) == 0 then                                                                                                 
				Say("C¸c h¹ chän thuéc tİnh lµ <color=yellow>"..tAttri[aType][1].."<color>",
					2,
					"§ång ı/#make_attri(2,"..aType..")",
					"Chän sai råi. Xin chän l¹i /#choose_attri("..GetTaskTemp(TT_ATTRI_TYPE)..")"
					);                           
			elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) ~= 0 and GetTaskTemp(TT_ATTRI_THREE) == 0 then                                                                                                                 
				Say("C¸c h¹ chän thuéc tİnh lµ <color=yellow>"..tAttri[aType][1].."<color>",
					2,
					"§ång ı/#make_attri(3,"..aType..")",
					"Chän sai råi. Xin chän l¹i /#choose_attri("..GetTaskTemp(TT_ATTRI_TYPE)..")"
					);                              
			end                                                                                                                                   
		end                                                                                                                                     
	end	                                          
end

function make_attri(att_num,nType)
	local strtab = {
	"Lo¹i t¨ng c«ng kİch/#choose_attri(1)",
	"Lo¹i lµm gi¶m søc chiÕn ®Êu ®èi ph­¬ng/#choose_attri(2)",
	"Lo¹i t¨ng n¨ng lùc b¶n th©n/#choose_attri(3)",
	"Ta ph¶i suy nghÜ kü ®·./cancel"
	}
	if att_num == 1 then
		SetTaskTemp(TT_ATTRI_ONE,nType);
		Say("…"..GetPlayerSex().."Hy väng xuÊt hiÖn thuéc tİnh ThÇn binh 2",getn(strtab),strtab);
	elseif att_num == 2 then
		SetTaskTemp(TT_ATTRI_TWO,nType);
		Say("…"..GetPlayerSex().."Hy väng xuÊt hiÖn thuéc tİnh ThÇn binh 3",getn(strtab),strtab);
	elseif att_num == 3 then
		SetTaskTemp(TT_ATTRI_THREE,nType);
		confirm_attri();
	end
end

		
function cancel()
	SetTaskTemp(TT_ATTRI_ONE,0);
	SetTaskTemp(TT_ATTRI_TWO,0);
	SetTaskTemp(TT_ATTRI_THREE,0);
	SetTaskTemp(TT_ATTRI_TYPE,0);
	SetTaskTemp(TT_SHAOLIN_WEAPON,0);
end
	
function confirm_attri()
	local attrione = GetTaskTemp(TT_ATTRI_ONE);
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);
	local nstr = "";
	
	if tAttri[attrione][8] == 0 then   --ÅĞ¶ÏÊÇ·ñÒª¼Ó°Ù·ÖºÅ£¨%£©
		nstr=nstr.."B¹n chän thuéc tİnh 1: <color=yellow>"..tAttri[attrione][1].."<color>, thuéc tİnh cã gi¸ trŞ: <color=yellow>"..floor(tAttri[attrione][5]/2).."%-"..tAttri[attrione][7].."%<color>.\n";
	else	
		nstr=nstr.."B¹n chän thuéc tİnh 1: <color=yellow>"..tAttri[attrione][1].."<color>, thuéc tİnh cã gi¸ trŞ: <color=yellow>"..floor(tAttri[attrione][5]/2).."-"..tAttri[attrione][7].."<color>.\n";
	end
	if tAttri[attritwo][8] == 0 then
		nstr=nstr.."thuéc tİnh 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thuéc tİnh cã gi¸ trŞ: <color=yellow>"..floor(tAttri[attritwo][5]/2).."%-"..tAttri[attritwo][7].."%<color>.\n";
	else
		nstr=nstr.."thuéc tİnh 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thuéc tİnh cã gi¸ trŞ: <color=yellow>"..floor(tAttri[attritwo][5]/2).."-"..tAttri[attritwo][7].."<color>.\n";
	end
	if tAttri[attrithree][8] == 0 then
		nstr=nstr.."thuéc tİnh 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thuéc tİnh cã gi¸ trŞ: <color=yellow>"..floor(tAttri[attrithree][5]/2).."%-"..tAttri[attrithree][7].."%<color>.";
	else
		nstr=nstr.."thuéc tİnh 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thuéc tİnh cã gi¸ trŞ: <color=yellow>"..floor(tAttri[attrithree][5]/2).."-"..tAttri[attrithree][7].."<color>.";
	end
		
	Say("…"..nstr,
		2,
		"Ta muèn vÒ trang chñ ThÇn binh /main",
		"Ta ch­a chän xong, cßn ph¶i suy nghÜ…/cancel"
		);
end

function main()
	local strtab = {
		"Ta ®· nghÜ ra thÇn binh nh­ thÕ nµo råi, giao ra th«i!/confirm_weapon",
		"X¸c suÊt thµnh c«ng chÕ t¹o ThÇn binh/weapon_probability",
		"Ta muèn dïng Thiªn §Şa HuyÒn Hoµng Th¹ch n¨ng cao linh khİ cña ThÇn binh./use_stone",
		"¸i cha, thÇn binh v« chñ, ch­a thÓ giao hép ra./cancel"
		}
	Say("ThÇn Binh xuÊt h¹p ¾t ph¶i cã c¸c thuéc tİnh"..GetPlayerSex().."B¹n muèn giao ra hép ThÇn Binh kh«ng? ",getn(strtab),strtab);
end

function confirm_weapon()
	if GetPlayerRoute() == 2 then
		Say("C¸c h¹ muèn dïng lo¹i hép ThÇn binh nµo?",
			3,
			"§ao/#shaolin_weapon(1)",
			"C«n/#shaolin_weapon(2)",
			"Sau nµy h·y tİnh!/cancel"
			);
	else			
		Say("C¸c h¹ muèn giao ra hép ThÇn binh chø?",
			2,
			"§­îc/give_weapon",
			"Sau nµy h·y tİnh!/cancel"
			);
	end
end

function shaolin_weapon(nWeaponType)
	if nWeaponType == 1 then
		SetTaskTemp(TT_SHAOLIN_WEAPON,1);
	elseif nWeaponType == 2 then
		SetTaskTemp(TT_SHAOLIN_WEAPON,2);
	end
	give_weapon();		
end

function weapon_probability()
	local attrione = GetTaskTemp(TT_ATTRI_ONE);                                                                                        
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);                                                                                       
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);                                                                                                                                                                                                            
	local nstr = "";                                                                                                                                                                                                                                                                 
	                                                                                                                                      
  local probone	= tAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10;  --»ñÈ¡µÚÒ»ÏîÊôĞÔ¸ÅÂÊ
	if probone >= 100 then
		probone = 100;
	end
	if tAttri[attrione][8] == 0 then   --ÅĞ¶ÏÊÇ·ñÒª¼Ó°Ù·ÖºÅ£¨%£©                                                                                                        
		nstr=nstr.."thuéc tİnh ThÇn binh lµ: <color=yellow>"..tAttri[attrione][1].."<color>, thuéc tİnh x¸c suÊt thµnh c«ng: <color=yellow>"..probone.."%<color>, thuéc tİnh t¨ng: <color=yellow>"..floor(tAttri[attrione][5]/2).."%-"..tAttri[attrione][7].."%<color>.\n";     
	else	                                                                                                                                     
		nstr=nstr.."thuéc tİnh ThÇn binh lµ: <color=yellow>"..tAttri[attrione][1].."<color>, thuéc tİnh x¸c suÊt thµnh c«ng: <color=yellow>"..probone.."%<color>, thuéc tİnh t¨ng: <color=yellow>"..floor(tAttri[attrione][5]/2).."-"..tAttri[attrione][7].."<color>.\n";       
	end
		
	local probtwo = tAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10;  --»ñÈ¡µÚ¶şÏîÊôĞÔ¸ÅÂÊ
	if probtwo >= 50 then
		probtwo = 50;
	end
	if tAttri[attritwo][8] == 0 then           --ÅĞ¶ÏÊÇ·ñÒª¼Ó°Ù·ÖºÅ£¨%£©                                                                                                
		nstr=nstr.."thuéc tİnh 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thuéc tİnh x¸c suÊt thµnh c«ng: <color=yellow>"..probtwo.."%<color>, thuéc tİnh t¨ng: <color=yellow>"..floor(tAttri[attritwo][5]/2).."%-"..tAttri[attritwo][7].."%<color>.\n";             
	else                                                                                                                                       
		nstr=nstr.."thuéc tİnh 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thuéc tİnh x¸c suÊt thµnh c«ng: <color=yellow>"..probtwo.."%<color>, thuéc tİnh t¨ng: <color=yellow>"..floor(tAttri[attritwo][5]/2).."-"..tAttri[attritwo][7].."<color>.\n";               
	end                                                                                                                                        
	
	local probthree = tAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10; --»ñÈ¡µÚÈıÏîÊôĞÔ¸ÅÂÊ
	if probthree >= 20 then
		probthree = 20;
	end
	if tAttri[attrithree][8] == 0 then                                                                                                       
		nstr=nstr.."thuéc tİnh 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thuéc tİnh x¸c suÊt thµnh c«ng: <color=yellow>"..probthree.."%<color>, thuéc tİnh t¨ng: <color=yellow>"..floor(tAttri[attrithree][5]/2).."%-"..tAttri[attrithree][7].."%<color>.\n"; 
	else                                                                                                                                       
		nstr=nstr.."thuéc tİnh 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thuéc tİnh x¸c suÊt thµnh c«ng: <color=yellow>"..probthree.."%<color>, thuéc tİnh t¨ng: <color=yellow>"..floor(tAttri[attrithree][5]/2).."-"..tAttri[attrithree][7].."<color>.\n";   
	end
	
	Talk(1,"main","…"..nstr.."<color=yellow> Xin chó ı, chØ khi thuéc tİnh 1 thµnh c«ng th× míi ngÉu nhiªn cã thuéc tİnh 2.<color>" );     

end                                                                                                                                 

function use_stone()
	Say("NÕu lÊy Thiªn §Şa HuyÒn Hoµng Th¹ch ®Æt hép ThÇn binh sÏ lµm t¨ng thuéc tİnh x¸c suÊt thÇn c«ng hiÖn t¹i cña ThÇn Binh. <color=yellow> Mçi lÇn <color>®Æt Thiªn §Şa HuyÒn Hoµng Th¹ch t¨ng <color=yellow>10%<color> x¸c suÊt thµnh c«ng, sao h¶?",
		4,
		"Mét lÇn ®Æt 1Thiªn §Şa HuyÒn Hoµng Th¹ch, lµm t¨ng thuéc tİnh x¸c suÊt thµnh c«ng, cã thÓ tİch lòy ®Ó t¨ng 100## x¸c suÊt thµnh c«ng./#is_probability(1)",
		"Mét lÇn ®Æt 6 Thiªn §Şa HuyÒn Hoµng Th¹ch, lµm t¨ng thuéc tİnh x¸c suÊt thµnh c«ng thø 2, cã thÓ tİch lòy ®Ó t¨ng 50%./#is_probability(2)",
		"Mét lÇn ®Æt 20 Thiªn §Şa HuyÒn Hoµng Th¹ch, lµm t¨ng thuéc tİnh x¸c suÊt thµnh c«ng thø 3, cã thÓ tİch lòy ®Ó t¨ng 20##/#is_probability(3)",
		"Ta kh«ng cã dù ®Şnh t¨ng linh khİ ThÇn binh./main"
		)
end   

function is_probability(aType)
  local attrione = GetTaskTemp(TT_ATTRI_ONE);
  local probone	= tAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10; --»ñÈ¡µÚÒ»ÏîÊôĞÔ¸ÅÂÊ
	if probone >= 100 then
		probone = 100;
	end
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);
	local probtwo = tAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10; --»ñÈ¡µÚ¶şÏîÊôĞÔ¸ÅÂÊ
	if probtwo >= 50 then
		probtwo = 50;
	end
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);
	local probthree = tAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10; --»ñÈ¡´óÈıÏîÊôĞÔ¸ÅÂÊ
	if probthree >= 20 then
		probthree = 20;
	end
	local nProbability = 0;
	if aType == 1 then
		nProbability = probone;
	elseif aType == 2 then
		nProbability = probtwo;
	elseif aType == 3 then
		nProbability = probthree;
	end				
	if (aType == 1 and probone >= 100) or (aType == 2 and probtwo >= 50) or (aType == 3 and probthree >= 20) then
		Talk(1,"use_stone","Tr­íc tiªn ph¶i t¨ng thuéc tİnh x¸c suÊt ®Õn møc cao nhÊt: <color=yellow>"..nProbability.."%<color>, nÕu ®Æt thªm còng kh«ng cã t¸c dông.");
	else
		Say("Tr­íc tiªn ph¶i t¨ng thuéc tİnh x¸c suÊt ®Õn møc cao nhÊt: <color=yellow>"..nProbability.."%<color>. b¹n tİnh mét lÇn ®Æt <color=yellow>"..tTiandiNum[aType].."<color> Thiªn §Şa HuyÒn Hoµng Th¹ch lµm t¨ng thuéc tİnh x¸c suÊt ThÇn binh, x¸c nhËn ®Æt kh«ng? ",
			2,
			"§ång ı/#add_probability("..aType..")",
			"Kh«ng, t¹i h¹ kh«ng ®Şnh lµm t¨ng linh khİ cho ThÇn binh/main"
			);
	end
end

--ÌìµØĞş»»Ê¯
function add_probability(pType)
	local strtab = {
		"Ta muèn vÒ trang tr­íc ®Ó lµm t¨ng linh khİ cho ThÇn binh/use_stone",
		"Ta muèn vÒ trang chñ ThÇn binh /main"
		};
		
	if pType == 1 then
		if DelItem(2,1,1151,1) == 1 then
			SetTask(TASK_PROB_ONE,GetTask(TASK_PROB_ONE)+1);
			local attrione = GetTaskTemp(TT_ATTRI_ONE);
  		local probone	= tAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10; --»ñÈ¡µÚÒ»ÏîÊôĞÔ¸ÅÂÊ
			if probone >= 100 then
				probone = 100;
			end			
			Say("C¸c h¹ 1 lÇn ®Æt 1 Thiªn §Şa HuyÒn Hoµng Th¹ch, thuéc tİnh x¸c suÊt thµnh c«ng t¨ng: <color=yellow>"..probone.."%<color>",
				getn(strtab),
				strtab
				);
		else
			Talk(1,"main","C¸c h¹ kh«ng cã Thiªn §Şa HuyÒn Hoµng Th¹ch . ");
		end
	elseif pType == 2 then
		if DelItem(2,1,1151,6) == 1 then
			SetTask(TASK_PROB_TWO,GetTask(TASK_PROB_TWO)+1);
			local attritwo = GetTaskTemp(TT_ATTRI_TWO);
			local probtwo = tAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10; --»ñÈ¡µÚ¶şÏîÊôĞÔ¸ÅÂÊ
			if probtwo >= 50 then
				probtwo = 50;
			end
			Say("C¸c h¹ 1 lÇn ®Æt 6 Thiªn §Şa HuyÒn Hoµng Th¹ch, thuéc tİnh x¸c suÊt thµnh c«ng lo¹i 2 t¨ng: <color=yellow>"..probtwo.."%<color>",
				getn(strtab),
				strtab
				);				
	  else
	  	Talk(1,"main","Huynh kh«ng ®ñ 6 Thiªn §Şa HuyÒn Hoµng Th¹ch.");
	  end
	elseif pType == 3 then
		if DelItem(2,1,1151,20) == 1 then
			SetTask(TASK_PROB_THREE,GetTask(TASK_PROB_THREE)+1);
			local attrithree = GetTaskTemp(TT_ATTRI_THREE);
			local probthree = tAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10; --»ñÈ¡´óÈıÏîÊôĞÔ¸ÅÂÊ
			if probthree >= 20 then
				probthree = 20;
			end			
			Say("C¸c h¹ 1 lÇn ®Æt 20 Thiªn §Şa HuyÒn Hoµng Th¹ch, x¸c suÊt thµnh c«ng loai 3 t¨ng: <color=yellow>"..probthree.."%<color>",
				getn(strtab),
				strtab
				);				
	  else
	  	Talk(1,"main","Huynh kh«ng ®ñ 20 Thiªn §Şa HuyÒn Hoµng Th¹ch.");
	  end			
	end	
end

function give_weapon()
	local attrione = GetTaskTemp(TT_ATTRI_ONE);                                                                                        
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);                                                                                       
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);	
	local nroute=0;   --¼ÇÂ¼Íæ¼ÒµÄÁ÷ÅÉ
	local nStone = GetTask(TASK_PROB_ONE)+GetTask(TASK_PROB_TWO)+GetTask(TASK_PROB_THREE); --Ò»¹²Í¶ÈëÌìµØĞş»ÆÊ¯µÄ´ÎÊı ×î´óÎª14
		
	--³õÊ¼Ã»ÓĞÓÃĞş»ÆÊ¯µÄ±í ¸útAttri±íÒ»Ñù
	local tInitAttri = {--   1		 2     3             4            5          6          7            8         9-15 
					 						--ÊôĞÔÃû id »ù´¡³É¹¦¸ÅÂÊ ³öÏÖ×îµÍµÈ¼¶ ×îµÍµÈ¼¶ÊıÖµ Ã¿¼¶ÔöÁ¿ ×î¸ßµÈ¼¶ÊıÖµ °Ù·Ö±È±êÖ¾ ÒÀ´Î³öÏÖ¸ÅÂÊ(²»ÊÇ´Ó1lv¿ªÊ¼µÄ²¹0) 
					 						--°Ù·Ö±È±êÖ¾£¬0±íÊ¾Õâ¸öÊôĞÔÊıÖµÊÇ°Ù·Ö±ÈµÄ£¬1±íÊ¾Õâ¸öÊôĞÔÊıÖµ²»ÊÇ°Ù·Ö±ÈµÄ¡£
	--¹¥»÷Ôö¼ÓÀàÊôĞÔ 12Ìõ
	{"Ngo¹i kİch + ",368,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"Néi kİch t¨ng ",369,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"Tû lÖ xuÊt chiªu t¨ng",370,25,4,2,1,5,0,0,0,0,9789,200,10,1},
	{"S¸t th­¬ng t¨ng ",372,25,4,30,30,150,1,0,0,0,9789,200,10,1},      
	{"Ph¸ phßng thñ ®èi ph­¬ng",362,40,5,4,3,10,0,0,0,0,0,9895,100,5},
	{"TÊn c«ng t¨ng ",77,60,1,10,5,40,0,2250,2250,2250,2250,600,300,100},
	{"Ph¸t huy c«ng kİch lín nhÊt",346,60,2,5,3,20,0,0,3500,3500,2000,600,300,100},
	{"Tû lÖ ®¸nh ph¹m vi",335,80,1,6,4,30,0,2000,1500,1500,1500,1500,1000,1000},
	{"Vò khİ ®¸nh ngo¹i lín nhÊt t¨ng ",65,80,1,8,7,50,1,2000,1500,1500,1500,1500,1000,1000},
	{"Vò khİ ®¸nh ngo¹i thÊp nhÊt t¨ng ",66,80,1,6,4,30,1,2000,1500,1500,1500,1500,1000,1000},
	{"Vò khİ ®¸nh néi lín nhÊt t¨ng",67,80,1,10,5,40,1,2000,1500,1500,1500,1500,1000,1000},
	{"Vò khİ ®¸nh néi thÊp nhÊt t¨ng ",68,80,1,7,3,25,1,2000,1500,1500,1500,1500,1000,1000},
--Ï÷ÈõµĞÈËÀàÊôĞÔ 12Ìõ 
	{"TÊn c«ng lµm søc m¹nh ®èi ph­¬ng gi¶m",348,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"TÊn c«ng lµm g©n cèt ®èi ph­¬ng gi¶m",349,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"TÊn c«ng lµm néi c«ng ®èi ph­¬ng gi¶m",350,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"KhiÕn ®èi ph­¬ng gi¶m Linh ho¹t ",351,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"TÊn c«ng lµm th©n ph¸p ®èi ph­¬ng gi¶m",352,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"TÊn c«ng lµm phßng ngo¹i ®èi ph­¬ng gi¶m",353,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"TÊn c«ng lµm gi¶m néi phßng ®èi ph­¬ng",354,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"Tû lÖ nhÊt ®Şnh lµm ®èi ph­¬ng khİ huyÕt hao tæn",53,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"Tû lÖ nhÊt ®Şnh lµm ®èi ph­¬ng ch©n nguyªn hao tæn",54,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"C«ng kİch khiÕn ngo¹i phßng cña ®èi ph­¬ng gi¶m",382,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"C«ng kİch khiÕn néi lùc cña ®èi ph­¬ng gi¶m ",383,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"TÊn c«ng lµm ®èi ph­¬ng hao tæn néi lùc",49,40,5,2,2,6,0,0,0,0,0,9895,100,5},
--ÔöÇ¿×ÔÉíÀàÊôĞÔ 15Ìõ
	{"H¹ gôc ®èi ph­¬ng sinh lùc håi phôc ",333,80,1,30,25,180,1,2000,1500,1500,1500,1500,1000,1000},
	{"Tû lÖ mµi mßn vò khİ gi¶m",9,80,1,10,5,40,0,2000,1500,1500,1500,1500,1000,1000},
	{"Søc lùc t¨ng",110,80,1,40,30,220,1,2000,1500,1500,1500,1500,1000,1000},
	{"§¸nh tËp trung t¨ng",342,60,1,3,2,15,0,2250,2250,2250,2250,600,300,100},
	{"Chİnh x¸c t¨ng",337,60,1,30,20,150,1,2250,2250,2250,2250,600,300,100},
	{"G©n cèt t¨ng",357,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Søc m¹ng t¨ng",358,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Th©n ph¸p t¨ng",359,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Linh ho¹t t¨ng",360,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Néi c«ng t¨ng ",361,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Sinh lùc tèi ®a t¨ng",79,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"Néi lùc + ",80,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"TÊt c¶ thuéc tİnh t¨ng",367,25,3,4,4,20,1,0,0,9489,400,100,10,1},
	{"Hç trî tÊn c«ng  duy tr× ",41,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},
	{"Hç trî phßng thñ duy tr× ",42,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},	
	};	
	
	if Zgc_pub_goods_add_chk(1,220) ~= 1 then   --¿Õ¼ä¸ºÖØ¼ì²â È¡×îÖØÎäÆ÷
		return
	end
	
	--¸ù¾İÍ¶ÈëµÄĞş»ÆÊ¯´ÎÊı¼ÓÉÏ²»Í¬µÄlv¸ÅÂÊÈ¨Öµ
	if nStone == 1 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 2 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end		
	elseif nStone == 3 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 4 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 5 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 6 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 7 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 8 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 9 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 10 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 11 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 12 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 13 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone >= 14 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --Èç¹û¸Ãlv==0 Ôò²»¼ÓÉÏÈ¨Öµ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[14][j];
				end
			end
		end
	end
		
		
	local n = random(1,100);
	local nProbone = tInitAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10;
	if nProbone >= 100 then
		nProbone = 100;
	end
	if n<=nProbone	then
		local m = random(1,100);
		local nProbtwo = tInitAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10;
		if nProbtwo >= 50 then
			nProtwo = 50;
		end
		if m <= nProbtwo then
			local x = random(1,100);
			local nProbthree = tInitAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10;
			if nProbthree >= 20 then
				nProbthree = 20;
			end
			if x<=nProbthree then 
				local nTotalOne = 0;  --¸÷lvµÄ×ÜºÍ£¬ÓÃÓÚËæ»ú¡£¼ÆËã·½Ê½ÎªÔ­Ê¼±í(tAttri)¼ÓÉÏÏàÓ¦µÄÈ¨Öµ±í
				local nTotalTwo = 0;
				local nTotalThree = 0;
				if nStone > 0 and nStone <15 then 
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i]+tLvProb[nStone][i-8];
						nTotalTwo = nTotalTwo+tAttri[attritwo][i]+tLvProb[nStone][i-8];
						nTotalThree = nTotalThree+tAttri[attrithree][i]+tLvProb[nStone][i-8];
					end
				elseif nStone == 0 then
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i];
						nTotalTwo = nTotalTwo+tAttri[attritwo][i];
						nTotalThree = nTotalThree+tAttri[attrithree][i];
					end					
				end
				local nlv = random(1,nTotalOne);
				local mlv = random(1,nTotalTwo);
				local xlv = random(1,nTotalThree);
				local ilv = 9; --¼ÇÂ¼¸ÅÂÊËæ»úµ½µÄÎ»ÖÃ,³õÊ¼Îª9¶ÔÓ¦ÓÚtInitAttri±íÖĞµÄµÚ9Î»ÖÃ¼´lv1
				local jlv = 9;
				local klv = 9;
				local nLvOne = 0; --ÀÛ¼ÓÖµ£¬ÅĞ¶ÏËæ»úÊıÂäÔÚÄÄÒ»¸öµÈ¼¶Çø¼ä
				local nLvTwo = 0;
				local nLvThree = 0;
				for i=9,15 do
					nLvOne = nLvOne+tInitAttri[attrione][i];
					if nlv <= nLvOne then
						ilv = i;
						break;
					end
				end
				for j=9,15 do
					nLvTwo = nLvTwo+tInitAttri[attritwo][j];
					if mlv <= nLvTwo then
						jlv = j;
						break;
					end
				end
				for k=9,15 do
					nLvThree = nLvThree+tInitAttri[attrithree][k];
					if xlv <= nLvThree then
						klv = k;
						break;
					end
				end
							
				if DelItem(2,1,1152,1)==1 then --³ş¹úÉñ±øÏ»
					if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
					 	local p=random(1,14);
					 	local add_flog = AddItem(tRandomW[p][2],tRandomW[p][3],tRandomW[p][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2],klv-8,tInitAttri[attrithree][2]);
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("Hép ThÇn Binh Së quèc: "..GetName().."NhËn ThÇn binh thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flog);
					 	end					 							
					else
						nroute = GetPlayerRoute();
					  local add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2],klv-8,tInitAttri[attrithree][2]); 
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("Hép ThÇn Binh Së quèc: "..GetName().."NhËn ThÇn binh thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flog);
					 	end	
					end 	
				end				
			else			--µÚÈıÏîÊôĞÔËæ»úÊ§°Ü	
				local nTotalOne = 0;  --¸÷lvµÄ×ÜºÍ£¬ÓÃÓÚËæ»ú
				local nTotalTwo = 0;
				if nStone > 0 and nStone <15 then 
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i]+tLvProb[nStone][i-8];
						nTotalTwo = nTotalTwo+tAttri[attritwo][i]+tLvProb[nStone][i-8];
					end
				elseif nStone == 0 then
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i];
						nTotalTwo = nTotalTwo+tAttri[attritwo][i];
					end					
				end
				local nlv = random(1,nTotalOne);
				local mlv = random(1,nTotalTwo);
				local ilv = 9; --¼ÇÂ¼¸ÅÂÊËæ»úµ½µÄÎ»ÖÃ,³õÊ¼Îª9¶ÔÓ¦ÓÚtInitAttri±íÖĞµÄµÚ9Î»ÖÃ¼´lv1
				local jlv = 9;
				local nLvOne = 0; --ÀÛ¼ÓÖµ£¬ÅĞ¶ÏËæ»úÊıÂäÔÚÄÄÒ»¸öµÈ¼¶Çø¼ä
				local nLvTwo = 0;
				for i=9,15 do
					nLvOne = nLvOne+tInitAttri[attrione][i];
					if nlv <= nLvOne then
						ilv = i;
						break;
					end
				end
				for j=9,15 do
					nLvTwo = nLvTwo+tInitAttri[attritwo][j];
					if mlv <= nLvTwo then
						jlv = j;
						break;
					end
				end
										
				if DelItem(2,1,1152,1)==1 then --³ş¹úÉñ±øÏ»
					if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
					 	local q=random(1,14);
					 	local add_flog = AddItem(tRandomW[q][2],tRandomW[q][3],tRandomW[q][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2]);
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("Hép ThÇn Binh Së quèc: "..GetName().."NhËn ThÇn binh thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flog);
					 	end							
					else
						nroute = GetPlayerRoute();
					  local add_flog = 0;
					  if nroute == 2 and GetTaskTemp(TT_SHAOLIN_WEAPON) == 2 then --¹÷ÉÙ
					  	add_flog = AddItem(tWeapon[12][2],tWeapon[12][3],tWeapon[12][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2]); 
					  else	
					  	add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2]); 
					 	end
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("Hép ThÇn Binh Së quèc: "..GetName().."NhËn ThÇn binh thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flog);
					 	end					  
					end 					
				end						
			end				--µÚÈıÏîÊôĞÔ¸ÅÂÊ
					
		else        --µÚ¶şÏîÊôĞÔËæ»úÊ§°Ü
				local nTotalOne = 0;  --¸÷lvµÄ×ÜºÍ£¬ÓÃÓÚËæ»ú
				if nStone > 0 and nStone <15 then 
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i]+tLvProb[nStone][i-8];
					end
				elseif nStone == 0 then
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i];
					end					
				end
				local nlv = random(1,nTotalOne);
				local ilv = 9; --¼ÇÂ¼¸ÅÂÊËæ»úµ½µÄÎ»ÖÃ,³õÊ¼Îª9¶ÔÓ¦ÓÚtInitAttri±íÖĞµÄµÚ9Î»ÖÃ¼´lv1
				local nLvOne = 0; --ÀÛ¼ÓÖµ£¬ÅĞ¶ÏËæ»úÊıÂäÔÚÄÄÒ»¸öµÈ¼¶Çø¼ä
				for i=9,15 do
					nLvOne = nLvOne+tInitAttri[attrione][i];
					if nlv <= nLvOne then
						ilv = i;
						break;
					end
				end
												
			if DelItem(2,1,1152,1)==1 then --³ş¹úÉñ±øÏ»
				if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
					local s=random(1,14);
					local add_flog = AddItem(tRandomW[s][2],tRandomW[s][3],tRandomW[s][4],1,1,ilv-8,tInitAttri[attrione][2]);
					if add_flog == 1 then
						weapon_finish();
					else
					 	WriteLog("Hép ThÇn Binh Së quèc: "..GetName().."NhËn ThÇn binh thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flog);
					end													
				else
					nroute = GetPlayerRoute();
					local add_flog = 0;
					if nroute == 2 and GetTaskTemp(TT_SHAOLIN_WEAPON) == 2 then --¹÷ÉÙ
					  add_flog = AddItem(tWeapon[12][2],tWeapon[12][3],tWeapon[12][4],1,1,ilv-8,tInitAttri[attrione][2]);
					else	
					  add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,ilv-8,tInitAttri[attrione][2]);
					end					
					if add_flog == 1 then
						weapon_finish();
					else
					 	WriteLog("Hép ThÇn Binh Së quèc: "..GetName().."NhËn ThÇn binh thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flog);
					end						
				end 				
			end				
		end         --µÚ¶şÏîÊôĞÔ¸ÅÂÊ	
	
	else          --µÚÒ»ÏîÊôĞÔËæ»úÊ§°Ü
		if DelItem(2,1,1152,1)==1 then --³ş¹úÉñ±øÏ»
			if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
				local r=random(1,14);
				local add_flog = AddItem(tRandomW[r][2],tRandomW[r][3],tRandomW[r][4],1);
				if add_flog == 1 then
					weapon_finish();
				else
					WriteLog("Hép ThÇn Binh Së quèc: "..GetName().."NhËn ThÇn binh thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flog);
				end					
			else
				nroute = GetPlayerRoute();
				local add_flog = 0;
				if nroute == 2 and GetTaskTemp(TT_SHAOLIN_WEAPON) == 2 then --¹÷ÉÙ
					add_flog = AddItem(tWeapon[12][2],tWeapon[12][3],tWeapon[12][4],1);
				else	
					add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1);
				end					
				if add_flog == 1 then
					weapon_finish();
				else
					WriteLog("Hép ThÇn Binh Së quèc: "..GetName().."NhËn ThÇn binh thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flog);
				end			
			end 						
		end				
	end	          --µÚÒ»ÏîÊôĞÔ¸ÅÂÊ
end        

function weapon_finish()
	Msg2Player("Huynh më ThÇn binh H¹p, nhËn ®­îc 1 ThÇn binh");
	SetTask(TASK_PROB_ONE,0);
	SetTask(TASK_PROB_TWO,0);
	SetTask(TASK_PROB_THREE,0);
	SetTaskTemp(TT_ATTRI_ONE,0);
	SetTaskTemp(TT_ATTRI_TWO,0);
	SetTaskTemp(TT_ATTRI_THREE,0);
end

function nothing()

end                                                                                         