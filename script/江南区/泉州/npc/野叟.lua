
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ò°ÛÅ½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\gmscript.lua")
--Include("\\script\\global\\skills_table.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--ÕÙ»ØÀÏÍæ¼Ò»î¶¯

TASK_JUE_NUM = 540   --08ÄêÊ¢ÊÀ½­É½°æ±¾Ï´¾÷Òª´ÎÊı ÏŞÖÆÎªÎå´Î

function main()
  if random(1,15) == 1 then
		NpcChat(GetTargetNpc()," Më tµi liÖu trªn trang chñ Vâ L©m TruyÒn Kú 2 ®Ó tham kh¶o vÒ s¬n hµ linh ®éng, kh¶m n¹m Linh Th¹ch, bé ®å B¸t qu¸i!");
	end;

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()

	if (nState==100) then

		task_000_00();
		return

	elseif (nState==6) then

		task_006_00();
		return

	elseif (nState==7) then

		if nLevel>=4 then
			task_007_00();
			return
		end;

	elseif (nState==10) then

		task_010_00();
		return

	elseif (nState==11) then

		if nLevel>=6 then
			task_011_00();
			return
		end;

	elseif (nState==14) then

		task_014_00();
		return

	elseif (nState==15) then

		Say("§· t×m ®­îc b¹n h÷u råi µ?",
			4,
			"§óng råi/teach_team_001",
			"Ch­a t×m ®­îc ai thİch hîp!/teach_team_004",
			"Lµm sao mang tíi ®©y/teach_team_002",
			"Ch­a cã!/teach_team_003");
		return

	elseif (nState==16) then

		if nLevel>=8 then
			task_016_00();
			return
		end;

	elseif (nState==17) then

		task_017_00();
		return

	elseif (nState==19) then

		task_019_00();
		return

	elseif (nState==20) then

		if nLevel>=9 then
			task_020_00();
			return
		end;

	elseif (nState==24) then

		if nLevel>=10 then
			task_024_00();
			return
		end;

	elseif (nState>=1) and (nState<24) then -- ÖĞ¼ä×´Ì¬

		local i,j;
		local strMain = {
			[1] = "Sao ng­¬i ch­a ®i gÆp Chñ tiÖm vò khİ? Trë l¹i ®©y lµm g×?",
			[2] = "Sao ng­¬i ch­a ®i gÆp Chñ tiÖm phôc trang? Trë l¹i ®©y lµm g×?",
			[3] = "Sao ng­¬i ch­a ®i gÆp Chñ Kim hoµn? Trë l¹i ®©y lµm g×?",
			[4] = "Sao ng­¬i ch­a ®i gÆp Chñ d­îc ®iÕm? Trë l¹i ®©y lµm g×?",
			[5] = "Sao ng­¬i ch­a ®i gÆp Chñ T¹p hãa? Trë l¹i ®©y lµm g×?"
		}

		for i,j in strMain do
			if TE_GetTeachState()==i then
				Say(strMain[i],0);
				return
			end;
		end;

	elseif (nState>=1) then
		if (GetPlayerFaction() > 0) then
			if attr_point_readd_date_chk() ~= 1 then
				local strtab = {
					"NhËn phÇn th­ëng/callback_talk",
					"§Õn th¨m D· TÈu/main_exit"
				};
				if callback_date_check() == 1 then
					tinsert(strtab,2,"Ta muèn trŞ th­¬ng/restore_all");
				end
				Say("<color=green>D· TÈu<color>: Ta ®· d¹y cho ng­¬i tÊt c¶ nh÷ng g× ta biÕt råi, ng­¬i cßn ®Õn ®©y lµm g× vËy?",
					getn(strtab),
					strtab);
			else
				attr_point_readd_dia()
			end
			return
		else
			local strtab = {
				"TÈy ®iÓm tiÒm n¨ng./main_point",
--				"TrŞ th­¬ng./main_restore",
				"NhËn phÇn th­ëng/callback_talk",
				--"ÎÒÒª½«ÉíÉÏ×°±¸µÄÃØóÅËù²åÈëµÄ¾÷ÒªÈ¡³ö/remove_addendar",
				"§Õn th¨m D· TÈu/main_exit"
				};
			if callback_date_check() == 1 then
				tinsert(strtab,4,"Ta muèn trŞ th­¬ng/restore_all");
			end
			Say("Ta cã thÓ gióp g× cho b»ng h÷u?",
				getn(strtab),
				strtab);
			return
		end;
	end;

	if (GetPlayerFaction() > 0) then
		if attr_point_readd_date_chk() ~= 1 then
			local strtab = {
				"NhËn phÇn th­ëng/callback_talk",
				"§Õn th¨m D· TÈu/main_exit"
			};
			if callback_date_check() == 1 then
				tinsert(strtab,2,"Ta muèn trŞ th­¬ng/restore_all");
			end
			Say("<color=green>D· TÈu<color>: Ta ®· d¹y cho ng­¬i tÊt c¶ nh÷ng g× ta biÕt råi, ng­¬i cßn ®Õn ®©y lµm g× vËy?",
				getn(strtab),
				strtab);
		else
			attr_point_readd_dia()
		end
		return
	else
		local strtab = {
			"TÈy ®iÓm tiÒm n¨ng./main_point",
--			"TrŞ th­¬ng./main_restore",
			"NhËn phÇn th­ëng/callback_talk",
			--"ÎÒÒª½«ÉíÉÏ×°±¸µÄÃØóÅËù²åÈëµÄ¾÷ÒªÈ¡³ö/remove_addendar",
			"§Õn th¨m D· TÈu/main_exit"
			};
		if callback_date_check() == 1 then
			tinsert(strtab,4,"Ta muèn trŞ th­¬ng/restore_all");
		end
		Say("Ta cã thÓ gióp g× cho b»ng h÷u?",
			getn(strtab),
			strtab);
	end;
end

--=========================================
--´å³¤207-06-29Ôö¼ÓÃâ·ÑÏ´µã¹¦ÄÜ
--¶Ô»°
function attr_point_readd_dia()
	Say("<color=green>D· TÈu<color>: Ta ®· d¹y cho ng­¬i tÊt c¶ nh÷ng g× ta biÕt råi, ng­¬i cßn ®Õn ®©y lµm g× vËy?",
		2,
--		"ÎÒÒª½«ÉíÉÏ×°±¸µÄÃØóÅËù²åÈëµÄ¾÷ÒªÈ¡³ö/remove_addendar",
		"§· më kü n¨ng míi råi, ta muèn tÈy ®iÓm /attr_point_readd",
		"§Õn th¨m D· TÈu/nothing"
		)

end
--Ï´µã
function attr_point_readd()
	Say("<color=green>D· TÈu<color>: Tr­íc <color=yellow>23h ngµy 4/5/2008<color>, cã thÓ <color=yellow>®Õn ®©y<color> ®Ó <color=yellow>tÈy ®iÓm<color>, b¹n x¸c nhËn muèn <color=yellow>tÈy ®iÓm<color>?",
	2,
	"Ta muèn tÈy ®iÓm/confirm_xidian",
	"Ta vÉn ch­a quyÕt ®Şnh/nothing"
	)
end
--Ê±¼ä¼ì²â
function attr_point_readd_date_chk()
	local date_now = tonumber(date("%Y%m%d%H"))
	if date_now >= 2008032710 and date_now <= 2008050423 then
		return 1
	else
		return 0
	end
end
--=========================================
function nothing()

end;

function remove_addendar()
	local nCount = GetTask(TASK_JUE_NUM);
	local selTab = {
			"Ta muèn th¸o yÕu quyÕt g¾n trªn bİ kİp/remove_addendar_confirm",
			"§Ó ta nghÜ l¹i ®·/nothing",
			}
	Say("<color=green>D· TÈu<color>: Tr­íc <color=yellow>23h ngµy 10/4/2008, ng­¬i cã thÓ ®Õn t×m l·o phu th¸o yÕu quyÕt g¾n trªn bİ kİp, <color=yellow>l­u ı, mçi ng­êi chØ ®­îc miÔn phİ 5 lÇn, ng­¬i cßn cã thÓ th¸o "..(5-nCount).." lÇn. <color>Ng­¬i cã muèn <color=yellow>th¸o yÕu quyÕt<color> kh«ng?",
	getn(selTab),
	selTab
	)
end;
--·µ»Ø¾÷ÒªÊıÁ¿¡¢¾÷Òª×Ö·û´®¡¢¾÷ÒªÃû×Ötable¡¢¾÷ÒªIDtable
function get_addendar_info()
	local tbAddendarName = {"", "", "", ""}
	local tbAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		tbAddendarName[i + 1], tbAddendarID[i + 1] = GetBookAddendarName(i)
		if (tbAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	if nAddendarCount == 0 then
		return 0,"",tbAddendarName,tbAddendarID;
	end;
	local strPages = "";
	for i=1,4 do	--×î¶àÖ»ÓĞËÄÕÅ¾÷Òª
		if tbAddendarName[i] ~= "" then
			strPages = strPages..tbAddendarName[i]..", ";
		end;
	end;
	strPages = strsub(strPages,1,strlen(strPages)-2);
	return nAddendarCount,strPages,tbAddendarName,tbAddendarID;
end;

function remove_addendar_confirm()
	if GetTask(TASK_JUE_NUM) >= 5 then
		Talk(1,"","<color=green>D· TÈu<color>: Mçi ng­êi chØ ®­îc miÔn phİ 5 lÇn, thiÕu hiÖp ®· th¸o 5 lÇn råi.");
		return
	end
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","<color=green>D· TÈu<color>: ThiÕp hiÖp h·y trang bŞ bİ kİp tr­íc ®·, nÕu kh«ng lµm sao l·o phu biÕt ®ã lµ bİ kİp nµo chø.");
		return 0;
	end;
	local nAddendarCount,strPages = get_addendar_info();
	if nAddendarCount == 0 then
		Talk(1,"","<color=green>D· TÈu<color>: LÏ nµo thiÕu hiÖp ®ang ®ïa víi l·o phu sao, bİ kİp nµy cã yÕu quyÕt g× chø?");
		return 0;
	end;
	local selTab = {
				"§­îc/remove_addendar_confirm_final",
				"§Ó ta suy nghÜ/nothing",
				}
	Say("<color=green>D· TÈu<color>: §­îc, thiÕu hiÖp nh×n kü ®©y, bİ kİp nµy cã thÓ th¸o <color=yellow>"..strPages.."<color><color=yellow>"..nAddendarCount.."<color> yÕu quyÕt, ng­¬i muèn nhËn nh÷ng yÕu quyÕt nµy chø?",getn(selTab),selTab);
end;

function remove_addendar_confirm_final()
	if GetTask(TASK_JUE_NUM) >= 5 then
		Talk(1,"","<color=green>D· TÈu<color>: Mçi ng­êi chØ ®­îc miÔn phİ 5 lÇn, thiÕu hiÖp ®· th¸o 5 lÇn råi.");
		return
	end
	if gf_JudgeRoomWeight(4,10) == 0 then
		Talk(1,"","<color=green>D· TÈu<color>: H·y kiÓm tra l¹i xem, nÕu nhËn yÕu quyÕt mµ kh«ng dïng ®­îc, h¸ ch¼ng ph¶i lµ trß c­êi cho thiªn h¹ sao?");
		return 0;
	end;
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","<color=green>D· TÈu<color>: ThiÕp hiÖp h·y trang bŞ bİ kİp tr­íc ®·, nÕu kh«ng lµm sao l·o phu biÕt ®ã lµ bİ kİp nµo chø.");
		return 0;
	end;
	if IsBookLocked() > 0 then
		Talk(1,"","<color=green>D· TÈu<color>: Bİ kİp cña ng­¬i ®ang kho¸, kh«ng thÓ th¸o yÕu quyÕt!")
		return 0;
	end
	local nAddendarCount,strPages,tbAddendarName,tbAddendarID = get_addendar_info();
	if nAddendarCount == 0 then
		Talk(1,"","<color=green>D· TÈu<color>: LÏ nµo thiÕu hiÖp ®ang ®ïa víi l·o phu sao, bİ kİp nµy cã yÕu quyÕt g× chø?");
		return 0;
	end;
	local nCurCount = GetTask(TASK_JUE_NUM);
	SetTask(TASK_JUE_NUM,nCurCount+1);
	local strName,nID = "",0;
	local nRetCode = 0;
	for i=1,4 do
		strName,nID = GetBookAddendarName(0);
		if nID ~= -1 then
			RemoveAddendarFromBook(0);
			nRetCode = AddItem(2, 6, nID, 1);
			if nRetCode == 1 then
				Msg2Player("B¹n ®· th¸o thµnh c«ng"..strName);
				WriteLog("[NhËn yÕu quyÕt D· TÈu]"..GetName().."§· th¸o"..strName);
			else
				WriteLog("[D· TÈu th¸o yÕu quyÕt bŞ lçi]"..GetName().." th¸o "..strName.." bŞ lçi, nRetCode:"..nRetCode);
			end;
		end;
	end;
	WriteLog("[NhËn yÕu quyÕt D· TÈu]:"..GetName().."thø"..(nCurCount+1).." lÇn yÕu quyÕt");
end;

-- Ãâ·ÑÏ´Ç±ÄÜµãµÄº¯Êı
function test_free_clean_points()
	Say("§©y lµ tiªn ®¬n quı hiÕm, ta chØ cã thÓ cho ng­¬i sö dông 1 viªn. Ng­¬i x¸c nhËn thËt sù cÇn dïng chø?",
		2,
		"X¸c nhËn/confirm_free_clean_points",
		"Sau nµy h·y tİnh./exit_free_clean_points")
end;
-- È·ÈÏÁËÒªÃâ·ÑÏ´µã£¬¸øËûÏ´£¡
function confirm_free_clean_points()
	ResetProperty()
	SetTask(99, 27)
	Say("Ng­¬i ®· tÈy ®­îc ®iÓm tiÒm n¨ng. LÇn sau ph¶i cÈn thËn nhĞ!", 0)
end;
-- ÔİÊ±²»ÒªÃâ·ÑÏ´Ç±ÄÜµãµÄº¯Êı
function exit_free_clean_points()
	Say("§­îc! Nh­ng lÇn sau ph¶i ®Õn sím! ChËm trÔ lµ hÕt tiªn ®¬n, ta kh«ng thÓ gióp ng­¬i tÈy ®iÓm tiÒm n¨ng ®©u!", 0)
end;
--======================================================


function teach_team_001()
local nMemCount = GetTeamSize()
	if (nMemCount == 0) or (nMemCount == 1) then
		task_015_check(2)
	else
		task_015_check(1)
	end
	return
end

function teach_team_002()
	task_015_check(3)
end

function teach_team_003()
	task_015_check(4)
end

function teach_team_004()

	if GetTeamSize() == 1 then
		task_015_check(5)
	else
		task_015_check(6)
	end

end


-- Ñ¡ÔñÏ´Ç±ÄÜµã
function main_point()
	if GetPlayerFaction()>0 then
		Talk(1,"","Ng­¬i ®· gia nhËp m«n ph¸i, kh«ng thÓ tÈy ®iÓm tiÒm n¨ng n÷a!");
	elseif GetLevel() > 10 then
		Talk(1, "", "§¼ng cÊp hiÖn t¹i cña ng­¬i ®· v­ît qu¸ 10, kh«ng thÓ tÈy ®iÓm tiÒm n¨ng.")
	else
		ResetProperty()
		Talk(1,"","Ng­¬i ®· tÈy ®­îc ®iÓm tiÒm n¨ng. LÇn sau ph¶i cÈn thËn nhĞ!");
	end
end

-- Ñ¡Ôñ»ØÀ´¿´¿´
function main_exit()
	Talk(1,"","Ha ha! Ng­¬i qu¶ thËt cã lßng!");
end

-- Ãâ·Ñ»Ø¸´ÉúÃü
function main_restore()
	if GetPlayerFaction()>0 then
		Talk(1,"","Ng­¬i ®· gia nhËp m«n ph¸i, cã thÓ ®Õn d­îc ®iÕm mua d­îc th¶o trŞ th­¬ng. Mua ®¬n d­îc cña ng­êi biÕt kü n¨ng luyÖn ®¬n, kh«ng thÓ gióp g× cho ng­¬i!");
	else
		Restore()    --»Ö¸´Íæ¼ÒµÄÉúÃü
		RestoreNeili()   --»Ö¸´Íæ¼ÒµÄÄÚÁ¦£¨È«Âú£©
		CureWound(2)    --ÖÎÁÆÄÚÍâÉË
		Talk(1,"","Ta ®· trŞ th­¬ng cho ng­¬i! Sau nµy ph¶i cÈn thËn nhĞ!");
		return
	end;
end;

function confirm_xidian()
	ResetProperty()
	Talk(1,"","<color=green>D· TÈu<color>: Ta ®· tÈy ®iÓm tiÒm n¨ng gióp ng­¬i råi.");
end
