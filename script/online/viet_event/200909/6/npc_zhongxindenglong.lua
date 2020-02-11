--=============================================
--create by baiyun 2009.8.26
--describe:Ô½ÄÏ°æ9ÔÂ·ÝÖÐÇï»î¶¯ÖÐÐÄµÆÁý½Å±¾ÎÄ¼þ
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

tRole ={
	{"toanleo1991","ZzThanhTuyetzZ",87},
	{"mylove220192","EmperorPitt",75},
	{"huydat008","ZxRoyKangxZx",96},
	{"duongtulang005vn","duongthieu2009",89},
	{"lovezuken7","lovezuken",90},
	{"xexichlo52","xzLongphiV©nzxx",94},
	{"volamzinh","TuyenUyenx",93},
	{"starletcute","ZzLordlyzZ",90},
	{"ttttnmthtk","sitinh",91},
	{"nhocconbuongbinh91","RRuouQuenSauu",88},
	{"tappro120","BatS­Thóc",95},
	{"hoaduongtathan10","CatherineLep",93},
	{"lightpoison","AnhSoDocx",92},
	{"macthienbinh","zTuyetTinhKhucz",92},
	{"lukeqn","TaoKoNoiNhieux",86},
	{"5docyeunu","iLyMacSau",92},
	{"vick89","1zCaterpillarz1",94},
	{"zhangngocphan","oZoMashimarooZo",90},
	{"triennhuoctran131727","zTuongTheNaoz",92},
	{"ukyo3006","XxLongTuyetNgoc",92},
	{"vuamuvuaden","§o¹nThñyCÇm",90},
	{"lequynhloan","o0TjeuTjeu0o",93},
	{"doibonba83","doibonba83",89},
	{"votinhgirl187","0oVoTinhGirloO",94},
	{"lynghiastc1","osoSTVoso",96},
	{"cuaongvip2091","IoIAniMaxIoI",96},
	{"volam2263107","KjepVeSau",90},
	{"tyhononlinetk5","TieuYeuNhoNo1",90},
	{"dudidudi2557","zxzCRYzxz",99},
	{"83722884","xOxEdwardxOx",94},
	{"xoaylovepe","zIzKeoCaoSuzIz",96},
	{"trangiahunghanam1987","Vua§écBiÕnH×nh",78},
	{"caytienthuonghoi0","dt01684919893",90},
	{"thinmeo88","zZzCuaHapBiazZz",95},
	{"hoat6892","o0oVIRUSoOo",92},
	{"volam2363535","DanGajTajTrau",89},
	{"shopluadong1","Back2theTOP",92},
	{"anhvudp619","o0oTHAYCHUAo0o",92},
	{"petrangiuiu","zTzBomNetzTz",98},
	{"chuminhhungpro","o0Mr§inho0",81},
	{"vyvy1203","ZxVitYeuHeoxZ",92},
	{"nhtl027670","HanDoiXamLoDick",79},
	{"leesanoc1986","o0ThiªnThÇn0o",82},
	{"nhimcon2210","oOTrieuManOo",88},
	{"binz246","TiÓuC¸i",83},
	{"luckyboys9xftubn","HËnKÎB¹cT×nh0241",85},
	{"nhtl050949","TuyPhong",75},
}


function main()
	local t_dialog = {
--		"NhËn buff hç trî néi c«ng/#Getfuzhu(1)",
--		"NhËn buff hç trî ngo¹i c«ng/#Getfuzhu(2)",
		"KÕt thóc ®èi tho¹i/viet_0909_nothing"
	};
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20091001 and nDate <= 20091004 then
		tinsert(t_dialog,1,"NhËn phÇn th­ëng dµnh cho Bang chñ/get_token")
	end
	Say("Sù kiÖn Trung Thu 2009 b¾t ®Çu diÔn ra tõ ngµy 18-09-2009 ®Õn hÕt ngµy 25-10-2009. Trong thêi gian nµy, ®ång ®¹o cã thÓ tham gia vµo c¸c sù kiÖn nçi bËc nh­: ChÕ biÕn B¸nh Trung Thu, vui cïng §Ìn KÐo Qu©n vµ Thá BÐo ó, tham gia tiªu diÖt Muçi §éc, Trång C©y H¹nh Phóc, xÐt th­ëng theo ®iÓm danh väng vµ ®iÓm s­ m«n ®Ó së h÷u nh÷ng phÇn th­ëng cùc khñng.Chóc ®ång ®¹o cã mét ®ªm Trung Thu Êm ¸p bªn ng­êi th©n vµ gia ®×nh!", getn(t_dialog), t_dialog);
end

function CheckRole(szName)
	for i=1,getn(tRole) do
		if tRole[i][2] == szName then
			return i
		end
	end
	return 0
end

function get_token()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20091001 and nDate <= 20091007 then
		if IsTongMaster() ~= 1 then
			Say("ChØ cã Bang chñ míi ®­îc nhËn th­ëng!",0)
			return
		end
		local nExtVal = GetExtPoint(4)
		if nExtVal < 1 then
			Say("C¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng!",0)
			return
		elseif  nExtVal == 2 then
			Say("Ch¼ng ph¶i c¸c h¹ ®· nhËn th­ëng råi sao?",0)
			return
		end
		local nRoleIndex = CheckRole(GetName())
		if nRoleIndex == 0 then
			Say("C¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng!",0)
			return
		end
		if GetLevel() < tRole[nRoleIndex][3] then
			Say("C¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng!",0)
			return
		end
		if GetFreeItemRoom() <1  then
			Say("Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng. H·y s¾p xÕp l¹i!",0)
			return
		end		
		if nExtVal == 1 then
			AddExtPoint(4,1)
		end	
	end
end

function GetTopWorld()
	if GetLevel() < 80 then
		Say("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		return
	end
	
	local nExtVal = GetExtPoint(5)	
	if nExtVal ~= 1 then
		Say("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng hoÆc ®· nhËn th­ëng råi!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		return	
	end
	
	if gf_JudgeRoomWeight(3,300,"") == 0 then
		return
	end
	
	PayExtPoint(5,1)
end


function GetTopFaction()
	if GetLevel() < 80 then
		Say("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		return
	end
	
	local nExtVal = GetExtPoint(6)	
	if nExtVal ~= 1 then
		Say("B¹n kh«ng ®ñ ®iÒu kiÖn ®Ó nhËn th­ëng hoÆc ®· nhËn th­ëng råi!",0)
		Msg2Player("B¹n kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		return	
	end
	
	if gf_JudgeRoomWeight(1,100,"") == 0 then
		return
	end
	
	PayExtPoint(6,1)
end


--»ñµÃ¸¨ÖúÐ§¹û,nType == 1ÄÚ¹¦£¬2Íâ¹¦
function Getfuzhu(nType)
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn ®­îc chøc n¨ng hç trî");
		return
	end
	if GetTask(VIET_0909_TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H«m nay c¸c h¹ ®· nhËn ®­îc chøc n¨ng hç trî råi, kh«ng thÓ tiÕp tôc nhËn thªm..");
		return
	end
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
	local nRandAttr = 0;
	if nType == 1 then
		nRandAttr = gf_GetRandItemByTable(viet_0909_tb_InBuff, 100, 1);
		for i = 1, getn(viet_0909_tb_InBuff[nRandAttr][3]) do
			CastState(viet_0909_tb_InBuff[nRandAttr][3][i][1], viet_0909_tb_InBuff[nRandAttr][3][i][2], nLeftTime);
		end
		Msg2Player("Trong h«m nay c¸c h¹ nhËn ®­îc hiÖu qu¶"..viet_0909_tb_InBuff[nRandAttr][1]);
	else
		nRandAttr = gf_GetRandItemByTable(viet_0909_tb_OutBuff, 100, 1);
		for i = 1, getn(viet_0909_tb_OutBuff[nRandAttr][3]) do
			CastState(viet_0909_tb_OutBuff[nRandAttr][3][i][1], viet_0909_tb_OutBuff[nRandAttr][3][i][2], nLeftTime);
		end
		Msg2Player("Trong h«m nay c¸c h¹ nhËn ®­îc hiÖu qu¶"..viet_0909_tb_OutBuff[nRandAttr][1]);
	end
	
	SetTask(VIET_0909_TASK_GET_FUZHU_TYPE, nType * 10 + nRandAttr);
	SetTask(VIET_0909_TASK_GET_FUZHU_DATE, tonumber(date("%y%m%d")));
	
end

