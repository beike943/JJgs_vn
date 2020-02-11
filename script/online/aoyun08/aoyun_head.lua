--Ê¥»ð´«µÝ»î¶¯Í·ÎÄ¼þ
--by vivi
--2008/05/28

--ÈÎÎñ±äÁ¿
--TASK_AOYUN_HUOJUSHOU = 905;  --»ð¾æÊÖ×Ê¸ñ£¬´æÈë¸ÃÇø´«µÝ»î¶¯Ê±¼ä
TASK_AOYUN_HUOJU_DATE = 906; --ÊÇ·ñÁìÈ¡¹ýÈÕ³£»î¶¯Ê±½±Àø£¬´æÈë×îºóÊ¥»ðÌ¨·þÎñÆ÷ÈÕÆÚ
TASK_AOYUN_TEMP_NUM = 907;  --ÈÕ³£»î¶¯ÖÐ£¬¼ÇÂ¼µ±Ç°µãÁÁÄÄ¸öÊ¥»ðÌ¨
TASK_AOYUN_HUOJU_NUM = 908; --»ð¾æÊÖµÄÈÎÎñ±àºÅ£¬¼´ÐèÒªµãÁÁÄÄ¸öÊ¥»ðÌ¨
TASK_AOYUN_ZHUWEI_NUM = 909; --ÖúÍþÕßµÄÈÎÎñ±àºÅ¡£1-31¡£31±íÊ¾Ê¢ÊÀ»ð¾æÌ¨ÅÔ
TASK_AOYUN_GET_SHENGHUO = 910; --»ð¾æÊÖÊÇ·ñÒÑÈ¡µÃÊ¥»ð£¬´æÈëÊ±¼äGetTime
TASK_AOYUN_DIAN_SHENGHUO = 911; --ÊÇ·ñµãÁÁÊ¥»ð
TASK_AOYUN_ZHUWEI_LABA = 912;  --ÊÇ·ñÁìÈ¡ÖúÍþÀ®°È
TASK_AOYUN_USE_LABA = 913;    --ÊÇ·ñÊ¹ÓÃ¹ýÖúÍþÀ®°È£¬·ÀË¢
TASK_AOYUN_HUOJU_IDX = 914;   --¼ÇÂ¼¶ÔÓ¦»ð¾æÌ¨µÄË÷Òý£¬ÓÃÓÚÓëÍæ¼Ò¾àÀëÅÐ¶Ï¡£ 
TASK_AOYUN_FINAL_AWARD = 915; --ÊÇ·ñÁìÈ¡ÁË×îÖÕ½±Àø


--·þÎñÆ÷±äÁ¿ ×¢Òâ£¬¸ü¸Ä·þÎñÆ÷±äÁ¿¼ÇµÃÈ¥¸ÄgmscriptºÍautoexecÏÂµÄÏàÓ¦±äÁ¿
GLB_AOYUN_TIME_STATE = 200; --´«µÝ»î¶¯¿ªÊ¼×´Ì¬
GLB_AOYUN_HUOJUTAI_NUM = 201; --¼ÇÂ¼Ë³ÐòµãÁÁµ½µÚ¼¸Ì¨»ð¾æÌ¨ÁË
GLB_AOYUN_NPC_YI = 202;     --¼ÇÂ¼Ê¥»ðÌ¨Ë÷Òý£¬ÒÔÏÂÀàÍÆ
GLB_AOYUN_NPC_ER = 203;
GLB_AOYUN_NPC_SAN = 204;
GLB_AOYUN_NPC_SI = 205;
GLB_AOYUN_NPC_WU = 206;
GLB_AOYUN_NPC_LIU = 207;
GLB_AOYUN_NPC_QI = 208;
GLB_AOYUN_NPC_BA = 209;
GLB_AOYUN_NPC_JIU = 210;
GLB_AOYUN_NPC_SHI = 211;
GLB_AOYUN_NPC_SHIYI = 212;
GLB_AOYUN_NPC_SHIER = 213;
GLB_AOYUN_NPC_SHISAN = 214;
GLB_AOYUN_NPC_SHISI = 215;
GLB_AOYUN_NPC_SHIWU = 216;
GLB_AOYUN_NPC_SHILIU = 217;
GLB_AOYUN_NPC_SHIQI = 218;
GLB_AOYUN_NPC_SHIBA = 219;
GLB_AOYUN_NPC_SHIJIU = 220;
GLB_AOYUN_NPC_ERSHI = 221;
GLB_AOYUN_NPC_ERYI = 222;
GLB_AOYUN_NPC_ERER = 223;
GLB_AOYUN_NPC_ERSAN = 224;
GLB_AOYUN_NPC_ERSI = 225;
GLB_AOYUN_NPC_ERWU = 226;
GLB_AOYUN_NPC_ERLIU = 227;
GLB_AOYUN_NPC_ERQI = 228;
GLB_AOYUN_NPC_ERBA = 229;
GLB_AOYUN_NPC_ERJIU = 230;
GLB_AOYUN_NPC_SANSHI = 231;
GLB_AOYUN_NPC_SANYI = 232;

--È«¾Ö±äÁ¿
TRIGER_AOYUN_TIME_ID = 300; --Ê±¼ä´¥·¢Æ÷ID
TIME_TABLE_ID = 50; --±íÀïID

tHuojuName = {
	[1] = {"Th¸nh Háa §µi","§µi ®uèc 1"},
	[2] = {"§µi ®uèc 1","§µi ®uèc 2"},
	[3] = {"§µi ®uèc 2","§µi ®uèc 3"},
	[4] = {"§µi ®uèc 3","§µi ®uèc 4"},
	[5] = {"§µi ®uèc 4","§µi ®uèc 5"},
	[6] = {"§µi ®uèc 5","§µi ®uèc 6"},
	[7] = {"§µi ®uèc 6","§µi ®uèc 7"},
	[8] = {"§µi ®uèc 7","§µi ®uèc 8"},
	[9] = {"§µi ®uèc 8","§µi ®uèc 9"},
	[10] = {"§µi ®uèc 9","§µi ®uèc 10"},
	[11] = {"§µi ®uèc 10","§µi ®uèc 11"},
	[12] = {"§µi ®uèc 11","§µi ®uèc 12"},
	[13] = {"§µi ®uèc 12","§µi ®uèc 13"},
	[14] = {"§µi ®uèc 13","§µi ®uèc 14"},
	[15] = {"§µi ®uèc 14","§µi ®uèc 15"},
	[16] = {"§µi ®uèc 15","§µi ®uèc 16"},
	[17] = {"§µi ®uèc 16","§µi ®uèc 1-7"},
	[18] = {"§µi ®uèc 1-7","§µi ®uèc 18"},
	[19] = {"§µi ®uèc 18","§µi ®uèc 19"},
	[20] = {"§µi ®uèc 19","§µi ®uèc 20"},
	[21] = {"§µi ®uèc 20","§µi ®uèc 21"},
	[22] = {"§µi ®uèc 21","§µi ®uèc 22"},
	[23] = {"§µi ®uèc 22","§µi ®uèc 23"},
	[24] = {"§µi ®uèc 23","§µi ®uèc 24"},
	[25] = {"§µi ®uèc 24","§µi ®uèc 25"},
	[26] = {"§µi ®uèc 25","§µi ®uèc 26"},
	[27] = {"§µi ®uèc 26","§µi ®uèc 27"},
	[28] = {"§µi ®uèc 27","§µi ®uèc 28"},
	[29] = {"§µi ®uèc 28","§µi ®uèc 29"},
	[30] = {"§µi ®uèc 29","Lß n­íng b¸nh"},
	[31] = {"Lß n­íng b¸nh"}  --ÖúÍþÕß
	}
	
--»ð¾æÌ¨pos	
tHuoJuPos = {
		{"Th¸nh Háa §µi","Th¸nh Háa §µi",500,1829,3065},{"§µi ®uèc","§µi ®uèc 1",500,1678,3214},{"§µi ®uèc","§µi ®uèc 2",500,1662,3099},{"§µi ®uèc","§µi ®uèc 3",500,1778,3203},
		{"§µi ®uèc","§µi ®uèc 4",350,1538,2870},{"§µi ®uèc","§µi ®uèc 5",350,1417,2790},{"§µi ®uèc","§µi ®uèc 6",350,1346,2878},{"§µi ®uèc","§µi ®uèc 7",350,1366,3052},{"§µi ®uèc","§µi ®uèc 8",350,1514,3051},
		{"§µi ®uèc","§µi ®uèc 9",300,1676,3676},{"§µi ®uèc","§µi ®uèc 10",300,1705,3487},{"§µi ®uèc","§µi ®uèc 11",300,1861,3490},{"§µi ®uèc","§µi ®uèc 12",300,1764,3553},{"§µi ®uèc","§µi ®uèc 13",300,1866,3632},
		{"§µi ®uèc","§µi ®uèc 14",400,1534,2920},{"§µi ®uèc","§µi ®uèc 15",400,1431,2963},{"§µi ®uèc","§µi ®uèc 16",400,1451,3094},{"§µi ®uèc","§µi ®uèc 1-7",400,1560,3112},
		{"§µi ®uèc","§µi ®uèc 18",100,1352,2894},{"§µi ®uèc","§µi ®uèc 19",100,1353,3051},{"§µi ®uèc","§µi ®uèc 20",100,1513,3053},{"§µi ®uèc","§µi ®uèc 21",100,1507,2899},
		{"§µi ®uèc","§µi ®uèc 22",150,1625,3060},{"§µi ®uèc","§µi ®uèc 23",150,1626,3185},{"§µi ®uèc","§µi ®uèc 24",150,1747,3182},{"§µi ®uèc","§µi ®uèc 25",150,1736,3076},
		{"§µi ®uèc","§µi ®uèc 26",200,1270,2974},{"§µi ®uèc","§µi ®uèc 27",200,1468,2946},{"§µi ®uèc","§µi ®uèc 28",200,1465,2783},{"§µi ®uèc","§µi ®uèc 29",200,1302,2755},{"Lß n­íng b¸nh","Lß n­íng b¸nh",200,1364,2875}}
		
			
--»î¶¯Ê±¼ä Ö¸ÈÕ³£»î¶¯ ´«µÝ»î¶¯Ê±¼äÓÉreyal¿ØÖÆ
function get_aoyun_state()
	--»î¶¯×´Ì¬ÅÐ¶Ï
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080630 then
		return 0;
	elseif nDate >= 20080630 and nDate <= 20080806 then
		return 1;
	else 
		return 2;
	end 	
	
end

--º¯ÊýÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êý
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end

--±¦Ê¯°ü¹ü¸ÅÂÊ
function aoyun_baoshi_prob()
	local nRand = random(1,1000);
	if nRand <= 249 then
		lspf_AddLingShiInBottle(1,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch CÊp 1, nã trong Tô linh ®Ønh.");
	elseif nRand <= 479 then
		lspf_AddLingShiInBottle(2,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 2, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 709 then
		lspf_AddLingShiInBottle(3,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc1 Linh Th¹ch cÊp 3, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 939 then
		lspf_AddLingShiInBottle(4,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 4, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 989 then
		lspf_AddLingShiInBottle(5,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 5, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 999 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 6, ®· nhËp vµo Tô linh ®Ønh.");
		Msg2Global("Ng­êi ch¬i"..GetName().."Tham gia ho¹t ®éng R­íc ®uèc nhËn ®­îc 1 Linh th¹ch cÊp 6");
		WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..GetName().."Tham gia ho¹t ®éng R­íc ®uèc nhËn ®­îc 1 Linh th¹ch cÊp 6.");		
	else
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 7, ®· nhËp vµo Tô linh ®Ønh.");		
		Msg2Global("Ng­êi ch¬i"..GetName().."Tham gia ho¹t ®éng R­íc ®uèc nhËn ®­îc 1 Linh th¹ch cÊp 7");
		WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..GetName().."Tham gia ho¹t ®éng R­íc ®uèc nhËn ®­îc 1 Linh th¹ch cÊp 7.");
	end
end

--´«ËÍÖÁ»ð¾æÌ¨
function goto_huojutai()
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"","B¶n ®å hiÖn t¹i kh«ng thÓ dïng chøc n¨ng di chuyÓn nµy!");
		return
	end
	if GetFightState() == 1 then
		Talk(1,"","Xin dïng chøc n¨ng di chuyÓn nµy ë khu vùc hßa b×nh (thµnh trÊn)!");
		return
	end
	local nTask = 1;
	if GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then
		nTask = GetTask(TASK_AOYUN_HUOJU_NUM);
	elseif GetTask(TASK_AOYUN_ZHUWEI_NUM) ~= 0 then
		nTask = GetTask(TASK_AOYUN_ZHUWEI_NUM);
	end
	if PrePay(5000)==0 then 
		Talk(1,"","Cã tiÒn th× h·y ngåi xe!")
	else 
		CleanInteractive();	
		NewWorld(tHuoJuPos[nTask][3],tHuoJuPos[nTask][4],tHuoJuPos[nTask][5]);
		SetFightState(0);
	end		
end

function nothing()

end