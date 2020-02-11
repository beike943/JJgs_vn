Include("\\script\\lib\\globalfunctions.lua");
TB_GUINSECT_INFO = 
{
	[1] = 
	{
		["name"] = "cæ  ",
		[1] = {"cæ",1},
	},
	[2] = 
	{
		["name"] = "§éc hÖ",
		[1] = {"§éc cæ",2},	
		[2] = {"M·nh ®éc cæ",3},	
		[3] = {"§éc yªu cæ",4},
		[4] = {"Yªu cæ",14},
		[5] = {"Thùc Yªu Cæ",15},	
		[6] = {"Yªu Hoµng Cæ",16},
	},
	[3] = 
	{
		["name"] = "HuyÕt hÖ",
		[1] = {"HuyÕt cæ",5},	
		[2] = {"ThÞ huyÕt cæ",6},	
		[3] = {"HuyÕt Tinh cæ",7},	
		[4] = {"HuyÔn Cæ",20},	
		[5] = {"B¨ng HuyÔn Cæ",21},	
		[6] = {"Vong Tiªn cæ",22},	
	},
	[4] = 
	{
		["name"] = "Linh hÖ",
		[1] = {"T©m cæ",17},	
		[2] = {"Thùc T©m Cæ",18},	
		[3] = {"T©m S¸t cæ",19},	
		[4] = {"H­¬ng cæ",8},	
		[5] = {"Mª h­¬ng cæ",9},	
		[6] = {"§Ò Hå cæ",10},	
		[7] = {"Linh cæ",26},	
		[8] = {"Linh Lung cæ",27},	
		[9] = {"ThÊt Th¸i TiÓu Tiªn Cæ",28},		
	},
	[5] = 
	{
		["name"] = "Ma hÖ",
		[1] = {"Thi cæ",11},	
		[2] = {"Tam thi cæ",12},	
		[3] = {"Quú V­¬ng cæ",13},	
		[4] = {"Tµm cæ",23},	
		[5] = {"HuyÕt Tµm cæ",24},	
		[6] = {"Kim Tµm cæ",25},	
		[7] = {"Ma cæ",29},	
		[8] = {"U ¶nh cæ",30},
		[9] = {"V« ¶nh Ma Cæ",31},	
	},
}

GU_INSECT_ID1 = 2;	--¹ÆµÄÎïÆ·ID1
GU_INSECT_ID2 = 17;	--¹ÆµÄÎïÆ·ID2

TSK_BASE_ID = 2201;	--2201ÖÁ2240¹²£´£°¸ö±äÁ¿
TSK_BASE_ID_LAST = 2240;--ÓµÓÐµÄ×îºóÒ»¸öÈÎÎñ±äÁ¿
TSK_TEMP_ID = 126;	--¼ÇÂ¼È¡³öµÄ¹ÆµÄID£¬Õâ¸ö±äÁ¿ºÍÂé½«Ïä×ÓµÄÁÙÊ±±äÁ¿ÊÇÒ»ÑùµÄ£¬²»¹ý¿ÉÒÔÖØÓÃ

MAX_SEL_PER_PAGE = 5;	--Ã¿Ò³×î´óÏÔÊ¾ÊýÁ¿

g_szInfoHeader = "<color=green>ThÇn méc v­¬ng ®Ønh<color>: ";

function OnUse()
	local selTab = {
				"B¾t s©u /get_guinsect",
				"Bá s©u vµo trong ®Ønh/put_guinsect",
				"ChØ xem ë d­íi ®Ønh/nothing",
				}
	Say(g_szInfoHeader.."§Ønh nµy chøa c¸c lo¹i s©u trong thiªn h¹, ng­¬i muèn b¾t s©u hay th¶ s©u?",getn(selTab),selTab);
end;
--È¡³ö¹Æ
function get_guinsect()
	local selTab = {};
	local nGuInsectNum = 0;
	for i=1,getn(TB_GUINSECT_INFO) do
		nGuInsectNum = get_guinsect_num(i);
		tinsert(selTab,TB_GUINSECT_INFO[i]["name"].."("..nGuInsectNum.." con)/#select_guinsect("..i..")");
	end;
	tinsert(selTab,"\nT¹m thêi kh«ng b¾t/OnUse");
	Say(g_szInfoHeader.."Ng­¬i muèn b¾t hÖ s©u nµo?",getn(selTab),selTab);
end;
--Ñ¡Ôñ¹Æ
function select_guinsect(nType)
	list_page(1,nType);
end;
--ÁÐ³ö¿É¹©Ñ¡ÔñµÄ¹Æ
function list_page(nPageNum,nType)
	local tbSelTab = get_select_list(nType);
	local nRecordCount = getn(TB_GUINSECT_INFO[nType]);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbSelTab[i]);
	end;
	local szCmdStr = "";
	if nPageNum ~= 1 then
		szCmdStr = "Trang tr­íc/#list_page("..(nPageNum-1)..","..nType..")";
		tinsert(selTab,szCmdStr);
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		szCmdStr = "Trang kÕ/#list_page("..(nPageNum+1)..","..nType..")";
		tinsert(selTab,szCmdStr);	
	end;
	tinsert(selTab,"\nT¹m thêi kh«ng b¾t/get_guinsect");
	Say(g_szInfoHeader.."Ng­¬i b¾t lo¹i s©u nµo?",getn(selTab),selTab);
end;
--»ñµÃÑ¡ÏîÊý¾Ý
function get_select_list(nType)
	local tbSelTab = {};
	local nCurNum = 0;
	local nGuInsectID = 0;
	local nTaskID = 0;
	for i=1,getn(TB_GUINSECT_INFO[nType]) do
		nGuInsectID = TB_GUINSECT_INFO[nType][i][2];
		nTaskID = TSK_BASE_ID+nGuInsectID-1;
		nCurNum = GetTask(nTaskID);
		szCmdStr = gf_FormatStringLength(TB_GUINSECT_INFO[nType][i][1],10).."("..nCurNum.." con)/#input_guinsect_num("..nType..","..i..","..nCurNum..")";
		tinsert(tbSelTab,szCmdStr);
	end;
	return tbSelTab;
end;
--ÊäÈëÈ¡³öÊýÁ¿
function input_guinsect_num(nType,nDetailType,nCurNum)
	local nGuInsectID = TB_GUINSECT_INFO[nType][nDetailType][2];
	local szGuInsectName = TB_GUINSECT_INFO[nType][nDetailType][1];
	if nCurNum <= 0 then
		Talk(1,"get_guinsect",g_szInfoHeader.."Trong ®Ønh cña ng­¬i kh«ng cã lo¹i s©u <color=yellow>"..szGuInsectName.."<color>.");
		return 0;
	end;
	SetTaskTemp(TSK_TEMP_ID,nGuInsectID);
	nCurNum = min(nCurNum,15000);	--×î¶àÒ»´ÎÈ¡£¹£°£°Ö»
	AskClientForNumber("get_guinsect_callback",1,nCurNum,"NhËp sè l­îng b¾t:");
end;
--»Øµ÷
function get_guinsect_callback(nNum)
	local nGuInsectID = GetTaskTemp(TSK_TEMP_ID);
	local nTaskID = TSK_BASE_ID+nGuInsectID-1;
	local nCurGuInsectNum = GetTask(nTaskID);
	local nType,nDetailType = get_guinsect_info_idx(nGuInsectID);
	if nType == 0 then
		return 0;
	end;
	if gf_JudgeRoomWeight((floor(nNum/1000)+1),10) ~= 1 then
		return 0;
	end;
	local szGuInsectName = TB_GUINSECT_INFO[nType][nDetailType][1];
	if nCurGuInsectNum < nNum then
		Talk(1,"get_guinsect",g_szInfoHeader.."Sè l­îng trong ®Ønh"..szGuInsectName.." kh«ng ®ñ "..nNum.." con.");
		return 0;
	end;
	AddGuInsectIntoBottle(nGuInsectID,-nNum);
	AddItem(GU_INSECT_ID1,GU_INSECT_ID2,nGuInsectID,nNum);
	Msg2Player("B¹n lÊy ra "..nNum.." con"..szGuInsectName);
	select_guinsect(nType);
end;
--¸ù¾Ý¹ÆµÄID»ñµÃ¹ÆµÄÐÅÏ¢Ë÷Òý
function get_guinsect_info_idx(nID)
	for i=1,getn(TB_GUINSECT_INFO) do
		for j=1,getn(TB_GUINSECT_INFO[i]) do
			if TB_GUINSECT_INFO[i][j][2] == nID then
				return i,j;
			end;
		end;
	end;
	return 0,0;
end;
--»ñµÃÄ³Àà¹ÆµÄÊýÁ¿
function get_guinsect_num(nType)
	local nTotalNum = 0;
	local nGuInsectID = 0;
	local nTaskID = 0;
	for i=1,getn(TB_GUINSECT_INFO[nType]) do
		nGuInsectID = TB_GUINSECT_INFO[nType][i][2];
		nTaskID = TSK_BASE_ID+nGuInsectID-1;
		nTotalNum = nTotalNum + GetTask(nTaskID);
	end;
	return nTotalNum;
end;
--´æÈëÉíÉÏËùÓÐµÄ¹Æ
function put_guinsect()
	local nGuInsectNum = 0;
	local nGuInsectID = 0;
	local nTaskID = 0;
	local szGuInsectName = "";
	for i=1,getn(TB_GUINSECT_INFO) do
		for j=1,getn(TB_GUINSECT_INFO[i]) do
			nGuInsectID = TB_GUINSECT_INFO[i][j][2];
			nTaskID = TSK_BASE_ID+nGuInsectID-1;
			szGuInsectName = TB_GUINSECT_INFO[i][j][1];
			nGuInsectNum = GetItemCount(GU_INSECT_ID1,GU_INSECT_ID2,nGuInsectID);
			if nGuInsectNum > 0 then
				if DelItem(GU_INSECT_ID1,GU_INSECT_ID2,nGuInsectID,nGuInsectNum) == 1 then
					AddGuInsectIntoBottle(nGuInsectID,nGuInsectNum);
					Msg2Player("B¹n ®em "..nGuInsectNum.."c¸i"..szGuInsectName.." bá vµo trong ®Ønh");
				end;
			end;
		end;
	end;
	Say("B¹n ®· ®em tÊt c¶ s©u cã trong tói bá vµo trong ®Ønh!",0);
end;

function nothing()

end;

--=================================================================================
--ÒÔÏÂÁ½½Ó¿Ú¹©³ÌÐòµ÷ÓÃ
--¸Ä±ä¹Æ¶¦ÖÐÄ³ÖÖ¹ÆµÄÊýÁ¿
--nNumÎªÕýÊ±ÊÇÔö¼Ó£¬Îª¸ºÊ±ÊÇ¼õÉÙ
function AddGuInsectIntoBottle(nID,nNum)
	local nTaskID = TSK_BASE_ID+nID-1;
	if nTaskID > TSK_BASE_ID_LAST then
		print(format("\n*********AddGuInsectIntoBottle(nID=%d,nNum%d) error nID must<=%d ",nID,nNum,TSK_BASE_ID_LAST-TSK_BASE_ID+1))
		return
	end
	local nCur=GetTask(nTaskID)
	local nCurNum = nCur+nNum;
	SetTask(nTaskID,nCurNum);
	SyncGuInsectNumInGuDing(nID,nCurNum);
	return 1;
end;
--´Ó¹Æ¶¦ÖÐÉ¾³ýÄ³ÖÖ¹Æ
function RemoveGuInsectFromBottle(nID,nNum)
	local nTaskID = TSK_BASE_ID+nID-1;
	local nCurNum = GetTask(nTaskID);
	if nCurNum >= nNum then	--Èç¹û¶¦ÀïÃæµÄÊýÁ¿×ã¹»ÁË
		SetTask(nTaskID,nCurNum-nNum);
		SyncGuInsectNumInGuDing(nID,nCurNum-nNum);
		return 1;
	else
		local nGuNumInBag = GetItemCount(GU_INSECT_ID1,GU_INSECT_ID2,nID);	--»ñµÃ°üÀïÃæµÄÊýÁ¿
		if nCurNum + nGuNumInBag >= nNum then	--Èç¹û¶¦ÀïÃæ¼Ó°üÀïÃæµÄÊýÁ¿×ã¹»
			if DelItem(GU_INSECT_ID1,GU_INSECT_ID2,nID,nNum-nCurNum) == 1 then
				SetTask(nTaskID,0);
				SyncGuInsectNumInGuDing(nID,0);
				return 1;
			else
				return 0;
			end;
		else
			return 0;
		end;
	end;
	return 1;
end;
--»ñµÃ¹Æ¶¦ÖÐºÍ±³°üÖÐ¿ÉÓÃµÄ¸ÃÀà¹Æ³æÊýÁ¿
function GetAvailableGuInsectNum(nID)
	local nTaskID = TSK_BASE_ID+nID-1;
	return GetItemCount(GU_INSECT_ID1,GU_INSECT_ID2,nID) + GetTask(nTaskID);
end;
