
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÊÀ½çÊÕ¼¯ÈÎÎñÍ·ÎÄ¼ş
-- Edited by peres
-- 2005/08/25 PM 20:00

-- Ö»ÓĞËûºÍËıÁ½¸öÈË
-- ËûÃÇÏà°®
-- Ëı¼ÇµÃ
-- ËûµÄÊÖ¸§Ä¦ÔÚËıµÄÆ¤·ôÉÏµÄÎÂÇé
-- ËûµÄÇ×ÎÇÏñÄñÈºÔÚÌì¿ÕÂÓ¹ı
-- ËûÔÚËıÉíÌåÀïÃæµÄ±©ìåºÍ·Å×İ
-- ËûÈëË¯Ê±ºòµÄÑù×Ó³äÂú´¿Õæ
-- Ëı¼ÇµÃ£¬Çå³¿ËıĞÑ¹ıÀ´µÄÒ»¿Ì£¬ËûÔÚËıµÄÉí±ß
-- ËıÕö×ÅÑÛ¾¦£¬¿´Êï¹âÍ¸¹ı´°Á±Ò»µãÒ»µãµØÕÕÉä½øÀ´
-- ËıµÄĞÄÀïÒòÎªĞÒ¸£¶øÌÛÍ´

-- ======================================================

-- ±í¸ñÎÄ¼şÀàµÄÖ§³Ö
Include("\\script\\class\\ktabfile.lua");

tabNpc    = new(KTabFile, "\\settings\\task\\collection\\npc.txt");
tabGoods  = new(KTabFile, "\\settings\\task\\collection\\goods.txt");

-- ÎïÆ·ÊÕ¼¯Ä£°æ£º{½±Àø¼Ó³ËÖµ£¬µÈ¼¶1£¬µÈ¼¶2...}
collMode  = {
	
	{3, 1,1},
	
	{3, 1,1,1},
	
	{3.5, 1,1,2},
	
	{3.5, 1,2,2},

	{2.5, 2,2,2},
	
	{2.5, 1,1,3},

	{3, 1,3,4},

	{2.5, 2,2,3},

	{3, 2,3,4},

	{2, 2,3,5},

	{2, 3,4,5},

}


-- ÌØÊâ½±ÀøµÄÊı×é
speAward  = {

	{"Kim Linh th¹ch", 2,13,1},
	{"Méc Linh th¹ch", 2,13,2},
	{"Thñy Linh th¹ch", 2,13,3},
	{"Háa Linh th¹ch", 2,13,4},
	{"Thæ Linh th¹ch", 2,13,5},

}

-- È«¾Ö±äÁ¿ID¶¨Òå

ID_COLLMODE = 99     -- ËùÒªÊÕ¼¯ÎïÆ·µÄÄ£°æ

ID_COLLNUM = 100;    -- ËùÒªÊÕ¼¯ÎïÆ·ÀàĞÍµÄÊıÁ¿ 

ID_COLL1_IDS = 101;  -- µÚ 1 ¸öËùÒªÊÕ¼¯ÎïÆ·µÄ ID
ID_COLL1_NUM = 102;  -- µÚ 1 ¸öËùÒªÊÕ¼¯ÎïÆ·µÄ ÊıÁ¿

ID_COLL2_IDS = 103;  -- µÚ 2 ¸öËùÒªÊÕ¼¯ÎïÆ·µÄ ID
ID_COLL2_NUM = 104;  -- µÚ 2 ¸öËùÒªÊÕ¼¯ÎïÆ·µÄ ÊıÁ¿

ID_COLL3_IDS = 105;  -- µÚ 3 ¸öËùÒªÊÕ¼¯ÎïÆ·µÄ ID
ID_COLL3_NUM = 106;  -- µÚ 3 ¸öËùÒªÊÕ¼¯ÎïÆ·µÄ ÊıÁ¿

ID_COLL_NPC  = 107;  -- ÈËÎïID

ID_COLL_STATE = 108; -- ÊÀ½çÊÕ¼¯ÈÎÎñµÄ×´Ì¬£¬ 1 ÎªÒÑ¾­¿ªÊ¼£¬2 ÎªÒÑ¾­¹Ø±Õ

ID_COLL_TIME  = 109; -- ÊÀ½çÊÕ¼¯ÈÎÎñ¿ªÊ¼Ê±µÄÊ±¼ä£¬¸ñÊ½Îª Äê/ÔÂ/ÈÕ/Ê±/·Ö

ID_ABS_TIME   = 110; -- ¼ÇÂ¼ÁËÊÕ¼¯ÈÎÎñ¿ªÊ¼Ê±´Ó 1970 Äê 1 ÔÂ 1 ÈÕ¿ªÊ¼ÒÔÀ´Ëù¾­ÀúµÄÃëÊı

-- Íæ¼Ò¸öÈË±äÁ¿¶¨Òå

PLAYER_COLLTIME = 586;  -- Íæ¼ÒÉÏ´Î×öµÄÊ±¼ä
PLAYER_DONUM    = 587;  -- Íæ¼ÒÀÛ»ıÒÑ¾­Íê³ÉµÄ´ÎÊı

-- ´ÓNPCÁĞ±íÖĞÑ¡ÔñÒ»¸ö NPC ID
function selectNpc()

local nRow = random(3, tabNpc:getRow());

local nNpcID  = tonumber(tabNpc:getCell(nRow, "NpcID"));

	return nNpcID;

end;


-- Ñ¡ÔñÒ»¸öÊÕ¼¯Ä£°æ£¬·µ»ØÊÕ¼¯Ä£°æµÄË÷Òı
function selectCollectModel()

	return random(1, getn(collMode));

end;


-- ¸ù¾İÄÑ¶ÈµÈ¼¶À´Ñ¡ÔñÒ»¸öËùÒªÊÕ¼¯µÄÎïÆ·
-- ·µ»ØÖµ£ºÎïÆ· ID¡¢ÎïÆ·µÄÊıÁ¿
function selectCollectItem(nLevel)

local aryLevel = getLevelArray(nLevel);
local nID      = aryLevel[random(1, getn(aryLevel))];
local nRow     = tabGoods:selectRowNum("GoodsID", nID);

local nNum     = random(tonumber(tabGoods:getCell(nRow, "Num_Min")),
						tonumber(tabGoods:getCell(nRow, "Num_Max"))
						);


	return nID, nNum;

end;


-- ¸ù¾İ´«ÈëµÄÎïÆ·µÈ¼¶À´¹¹ÔìÒ»¸öÊı×é
function getLevelArray(nLevel)

local aryLevel = {};
local i=0;

	for i=3, tabGoods:getRow() do
--		print ( tonumber(tabGoods:getCell(i, "Level")) );
		if tonumber(tabGoods:getCell(i, "Level"))==nLevel then
			tinsert(aryLevel, tonumber(tabGoods:getCell(i, "GoodsID")));
		end;
	end;
	
	return aryLevel;

end;


-- ¿ªÊ¼´´½¨Ò»¸öÊÕ¼¯»î¶¯µÄËùÓĞÊı¾İ
function createCollecEvent()

-- µÃµ½Ò»¸ö NPC ID
local nNpcID     = selectNpc();

-- È¡µÃÒ»¸öÎïÆ·ÊÕ¼¯µÄÄ£°æ
local nModel     = selectCollectModel();

-- ËùĞèÒªÊÕ¼¯ÎïÆ·IDµÄÊıÁ¿
local nCollNum   = getn(collMode[nModel])-1;

-- ËùÒªÊÕ¼¯ÎïÆ·µÄÊı×é£¬×î´ó²»³¬¹ı 3 ¸ö
local aryColl    = {{0,0},{0,0},{0,0}}

local tempID, tempNum = 0,0;

local i,j=0,0;

	for i=2, getn(collMode[nModel]) do
		j = j + 1;
		tempID,tempNum = selectCollectItem(collMode[nModel][i]);
		aryColl[j][1] = tempID;
		aryColl[j][2] = tempNum;
	end;


	collectDataIncept(nNpcID,
					  nModel, 
					  nCollNum,
					  aryColl[1][1], 
					  aryColl[1][2], 
					  aryColl[2][1], 
					  aryColl[2][2],
					  aryColl[3][1],
					  aryColl[3][2]);

end;


function collectDataIncept(nNpcID, nModel, nCollNum, nItem_1, nNum_1, nItem_2, nNum_2, nItem_3, nNum_3)


-- µÃµ½ NPC µÄĞĞÊı
local nNpcRow    = tabNpc:selectRowNum("NpcID", nNpcID);

-- µÃµ½µØÍ¼µÄ±àºÅ
local nMapID     = tonumber(tabNpc:getCell(nNpcRow, "MapID"));

-- µÃµ½ NPC µÄÖĞÎÄÃû
local strNpcName = tabNpc:getCell(nNpcRow, "NpcName");

-- µÃµ½µØÍ¼µÄÖĞÎÄÃû
local strMapName = tabNpc:getCell(nNpcRow, "NpcMap");

-- µÃµ½µÚÒ»¸öÎïÆ·µÄĞĞÊı
local nItemRow = tabGoods:selectRowNum("GoodsID", nItem_1);

-- µÃµ½µÚÒ»¸öÎïÆ·µÄÃû×Ö
local strItemName = tabGoods:getCell(nItemRow, "Text");

--	AddGlobalNews("Î»ÓÚ"..strMapName.."µÄ"..strNpcName.."ÌØÏò¹ã´óÍæ¼ÒÊÕ¼¯");

	--print ("Î»ÓÚ"..strMapName.."µÄ"..strNpcName.."ÌØÏò¹ã´óÍæ¼ÒÊÕ¼¯"..strItemName.."µÈÎïÆ·£¡");
	
		Msg2SubWorld("Giang hå x«n xao, "..strMapName.."-"..strNpcName.." mong c¸c hiÖp kh¸ch gióp thu thËp c¸c lo¹i "..strItemName..", nÕu hoµn thµnh trong 30 phót sÏ ®­îc "..strNpcName.." träng th­ëng!");
		
--	AddGlobalNews("ºÃÏûÏ¢£¬ºÃÏûÏ¢£¡Î»ÓÚ"..strMapName.."µÄ"..strNpcName.."ÌØÏò¹ã´óÍæ¼ÒÊÕ¼¯"..strItemName.."µÈÎïÆ·£¡");

	-- ÉèÖÃÈ«¾Ö±äÁ¿
	SetGlbValue(ID_COLL_NPC,   nNpcID);
	
	SetGlbValue(ID_COLLMODE,   nModel);
	
	SetGlbValue(ID_COLLNUM,    nCollNum);
	
	SetGlbValue(ID_COLL1_IDS,  nItem_1);
	SetGlbValue(ID_COLL1_NUM,  nNum_1);
	
	SetGlbValue(ID_COLL2_IDS,  nItem_2);
	SetGlbValue(ID_COLL2_NUM,  nNum_2);
	
	SetGlbValue(ID_COLL3_IDS,  nItem_3);
	SetGlbValue(ID_COLL3_NUM,  nNum_3);
	
	-- ¼ÇÂ¼ÊÕ¼¯»î¶¯µÄ¿ªÊ¼Ê±¼ä£ºÄê/ÔÂ/ÈÕ/Ê±/·Ö
	SetGlbValue(ID_COLL_TIME,  tonumber(date("%y")..date("%m")..date("%d")..date("%H")..date("%M")) );
	
	-- ¼ÇÂ¼ÁËÊÕ¼¯ÈÎÎñ¿ªÊ¼Ê±´Ó 1970 Äê 1 ÔÂ 1 ÈÕ¿ªÊ¼ÒÔÀ´Ëù¾­ÀúµÄÃëÊı
--	SetGlbValue(ID_ABS_TIME, GetAbsTime());	
	
	-- ±ê¼ÇÊÕ¼¯ÈÎÎñÒÑ¾­¿ªÊ¼
	SetGlbValue(ID_COLL_STATE, 1);

end;


-- ¼ì²âµ±Ç°µÄÈËÎïÊÇ·ñÎªÖ¸¶¨µÄÊÕ¼¯ÈËÎï
-- ³É¹¦Ôò·µ»Ø 1£¬Ê§°Ü·µ»Ø 0
function checkCollectNpc(nMapID, strName)

local glb_NpcID = GetGlbValue(ID_COLL_NPC);

	if glb_NpcID==0 then return 0; end; -- Èç¹û NPC ±àºÅÎª 0 Ôò·µ»ØÊ§°Ü

local nNpcRow   = tabNpc:selectRowNum("NpcID", glb_NpcID);

local nNeedMapID = tonumber(tabNpc:getCell(nNpcRow, "MapID"));

local strNeedName = tabNpc:getCell(nNpcRow, "NpcName");

	-- µØÍ¼·ûºÏ¡¢ÈËÎï·ûºÏ¡¢ÊÕ¼¯Õı¿ªÆôÕâÈı¸ö×´Ì¬È«·ûºÏ²Å·µ»Ø 1
	if nMapID==nNeedMapID and strName==strNeedName and GetGlbValue(ID_COLL_STATE)==1 then
		return 1;
	else
		return 0;
	end;

end;


-- ¼ì²âÍæ¼ÒÉíÉÏÊÇ·ñÒÑ¾­´øÓĞ×ã¹»µÄÎïÆ·
-- Èç¹ûÉíÉÏ´øÓĞÏàÓ¦ÎïÆ·ÔòÖ±½ÓÉ¾³ı£¬²¢·µ»Ø 1£¬Èç¹ûÃ»´ø·ûºÏÒªÇóÔò·µ»Ø 0
function checkCollectItem()

local nCollNum = GetGlbValue(ID_COLLNUM);

local nItem_1  = GetGlbValue(ID_COLL1_IDS);
local nNum_1   = GetGlbValue(ID_COLL1_NUM);

local nItem_2  = GetGlbValue(ID_COLL2_IDS);
local nNum_2   = GetGlbValue(ID_COLL2_NUM);

local nItem_3  = GetGlbValue(ID_COLL3_IDS);
local nNum_3   = GetGlbValue(ID_COLL3_NUM);

local aryColl_ID = {{nItem_1, nNum_1},
				    {nItem_2, nNum_2},
				    {nItem_3, nNum_3}
				   }

local aryColl_Code = {};
					  
local nGenre, nDetail, nParticular, nNum = 0,0,0,0;
local nRow = 0;
local nCheck = 0;
local i=0;

	for i=1, nCollNum do
		nRow         = tabGoods:selectRowNum("GoodsID", aryColl_ID[i][1]);
		nGenre       = tonumber(tabGoods:getCell(nRow, "Genre"));
		nDetail      = tonumber(tabGoods:getCell(nRow, "Detail"));
		nParticular  = tonumber(tabGoods:getCell(nRow, "Particular"));
		nNum         = aryColl_ID[i][2];
		if GetItemCount(nGenre, nDetail, nParticular)>=nNum then
			tinsert(aryColl_Code, {nGenre, nDetail, nParticular, nNum});
			nCheck = nCheck + 1;
		end;
	end;
	
	-- Èç¹ûÈ«²¿ÎïÆ··ûºÏÔòÉ¾³ı
	if nCheck==nCollNum then
		for i=1, getn(aryColl_Code) do
			DelItem(aryColl_Code[i][1],
					aryColl_Code[i][2],
					aryColl_Code[i][3],
					aryColl_Code[i][4]);
		end;
		return 1;
	else
		return 0;
	end;

end;


-- ¸øÍæ¼Ò·¢Óè½±Àø
function payCollectAward()

-- µÃµ½ NPC ID
local nNpcID      = GetGlbValue(ID_COLL_NPC);

-- µÃµ½ NPC µÄĞĞÊı
local nNpcRow    = tabNpc:selectRowNum("NpcID", nNpcID);

-- µÃµ½ NPC µÄÖĞÎÄÃû
local strNpcName = tabNpc:getCell(nNpcRow, "NpcName");

local nModel      = GetGlbValue(ID_COLLMODE);

local nValueBasic = countCollectAward();

-- ¸ù¾İÄÑ¶ÈÏµÊı×ö½±Àø¼Ó³Ë
local nPayValue   = floor(nValueBasic * collMode[nModel][1] * 3.5);

local nSpe        = 0;

	Earn(nPayValue);
	
	if GetTask(PLAYER_DONUM) == 1 then
		local nAdd,nIdx = AddItem(2,1,1012,1,4);
		SetItemExpireTime(nIdx,3600*72);
		Say("<color=green>"..strNpcName.."<color>: B»ng h÷u rÊt giái! Trong nh¸y m¾t ®· thu thËp ®ñ thø ta cÇn! §©y lµ <color=yellow>"..nPayValue.."<color> ®ång! Mçi ngµy, lÇn ®Çu tiªn gióp ta, ta sÏ tÆng ng­¬i 1 <color=yellow>Bång Lai Tiªn Thuû (kh«ng thÓ giao dŞch, thêi h¹n 3 ngµy)<color>. LÇn sau nhÊt ®Şnh ta sÏ ®Õn gióp ng­¬i.", 0);		
	else
		Say("<color=green>"..strNpcName.."<color>: B»ng h÷u rÊt giái! Trong nh¸y m¾t ®· thu thËp ®ñ thø ta cÇn! §©y lµ <color=yellow>"..nPayValue.."<color> tiÒn ®ång phÇn th­ëng cña b»ng h÷u! LÇn sau ta nhÊt ®Şnh sÏ t×m b»ng h÷u gióp ®ì.", 0);
	end	
	-- 15% µÄ¼¸ÂÊµÃµ½ÌØÊâ½±Àø
--	if random(1,100)<=15 then
--	
--		return
--	
--	else
--		
--		nSpe = random(1, getn(speAward));
--		AddItem(speAward[nSpe][2],
--				speAward[nSpe][3],
--				speAward[nSpe][4],
--				1);
--		
--		Say("<color=green>"..strNpcName.."<color>£ºÌ«ºÃÁË£¬ÎÒ±éÑ°²»×ÅµÄ¶«Î÷¶¼ÄÜ¸øÄãÕÒµ½£¬²»¼òµ¥£¬²»¼òµ¥°¡£¡ÕâÊÇ´ğĞ»ÄãµÄ <color=yellow>"..nPayValue.."<color> ¸öÍ­Ç®ÒÔ¼°ÎÒ¼èÄÑËÑ¼¯»ØÀ´µÄÒ»¸ö <color=yellow>"..speAward[nSpe][1].."<color>¡£ÏÂ´ÎÎÒÒ»¶¨»áÔÙÕÒÄã°ïÃ¦µÄ¡£", 0);
--		return
--		
--	end;
	
end;


-- ¹Ø±Õµ±Ç°ÊÀ½çµÄÊÕ¼¯»î¶¯
function closeCollectEvent()
	-- ±ê¼ÇÊÕ¼¯ÈÎÎñÒÑ¾­½áÊø
	SetGlbValue(ID_COLL_STATE, 0);
end;


-- ¼ÆËã±¾´ÎÊÕ¼¯Ò»¹²¿É»ñµÃ¶àÉÙ»ù´¡½±Àø
function countCollectAward()

local nCollNum = GetGlbValue(ID_COLLNUM);

local aryColl_ID = createCollectArray();

local nValue, nTotalValue = 0,0;
local i=0;

	for i=1, nCollNum do
		nRow         = tabGoods:selectRowNum("GoodsID", aryColl_ID[i][1]);
		-- »ù´¡¼ÛÖµ  = ÎïÆ·ÊÛ¼Û * ÊıÁ¿
		nValue       = tonumber(tabGoods:getCell(nRow, "Value")) * aryColl_ID[i][2];
		nTotalValue = nTotalValue + nValue;
	end;
	
	return nTotalValue;

end;


-- ¸ù¾İÈ«¾Ö±äÁ¿¹¹ÔìÒ»¸öÊÕ¼¯ÈÎÎñµÄÊı×é
function createCollectArray()

local nItem_1  = GetGlbValue(ID_COLL1_IDS);
local nNum_1   = GetGlbValue(ID_COLL1_NUM);

local nItem_2  = GetGlbValue(ID_COLL2_IDS);
local nNum_2   = GetGlbValue(ID_COLL2_NUM);

local nItem_3  = GetGlbValue(ID_COLL3_IDS);
local nNum_3   = GetGlbValue(ID_COLL3_NUM);

local aryColl_ID = {{nItem_1, nNum_1},
				    {nItem_2, nNum_2},
				    {nItem_3, nNum_3}
				   }
				   
	return aryColl_ID;

end;


-- ¹¹ÔìÒ»¸öÈËÎïËùËµµÄ¶Ô»°
function createCollectTalk(strName)

	Talk(1, "", "T¹i h¹ kh«ng cßn g× ®Ó cho ®¹i hiÖp n÷a råi !!!!")
	do return end
-------------
local aryColl_ID = createCollectArray();

local nCollNum = GetGlbValue(ID_COLLNUM);

local strItem, strItemSay, strMain = "", "", "";

local i=0;

	for i=1, nCollNum do
		nRow         = tabGoods:selectRowNum("GoodsID", aryColl_ID[i][1]);
		strItem      = tabGoods:getCell(nRow, "Text");
		strItemSay   = strItemSay.."<color=yellow>"..aryColl_ID[i][2].."<color> <color=yellow>"..strItem.."<color><enter>";
	end;
	
	strMain = "<color=green>"..strName.."<color>: Ta rÊt thİch s­u tÇm vËt phÈm l¹! B»ng h÷u cã thÓ gióp ta kh«ng? ChØ cÇn gióp ta <color=yellow>3 lÇn<color>, sÏ cã thï lao c¶m t¹!<enter>"..strItemSay;
	
	Say(strMain,
		2,
		"Ta ®· t×m ®­îc thø ng­êi cÇn, ng­êi ®Şnh ®Òn ¬n ta thÕ nµo?/_AccCollectCall",
		"§i mÖt th× ngåi nghØ nh­ng viÖc ®ã ®èi víi ta lµ kh«ng thÓ./Main_Exit");

end;



function _AccCollectCall()

-- µÃµ½ NPC ID
local nNpcID      = GetGlbValue(ID_COLL_NPC);

-- µÃµ½ NPC µÄĞĞÊı
local nNpcRow    = tabNpc:selectRowNum("NpcID", nNpcID);

-- µÃµ½ NPC µÄÖĞÎÄÃû
local strNpcName = tabNpc:getCell(nNpcRow, "NpcName");

local nGlobalTime = GetGlbValue(ID_COLL_TIME);

	-- Èç¹ûÍ¬Ò»Ê±¼äÄÚ³¬¹ı 3 ´ÎÁË£¬Ôò²»ÄÜÔÙ×ö
	--ĞŞ¸ÄÎªÃ¿ÌìÖ»ÄÜ×ö3´Î edited by vivi
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(PLAYER_COLLTIME)>=nDate and GetTask(PLAYER_DONUM)>=3 then
		Say("<color=green>"..strNpcName.."<color>: H«m nay thiÕu hiÖp ®· gióp ta 3 lÇn liªn tiÕp, thËt kh«ng d¸m lµm phiÒn n÷a. Xin ®a t¹ thiÕu hiÖp, ta sÏ nhê ng­êi kh¸c vËy! Ngµy mai thiÕu hiÖp l¹i ®Õn nhĞ!", 0);
		return
	end;
	
	if GetTask(PLAYER_COLLTIME) < nDate then
		SetTask(PLAYER_COLLTIME, nDate);
		SetTask(PLAYER_DONUM, 0);
	end;	
	
	if checkCollectItem()==1 then
--		SetTask(PLAYER_COLLTIME, nGlobalTime);
		SetTask(PLAYER_DONUM, GetTask(PLAYER_DONUM)+1);
		payCollectAward();
	else
		Say("<color=green>"..strNpcName.."<color>: Nh×n ng­¬i trÎ thÕ mµ ®Şnh g¹t phÇn th­ëng cña ta. Ta tuy ch©n yÕu nh­ng m¾t ch­a hoa mµ!", 0);
	end;

end;

-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êı
function Main_Exit()

end;
