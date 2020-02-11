--====================================================
--create by baiyun 2009.6.3
--describe:Ô½ÄÏ°æ7ÔÂ·Ý»î¶¯Ö®ÁùÎÔ»¢²ØÁú£¬Îä·¼½«¾ü½Å±¾
--====================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	tSay = {
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 73/#get_aword(73)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 74/#get_aword(74)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 75/#get_aword(75)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 76/#get_aword(76)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 77/#get_aword(77)",
					"Ta muèn nhËn phÇn th­ëng cÊp ®é 78/#get_aword(78)",
					"Trang kÕ/nextpage",
					"T¹i h¹ chØ ghÐ ngang!/dlgover",
			}
						
	if CheckStateNHTL() == 2 then
		tinsert(tSay,1,"Ta muèn nhËn th­ëng th¨ng cÊp 73/levelup")
	end

	if CheckStateNHTL() == 1 or  CheckStateNHTL() == 2 then
		Say("<color=green>Vò Ph­¬ng T­íng Qu©n<color>: Sù kiÖn Ngäa Hæ Tµng Long diÔn ra tõ ngµy<color=red>19-06-2009 ®Õn 24:00 30-11-2009<color>. Trong thêi gian nµy, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng.",	getn(tSay),tSay)
	else
		Say("C¸c h¹ ch­a ®ñ thêi gian ®Ó kÝch ho¹t nhËn th­ëng, ( 8 tiÕng kÓ tõ thêi ®iÓm ®¨ng nhËp ®Çu tiªn) xin h·y quay l¹i sau!",0)
	end
end

function nextpage()
	if CheckStateNHTL() == 1 or  CheckStateNHTL() == 2 then
		Say("<color=green>Vò Ph­¬ng T­íng Qu©n<color>: Sù kiÖn Ngäa Hæ Tµng Long diÔn ra tõ ngµy<color=red>19-06-2009 ®Õn 24:00 30-11-2009<color>. Trong thêi gian nµy, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng.",
			8,
			"Ta muèn nhËn phÇn th­ëng cÊp ®é 79/#get_aword(79)",
			"Ta muèn nhËn phÇn th­ëng cÊp ®é 80/#get_aword(80)",
			"Ta muèn nhËn phÇn th­ëng cÊp ®é 81/#get_aword(81)",
			"Ta muèn nhËn phÇn th­ëng cÊp ®é 82/#get_aword(82)",
			"Ta muèn nhËn phÇn th­ëng cÊp ®é 83/#get_aword(83)",
			"Ta muèn nhËn phÇn th­ëng cÊp ®é 84/#get_aword(84)",
			"Trang tr­íc/main",
			"T¹i h¹ chØ ghÐ ngang!/dlgover");
	else
		Say("Ho¹t ®éng ®· kÕt thóc!",0)
	end
end

function CheckStateNHTL()
	local nRet = 0
	local nExtVal = GetExtPoint(EXT_POINT)	
	if (VerifyDate(3) == 1 and GetBit(nExtVal,1) == 1)  then
		nRet = 2	
	elseif  (VerifyDate(2) == 1) then
		nRet = 1
	end			
	return nRet
end

function GetEventBit(nBit)
	return GetBit(GetExtPoint(EXT_POINT),nBit)	
end

function SetEventBit(nBit)
	local nExtVal = GetExtPoint(EXT_POINT)
	local nExtVal2 = SetBit(nExtVal,nBit,1)
	
	local nExtFinal = nExtVal2 - nExtVal

	if AddExtPoint(EXT_POINT,nExtFinal) == 1 then
		return 1
	else
		return 0
	end
end

function levelup()
	if GetLevel() >= 73 then
		Say("C¸c h¹ ®· ®¹t ®¼ng cÊp 73 råi, kh«ng thÓ nhËn th­ëng!",0)
		return
	end
	if GetEventBit(2) == 0 then
		if SetEventBit(2) == 1 then
			SetLevel(73, 454)
			ResetProperty()
			ModifyExp(20000000)
			Say("Chóc mõng c¸c h¹ ®· th¨ng cÊp 73, vui lßng ®¨ng nhËp l¹i!",0)
			Msg2Player("B¹n nhËn ®­îc 20000000 ®iÓm kinh nghiÖm.")
			WriteLogEx("Ngoa Ho Tang Long","nhËn phÇn th­ëng th¨ng cÊp")
		else
			WriteLogEx("Ngoa Ho Tang Long","nhËn phÇn th­ëng th¨ng cÊp thÊt b¹i")
		end
	else
		Say("Ch¼ng ph¶i c¸c h¹ ®· nhËn th­ëng råi sao?",0)
	end
end



function dlgover()
end

function get_aword(nLevel)
--Ê±¼ä´Á
--1245394800,ÊÇ2009-06-19 0µã
--1249282800,ÊÇ2009-08-02 24µã
	if CheckStateNHTL() == 1 or CheckStateNHTL() == 2 then		
		if GetEventBit(1) == 0 then -- C¸c tµi kho¶n tù t¹o cña gamer
			if GetExtPoint(1) == 0 then -- Thêi gian t¹o tµi kho¶n ko ®óng quy ®Þnh			
				Talk(1, "", "<color=green>Vò Ph­¬ng T­íng Qu©n<color>: Tµi kho¶n cña c¸c h¹ kh«ng ph¶i t¹o trong thêi gian yªu cÇu.");
				return
			end
		end
		if GetPlayerRoute() == 0 then
			Talk(1, "", "<color=green>Vò Ph­¬ng T­íng Qu©n<color>: Ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
			return
		end
		local bHaveLearnFullSkill = get_full_skill_level()
		if (bHaveLearnFullSkill == 0) then
			Talk(1, "", "<color=green>Vò Ph­¬ng T­íng Qu©n<color>: C¸c h¹ vÉn ch­a häc ®ñ kü n¨ng cÊp 55.");
			return	
		end
		if GetLevel() < 73 then
			Talk(1, "", "<color=green>Vò Ph­¬ng T­íng Qu©n<color>: CÊp cña ®¹i hiÖp vÉn ch­a ®ñ, kh«ng thÓ nhËn th­ëng.");
			return
		end
		if GetEventBit(nLevel - 70) == 1  then
			Talk(1, "", "<color=green>Vò Ph­¬ng T­íng Qu©n<color>: §¹i hiÖp ®· nhËn th­ëng råi, kh«ng thÓ tiÕp tôc nhËn th­ëng.");
			return
		end
		confim_get_aword(nLevel);
	end
end

function confim_get_aword(nLevel)
	local nAwordLevel = check_aword_level();
	if nAwordLevel == 0 or nAwordLevel < nLevel then
		Talk(1, "", "<color=green>Vò Ph­¬ng T­íng Qu©n<color>: Kh«ng ®ñ ®iÒu kiÖn nhËn phÇn th­ëng nµy");
		return
	end
	warning_get_aword(nLevel, nAwordLevel);--¾¯¸æÍæ¼ÒÁìÈ¡½±Àø
end

function warning_get_aword(nWantLevel, nLevel)
	Say("NhËn phÇn th­ëng lµ phÇn th­ëng cÊp <color=red>"..nWantLevel.."<color>, ng­¬i cã thÓ nhËn phÇn th­ëng cao nhÊt lµ  phÇn th­ëng cÊp <color=red>"..nLevel.."<color>. Cã ch¾c muèn nhËn phÇn th­ëng cÊp "..nWantLevel.." kh«ng??",
		2,
		"Ta muèn nhËn /#confirm_confirm("..nWantLevel..")",
		"§Ó ta suy nghÜ l¹i xem./nothing");
end

--×îÖÕ·¢½±ÁË
function confirm_confirm(nLevel)
	if GetEventBit(nLevel - 70) == 1  then
		Talk(1, "", "<color=green>Vò Ph­¬ng T­íng Qu©n<color>: §¹i hiÖp ®· nhËn th­ëng råi, kh«ng thÓ tiÕp tôc nhËn th­ëng.");
		return
	end
	if gf_Judge_Room_Weight(5, 100, " ") == 0 then
		return
	end
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	if SetEventBit(nLevel - 70) == 1 then
		gf_SetLogCaption("Ho¹t ®éng ngäa hæ tµng long");
		if nLevel == 73 or nLevel == 76 or nLevel == 77 or nLevel == 80 or nLevel == 84 then
			local nRetCode, nItem = gf_AddItemEx(tb_wohucanglong_item_aword[nLevel][2], tb_wohucanglong_item_aword[nLevel][1]);
			if nLevel == 77 or nLevel == 84 then
				if nRetCode == 1 then
					SetItemExpireTime(nItem, 30*24*60*60);				
				end
			end				
			WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",tb_wohucanglong_item_aword[nLevel][2][4],tb_wohucanglong_item_aword[nLevel][1]);
		elseif nLevel == 74 then
			gf_AddItemEx(tb_wohucanglong_item_aword_74[nBody][2], tb_wohucanglong_item_aword_74[nBody][1]);
			WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",tb_wohucanglong_item_aword_74[nBody][2][4],tb_wohucanglong_item_aword_74[nBody][1]);
		elseif nLevel == 75 then
			gf_AddItemEx(tb_wohucanglong_item_aword_75[nRoute][nBody][2], tb_wohucanglong_item_aword_75[nRoute][nBody][1]);
			WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",1, "¸o S­ m«n cÊp 8x");
		elseif nLevel == 78 then
			gf_AddItemEx(tb_wohucanglong_item_aword_78[nRoute][2], tb_wohucanglong_item_aword_78[nRoute][1]);
			WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",1,"Tói YÕu QuyÕt");
		elseif nLevel == 79 then
			local nItem = gf_GetRandItemByTable(tb_wohucanglong_item_aword_79, 100, 1);
			gf_AddItemEx(tb_wohucanglong_item_aword_79[nItem][3], tb_wohucanglong_item_aword_79[nItem][1]);
			WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",1,"Trang Søc Th¸i H­");
		elseif nLevel == 81 then
			gf_AddItemEx(tb_wohucanglong_item_aword_81[nBody][2], tb_wohucanglong_item_aword_81[nBody][1]);
			WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",1,"QuÇn Tµng KiÕm cÊp 8x");
		elseif nLevel == 82 then
			local nItem = random(1, 100);
			local nBook = random(1, 14);
			if 0 < nItem and nItem <= 45 then
				gf_AddItemEx(tb_wohucanglong_item_aword_82_1[nBook][2], tb_wohucanglong_item_aword_82_1[nBook][1]);
				WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",1,"QuyÓn MËt TÞch TrÊn Ph¸i");
			elseif nItem > 45 and nItem <= 90 then
				gf_AddItemEx(tb_wohucanglong_item_aword_82_2[nBook][2], tb_wohucanglong_item_aword_82_2[nBook][1]);
				WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",1,"QuyÓn MËt TÞch TrÊn Ph¸i");
			else
				gf_AddItemEx(tb_wohucanglong_item_aword_82_3[nBook][2], tb_wohucanglong_item_aword_82_3[nBook][1]);
				WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",1,"QuyÓn MËt TÞch TrÊn Ph¸i");
			end
		elseif nLevel == 83 then
			gf_AddItemEx(tb_wohucanglong_item_aword_83[nRoute][2], tb_wohucanglong_item_aword_83[nRoute][1]);
			WriteLogEx("Hoat dong thang 6","Ngo¹ Hæ Tµng Long",1,"Vò KhÝ Bé Phi Yªn");
		end
		gf_SetLogCaption("");	
	end
end

--ÅÐ¶Ï¿ÉÒÔÂú×ãÄÄ¸ö¼¶±ðµÄ½±Àø
function check_aword_level()
	local nAwordLevel = 0;
	local nLevel = GetLevel();
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	if nHor < 0 then
		nHor = 0 - nHor;
	end
	
	for i = 84, 73, -1 do
		if nLevel >= i and nRep >= tb_wohucanglong_aword[i][1] and nFaction >= tb_wohucanglong_aword[i][2] and nHor >= tb_wohucanglong_aword[i][3] then
			nAwordLevel = i;
			break;
		end
	end
	return nAwordLevel;
end

function get_full_skill_level()
	local nPlayerRoute = GetPlayerRoute()
	if TB_55_SKILL_INFO[nPlayerRoute] == nil then
		return 0
	end
	for i = TB_55_SKILL_INFO[nPlayerRoute][1], TB_55_SKILL_INFO[nPlayerRoute][2] do
		if GetSkillLevel(i) == 0 then
			return 0;
		end
	end
	return 1;
end;


-- »ñµÃ55¼¶¼¼ÄÜÊÇ·ñÒÑ¾­Ñ§ÂúÁË
TB_55_SKILL_INFO = {
	[2] = {21, 31},
	[3] = {45, 56},
	[4] = {33, 43},
	[6] = {58, 73},
	[8] = {75, 88},
	[9] = {90, 101},
	[11] = {103, 112},
	[12] = {114, 123},
	[14] = {125, 145},
	[15] = {147, 158},
	[17] = {720, 731},
	[18] = {733, 744},
	[20] = {364, 377},
	[21] = {347, 363}
}

function nothing()
end