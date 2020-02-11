
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ĞÂÊÖÎÊ´ğ¹¦ÄÜÍ·ÎÄ¼ş
-- Edited by peres
-- 2005/04/12 PM 16:38

-- ¿´¼ûµÄ  Ï¨ÃğÁË
-- ÏûÊ§µÄ  ¼Ç×¡ÁË
-- ÎÒÕ¾ÔÚ  º£½ÅÌìÑÄ
-- Ìı¼û    ÍÁÈÀÃÈÑ¿
-- µÈ´ı    ê¼»¨ÔÙ¿ª
-- °Ñ·Ò·¼  Áô¸øÄê»ª
-- ±Ë°¶    Ã»ÓĞµÆËş
-- ÎÒÒÀÈ»  ÕÅÍû×Å
-- ÌìºÚ    Ë¢°×ÁËÍ··¢
-- ½ôÎÕ×Å  ÎÒ»ğ°Ñ
-- ËûÀ´    ÎÒ¶Ô×Ô¼ºËµ
-- ÎÒ²»º¦ÅÂ
-- ÎÒºÜ°®Ëû

-- lyrics : ±Ë°¶»¨

-- ======================================================

-- ±í¸ñÎÄ¼şÀàµÄÖ§³Ö
Include("\\script\\class\\ktabfile.lua");

-- /////////////////// È«¾Öº¯Êı´¦ÀíÇø ////////////////////

-- ¶ÁÈëÎÊÌâ±í¸ñÎÄ¼ş
tabFile = new(KTabFile, "\\settings\\new_question.txt");

-- /////////////////// È«¾Ö±äÁ¿ÉùÃ÷Çø ////////////////////

-- ¼ÇÂ¼µ±Ç°ÎÊ´ğÌâËùÔÚ±í¸ñÎÄ¼şµÄĞĞÊı
QA_NOWROW = 1012;
-- ¼ÇÂ¼Íæ¼ÒÒÑ¾­»Ø´ğµÄÎÊÌâÊı
QA_FINISHNUM = 1013;
-- ¼ÇÂ¼Íæ¼ÒÃ¿¸öÎÊÌâ»Ø´ğµÄ¶Ô´í×´Ì¬
QA_RIGHTSTATE = 1016;
-- ¼ÇÂ¼Íæ¼ÒÈÎÎñ×´Ì¬µÄ±äÁ¿
QA_STATE = 1014;
-- ¼ÇÂ¼Ëæ»úÖÖ×ÓµÄ±äÁ¿
QA_RANDOMSEED = 1015;
-- Ã¿´Î¿Û³ıÍæ¼ÒµÄÌåÁ¦Öµ
QA_PAYSTAMINA = 5;
-- ×îĞ¡¿ÉÒÔ½øĞĞÈÎÎñµÄÌåÁ¦Öµ
QA_MINSTAMINA = 5;

-- ÓÃÓÚ¼ìË÷±í¸ñĞĞÊıºÍÈ¨ÖØµÄÊı×é
QA_RowRate = {};

-- »Ø´ğÎÊÌâ¶ÔÓë´íµÄ¹ı³ÌÃû£¬ÓÃÓÚ×éºÏ×Ö·ûÊı×é
QA_RightFunction = "/AnswerRight";
QA_ErrorFunction = "/AnswerError";
QA_ExitFunction = "Cho ta suy nghÜ chót ®·!/MainExit";
-- 
QA_TitleText = "<enter>";


-- ´Ó±í¸ñÎÄ¼şÖĞ¶ÁÈ¡Ã¿¸öÈÎÎñµÄÈ¨ÖØĞÎ³ÉÒ»¸öÊı×é
function CreateRateArry()

local nRow = tonumber(tabFile:getRow()); -- »ñÈ¡±í¸ñµÄ×ÜĞĞÊı

local i,j = 0,0;

	for i=2, nRow do
		j = j + 1;
		tinsert(QA_RowRate, getn(QA_RowRate) + 1, {i, tonumber(tabFile:getCell(i,"TaskRate"))});
	end;

end;


-- ´Ó»ñÈ¡µ½µÄÈÎÎñĞĞÊı´´½¨Ò»¸ö¶Ô»°½Å±¾
function CreateQuestion()

--randomseed(GetTask(QA_RANDOMSEED)); -- ÉèÖÃËæ»úÖÖ×Ó

local nRow = SelectQuestion(); -- Ëæ»úµÃµ½Ò»¸öÎÊÌâµÄĞĞÊı
local nKeyNum = tonumber(tabFile:getCell(nRow, "KeyNum")); -- µÃµ½´ğ°¸µÄ¸öÊı
local nKeyPos = tonumber(tabFile:getCell(nRow, "KeyPos")); -- µÃµ½ÕıÈ·´ğ°¸µÄÎ»ÖÃ

local strTitle = tabFile:getCell(nRow, "QuestionTitle"); -- ÎÊÌâµÄ±êÌâ×Ö·û

local strRead = ""; -- ÓÃÓÚÁÙÊ±¶ÁÈ¡±í¸ñÖĞµÄ×Ö·û´®

local strKey = {""}; -- ¹¹³É´ğ°¸µÄ×Ö·ûÊı×é
local strMain = {""}; -- ×îÖÕÊä³ö³É SAY º¯ÊıµÄ×Ö·û´®Êı×é

local i,j = 0,0;


	strMain[1] = QA_TitleText.."Tæng céng ng­¬i tr¶ lêi ®óng "..GetTask(QA_RIGHTSTATE).."  c©u hái! ".."§©y lµ c©u hái thø  "..(GetTask(QA_FINISHNUM) + 1).." :"..strTitle;

	for i=1, nKeyNum do
		strRead = tabFile:getCell(nRow, "Key"..i);
		if (nKeyPos==i) then
			strKey[i] = strRead..QA_RightFunction;			
		else
			strKey[i] = strRead..QA_ErrorFunction;
		end;
	end;
	
	-- ¶Ô´ğ°¸Êı×é½øĞĞÂÒĞò´¦Àí
	strKey = RandomArry(strKey);
	
	-- ÔÙÑ­»·Ò»´Î×îÖÕ×é³É¶Ô»°½Å±¾ËùĞèµÄ×Ö·û´®Êı×é
	for i=1, nKeyNum do
		tinsert(strMain, getn(strMain)+1, strKey[i]);
	end;
	
	tinsert(strMain, getn(strMain)+1, QA_ExitFunction);
	
	-- µ¯³öÑ¡Ôñ¶Ô»°¿ò
	SelectSay(strMain);
	
end;


-- ´Óµ±Ç°µÄÎÊÌâÁĞ±íÀïËæ»úÑ¡³öÒ»¸öÎÊÌâÀ´£¬·µ»ØÖµÎª¸ÃÎÊÌâµÄĞĞÊı
function SelectQuestion()

local nQuestionRow = 0; -- ×îºó»ñÈ¡µ½µÄ±í¸ñº¯Êı
local nTotalRate = 0; -- ËùÓĞÈ¨ÖØµÄ¼Ó×Ü
local nRandomRate = 0; -- Ëæ»úµÃµ½µÄÈ¨ÖØ
local nAddRate = 0; -- ÓÃÓÚËæ»ú¼Ó³ÉµÄ±äÁ¿

local i,j = 0,0;

	for i=1, getn(QA_RowRate) do
		nTotalRate = nTotalRate + QA_RowRate[i][2];
	end;
	
	nRandomRate = random(1,nTotalRate);
	
	for i=1, getn(QA_RowRate) do
	
		nAddRate = nAddRate + QA_RowRate[i][2];
	
		if (nAddRate >= nRandomRate) then
			nQuestionRow = QA_RowRate[i][1];
			SetTask(QA_NOWROW, nQuestionRow); -- ´¢´æ±äÁ¿
			return nQuestionRow;
		end;
	end;

end;


-- ¶ÔÒ»¸öÊı×éÀïÃæµÄÔªËØ½øĞĞÂÒĞò´¦Àí
function RandomArry(nArray)

local nNum = getn(nArray);
local nRanA, nRanB = 0,0; -- Á½¸ö½»»»µÄËæ»úÎ»ÖÃ
local i = 0;

local nChange; -- ÓÃÓÚÁÙÊ±½»»»µÄ±äÁ¿

	-- Èç¹ûÊı×éµÄÔªËØĞ¡ÓÚ 2 »òÕß´«ÈëµÄÆğÊ¼ºÍ½áÊøÎ»ÖÃ²»·ûµÄ»°ÄÇ¾ÍÖ±½Ó·µ»ØÔ­Ê¼ÖµÁË
	if (nNum<2) then
		return nArray;
	end;
	
	for i=1, nNum do
		nRanA = random(1, nNum);
		nRanB = random(1, nNum);
		nChange = nArray[nRanA];
		nArray[nRanA] = nArray[nRanB];
		nArray[nRanB] = nChange;
	end;
	
	return nArray;

end;


-- ÓÃÓÚ´¦ÀíÒ»¶ÑÑ¡ÏîµÄ¶Ô»°º¯Êı Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;

-- ÓÃÒÔ»ñÈ¡Íæ¼ÒµÄĞÔ±ğ£¬Ö±½Ó·µ»Ø×Ö·û´®
function GetPlayerSex()
local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û

	if (GetSex() == 1) then
		mySex = "C«ng tö"
	elseif (GetSex() == 2) then
		mySex = "N÷ hiÖp "
	end
	
return mySex
end