Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\lingshi_head.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")

msg = format("Chóc mõng $n ®· nhËn ®­îc $i tõ L­¬ng S¬n QuÇn Anh Héi", itemName);
--ºÃººÏä×Ó
function giveItem(self)
	ItemCreate:create(self[1])
	local notice = gsub(msg, "\$n", GetName());
	notice = gsub(notice, "\$i", self[1]);
	Msg2Global(notice);
end
tClause1 = {
    {{"Thiªn Cang LÖnh"          ,{2,95,204,1},msg},     80000},
    {{"Thiªn Cang LÖnh"          ,{2,95,204,2},msg},     10000},
    {{"Thiªn Cang LÖnh"          ,{2,95,204,3},msg},     5000},
    {{"Huy Ch­¬ng Du HiÖp"          ,{0,153,26,1},msg},     2000},
    {{"Huy Ch­¬ng ThiÕt HuyÕt"          ,{0,153,27,1},msg},     2000},
    {{"Huy Ch­¬ng V©n Du"          ,{0,153,28,1},msg},     1000},
}
tClause2 = {
--	{{"Ð¡°üµÄÔÉÌú¾«Ê¯"    	,{2,1,3356,1},msg},    10.00*100,7},
--	{{"´ò°üµÄÔÉÌú"         	,{2,1,1050,1}},        5.00*100,7},
--	{{"7¼¶ÁéÊ¯°ü"          	,{2,1,30305,1},msg}, 	10.00*100,7},
--	{{TTGLInfo[4]          	,{TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],1},msg},    1.00*100 },
--	{{TTGLInfo[4]          	,{TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],1},msg},    0.50*100 },
--	{{"´ò°üµÄÔÉÌúËéÆ¬"     	,{2,1,1049,1},msg},   	3.00*100,7},
--	{{"6¼¶ÁéÊ¯°ü"          	,{2,1,30306,1},msg}, 	10.00*100,7},
--	{{"»Æ½ð´óºì°ü£¨¿Õ£©"   	,{2,1,538,1},msg}, 	17.00*100,30},
--	{{"¶¨»êÔÉÌúÉñÊ¯"       	,{2,1,1067,1},msg},    3.00*100,30},
--	{{"´ó¾ü¹¦ÕÂ"       		,{2,1,9998,1}},    	23.00*100,7},
--	{{"»Ô»Í¾ü¹¦ÕÂ"       	,{2,1,9977,1},msg},    10.00*100,7},
--	{{"Áè²¨Î¢²½"       		,{0,112,78,1},msg},    1.00*100 },
--	{{"ºÍÊÏèµ"       		,{2,1,1001,1},msg},    2.50*100,7},
--	
--	{{"3¼¶Ç§»Ã¿Ì°å"       		,{2,1,30408,1}},    	1.00*100 ,30},
--	{{"15¼¶Ç¿»¯¾í"       		,{2,1,30427,1},msg},    	0.50*100 ,30},
--	{{"14¼¶Ç¿»¯¾í"       		,{2,1,30426,1},msg},    	1.00*100 ,30},
--	{{"3¼¶Ä¥µ¶Ê¯"       		,{2,1,30430,1}},    	1.50*100 ,7},
    {{"C©y B¸t Nh· nhá"          ,{2,0,504,1}},     6000, 7},
    {{"C©y B¸t Nh·"          ,{2,0,398,1}},     6000, 7},
    {{"C©y Tø Linh"          ,{2,1,30269,1}},     6000, 7},
    {{"B¹ch C©u Hoµn"          ,{2,1,270,1}},     6000, 7},
    {{"§¹i B¹ch C©u hoµn"          ,{2,1,1007,1}},     8000, 7},
    {{"B¹ch C©u Tiªn ®¬n"          ,{2,1,1008,1}},     6000, 7},
    {{"§¹i Nh©n s©m"          ,{2,0,553,1}},     5000, 7},
    {{"Hu©n ch­¬ng anh hïng"          ,{2,1,30499,1,4}},     15000},
    {{"Hu©n ch­¬ng anh hïng"          ,{2,1,30499,2,4}},     6000},
    {{"Hu©n ch­¬ng anh hïng"          ,{2,1,30499,4,4}},     2000},
    {{"Hu©n ch­¬ng anh hïng"          ,{2,1,30499,10,4}},     500},
    {{"M¶nh Thiªn Cang"          ,{2,1,30390,10}},     12000},
    {{"M¶nh Thiªn Cang"          ,{2,1,30390,20}},     3910},
    {{"M¶nh Thiªn Cang"          ,{2,1,30390,100}},     400},
    {{"Thiªn Cang LÖnh"          ,{2,95,204,1},msg},     100},
    {{"Huy Ch­¬ng §ång ChÕ", {0,153,1,1}}, 4000},
    {{"Huy Ch­¬ng ThiÕt ChÕ", {0,153,2,1}}, 4000},
    {{"Huy Ch­¬ng Ngäc ChÕ", {0,153,3,1}}, 3060},
    {{"Huy Ch­¬ng Kim ChÕ ngò hµnh", {0,153,4,1}}, 1000},
    {{"Huy Ch­¬ng Méc ChÕ ngò hµnh", {0,153,5,1}}, 1000},
    {{"Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0,153,6,1}}, 1000},
    {{"Huy Ch­¬ng Háa ChÕ ngò hµnh", {0,153,7,1}}, 1000},
    {{"Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0,153,8,1}}, 1000},
    {{"Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0,153,9,1}}, 1000},
    {{"Huy Ch­¬ng Du HiÖp"          ,{0,153,26,1},msg},     10},
    {{"Huy Ch­¬ng ThiÕt HuyÕt"          ,{0,153,27,1},msg},     10},
    {{"Huy Ch­¬ng V©n Du"          ,{0,153,28,1},msg},     10},
}
tClause3 = {
--	{{"ÅÍÁúèµ"           	,{2,1,1000,1}},        15.00*100 ,7},
--	{{"¾ü¹¦ÕÂ"       		,{2,1,9999,1},msg},    6.00*100 ,7},
--	{{"´óÈË²Î¹û"           	,{2,0,553,1}},        	5.00*100 ,7},
--	{{"¸ß¼¶Ê¦ÃÅÃØ¼®°ü"      ,{2,1,30627,1}},        5.00*100 ,7},
----	{{"½ð¸Õ°ãÈô¾­"          ,{0,107,166,1}},      	0.29*100 },
----	{{"Ç±Áú¼ÅÃð¾­"          ,{0,107,167,1}},      	0.29*100 },
----	{{"ÎÞ³¾ÆÐÌá¾­"          ,{0,107,168,1}},      	0.29*100 },
----	{{"ÌìÂÞÁ¬ÖéÂ¼"          ,{0,107,169,1}},      	0.29*100 },
----	{{"ÈçÒâ½ð¶¥ÃØ¼®"        ,{0,107,170,1}},      	0.29*100 },
----	{{"±Ìº£¾øÒôÆ×"          ,{0,107,171,1}},      	0.29*100 },
----	{{"»ìãçÕòÔÀÃØ¼®"        ,{0,107,172,1}},      	0.29*100 },
----	{{"ÞñÌìÓÎÁúÃØ¼®"        ,{0,107,173,1}},      	0.29*100 },
----	{{"»ÃÓ°ÃÔ×ÙÃØ¼®"        ,{0,107,174,1}},      	0.29*100 },
----	{{"¾ý×Ó½Ø·çÃØ¼®"        ,{0,107,175,1}},      	0.29*100 },
----	{{"Õò¾ü·ÉÁúÇ¹Æ×"        ,{0,107,176,1}},      	0.29*100 },
----	{{"´©ÔÆÂäºçÃØ¼®"        ,{0,107,177,1}},      	0.29*100 },
----	{{"ÓÄÚ¤·âÄ§Â¼"          ,{0,107,178,1}},      	0.29*100 },
----	{{"Áé¹Æ»ÃÐ°Â¼"          ,{0,107,179,1}},      	0.29*100 },
----	{{"¾ÅÌì·çÀ×¾÷"        ,{0,107,198,1}},      	0.29*100 },
----	{{"ºì³¾×íÃÎÆ×"          ,{0,107,202,1}},      	0.29*100 },
----	{{"·ç»¨Ç§Ò¶Æ×"          ,{0,107,203,1}},      	0.29*100 },
--	{{"´ò°üµÄÔÉÌúËéÆ¬"     	,{2,1,1049,1},msg},   	5.00*100 ,7},
--	{{"¶·»ê"     			,{2,1,1157,1},msg},   	5.00*100 ,30},
--	{{"´ó¾ü¹¦ÕÂ"       		,{2,1,9998,1}},      	5.00*100 ,7},
--	--{{"ÎåÐÐÐþÊ¯"       		,{2,1,30302,100},msg},	3.00*100 },
--	{{"·­Óð"               	,{0,105,15,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"³¬¹â"               	,{0,105,19,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"±¼Ïü"               	,{0,105,16,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"ÌÚÎí"               	,{0,105,20,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	{{"½«¾ü°×Âí"           	,{0,105,34,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    5.00*100,45},
--	--{{"ÎÞºÛË®"       		,{2,1,503,1},msg},	3.00*100 ,30},
--	--{{"Ï´Ëèµ¤"       		,{2,0,136,1}},	2.00*100 ,30},
--	--{{"Ï´ËèÁéµ¤"       		,{2,0,137,1},msg},	1.00*100 ,30},
--	{{"ÖÖ×Ó°ü"       		,{2,1,30087,1}},	4.00*100 ,7},
--	{{"´ó°ãÈôÖÖ×Ó"       	,{2,0,398,1}},	5.00*100 ,7},
--	{{"Ð¡°ãÈôÖÖ×Ó"       	,{2,0,504,1}},	7.00*100 ,7},
--	
--	{{"2¼¶Ç§»Ã¿Ì°å"       		,{2,1,30407,1}},    	1.00*100 ,30},
--	{{"14¼¶Ç¿»¯¾í"       		,{2,1,30426,1},msg},    0.25*100 ,30},
--	{{"13¼¶Ç¿»¯¾í"       		,{2,1,30425,1}},    	0.50*100 ,30},
--	{{"2¼¶Ä¥µ¶Ê¯"       		,{2,1,30429,1}},    	1.00*100 ,7},
--	{{"¿Ì°å"       				,{2,1,30373,1}},    	1.25*100},
--	
--	{{"3¼¶Ìú¾§"       		,{2,1,30535,1},msg},      	3.00*100},
--	{{"ÃØÒø´¸"       		,{2,1,30539,1}},      	3.00*100},
--	{{"ÃØÒø×ê"       		,{2,1,30538,1}},      	2.00*100},
--	{{"±ù¾§Ê¯"       		,{2,1,30554,1}},      	1.00*100},
    {{"Tø Linh Quy Nguyªn §¬n"          ,{2,1,30352,1,4}},     5000},
    {{"Båi Nguyªn §¬n"          ,{2,1,30351,1,4}},     5000},
    {{"TruyÒn C«ng §¬n"          ,{2,1,30313,1,4}},     5000},
    {{"M¶nh Tu Ch©n YÕu QuyÕt"          ,{2,1,30315,1,4}},     5000},
    {{"ThiÕt Tinh cÊp 1"          ,{2,1,30533,1,4}},     10000},
    {{"ThiÕt Tinh cÊp 2"          ,{2,1,30534,1,4}},     10000},
    {{"ThiÕt Tinh cÊp 3"          ,{2,1,30535,1,4}},     10000},
    {{"Huy Ch­¬ng §ång ChÕ"          ,{0,153,1,1}},     15000},
    {{"Huy Ch­¬ng ThiÕt ChÕ"          ,{0,153,2,1}},     20000},
    {{"Huy Ch­¬ng Ngäc ChÕ"          ,{0,153,3,1}},     15000},
}
tClause4 = {
--	{{"Ð¡°×¾ÔÍè"          	,{2,1,30307,1}},       5.00*100 ,7},
--	{{"Ð¡ÈýÇåÍè"          	,{2,1,30308,1}},       5.00*100 ,7},
--	{{"Ð¡ÁùÉñÍè"          	,{2,1,30309,1}},       5.00*100 ,7},
--	{{"´«¹¦µ¤"         	 	,{2,1,30313,1}},       5.00*100 ,7},
--	{{"¸ß¼¶Ê¦ÃÅÃØ¼®°ü"      ,{2,1,30627,1}},        2.80*100 ,7},
----	{{"½ð¸Õ°ãÈô¾­"          ,{0,107,166,1}},      	0.16*100 },
----	{{"Ç±Áú¼ÅÃð¾­"          ,{0,107,167,1}},      	0.16*100 },
----	{{"ÎÞ³¾ÆÐÌá¾­"          ,{0,107,168,1}},      	0.16*100 },
----	{{"ÌìÂÞÁ¬ÖéÂ¼"          ,{0,107,169,1}},      	0.16*100 },
----	{{"ÈçÒâ½ð¶¥ÃØ¼®"        ,{0,107,170,1}},      	0.16*100 },
----	{{"±Ìº£¾øÒôÆ×"          ,{0,107,171,1}},      	0.16*100 },
----	{{"»ìãçÕòÔÀÃØ¼®"        ,{0,107,172,1}},      	0.16*100 },
----	{{"ÞñÌìÓÎÁúÃØ¼®"        ,{0,107,173,1}},      	0.16*100 },
----	{{"»ÃÓ°ÃÔ×ÙÃØ¼®"        ,{0,107,174,1}},      	0.16*100 },
----	{{"¾ý×Ó½Ø·çÃØ¼®"        ,{0,107,175,1}},      	0.16*100 },
----	{{"Õò¾ü·ÉÁúÇ¹Æ×"        ,{0,107,176,1}},      	0.16*100 },
----	{{"´©ÔÆÂäºçÃØ¼®"        ,{0,107,177,1}},      	0.16*100 },
----	{{"ÓÄÚ¤·âÄ§Â¼"          ,{0,107,178,1}},      	0.16*100 },
----	{{"Áé¹Æ»ÃÐ°Â¼"          ,{0,107,179,1}},      	0.16*100 },
----	{{"¾ÅÌì·çÀ×¾÷"        ,{0,107,198,1}},      	0.16*100 },
----	{{"ºì³¾×íÃÎÆ×"          ,{0,107,202,1}},      	0.16*100 },
----	{{"·ç»¨Ç§Ò¶Æ×"          ,{0,107,203,1}},      	0.16*100 },
--	--{{"ÎåÐÐÐþÊ¯"         	,{2,1,30302,2}},  	 	10.00*100 },
--	--{{"ÎåÐÐ±¦Ïä"         	,{2,1,30320,1}},   	3.00*100 },
--	{{"Ïû½ÙÉ¢"         		,{2,0,141,1}},   		3.00*100 ,30},
--	{{"°Ë±¦ôÕ×Ó"         	,{2,1,1125,1}},   		5.00*100 },
--	{{"ÁºÉ½ÌØ²ú"         	,{2,1,30310,1}},   	14.20*100 },
--	{{"ÅàÔªµ¤"         		,{2,1,30351,1}},		10.00*100},
--	
--	{{"1¼¶Ç§»Ã¿Ì°å"       	,{2,1,30406,1}},    	0.50*100 ,30},
--	{{"1¼¶Ä¥µ¶Ê¯"       	,{2,1,30428,1}},    	0.50*100 ,7},
--	
--	{{"ÓÂÊ¿Ñ«ÕÂ"       	,{2,1,30498,1}},    	10*100},
--	{{"1¼¶Ìú¾§"       	,{2,1,30533,1}},    	10*100},
--	{{"2¼¶Ìú¾§"       	,{2,1,30534,1}},    	5*100},
--	{{"Ç§Àï´«Òô·ûÖ½"       	,{2,1,3508,1}},    	10*100},
--	{{"Ï´³¾µ¤"       	,{2,1,30613,1}},    	4*100},
--	{{"ËÄÁé¹éÔªµ¤"       	,{2,1,30352,1}},    5.00*100},
    {{"Tø Linh Quy Nguyªn §¬n"          ,{2,1,30352,1,4}},     5000},
    {{"Båi Nguyªn §¬n"          ,{2,1,30351,1,4}},     10000},
    {{"TruyÒn C«ng §¬n"          ,{2,1,30313,1,4}},     10000},
    {{"M¶nh Tu Ch©n YÕu QuyÕt"          ,{2,1,30315,1,4}},     5000},
    {{"ThiÕt Tinh cÊp 1"          ,{2,1,30533,1,4}},     20000},
    {{"ThiÕt Tinh cÊp 2"          ,{2,1,30534,1,4}},     10000},
    {{"ThiÕt Tinh cÊp 3"          ,{2,1,30535,1,4}},     10000},
    {{"Huy Ch­¬ng §ång ChÕ"          ,{0,153,1,1}},     15000},
    {{"Huy Ch­¬ng ThiÕt ChÕ"          ,{0,153,2,1}},     15000},
}
tClause5 = {
--	{{"ÎäÁÖÔç±¨"         	,{2,1,30314,1}},       20.00*100,7},
--	{{"Ê¦ÃÅÊ¥Îï"         	,{2,1,30311,1}},      	20.00*100,7},
--	{{"Ð¡´«¹¦µ¤"          	,{2,1,30312,1}},      	18.00*100,7},
--	{{"ÐÞÕæÒª¾÷²ÐÒ³"        ,{2,1,30315,1}},      	10.00*100,7},
----	{{"½ð¸Õ·üÄ§¾­"			,{0,107,1,1}},			0.14*100},
----	{{"½ð¸Õ·üÄ§ÐÄ·¨"		,{0,107,2,1}},			0.14*100},
----	{{"Ç±ÁúÃØ¼®"			,{0,107,3,1}},			0.14*100},
----	{{"Ç±ÁúÐÄ·¨"			,{0,107,4,1}},			0.14*100},
----	{{"ÎÞ³¾ÃØ¼®"			,{0,107,5,1}},			0.14*100},
----	{{"ÎÞ³¾ÐÄ·¨"			,{0,107,6,1}},			0.14*100},
----	{{"ÌìÂÞÃØ¼®"			,{0,107,7,1}},			0.14*100},
----	{{"ÌìÂÞÐÄ·¨"			,{0,107,8,1}},			0.14*100},
----	{{"ÈçÒâÃØ¼®"			,{0,107,9,1}},			0.14*100},
----	{{"ÈçÒâÐÄ·¨"			,{0,107,10,1}},			0.14*100},
----	{{"±Ìº£Æ×"				,{0,107,11,1}},			0.14*100},
----	{{"±Ìº£ÐÄ·¨"			,{0,107,12,1}},			0.14*100},
----	{{"»ìãçÃØ¼®"			,{0,107,13,1}},			0.14*100},
----	{{"»ìãçÐÄ·¨"			,{0,107,14,1}},			0.14*100},
----	{{"ÞñÌìÃØ¼®"			,{0,107,15,1}},			0.14*100},
----	{{"ÞñÌìÐÄ·¨"			,{0,107,16,1}},			0.14*100},
----	{{"»ÃÓ°ÃØ¼®"			,{0,107,17,1}},			0.14*100},
----	{{"»ÃÓ°ÐÄ·¨"			,{0,107,18,1}},			0.14*100},
----	{{"¾ý×ÓÃØ¼®"			,{0,107,19,1}},			0.14*100},
----	{{"¾ý×ÓÐÄ·¨"			,{0,107,20,1}},			0.14*100},
----	{{"Õò¾üÃØ¼®"			,{0,107,21,1}},			0.14*100},
----	{{"Õò¾üÐÄ·¨"			,{0,107,22,1}},			0.14*100},
----	{{"´©ÔÆÃØ¼®"			,{0,107,23,1}},			0.14*100},
----	{{"´©ÔÆÐÄ·¨"			,{0,107,24,1}},			0.14*100},
----	{{"ÓÄÚ¤¹íÂ¼"			,{0,107,25,1}},			0.14*100},
----	{{"ÓÄÚ¤ÐÄ·¨"			,{0,107,26,1}},			0.14*100},
----	{{"Áé¹ÆÃØ¼®"			,{0,107,27,1}},			0.14*100},
----	{{"Áé¹ÆÐÄ·¨"			,{0,107,28,1}},			0.14*100},
----	{{"¾ª·çÃØ¼®"			,{0,107,180,1}},			0.14*100},
----	{{"¾ª·çÐÄ·¨"			,{0,107,181,1}},			0.14*100},
----	{{"×íÃÎÃØ¼®"			,{0,107,188,1}},			0.14*100},
----	{{"×íÃÎÐÄ·¨"			,{0,107,189,1}},			0.14*100},
----	{{"·±»¨ÃØ¼®"			,{0,107,190,1}},			0.14*100},
----	{{"·±»¨ÐÄ·¨"			,{0,107,191,1}},			0.14*100},
----	{{"ÎåÐÐÐþÊ¯"         	,{2,1,30302,1}},          9.00*100},
----	{{"ÎåÐÐ±¦Ïä"         	,{2,1,30320,1}},   	1.00*100},
--	
--	{{"ÓÂÊ¿Ñ«ÕÂ"       	,{2,1,30498,1}},    	4.80*100},
--	{{"1¼¶Ìú¾§"       	,{2,1,30533,1}},    	9*100},
--	{{"2¼¶Ìú¾§"       	,{2,1,30534,1}},    	0.70*100},
--	{{"Ï´³¾µ¤"       	,{2,1,30613,1}},    	5*100},
--	{{"Ç§Àï´«Òô·ûÖ½"       	,{2,1,3508,1}},    	8*100},
--	{{"ËÄÁé¹éÔªµ¤"       	,{2,1,30352,1}},    2.00*100},
--	{{"ÅàÔªµ¤"         		,{2,1,30351,1}},		2.50*100},

    {{"TiÓu truyÒn c«ng ®¬n"          ,{2,1,30312,1,4}},     10000},
    {{"M¶nh Tu Ch©n YÕu QuyÕt"          ,{2,1,30315,1,4}},     10000},
    {{"ThiÕt Tinh cÊp 1"          ,{2,1,30533,1,4}},     40000},
    {{"ThiÕt Tinh cÊp 2"          ,{2,1,30534,1,4}},     30000},
    {{"Huy Ch­¬ng §ång ChÕ"          ,{0,153,1,1}},     10000},
}
function getLootSeting(bossLv)
	local t = {tClause1,tClause2,tClause3,tClause4,tClause5}
	tClause = t[bossLv];
	if not tClause then
		print(format("[getLootSeting] [error bossLv] [bossLv=%s]", tostring(bossLv)));
		assert()
	end
	return tClause;
end

function getLootItem(bossLv)
	local tClause = getLootSeting(bossLv);

	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i, tClause[i][1];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function main()
	speLoot();
end

function speLoot()
	local nNpcIdx = GetTargetNpc();
    local bossId = GetMissionV(MV_CUR_BOSS_ID);
	local bossLv = tMission:getBossLv(bossId);
	local daye = GetMissionV(MV_DAYE);
	if daye == -1 or daye == 0 then
		return
	end
	local tSel = {
			"KÕt thóc ®èi tho¹i/nothing",
		}
	local OldPlayerIndex = PlayerIndex;
	if daye == PlayerIndex then
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= OldPlayerIndex then
				player_name = GetName();
				player_name = zgc_pub_name_replace(player_name,"/","-");
				player_name = zgc_pub_name_replace(player_name,"|","-");
				player_name = zgc_pub_name_replace(player_name,":","-");
				tinsert(tSel, 1, "Ta cÇn mang phÇn th­ëng ph©n cho "..player_name.."/#lootAwardOther("..PlayerIndex..","..nNpcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "Ta muèn nhËn phÇn th­ëng/#lootAward("..PlayerIndex..","..nNpcIdx..")");
	end


	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem(bossLv);
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end

	local tClause = getLootSeting(bossLv);
	if not tClause or not tClause[nLootItemId] or not tClause[nLootItemId][1] then
		WriteLog(format("[ERROR] [liangshan:lootError] [Role:%s Acc:%s][bossLv=%s, nLootItemId=%s]",
			GetName(), GetAccount(), tostring(bossLv), tostring(nLootItemId)));
		nLootItemId = getLootItem(bossLv);
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end
	local tLootItem = tClause[nLootItemId][1];
	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B¶o r­¬ng<color>: ë ®©y cã"..msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)

	if 1 ~= tMission:CheckTargetNpc(box_index) then return end

	local player_index_save = PlayerIndex
	--ÅÐ¶Ï¸ÃË÷ÒýÊÇ·ñ»¹ÊÇÔÚ¸Ã¶ÓÎéÖÐ
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = zgc_pub_same_team_chk(player_index)
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>Chó ý<color>: Xin mêi h·y kiÓm tra l¹i nh÷ng ng­êi mµ b¹n ph©n chia cã ph¶i cã cïng <color=yellow>tæ ®éi<color> víi b¹n!")
		return
	end
	--·ÖÅä¶ÔÏóµÄ¿Õ¼ä¸ºÖØ¼ì²â
	PlayerIndex = player_index
	local s_palyer_name = GetName()
	if GetFreeItemRoom()  < 3 then
		Talk(1,"","<color=green>Th«ng b¸o<color>: <color=yellow>Hµnh trang<color> c¸c h¹ kh«ng ®ñ!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>Th«ng b¸o<color>: : <color=green>"..s_palyer_name.."<color><color=yellow>Hµnh trang<color> ®· ®Çy, kh«ng thÓ ph©n phèi!")
		return
	end

	PlayerIndex = player_index_save

	lootAward(player_index, box_index)

end

function lootAward(player_index, box_index)

	if 1 ~= tMission:CheckTargetNpc(box_index) then return end

	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(3, 100, "") ~= 1 then return end
	PlayerIndex = player_index_save;

	local bossId = GetMissionV(MV_CUR_BOSS_ID);
	local bossLv = tMission:getBossLv(bossId);

	local daye = GetMissionV(MV_DAYE);
	if daye == -1 then
		daye = GetTeamMember(0);
	end
	if daye ~= PlayerIndex then
		return
	end

	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem(bossLv);
	end
	local tLoot = getLootSeting(bossLv)[nLootItemId];
	SetMissionV(MV_LOOT_ID, 0);
	SetMissionV(MV_DAYE, 0);
	SetMissionV(MV_LAO_ER, 0);

	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption("liangshan:ib_box");
	local nItemIndex = Clause3.giveClause(tLoot[1]);
	if tLoot[3] then
		SetItemExpireTime(nItemIndex,tLoot[3]*DAY_SECOND_NUM)
	end
	gf_SetLogCaption("");
	PlayerIndex = player_index_save;
	
		--Ììî¸Áî
	if tLoot[1][1] == TTGLInfo[4] then
		_stat_when_ib_produce(tLoot[1][2][4])--IBµÀ¾ß²ú³öÍ³¼Æ
	end
end
