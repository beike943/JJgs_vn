--×Ô¶¯¼ÓÔØNPC½Å±¾£¬·þÎñÆ÷Æô¶¯Ê±µ÷ÓÃ
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\online\\qingming\\qingming_head.lua");
function main()
	addnpc_yanmenbattle_signup();
	
	AddNpcCd();     --³É¶¼ÈÎÎñADDµÄNPC
	AddNpcXy();    --ÏåÑôÈÎÎñADDµÄNPC
	AddNpcYz();     --ÑïÖÝÈÎÎñADDµÄNPC
	AddNpcWeekEnd();     --ÖÜÄ©»î¶¯ADDµÄNPC
	AddNpcXl();     --±Õ¹ØÐÞÁ¶ADDµÄNPC
	Addxinan();     --Î÷ÄÏµØÍ¼NPC
	-------------------
	AddNpcQz();     --ÈªÖÝÐÂ¼ÓNPC
	AddXsTg();      --ÐÂÊÖÍÆ¹ãÔ±
	AddTl();        --ÌìÀÎµØÍ¼Ìí¼ÓµÄNPC
	Addsh();        --ÉÌ»áÌí¼ÓµÄNPC
	Addtj();        --Í¨¼©ÈÎÎñÌí¼ÓµÄNPC
	Addtaohuadao();        --½ø³öÌÒ»¨µºÌí¼ÓµÄNPC
	Addcangjian();        --²Ø½£Ê¹Õß
	Addyangmen();        --Ìì²¨Ñî¸®Ìí¼ÓµÄNPC
	AddChristmas()		--Ê¥µ®½Ú»î¶¯NPC£¨±£Áô¸øÒÔºóÍâ¹ú½ÚÈÕÓÃ£©
	AddCheFu();		 --²É¼¯µØÍ¼³µ·ò
	AddDragonBoatDay()	--¶ËÎç½Ú
	
	AddTxNpc()			--Ì«Ðé»Ã¾³NPCÌí¼Ó
	ZoneInit(1010)		--Ì«Ðé»Ã¾³³õÊ¼»¯µØÍ¼Trap
	ZoneInit(2010)
	ZoneInit(3010)
	ZoneInit(4010)
	ZoneInit(5010)

	Addfengdutrap()    --·á¶¼to¹íÃÅ»ØÀÈtrap
	Addmenpaibuchong() --ÃÅÅÉtrapµÄ²¹³ä,±ÜÃâÒ»Ð©×´Ì¬ÎÞ·¨¸Ä±äµÄÇé¿ö
	AddXinshou()  ---ÐÂÊÖÖ¸ÒýµÄ²éÑ¯npc
	AddDoubleNinth()	--ÖØÑô½Ú»î¶¯
	CreateGatherNpc()		-- ÌæÉí²É¼¯ÍÐ¹ÜÈË
	AddNewBattle();		--ÐÂÕ½³¡NPC
	ApplyBattleRank()	--¸üÐÂÕ½³¡ÅÅÃû
end;

function ApplyBattleRank()
	GetBattleRank()
end

tbGAME_SIGNMAP = {806, 808} --¼ÇÂ¼¸÷µÈ¼¶±¨ÃûµãµÄµØÍ¼IDºÅ £¬µÈ¼¶°´µÍ¼¶Ïò¸ß¼¶ÅÅ²¼
function addnpc_yanmenbattle_signup()
	for i = 1, getn(tbGAME_SIGNMAP) do
		CreatBattleSignNpc(tbGAME_SIGNMAP[i])
	end
end

function CreatBattleSignNpc( mapid )
	if( SubWorldID2Idx( mapid ) >= 0 ) then	--³õ¼¶
		local npcindex1 = CreateNpc("VÖ binh thµnh m«n", "Mé Binh Quan phe Tèng", mapid, 1728, 3083)
		SetNpcScript(npcindex1, "\\script\\battles\\battlejoin1.lua")
		
		local npcindex2 = CreateNpc("Nam nh©n ph­¬ng B¾c3", "Mé Binh Quan phe Liªu", mapid, 1652,3174)
		SetNpcScript(npcindex2, "\\script\\battles\\battlejoin2.lua")
		
		local npcindex3 = CreateNpc("Quan sø-trung niªn1", "Tèng Nhu quan", mapid, 1728,3065)
		SetNpcScript(npcindex3, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\song_shop.lua")
		
		local npcindex4 = CreateNpc("Nam nh©n ph­¬ng B¾c2", "Liªu Nhu quan", mapid, 1634,3175)
		SetNpcScript(npcindex4, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\jin_shop.lua")
		------------------
		local npcindex5 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ Khè-Tèng", mapid, 1738,3054)
		SetNpcScript(npcindex5, "\\script\\battles\\openbox.lua")
		
		local npcindex6 = CreateNpc("R­¬ng ®å Tr.Nguyªn", "Thñ Khè- Liªu", mapid, 1626,3181)
		SetNpcScript(npcindex6, "\\script\\battles\\openbox.lua")
		
		local npcindex7 = CreateNpc("Xa phu Trung Nguyªn", "Xa phu phe Tèng", mapid, 1754,3040)
		SetNpcScript(npcindex7, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\song_transport.lua")
		
		local npcindex8 = CreateNpc("Xa phu", "Xa phu phe Liªu", mapid, 1639,3200)
		SetNpcScript(npcindex8, "\\script\\global\\ÌØÊâÓÃµØ\\ËÎÁÉ±¨Ãûµã\\npc\\jin_transport.lua")
		
	end
end

function AddNpcCd()
    local npcIndexGbdz = CreateNpc("C¸i Bang m«n nh©n", "§Ö tö C¸i Bang", 209,1701,3111);
    SetNpcScript(npcIndexGbdz, "\\script\\ÖÐÔ­Ò»Çø\\Ø¤°ï\\npc\\Ø¤°ïµÜ×Ó.lua");
end;

function AddNpcXy()
    local npcIndexDyx_1 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1382, 3186);
    local npcIndexDyx_2 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1299, 3193);
    local npcIndexDyx_3 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1358, 3016);
    local npcIndexDyx_4 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1426, 2916);
    
    local npcIndexDyx_5 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1143, 2931);
    local npcIndexDyx_6 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1219, 2910);
    local npcIndexDyx_7 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1271, 2974);
    local npcIndexDyx_8 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1222, 2985);
    local npcIndexDyx_9 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1116, 3020);
    local npcIndexDyx_10 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1269, 3092);
    local npcIndexDyx_11 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1236, 3147);
    local npcIndexDyx_12 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1356, 3149);
    local npcIndexDyx_13 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1352, 3087);
    local npcIndexDyx_14 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1307, 3079);
    local npcIndexDyx_15 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1404, 2968);
    local npcIndexDyx_16 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1326, 2949);
    local npcIndexDyx_17 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1386, 2926);
    local npcIndexDyx_18 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1428, 2966);
    local npcIndexDyx_19 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1501, 2915);
    local npcIndexDyx_20 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1525, 2935);
    local npcIndexDyx_21 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1573, 2979);
    local npcIndexDyx_22 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1552, 3028);
    local npcIndexDyx_23 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1539, 3110);
    local npcIndexDyx_24 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1571, 3166);
    local npcIndexDyx_25 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1540, 3198);
    local npcIndexDyx_26 = CreateNpc("R­¬ng cã thÓ më", "R­¬ng ®éc d­îc", 309, 1501, 3174);
	local npcIndexJwyh = CreateNpc("Ng©n Hå", "Ng©n Hå", 324, 1822, 3005);
	SetNpcScript(npcIndexJwyh, "\\script\\ÖÐÔ­¶þÇø\\ÆßÐÇ¶´Ò»²ã\\npc\\¾ÅÎ²Òøºü.lua");
	
	local npcIndexYlby = CreateNpc("§Çu lÜnh S¬n tÆc", "§Çu lÜnh S¬n tÆc", 322, 1491, 3323);
    SetNpcScript(npcIndexYlby, "\\script\\ÖÐÔ­¶þÇø\\Áú»¢¶´Ò»²ã\\npc\\·üÅ£É½´óÍõ.lua");
	local npcIndexZh1 = CreateNpc("Ph¸p S­ T©y H¹", "Ph¸p S­ T©y H¹", 311, 1352, 3117);
    SetNpcScript(npcIndexZh1, "\\script\\ÖÐÔ­¶þÇø\\·üÅ£É½\\npc\\Î÷ÏÄÖäÊ¦.lua");
    
	local npcIndexZh2 = CreateNpc("Ph¸p S­ T©y H¹", "Ph¸p S­ T©y H¹", 311, 1439, 3144);
    SetNpcScript(npcIndexZh2, "\\script\\ÖÐÔ­¶þÇø\\·üÅ£É½\\npc\\Î÷ÏÄÖäÊ¦.lua");
    
	local npcIndexZh3 = CreateNpc("Ph¸p S­ T©y H¹", "Ph¸p S­ T©y H¹", 311, 1442, 3033);
    SetNpcScript(npcIndexZh3, "\\script\\ÖÐÔ­¶þÇø\\·üÅ£É½\\npc\\Î÷ÏÄÖäÊ¦.lua");
end;

function AddNpcYz()
    local npcIndexLs = CreateNpc("x¸c L«i Th¾ng", "Thi thÓ cña L«i Th¾ng", 111, 1849, 2887);
    SetNpcScript(npcIndexLs, "\\script\\½­ÄÏÇø\\ÇåÏª¶´\\npc\\À×Ê¤µÄÊ¬Ìå.lua");
    
    local npcIndexLshw1 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ hé vÖ cña L«i Th¾ng", 111, 1854, 2887);
    --SetNpcScript(npcIndexLs, "\\script\\½­ÄÏÇø\\ÇåÏª¶´\\npc\\À×Ê¤µÄÊ¬Ìå.lua");
    local npcIndexLshw2 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ hé vÖ cña L«i Th¾ng", 111, 1847, 2889);
    --SetNpcScript(npcIndexLs, "\\script\\½­ÄÏÇø\\ÇåÏª¶´\\npc\\À×Ê¤µÄÊ¬Ìå.lua");
    local npcIndexLshw3 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ hé vÖ cña L«i Th¾ng", 111, 1851, 2877);
    --SetNpcScript(npcIndexLs, "\\script\\½­ÄÏÇø\\ÇåÏª¶´\\npc\\À×Ê¤µÄÊ¬Ìå.lua");
    
    local npcIndexZbh = CreateNpc("Du Ph­¬ng ®¹i phu", "Tr­¬ng B¸ H¸n", 150, 1711, 3115);
    SetNpcScript(npcIndexZbh, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\ÕÅ²®ºº.lua");
    
    local npcIndexBg = CreateNpc("Tói r¸nh", "Tói tÇm th­êng", 107, 1573, 2939);
    
    local npcIndexTn = CreateNpc("HiÖp n÷", "§­êng Ninh", 107,1417,2946);
    SetNpcScript(npcIndexTn, "\\script\\½­ÄÏÇø\\ÎäÒÄÉ½\\npc\\ÌÆÄþ.lua");

    local npcIndexLjy = CreateNpc("Du Ph­¬ng T­íng SÜ","Lý TiÕn Dòng",150,1767,3111);
    SetNpcScript(npcIndexLjy, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\Àî½øÓÂ.lua");
    
    local npcIndexLxq = CreateNpc("V©n Du §¹o Nh©n","L­u HuyÒn Thanh",150,1579,3110);
    SetNpcScript(npcIndexLxq, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\ÁõÐþÇå.lua");
    
    local npcIndexQr = CreateNpc("Bµ chñ", "Thu Dung", 150,1678,3028);
    SetNpcScript(npcIndexQr, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\ÇïÈØ.lua");
    
    local npcIndexHql = CreateNpc("Th­îng Cæ Háa Kú L©n", "Th­îng Cæ Háa Kú L©n", 113, 1669, 3225);
    SetNpcScript(npcIndexHql, "\\script\\½­ÄÏÇø\\Á½Ë®¶´¶þ²ã\\npc\\»ð÷è÷ë.lua");
    
    local npcIndexThj = CreateNpc("x¸c L«i Th¾ng", "Thi thÓ Th¸i Hång TuyÖt", 113, 1668, 3230);
    local npcIndexJt01 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ Xi Háa gi¸o ®å", 113, 1669, 3231);
    local npcIndexJt02 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ Xi Háa gi¸o ®å", 113, 1664, 3225);
    local npcIndexJt03 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ Xi Háa gi¸o ®å", 113, 1670, 3224);
    local npcIndexJt04 = CreateNpc("X¸c hé vÖ L«i Th¾ng", "Thi thÓ Xi Háa gi¸o ®å", 113, 1661, 3231);
    
    local npcIndexJw = CreateNpc("ThiÕu niªn nam1", "T­ëng Duy", 150, 1679, 3237);
    SetNpcScript(npcIndexJw, "\\script\\½­ÄÏÇø\\ÑïÖÝ\\npc\\½¯Î¬.lua");
    
    local npcIndexWyq = CreateNpc("Tè Hoµn Ch©n", "ViÔn Tinh", 108, 1585, 3195);
    SetNpcScript(npcIndexWyq, "\\script\\½­ÄÏÇø\\ÈªÖÝ¸®±±\\npc\\ÚùÔ¶Çç.lua");
    
    local npcIndexYg = CreateNpc("Ng­ Qu¸i §Çu Môc", "Ng­ Qu¸i §Çu Môc", 103, 1673, 3431);
    SetNpcScript(npcIndexYg, "\\script\\½­ÄÏÇø\\¶«º£º£±õÒ»\\npc\\Óã¹ÖÍ·Ä¿.lua");
end;

function AddNpcWeekEnd()
    local npcIndexZzd = CreateNpc("Ch©n Tö §¬n", "Ch©n Tö §¬n", 200, 1380, 2872);
    SetNpcScript(npcIndexZzd, "\\script\\task\\WeekEnd\\Õç×Óµ¤.lua");
    
    local npcXyZzd = CreateNpc("Ch©n Tö §¬n", "Ch©n Tö §¬n", 350, 1452, 2967);
    SetNpcScript(npcXyZzd, "\\script\\task\\WeekEnd\\Õç×Óµ¤.lua");
    
    local npcXyBm1 = CreateNpc("VÖ binh thµnh m«n", "ChØ huy sø", 350, 1503, 3024);
    SetNpcScript(npcXyBm1, "\\script\\task\\WeekEnd\\±øÂíÖ¸»ÓÊ¹.lua");
    
    local npcYzZzd = CreateNpc("Ch©n Tö §¬n", "Ch©n Tö §¬n", 150, 1714, 3137);
    SetNpcScript(npcYzZzd, "\\script\\task\\WeekEnd\\Õç×Óµ¤.lua");
    
   	local npcYzBm1 = CreateNpc("VÖ binh thµnh m«n", "ChØ huy sø", 150, 1682, 3161);
    SetNpcScript(npcYzBm1, "\\script\\task\\WeekEnd\\±øÂíÖ¸»ÓÊ¹.lua");
    
    local npcIndexBm = CreateNpc("VÖ binh thµnh m«n", "ChØ huy sø", 100, 1423, 2985);
    SetNpcScript(npcIndexBm, "\\script\\task\\WeekEnd\\±øÂíÖ¸»ÓÊ¹.lua");
    
    --ÙÁ¿ÜµØÍ¼µÄ³õÊ¼»¯NPC
    local npc1 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 951, 1333, 2844);
    SetNpcScript(npc1, "\\script\\task\\WeekEnd\\man_killwk.lua");
    local npc2 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 952, 1333, 2844);
    SetNpcScript(npc2, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc3 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 953, 1333, 2844);
    SetNpcScript(npc3, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc4 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 954, 1333, 2844);
    SetNpcScript(npc4, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc5 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 955, 1333, 2844);
    SetNpcScript(npc5, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc6 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 956, 1333, 2844);
    SetNpcScript(npc6, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc7 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 957, 1333, 2844);
    SetNpcScript(npc7, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc8 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 958, 1333, 2844);
    SetNpcScript(npc8, "\\script\\task\\WeekEnd\\man_killwk.lua");
 	local npc9 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 959, 1333, 2844);
    SetNpcScript(npc9, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc10 = CreateNpc("VÖ binh thµnh m«n", "T­íng lÜnh tiÒn tuyÕn", 960, 1333, 2844);
    SetNpcScript(npc10, "\\script\\task\\WeekEnd\\man_killwk.lua");
    
	local liguan1 = CreateNpc("Tö Thanh Th­îng Nh©n", "LÔ quan", 100, 1512, 2990);
	SetNpcScript(liguan1, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\´óÄÚ×Ü¹Ü.lua");
	
	local liguan2 = CreateNpc("Tö Thanh Th­îng Nh©n", "LÔ quan", 300, 1787, 3497);
	SetNpcScript(liguan2, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\´óÄÚ×Ü¹Ü.lua")
    --AddWk(15, 10);
end;

function AddNpcXl()
    local npcIndexSl = CreateNpc("ThiÕu L©m T¨ng Nh©n","Qu¸ ¶i hé tèng nh©n",814,1626,3149);  --ÐÞÁ¶µØÍ¼µÄÉÙÁÖ´«ËÍÈË
    SetNpcScript(npcIndexSl, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");
    
    local npcIndexWd = CreateNpc("Vâ §ang  m«n nh©n","Qu¸ ¶i hé tèng nh©n",812,1622,3093);  --ÐÞÁ¶µØÍ¼µÄÎäµ±´«ËÍÈË
    SetNpcScript(npcIndexWd, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");
    
    local npcIndexEm = CreateNpc("Nga My m«n nh©n","Qu¸ ¶i hé tèng nh©n",816,1626,3149);  --ÐÞÁ¶µØÍ¼µÄ¶ëáÒ´«ËÍÈË
    SetNpcScript(npcIndexEm, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");
    
    local npcIndexGb = CreateNpc("C¸i Bang m«n nh©n","Qu¸ ¶i hé tèng nh©n",815,1373,3118);  --ÐÞÁ¶µØÍ¼µÄØ¤°ï´«ËÍÈË
    SetNpcScript(npcIndexGb, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");
    
    local npcIndexTm = CreateNpc("§­êng M«n T©n m«n nh©n","Qu¸ ¶i hé tèng nh©n",813,1677,2983);  --ÐÞÁ¶µØÍ¼µÄÌÆÃÅ´«ËÍÈË
    SetNpcScript(npcIndexTm, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");
    
		local npcIndexYm = CreateNpc("VÖ binh thµnh m«n", "Qu¸ ¶i hé tèng nh©n", 817,1457,2972);	--ÐÞÁ¶µØÍ¼µÄÑîÃÅ´«ËÍÈË
    SetNpcScript(npcIndexYm, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");   
    
    local npcIndexWp = CreateNpc("Ngò §éc hé ph¸p", "Qu¸ ¶i hé tèng nh©n", 422,1628,3508);	--ÐÞÁ¶µØÍ¼Îå¶¾´«ËÍÈË
    SetNpcScript(npcIndexWp, "\\script\\task\\practice\\³ö¹Ø´«ËÍÈË.lua");
    
end;

function AddNpcQz()
    local npcIndexLfs = CreateNpc("ThiÕu niªn trong th«n", "Lý Phong Thu", 100, 1607, 2970);
    SetNpcScript(npcIndexLfs, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\ÊÕ¸ûÑ§Ï°.lua");
    
    local npcIndexLys = CreateNpc("Du Ph­¬ng ®¹i phu", "L©m D­îc S­", 100, 1558, 2958);
    SetNpcScript(npcIndexLys, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\²ÉÒ©Ñ§Ï°.lua");
end;
function AddXsTg()
    local npcIndexCd = CreateNpc("B¸n s¸ch", "Sø gi¶", 300, 1638, 3575);
    SetNpcScript(npcIndexCd, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\ÐÂÊÖÍÆ¹ãÔ±.lua");
    
    local npcIndexQz = CreateNpc("B¸n s¸ch", "Sø gi¶", 100, 1451, 2821);
    SetNpcScript(npcIndexQz, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\ÐÂÊÖÍÆ¹ãÔ±.lua");
    
    local npcIndexBj = CreateNpc("B¸n s¸ch", "Sø gi¶", 200, 1159, 2839);
    SetNpcScript(npcIndexBj, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÐÂÊÖÍÆ¹ãÔ±.lua");
    
end;
function AddTl()
    local npcIndex701 = CreateNpc("Nha dÞch", "Lao ®Çu", 701, 1376, 3143);
    SetNpcScript(npcIndex701, "\\script\\task\\prison\\ÀÎÍ·.lua");
    
    local npcIndex702 = CreateNpc("Nha dÞch", "Lao ®Çu", 702, 1614, 3202);
    SetNpcScript(npcIndex702, "\\script\\task\\prison\\ÀÎÍ·.lua");
    
    local npcIndex703 = CreateNpc("Nha dÞch", "Lao ®Çu", 703, 1337, 3161);
    SetNpcScript(npcIndex703, "\\script\\task\\prison\\ÀÎÍ·.lua");
end;

function AddWk(nDistanceX, nDistanceY)
    rect_table = {
        {1294, 2854, 1501, 3119},
        {1294, 3119, 1482, 3169},
        {1508, 2973, 1534, 3034},
        {1534, 2842, 1578, 2894},
        {1554, 2901, 1580, 2908},
        {1519, 2913, 1538, 2926}
    };
    local sp = {   --Ã¿µØÍ¼µÄ¿ªÊ¼×ø±ê£¬µØÍ¼ID£¬NPCÄ£°åÃû×Ö
        {1294, 2854, 907, "Oa KhÊu"},
        {1294, 2854, 908, "Oa KhÊu Binh sÜ"},
        {1294, 2854, 909, "Oa KhÊu Thñy Binh"},
        {1294, 2854, 910, "Oa KhÊu Lôc Binh"},
        {1294, 2854, 911, "Oa KhÊu Vâ SÜ"}
    };
    for index, v in sp do
        local nCount = getn(rect_table);
        for i = 1, nCount do
            for nX = rect_table[i][1], rect_table[i][3], nDistanceX do
                for nY = rect_table[i][2], rect_table[i][4], nDistanceY do
                    CreateNpc(v[4], v[4], v[3], nX, nY);
                end;
            end;
        end;
    end;

end;
function Addsh()
    local npcIndexshxjqz = CreateNpc("G¸nh hµng", "Hµnh C­íc Th­¬ng Nh©n", 100, 1462, 2922);
    SetNpcScript(npcIndexshxjqz, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÐÐ½ÅÉÌÈË.lua");
    
    local npcIndexshxjyz = CreateNpc("G¸nh hµng", "Hµnh C­íc Th­¬ng Nh©n", 150, 1698, 3203);
    SetNpcScript(npcIndexshxjyz, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÐÐ½ÅÉÌÈË.lua");
    
    local npcIndexshxy = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ th­¬ng héi", 350, 1456, 2925);
    SetNpcScript(npcIndexshxy, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÉÌ»áÀÏ°å.lua");
    
    local npcIndexshyz = CreateNpc("Chñ cÇm ®å Trung Nguyªn", "Chñ th­¬ng héi", 150, 1636, 3139);
    SetNpcScript(npcIndexshyz, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÉÌ»áÀÏ°å.lua"); 

    local npcIndexsmsr = CreateNpc("L·o phó hé", "Th­¬ng Nh©n thÇn bÝ", 200, 1488, 2826);
    SetNpcScript(npcIndexsmsr, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÉñÃØÉÌÈË.lua");   
end;

function Addtj()
    local npcIndextjqz = CreateNpc("Nha dÞch", "Bé ®Çu", 100, 1518, 2988);
    SetNpcScript(npcIndextjqz, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\²¶Í·.lua");
    
    local npcIndextjyz = CreateNpc("Nha dÞch", "Bé ®Çu", 150, 1739, 3158);
    SetNpcScript(npcIndextjyz, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\²¶Í·.lua");
    
    local npcIndextjxy = CreateNpc("Nha dÞch", "Bé ®Çu", 350, 1507, 2997);
    SetNpcScript(npcIndextjxy, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\²¶Í·.lua");
    
    local npcIndextjztx = CreateNpc("Cô giµ", "Tr¸c Thiªn Hµnh", 350, 1427, 3024);
    SetNpcScript(npcIndextjztx, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\×¿ÌìÐÐ.lua");   
end;

function Addtaohuadao()
    local npcIndextaohuadao1 = CreateNpc("Xa phu Trung Nguyªn", "ThuyÒn phu H¶i T©n", 104,1568,2975);
    SetNpcScript(npcIndextaohuadao1, "\\script\\½­ÄÏÇø\\¶«º£º£±õ¶þ\\npc\\¶«º£º£±õ2´¬·ò.lua");

    local npcIndextaohuadao2 = CreateNpc("Xa phu Trung Nguyªn", "ThuyÒn Phu §µo Hoa ®¶o", 102,1459,3163);
    SetNpcScript(npcIndextaohuadao2, "\\script\\½­ÄÏÇø\\ÌÒ»¨µº\\npc\\ÌÒ»¨µº´¬·ò.lua");
end;


function Addcangjian()
    local npcIndexcangjian1 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 300,1776,3703);
    SetNpcScript(npcIndexcangjian1, "\\script\\²Ø½£É½×¯\\task_script\\³É¶¼\\²Ø½£Ê¹Õß.lua");
    
    local npcIndexcangjian2 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 200,1229,2762);
    SetNpcScript(npcIndexcangjian2, "\\script\\²Ø½£É½×¯\\task_script\\ãê¾©\\²Ø½£Ê¹Õß.lua");
    
    local npcIndexcangjian3 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 100,1510,3106);
    SetNpcScript(npcIndexcangjian3, "\\script\\²Ø½£É½×¯\\task_script\\ÈªÖÝ\\²Ø½£Ê¹Õß.lua");
    
    local npcIndexcangjian4 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 350,1395,2851);
    SetNpcScript(npcIndexcangjian4, "\\script\\²Ø½£É½×¯\\task_script\\ÏåÑô\\²Ø½£Ê¹Õß.lua");

    local npcIndexcangjian5 = CreateNpc("V­¬ng An Th¹ch", "Sø gi¶ Tµng KiÕm", 150,1745,3119);
    SetNpcScript(npcIndexcangjian5, "\\script\\²Ø½£É½×¯\\task_script\\ÑïÖÝ\\²Ø½£Ê¹Õß.lua");
    
end;


function Addyangmen()
    local npcIndexyangmen1 = CreateNpc("D­¬ng Diªn Chiªu", "D­¬ng Diªn Chiªu", 219,1543,2939);
    SetNpcScript(npcIndexyangmen1, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÑîÑÓÕÑ.lua");
    
    local npcIndexyangmen2 = CreateNpc("D­¬ng Bµi Phong", "D­¬ng Bµi Phong", 219,1454,3107);
    SetNpcScript(npcIndexyangmen2, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÑîÅÅ·ç.lua");
    
    local npcIndexyangmen3 = CreateNpc("D­¬ng T«n B¶o", "D­¬ng T«n B¶o", 219,1559,3084);
    SetNpcScript(npcIndexyangmen3, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\Ñî×Ú±£.lua");
    
    local npcIndexyangmen4 = CreateNpc("Méc QuÕ Anh", "Méc QuÕ Anh", 219,1481,3184);
    SetNpcScript(npcIndexyangmen4, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÄÂ¹ðÓ¢.lua");
    
    local npcIndexyangmen5 = CreateNpc("Qu¶n gia", "D­¬ng Hång", 219,1634,3278);
    SetNpcScript(npcIndexyangmen5, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\Ñîºé.lua");
    
    local npcIndexyangmen6 = CreateNpc("Xa Th¸i Qu©n", "Xa Th¸i Qu©n", 219,1529,3137);
    SetNpcScript(npcIndexyangmen6, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÙÜÌ«¾ý.lua");
    
    local npcIndexyangmen7 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 219,1599,3140);
    SetNpcScript(npcIndexyangmen7, "\\script\\ÖÐÔ­Ò»Çø\\Ìì²¨Ñî¸®\\npc\\ÖÐÔ­´¢Îï¹ñ.lua");
      
end;

function AddChristmas()
	local npcIndexWilson = CreateNpc("TruyÒn gi¸o sÜ","Uy NhÜ Tèn",100,1308,2930);	--ÈªÖÝ
		SetNpcScript(npcIndexWilson,"\\script\\online\\zgc_npc_dialog.lua");
	local npcIndexchurchman1 = CreateNpc("TruyÒn gi¸o sÜ","Gi¸o sÜ",200,1333,2811);
		SetNpcScript(npcIndexchurchman1,"\\script\\online\\zgc_npc_dialog.lua");
	local npcIndexchurchman2 = CreateNpc("TruyÒn gi¸o sÜ","Gi¸o sÜ",300,1707,3546);
		SetNpcScript(npcIndexchurchman2,"\\script\\online\\zgc_npc_dialog.lua");		
	local npcIndexRosa = CreateNpc("Phu nh©n T©y D­¬ng","La Sa",100,1526,2948);
		SetNpcScript(npcIndexRosa,"\\script\\online\\Ê¥µ®½Ú»î¶¯\\ÂÞÉ¯.lua");
end

function Addxinan()
    local npcIndexxinan1 = CreateNpc("Xi Háa §¹i hé ph¸p", "Xi Háa §¹i hé ph¸p", 417,1642,3382);
    SetNpcScript(npcIndexxinan1, "\\script\\Î÷ÄÏÇø\\°×Ë®¶´¶þ²ã\\npc\\ò¿»ð´ó»¤·¨.lua");

    local npcIndexxinan2 = CreateNpc("D¹ Xoa Nha", "D¹ Xoa", 417,1815,3412);
    SetNpcScript(npcIndexxinan2, "\\script\\Î÷ÄÏÇø\\°×Ë®¶´¶þ²ã\\npc\\Ò¹²æ.lua");
    
    local npcIndexxinan3 = CreateNpc("T¨ng ¸c", "Xi Háa ¸c t¨ng", 416,1724,2821);
    SetNpcScript(npcIndexxinan3, "\\script\\Î÷ÄÏÇø\\°×Ë®¶´Ò»²ã\\npc\\ò¿»ðÉ®¶ñ.lua");   
    
    local npcIndexxinan4 = CreateNpc("Quan sø-trung niªn1", "Cao Th¨ng TuyÒn", 400,1537,3050);
    SetNpcScript(npcIndexxinan4, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\¸ßÉýÈª.lua");      
        
    local npcIndexxinan5 = CreateNpc("Bµ chñ", "TrÞnh Qu¸n Chi", 400,1593,2928);
    SetNpcScript(npcIndexxinan5, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\Ö£¹áÖ®.lua");      
    
    local npcIndexxinan6 = CreateNpc("Cô giµ", "§æng Giµ La", 400,1522,2848);
    SetNpcScript(npcIndexxinan6, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\¶­åÈÂÞ.lua");      

    local npcIndexxinan7 = CreateNpc("Qu¶n gia", "TrÇn LËp Hµnh", 400,1470,2847);
    SetNpcScript(npcIndexxinan7, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\³ÂÁ¢ºâ.lua");      

    local npcIndexxinan8 = CreateNpc("ThiÕu niªn nam1", "L­u §iÓn", 400,1443,3018);
    SetNpcScript(npcIndexxinan8, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\Áõµä.lua");      

    local npcIndexxinan9 = CreateNpc("Ngôc Háa Cuång Nh©n", "Ngôc Háa Cuång Nh©n", 401,1568,3085);
    SetNpcScript(npcIndexxinan9, "\\script\\Î÷ÄÏÇø\\µã²ÔÉ½\\npc\\Óü»ð¿ñÈË.lua");      

    local npcIndexxinan10 = CreateNpc("Xi Háa Tæng ®µn chñ", "Xi Háa Tæng ®µn chñ", 413,1697,3192);
    SetNpcScript(npcIndexxinan10, "\\script\\Î÷ÄÏÇø\\ÁúÑÛ¶´¶þ²ã\\npc\\ò¿»ð½Ì×ÜÌ³Ö÷.lua");      

    local npcIndexxinan11 = CreateNpc("A Tu La", "A Tu La", 413,1701,3474);
    SetNpcScript(npcIndexxinan11, "\\script\\Î÷ÄÏÇø\\ÁúÑÛ¶´¶þ²ã\\npc\\°¢ÐÞÂÞ.lua");      

    local npcIndexxinan12 = CreateNpc("Xi Háa §¹i tr­ëng l·o", "Xi Háa §¹i tr­ëng l·o", 412,1553,2976);
    SetNpcScript(npcIndexxinan12, "\\script\\Î÷ÄÏÇø\\ÁúÑÛ¶´Ò»²ã\\npc\\ò¿»ð´ó³¤ÀÏ.lua");
    
    local npcIndexxinan13 = CreateNpc("Miªu LÜnh Dòng SÜ", "Miªu LÜnh Dòng SÜ", 408,1321,3004);
    SetNpcScript(npcIndexxinan13, "\\script\\Î÷ÄÏÇø\\ÃçÁë\\npc\\ÃçÁëÓÂÊ¿.lua");
    
    local npcIndexxinan14 = CreateNpc("Nam nh©n T©y Nam", "Téc tr­ëng Miªu LÜnh", 408,1300,3140);
    SetNpcScript(npcIndexxinan14, "\\script\\Î÷ÄÏÇø\\ÃçÁë\\npc\\ÃçÁë×å³¤.lua");
      
    local npcIndexxinan15 = CreateNpc("§éi tr­ëng hé vÖ", "§éi tr­ëng hé vÖ", 409,1820,3518);
    SetNpcScript(npcIndexxinan15, "\\script\\Î÷ÄÏÇø\\Ç§Ñ°ËþÒ»²ã\\npc\\»¤ÎÀ¶Ó³¤.lua");

    local npcIndexxinan16 = CreateNpc("KiÒn §¹t Bµ", "KiÒn §¹t Bµ", 409,1849,3598);
    SetNpcScript(npcIndexxinan16, "\\script\\Î÷ÄÏÇø\\Ç§Ñ°ËþÒ»²ã\\npc\\Ç¬´ïÆÅ.lua");
    
    local npcIndexxinan17 = CreateNpc("Thiªn TÇm N¹p S­", "Thiªn TÇm N¹p S­", 410,1694,3134);
    SetNpcScript(npcIndexxinan17, "\\script\\Î÷ÄÏÇø\\Ç§Ñ°Ëþ¶þ²ã\\npc\\Ç§Ñ°ñÄÊ¦.lua");
        
    local npcIndexxinan18 = CreateNpc("KhÈn Na La", "KhÈn Na La", 410,1693,3183);
    SetNpcScript(npcIndexxinan18, "\\script\\Î÷ÄÏÇø\\Ç§Ñ°Ëþ¶þ²ã\\npc\\½ôÄÇÂÞ.lua");

    local npcIndexxinan19 = CreateNpc("Ngù §éc ¢m C¬", "Ngù §éc ¢m C¬", 419,1774,3129);
    SetNpcScript(npcIndexxinan19, "\\script\\Î÷ÄÏÇø\\ÈëÃÅÃÔ¹¬¶þ\\npc\\Ô¦¶¾Òõ¼§.lua");
    
    local npcIndexxinan20 = CreateNpc("Hò Cèt §éc Nh©n", "Hò Cèt §éc Nh©n", 418,1512,2825);
    SetNpcScript(npcIndexxinan20, "\\script\\Î÷ÄÏÇø\\ÈëÃÅÃÔ¹¬Ò»\\npc\\¸¯¹Ç¶¾ÈË.lua");

    local npcIndexxinan21 = CreateNpc("Ngôc Háa Nh©n", "Ngôc Háa Nh©n", 406,1404,2770);
    SetNpcScript(npcIndexxinan21, "\\script\\Î÷ÄÏÇø\\ÎäÁêÉ½\\npc\\Óü»ðÈË.lua");

    local npcIndexxinan22 = CreateNpc("B¸n §iÖp Nh©n", "B¸n §iÖp Nh©n", 405,1555,2959);
    SetNpcScript(npcIndexxinan22, "\\script\\Î÷ÄÏÇø\\ÎäÁêÉ½½Å\\npc\\°ëµûÈË.lua");

    local npcIndexxinan23 = CreateNpc("Ma H« La Giµ", "Ma H« La Giµ", 402,1319,2955);
    SetNpcScript(npcIndexxinan23, "\\script\\Î÷ÄÏÇø\\Î÷Ë«°æÄÉ±±²¿\\npc\\Ä¦ºôÂÞåÈ.lua");

    local npcIndexxinan24 = CreateNpc("NhÞ Hoµng Tö_§¹i Lý", "NhÞ hoµng tö §oµn Tè ThuËn", 403,1458,2842);
    SetNpcScript(npcIndexxinan24, "\\script\\Î÷ÄÏÇø\\Î÷Ë«°æÄÉÄÏ²¿\\npc\\´óÀí¶þ»Ê×Ó.lua");

    local npcIndexxinan25 = CreateNpc("§oµn Thõa ¢n", "§oµn Thõa ¢n", 403,1537,2967);
    SetNpcScript(npcIndexxinan25, "\\script\\Î÷ÄÏÇø\\Î÷Ë«°æÄÉÄÏ²¿\\npc\\¶Î³Ð¶÷.lua");

    local npcIndexxinan26 = CreateNpc("Miªu LÜnh Thñ lÜnh", "Miªu LÜnh Thñ lÜnh", 421,1576,3469);
    SetNpcScript(npcIndexxinan26, "\\script\\Î÷ÄÏÇø\\Ñà×Ó¶´¶þ²ã\\npc\\ÃçÁëÊ×Áì.lua");
    
    local npcIndexxinan27 = CreateNpc("Ngò §éc T©n Ch­ëng M«n", "B¹ch Doanh Doanh", 407,1615,3182);
    SetNpcScript(npcIndexxinan27, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\°×Ó¨Ó¨.lua");    
    
    local npcIndexxinan28 = CreateNpc("Xi Háa Yªu N÷", "Xi Háa Yªu N÷", 404,1346,3144);
    SetNpcScript(npcIndexxinan28, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ò¿»ðÑý¸¾.lua");
    
    local npcIndexxinan29 = CreateNpc("T©y Nam Miªu Nh©n", "C©u S¸ch", 407,1572,3159);
    SetNpcScript(npcIndexxinan29, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\¹´²á.lua");    
    
    local npcIndexxinan30 = CreateNpc("Nam nh©n T©y Nam", "Ph­¬ng Viªn", 407,1549,3184);
    SetNpcScript(npcIndexxinan30, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\·½Ô³.lua");      
    
    local npcIndexxinan31 = CreateNpc("Ngò §éc gi¸o chñ", "V­u Dung", 407,1643,3233);
    SetNpcScript(npcIndexxinan31, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÓÈéÅ.lua");    

    local npcIndexxinan32 = CreateNpc("Ngò §éc gi¸o ®å", "T©y §å", 407,1606,3279);
    SetNpcScript(npcIndexxinan32, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\Î÷Í¼.lua");    

    local npcIndexxinan33 = CreateNpc("Chñ tiÖm v¶i T©y Nam", "LiÔu T©n Tróc", 407,1606,3220);
    SetNpcScript(npcIndexxinan33, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÁøÐÂÖñ.lua");
    
    local npcIndexxinan34 = CreateNpc("Ngò §éc Phã gi¸o chñ", "Ng« Ng«n", 407,1594,3171);
    SetNpcScript(npcIndexxinan34, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎâÑÔ.lua");   

    local npcIndexxinan35 = CreateNpc("Ngò §éc Phã gi¸o chñ", "Hïng LËp", 407,1551,3265);
    SetNpcScript(npcIndexxinan35, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÐÜÁ¢.lua");   

    local npcIndexxinan36 = CreateNpc("Ngò §éc gi¸o ®å", "Th¸i Quang", 407,1556,3216);
    SetNpcScript(npcIndexxinan36, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\Ì©¹â.lua");
    
    local npcIndexxinan37 = CreateNpc("Lý S­ S­", "Sµi Hoµng Nhi", 404,1570,2725);
    SetNpcScript(npcIndexxinan37, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\²ñ»Ë¶ù.lua");
    
    local npcIndexxinan38 = CreateNpc("Thóy Yªn hé ph¸p", "Hé MÉn", 404,1599,2760);
    SetNpcScript(npcIndexxinan38, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ìèÃô.lua");  
    
    local npcIndexxinan39 = CreateNpc("Thóy Yªn ch­ëng m«n", "L­u Thanh Mi", 404,1543,2693);
    SetNpcScript(npcIndexxinan39, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ÁõÇàÃ¼.lua");
    
    local npcIndexxinan40 = CreateNpc("HiÖp n÷", "Chu Tö V¨n",404,1524,2719);
    SetNpcScript(npcIndexxinan40, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ÖÜ×Óö©.lua");
    
    local npcIndexxinan41 = CreateNpc("Tè Hoµn Ch©n", "Hå Man Thµnh", 404,1577,2784);
    SetNpcScript(npcIndexxinan41, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ºúÂü³É.lua");
    
    local npcIndexxinan42 = CreateNpc("Thóy Yªn m«n nh©n", "Hµ Hµi", 404,1493,2746);
    SetNpcScript(npcIndexxinan42, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ºÎÐ³.lua");
   
    local npcIndexxinan43 = CreateNpc("Thóy Yªn hé ph¸p", "X¶o X¶o", 404,1474,2838);
    SetNpcScript(npcIndexxinan43, "\\script\\Î÷ÄÏÇø\\´äÑÌ\\npc\\ÇÉÇÉ.lua");

    local npcIndexxinan44 = CreateNpc("Xa phu T©y Nam", "Xa phu §¹i Lý", 400,1549,2882);
    SetNpcScript(npcIndexxinan44, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\´óÀí³µ·ò.lua");
    
    local npcIndexxinan45 = CreateNpc("Chñ tiÖm ®¸ T©y Nam", "Chñ Kim hoµn", 400,1497,2940);
    SetNpcScript(npcIndexxinan45, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÊÎÆ·µêÀÏ°å.lua");
    
    local npcIndexxinan46 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 400,1553,2914);
    SetNpcScript(npcIndexxinan46, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÎïÆ·±£¹ÜÈË±±.lua");
    
    local npcIndexxinan47 = CreateNpc("Chñ cÇm ®å T©y Nam", "Chñ töu lÇu", 400,1524,2894);
    SetNpcScript(npcIndexxinan47, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\¾ÆÂ¥ÀÏ°å.lua");  
    
    local npcIndexxinan48 = CreateNpc("Tö Thanh Th­îng Nh©n", "LÔ quan", 400,1506,2847);
    SetNpcScript(npcIndexxinan48, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\´óÄÚ×Ü¹Ü.lua");
    
    local npcIndexxinan49 = CreateNpc("Ch­ëng d­îc Thæ Phån", "Chñ T¹p hãa", 400,1511,2955);
    SetNpcScript(npcIndexxinan49, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÔÓ»õµêÀÏ°å.lua"); 
    
    local npcIndexxinan50 = CreateNpc("Tr×nh Di", "Chñ th­¬ng héi", 400,1486,2924);
    SetNpcScript(npcIndexxinan50, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÉÌ»áÀÏ°å.lua");
    
    local npcIndexxinan51 = CreateNpc("Ch­ëng d­îc T©y Nam", "Chñ D­îc ®iÕm", 400,1522,3007);
    SetNpcScript(npcIndexxinan51, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\Ò©µêÀÏ°å.lua");
    
    local npcIndexxinan52 = CreateNpc("Vâ L©m Minh Chñ1", "Sø gi¶ m«n ph¸i", 400,1548,2981);
    SetNpcScript(npcIndexxinan52, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÃÅÅÉ½ÓÒýÈË.lua");
    
    local npcIndexxinan53 = CreateNpc("Chñ tiÖm vò khÝ T©y Nam", "Chñ TiÖm Nam phôc", 400,1471,2956);
    SetNpcScript(npcIndexxinan53, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÄÐ×°µêÀÏ°å.lua");
    
    local npcIndexxinan54 = CreateNpc("Chñ tiÖm v¶i T©y Nam", "Chñ TiÖm N÷ phôc", 400,1498,2969);
    SetNpcScript(npcIndexxinan54, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\Å®×°µêÀÏ°å.lua");
    
    local npcIndexxinan55 = CreateNpc("Xa phu T©y Nam", "Xa phu §¹i Lý", 400,1574,3110);
    SetNpcScript(npcIndexxinan55, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\´óÀí³µ·ò.lua");
    
    local npcIndexxinan56 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 400,1527,3112);
    SetNpcScript(npcIndexxinan56, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÎïÆ·±£¹ÜÈË¶«.lua");
    
    local npcIndexxinan57 = CreateNpc("Xa phu T©y Nam", "Xa phu §¹i Lý", 400,1465,3110);
    SetNpcScript(npcIndexxinan57, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\´óÀí³µ·ò.lua");
    
    local npcIndexxinan58 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 400,1456,3071);
    SetNpcScript(npcIndexxinan58, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÎïÆ·±£¹ÜÈËÄÏ.lua");

    local npcIndexxinan59 = CreateNpc("R­¬ng ®å Trung Nguyªn", "Thñ khè", 407,1621,3249);
    SetNpcScript(npcIndexxinan59, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\ÎïÆ·±£¹ÜÈË.lua");

    local npcIndexxinan60 = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Chñ TiÖm vò khÝ", 400,1566,3005);
    SetNpcScript(npcIndexxinan60, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÎäÆ÷µêÀÏ°å.lua");
    
    local npcIndexxinan61 = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Minh S­ Phã", 350,1546,2930);
    SetNpcScript(npcIndexxinan61, "\\script\\ÖÐÔ­¶þÇø\\ÏåÑô\\npc\\ÖÆÃ±¼¼ÄÜ.lua");    

    local npcIndexxinan62 = CreateNpc("ThiÕu n÷ Miªu Téc", "Tö Quyªn", 400,1409,2980);
    SetNpcScript(npcIndexxinan62, "\\script\\Î÷ÄÏÇø\\´óÀí¸®\\npc\\ÖÆ¿ã¼¼ÄÜ.lua");  
                                                                   
end;

function AddCheFu()		 --²É¼¯µØÍ¼³µ·ò
	local npcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",714,1425,2847);
	SetNpcScript(npcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÄÏ»±¹È\\npc\\³µ·ò.lua");
	npcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",714,1585,3166);
	SetNpcScript(npcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÄÏ»±¹È\\npc\\³µ·ò.lua");
	
	npcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",719,1624,3269);
	SetNpcScript(npcIndex,"\\script\\ÊÀ½çµØÍ¼\\º¬ÓÄ¹È\\npc\\³µ·ò.lua");
	npcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",719,1785,3516);
	SetNpcScript(npcIndex,"\\script\\ÊÀ½çµØÍ¼\\º¬ÓÄ¹È\\npc\\³µ·ò.lua");
	
	npcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu",724,1656,3554);
	SetNpcScript(npcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÐùÔ¯¹È\\npc\\³µ·ò.lua");
	npcIndex = CreateNpc("Xa phu Trung Nguyªn","Xa phu", 724,1814,3554);
	SetNpcScript(npcIndex,"\\script\\ÊÀ½çµØÍ¼\\ÐùÔ¯¹È\\npc\\³µ·ò.lua");
end

function AddDragonBoatDay()
	local npcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",100,1465,2794);
	SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");
	npcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",200,1170,2828);
	SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");
	npcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",300,1640,3526);
	SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");	

	for i=0,7 do 
		npcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",1070+i,2051,3249);
		SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
	for i=0,7 do 
		npcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",2070+i,2051,3249);
		SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
	for i=0,7 do 
		npcIndex = CreateNpc("Vâ L©m Minh Chñ1","Long Chu sø gi¶",3070+i,2051,3249);
		SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
end;

function AddTxNpc()
	local npcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "ThÇn Du Ch©n Nh©n", 200, 1151, 2850)
	SetNpcScript(npcIndex, "\\script\\Ì«Ðé»Ã¾³\\¿Õ¿ÕºÍÉÐ.lua")
	npcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "ThÇn Du Ch©n Nh©n", 300, 1975, 3552)
	SetNpcScript(npcIndex, "\\script\\Ì«Ðé»Ã¾³\\¿Õ¿ÕºÍÉÐ.lua")
	npcIndex = CreateNpc("Vâ §ang  ch­ëng m«n", "ThÇn Du Ch©n Nh©n", 100, 1379, 2858)
	SetNpcScript(npcIndex, "\\script\\Ì«Ðé»Ã¾³\\¿Õ¿ÕºÍÉÐ.lua")
end

function ZoneInit(nMapid)
	--¶¯Ì¬¼ÓÉÏTrap
	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3235 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_±ùÑ©ÌìµØ.lua")
	end

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3330 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_±ùÑ©ÌìµØ.lua")
	end

	for i = 3235, 3330 do
		AddMapTrap(nMapid, 1515 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_±ùÑ©ÌìµØ.lua")
	end

	for i = 3235, 3330 do
		AddMapTrap(nMapid, 1570 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_±ùÑ©ÌìµØ.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3230 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_½­ÄÏ´ºÉ«.lua")
	end

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3330 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_½­ÄÏ´ºÉ«.lua")
	end

	for i = 3230, 3330 do
		AddMapTrap(nMapid, 1600 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_½­ÄÏ´ºÉ«.lua")
	end

	for i = 3230, 3330 do
		AddMapTrap(nMapid, 1650 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_½­ÄÏ´ºÉ«.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3395 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_ÈÛÑÒµØÓü.lua")
	end

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3495 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_ÈÛÑÒµØÓü.lua")
	end

	for i = 3395, 3495 do
		AddMapTrap(nMapid, 1515 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_ÈÛÑÒµØÓü.lua")
	end

	for i = 3395, 3495 do
		AddMapTrap(nMapid, 1570 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_ÈÛÑÒµØÓü.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3390 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_å«º£»ÆÉ³.lua")
	end

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3500 * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_å«º£»ÆÉ³.lua")
	end

	for i = 3390, 3500 do
		AddMapTrap(nMapid, 1600 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_å«º£»ÆÉ³.lua")
	end

	for i = 3390, 3500 do
		AddMapTrap(nMapid, 1650 * 32, i * 32, "\\script\\Ì«Ðé»Ã¾³\\trap_å«º£»ÆÉ³.lua")
	end
end

function Addfengdutrap()
	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2687 * 32, "\\script\\ÖÐÔ­¶þÇø\\·á¶¼\\trap\\·á¶¼toÊ®°Ë²ãµØÓü.lua")
	end

	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2686 * 32, "\\script\\ÖÐÔ­¶þÇø\\·á¶¼\\trap\\·á¶¼toÊ®°Ë²ãµØÓü.lua")
	end
end

function Addmenpaibuchong()
	for i = 1625, 1630 do
		AddMapTrap(303, i * 32, 3180 * 32, "\\script\\ÖÐÔ­¶þÇø\\¶ëáÒ\\trap\\½ø¶ëáÒ.lua")
	end

	for i = 1571, 1577 do
		AddMapTrap(209, i * 32, 3217 * 32, "\\script\\ÖÐÔ­Ò»Çø\\Ø¤°ï\\trap\\½øØ¤°ï.lua")
	end
	
	for i = 1585, 1591 do
		AddMapTrap(407, i * 32, 3287 * 32, "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\trap\\ÈëÎå¶¾½Ì.lua")
	end
	
	for i = 1891, 1896 do
		AddMapTrap(312, i * 32, 3422 * 32, "\\script\\ÖÐÔ­¶þÇø\\Îäµ±\\trap\\½øÎäµ±.lua")
	end	
end

function AddXinshou()
	local npcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 200, 1397, 2849)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")
	npcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 300, 1750, 3524)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")
	npcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 100, 1440, 2964)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")
	npcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 350, 1452, 2991)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")
	npcIndex = CreateNpc("ThiÖu Ung", "V¹n Sù Th«ng", 150, 1694, 3146)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\ÐÂÊÖÖ¸Òýnpc.lua")		
end

function CreateGatherNpc()
	local nIndex = 0
	nIndex = CreateNpc("Du Ph­¬ng ®¹i phu", "Ng­êi ñy th¸c h¸i thuèc", 724,1737,3377)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Du Ph­¬ng ®¹i phu", "Ng­êi ñy th¸c h¸i thuèc", 714, 1500, 3018)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Du Ph­¬ng ®¹i phu", "Ng­êi ñy th¸c h¸i thuèc", 719, 1708, 3376)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Xa phu Trung Nguyªn", "Ng­êi ñy th¸c ®èn gç", 710, 1711, 3395)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Xa phu Trung Nguyªn", "Ng­êi ñy th¸c ®èn gç", 715, 1500, 2992)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Xa phu Trung Nguyªn", "Ng­êi ñy th¸c ®èn gç", 720, 1727, 3346)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("ThiÕu niªn trong th«n", "Ng­êi ñy th¸c canh t¸c", 713, 1481, 2944)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("ThiÕu niªn trong th«n", "Ng­êi ñy th¸c canh t¸c", 718, 1703, 3410)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("ThiÕu niªn trong th«n", "Ng­êi ñy th¸c canh t¸c", 723, 1701, 3456)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Ng­êi ñy th¸c ®µo khãang", 711, 1721, 3373)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Ng­êi ñy th¸c ®µo khãang", 716, 1707, 3038)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Chñ Vò khÝ Trung Nguyªn", "Ng­êi ñy th¸c ®µo khãang", 721, 1682, 3336)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("ThÇy luyÖn thó", "Ng­êi ñy th¸c thu thËp", 712, 1480, 2919)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Phô n÷1", "Ng­êi ñy th¸c thu thËp", 717, 1744, 2957)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("ThÇy luyÖn thó", "Ng­êi ñy th¸c thu thËp", 722, 1755, 3430)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
end
--******************************ÖØÑô½Ú»î¶¯*******************************
function AddDoubleNinth()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Vâ L©m truyÒn nh©n",100,1456,2789);	--ÈªÖÝ£º183£¬174
	SetNpcScript(nNpcIndex, "\\script\\½­ÄÏÇø\\ÈªÖÝ\\npc\\ÎäÁÖÃË´«ÈË.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Vâ L©m truyÒn nh©n",300,1629,3529);	--³É¶¼£º205£¬220
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­¶þÇø\\³É¶¼\\npc\\ÎäÁÖÃË´«ÈË.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Vâ L©m truyÒn nh©n",200,1189,2835);	--ãê¾©£º146£¬176
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÎäÁÖÃË´«ÈË.lua");
	nNpcIndex = CreateNpc("Vâ L©m Minh Chñ1","Vâ L©m truyÒn nh©n",969,1643,3225);	
	SetNpcScript(nNpcIndex, "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\»ªÉ½ÎäÁÖÃË´«ÈË.lua");
end;

function AddNewBattle()
	local tChannel = 
	{								--ÆµµÀÃû×ÖÓëID
		[1] = {"Nh¹n M«n Quan-chiÕn dÞch Th«n trang",12},
		[2] = {"Nh¹n M«n Quan-chiÕn dÞch th¶o cèc",13},
		[3] = {"Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi",14},
		[4] = {"Nh¹n M«n Quan-chiÕn dÞch chÝnh",15},
		[5] = {"Nh¹n M«n Quan-chiÕn dÞch Th«n trang phe Tèng",16},
		[6] = {"Nh¹n M«n Quan-chiÕn dÞch Th«n trang phe Liªu",17},
		[7] = {"Nh¹n M«n Quan-chiÕn dÞch th¶o cèc phe Tèng",18},
		[8] = {"Nh¹n M«n Quan-chiÕn dÞch th¶o cèc phe Liªu",19},
		[9] = {"Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi phe Tèng",20},
		[10] = {"Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi phe Liªu",21},
		[11] = {"Nh¹n M«n Quan-chiÕn dÞch chÝnh phe Tèng",22},
		[12] = {"Nh¹n M«n Quan-chiÕn dÞch chÝnh phe Liªu",23},
	}
	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2]);
	end;
	SetGlbValue(31,0)	--¿ªÆôÐÂÕ½³¡
end;