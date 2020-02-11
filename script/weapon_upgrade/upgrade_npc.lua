--=============================================
--Created by TuanNA5
--Upgrade weapon
--=============================================

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\weapon_upgrade\\upgrade_head.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\weapon_upgrade\\upgrade_extend.lua");
FILE_NAME = "\\script\\weapon_upgrade\\upgrade_npc.lua";
THUONGUNGTUONGQUAN_FILE = "\\script\\vng\\weapon_upgrade\\thuongung.lua";
THUONGUNGNGUYENSOAI_FILE = "\\script\\vng\\weapon_upgrade\\thuongungnguyensoai.lua";
LOIHONGUYENSOAI_FILE = "\\script\\vng\\weapon_upgrade\\loihonguyensoai.lua";
BACHKIMVIEMDE100_FILE = "\\script\\vng\\weapon_upgrade\\bachkimviemde100.lua";
RENLAIVUKHI_FILE = "\\script\\vng\\weapon_upgrade\\renlaivukhi.lua";

NGULONGTUONGQUANCHANGE_FILE = "\\script\\vng\\weapon_upgrade\\ngulongtuongquan_change.lua";
THUONGUNGTUONGQUANCHANGE_FILE = "\\script\\vng\\weapon_upgrade\\thuongungtuongquan_change.lua";
DAINGUYENSOAICHANGE_FILE = "\\script\\vng\\weapon_upgrade\\dainguyensoai_change.lua";
THUONGUNGNGUYENSOAICHANGE_FILE = "\\script\\vng\\weapon_upgrade\\thuongungnguyensoai_change.lua";
THIENCHITUONGQUAN100_FILE = "\\script\\vng\\weapon_upgrade\\thienchituongquan100.lua"
NGULONGTUONGQUAN100_FILE = "\\script\\vng\\weapon_upgrade\\ngulongtuongquan100.lua"
NGULONG2THUONGUNGTUONGQUAN100_FILE = "\\script\\vng\\weapon_upgrade\\thuongungtuongquan100.lua";
TUONGQUAN2THUONGUNGTUONGQUAN_FILE = "\\script\\vng\\weapon_upgrade\\tuongquan2thuongungtuongquan100.lua"
THIENCHITUONGQUAN2THUONGUNGTUONGQUAN_FILE = "\\script\\vng\\weapon_upgrade\\thienchituongquan2thuongungtuongquan100.lua"
BACHU2VOSONG_FILE = "\\script\\vng\\weapon_upgrade\\bachu2vosong.lua"
THUONGUNGNGUYENSOAI100_FILE = "\\script\\vng\\weapon_upgrade\\dainguyensoai2thuongungnguyensoai100.lua";
THUONGUNGTUONGQUAN2LOIHOTUONGQUAN_FILE = "\\script\\vng\\weapon_upgrade\\tuongquan_thuongung2loiho.lua";
THUONGUNGNGUYENSOAI2LOIHONGUYENSOAI_FILE = "\\script\\vng\\weapon_upgrade\\nguyensoai_thuongung2loiho.lua";

g_szNpcName = "<color=green>§Ö tö thî rÌn L­u: <color>";

function npc_upgrade_talk()
	local nDate = tonumber(date("%Y%m%d"))
	local tSay = {	
--			"N©ng cÊp vò khÝ ViÖt Yªn/upgrade_vietyen",
--			"C¶i t¹o vò khÝ §¹i ViÖt Yªn/remake_daivietyen",
--			"N©ng cÊp trang bÞ s­ m«n/upgrade_sumon4",
--			"ChÕ t¹o vµ n©ng cÊp vò khÝ Bé Phi Yªn/create_bpy",			
--			"ChÕ t¹o trang bÞ S­ m«n cÊp 4/make_shimen_tier4",
--			"N©ng cÊp vò khÝ ViÖt Yªn, §¹i ViÖt Yªn/upgrade_vy",
--			"N©ng cÊp trang bÞ Thiªn Chi Viªm §Õ thµnh B¹ch Kim Viªm §Õ/upgrade_PlatinumEmperor",
--			"N©ng cÊp trang bÞ Tö Quang Viªm §Õ/upgrade_tq_emperor",
--			"ChuyÓn ®æi trang bÞ Tµng KiÕm/change_cangjiang",
--			"C¶i t¹o trang søc Tµng KiÕm/upgrade_cangjiang",
--			"N©ng cÊp trang bÞ Thiªn Chi Tµng KiÕm/upgrade_tk_equipment",
--			"C¶i t¹o trang bÞ Thiªn Chi Tµng KiÕm/upgrade_tctk_equipment",
--			"N©ng cÊp trang bÞ Tö Quang/upgrade_tqc",
--			"N©ng cÊp trang bÞ Tèng Liªu/upgrade_songliao",
			"ChÕ t¹o Thiªn Qu¸i Th¹ch/make_tianguashi",
			"T¹i h¹ chØ tiÖn ghÐ ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Ng­êi trong giang hå b«n tÈu ph¶i cã c¸c lo¹i trang bÞ tèt trªn ng­êi. NÕu c¸c h¹ cã thÓ t×m ®­îc c¸c nguyªn liÖu quý hiÕm ®em ®Õn ®©y, ta sÏ gióp c¸c h¹ chÕ t¹o c¸c lo¹i trang bÞ nh­ ý. <color=red>L­u ý: C¸c h¹ ph¶i thiÕt ®Æt mËt khÈu hµnh trang vµ më khãa hµnh trang míi cã thÓ tiÕn hµnh n©ng cÊp.<color>",getn(tSay),tSay)
end

function NangCapLevelVuKhi_Menu()
	local szSay = "- Sau khi n©ng cÊp, hiÖu qu¶ ®Þnh hån, ®¹i ®Þnh hån sÏ biÕn mÊt.\n"
	szSay = szSay .. "- Vò khÝ Ðp linh th¹ch n©ng cÊp sÏ mÊt gi¸ trÞ linh khÝ, gi÷ nguyªn thuéc tÝnh ®· Ðp.\n"
	szSay = szSay .. "- Mét sè thuéc tÝnh sau sÏ cã tû lÖ bÞ gi¶m sau khi ®em ®i n©ng cÊp:\n"
	szSay = szSay .. "  + Bá qua phßng ngù ®èi ph­¬ng: 13%, 16% , 19% , 22%\n"
	szSay = szSay .. "  + Hñy Sinh lùc, Nguyªn khÝ ®èi ph­¬ng:   25% , 30% , 35%\n"
	szSay = szSay .. "  + Néi lùc ®èi ph­¬ng tiªu hao:  8% ,10% , 12% , 14%\n"
	szSay = szSay .. "  + KhiÕn ®èi ph­¬ng bá ch¹y:  11% , 14% , 17% , 20%\n"
	szSay = szSay .. "  + S¸t th­¬ng t¨ng : 1-150"
	
	local tbSay = {
		"Ta ®· hiÓu râ, hay gióp ta rÌn l¹i vò khÝ/RenLaiVuKhi_Form",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(g_szNpcName..szSay,getn(tbSay),tbSay)
end

function ViemDeMenu()
	local tbSay = {
		"N©ng cÊp trang bÞ Tö Quang Viªm §Õ thµnh Viªm §Õ/upgrade_tq_emperor",
		"N©ng cÊp trang bÞ Tö Quang Viªm §Õ thµnh Viªm §Õ (thµnh c«ng 100%)/upgrade_tq_emperor_100",
		"N©ng cÊp trang bÞ Viªm §Õ thµnh Thiªn Chi Viªm §Õ/upgrade_emperor",
		"N©ng cÊp trang bÞ Viªm §Õ thµnh Thiªn Chi Viªm §Õ (100%)/upgrade_thienchiviemde",
--		"N©ng cÊp Thiªn Chi Viªm §Õ thµnh B¹ch Kim Viªm §Õ/upgrade_bachkimviemde",
		"N©ng cÊp Thiªn Chi Viªm §Õ thµnh B¹ch Kim Viªm §Õ (100%)/upgrade_bachkimviemde_100_Form",
		"C¶i t¹o trang bÞ Tö Quang Viªm §Õ/upgrade_tqvd",
		"T¹i h¹ chØ tiÖn ghÐ ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Ng­êi trong giang hå b«n tÈu ph¶i cã c¸c lo¹i trang bÞ tèt trªn ng­êi. NÕu c¸c h¹ cã thÓ t×m ®­îc c¸c nguyªn liÖu quý hiÕm ®em ®Õn ®©y, ta sÏ gióp c¸c h¹ chÕ t¹o c¸c lo¹i trang bÞ nh­ ý. <color=red>L­u ý: C¸c h¹ ph¶i thiÕt ®Æt mËt khÈu hµnh trang vµ më khãa hµnh trang míi cã thÓ tiÕn hµnh n©ng cÊp.<color>",getn(tbSay),tbSay)
end

function TuongQuanMenu()
	local tbSay = {
--		"N©ng cÊp trang bÞ T­íng Qu©n thµnh Thiªn Chi T­íng Qu©n/upgrade_gen",
--		"N©ng cÊp trang bÞ T­íng Qu©n thµnh Thiªn Chi T­íng Qu©n (100%)/upgrade_gen_100",
--		"N©ng cÊp trang bÞ T­íng Qu©n thµnh Thiªn Chi T­íng Qu©n (100%)/ThienChiTuongQuan100Upgrade_Form",
--		"N©ng cÊp trang bÞ Thiªn Chi T­íng Qu©n thµnh Ngù Long T­íng Qu©n/upgrade_gen1",
--		"N©ng cÊp trang bÞ Thiªn Chi T­íng Qu©n thµnh Ngù Long T­íng Qu©n (100%)/upgrade_gen2",
--		"N©ng cÊp trang bÞ Thiªn Chi T­íng Qu©n thµnh Ngù Long T­íng Qu©n tû lÖ (100%)/upgrade_gen2_100",
--		"N©ng cÊp trang bÞ Thiªn Chi T­íng Qu©n thµnh Ngù Long T­íng Qu©n tû lÖ (100%)/NguLongTuongQuan100Upgrade_Form",
--		"N©ng cÊp trang bÞ Ngù Long T­íng Qu©n thµnh Th­¬ng ¦ng T­íng Qu©n/ThienUngTuongQuanUpgrade_Form",
		"N©ng cÊp trang bÞ T­íng Qu©n thµnh Th­¬ng ¦ng T­íng Qu©n/TuongQuan2ThuongUngTuongQuan_Form",
		"N©ng cÊp trang bÞ Thiªn Chi T­íng Qu©n thµnh Th­¬ng ¦ng T­íng Qu©n/ThienChi2ThuongUngTuongQuan_Form",
		"N©ng cÊp trang bÞ Ngù Long T­íng Qu©n thµnh Th­¬ng ¦ng T­íng Qu©n/NguLong2ThuongUngTuongQuan100Upgrade_Form",
--		"ChuyÓn ®æi trang bÞ Ngù Long T­íng Qu©n/NguLongTuongQuanChange_Form",
--		"ChuyÓn ®æi trang bÞ Th­¬ng ¦ng T­íng Qu©n/ThuongUngTuongQuanChange_Form",
--		"C¶i t¹o trang bÞ Ngù Long T­íng Qu©n/upgrade_nltq_clothes",
		"ChuyÓn ®æi trang bÞ Ngù Long T­íng Qu©n/NguLongTuongQuanChange_Menu",
		"ChuyÓn ®æi trang bÞ Th­¬ng ¦ng T­íng Qu©n/ThuongUngTuongQuanChange_Menu",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."Ng­êi trong giang hå b«n tÈu ph¶i cã c¸c lo¹i trang bÞ tèt trªn ng­êi. NÕu c¸c h¹ cã thÓ t×m ®­îc c¸c nguyªn liÖu quý hiÕm ®em ®Õn ®©y, ta sÏ gióp c¸c h¹ chÕ t¹o c¸c lo¹i trang bÞ nh­ ý. <color=red>L­u ý: C¸c h¹ ph¶i thiÕt ®Æt mËt khÈu hµnh trang vµ më khãa hµnh trang míi cã thÓ tiÕn hµnh n©ng cÊp.<color>",getn(tbSay),tbSay)
end

function NguyenSoaiMenu()
	local tbSay = {
		"N©ng cÊp trang bÞ Nguyªn So¸i thµnh Ngù Long - ThiÖu Th¸nh Nguyªn So¸i/upgrade_mar",
		"N©ng cÊp trang bÞ Ngù Long - ThiÖu Th¸nh thµnh Ngù Long - Chiªu Th¸nh Nguyªn So¸i/upgrade_upper_mar",
		"Ngù Long - ThiÖu Th¸nh Nguyªn So¸i thµnh §¹i Tèng-Liªu Nguyªn So¸i (100%)/upgrade_upper_mar_100",
		"N©ng cÊp §¹i Tèng-Liªu Nguyªn So¸i thµnh Th­¬ng ¦ng Nguyªn So¸i/ThuongUngNguyenSoai_Form",
		"N©ng cÊp §¹i Tèng-Liªu Nguyªn So¸i thµnh Th­¬ng ¦ng Nguyªn So¸i 100%/ThuongUngNguyenSoai100_Form",
		"ChuyÓn ®æi trang bÞ §¹i Nguyªn So¸i/DaiNguyenSoaiChange_Form",
		"ChuyÓn ®æi trang bÞ Th­¬ng ¦ng Nguyªn So¸i/ThuongUngNguyenSoaiChange_Form",
		"N©ng cÊp §¹i Tèng-Liªu Nguyªn So¸i thµnh L«i Hæ Nguyªn So¸i/LoiHoNguyenSoai_Form",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."Ng­êi trong giang hå b«n tÈu ph¶i cã c¸c lo¹i trang bÞ tèt trªn ng­êi. NÕu c¸c h¹ cã thÓ t×m ®­îc c¸c nguyªn liÖu quý hiÕm ®em ®Õn ®©y, ta sÏ gióp c¸c h¹ chÕ t¹o c¸c lo¹i trang bÞ nh­ ý. <color=red>L­u ý: C¸c h¹ ph¶i thiÕt ®Æt mËt khÈu hµnh trang vµ më khãa hµnh trang míi cã thÓ tiÕn hµnh n©ng cÊp.<color>",getn(tbSay),tbSay)
end

function ThienUngTuongQuanUpgrade_Form()
	PutinItemBox("ChÕ t¹o trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn chÕ t¹o?", THUONGUNGTUONGQUAN_FILE, 1)
end


function ThuongUngTuongQuanChange_Form(nOption)
	local szSay = ""
	if nOption >=0 then
		szSay = "ChuyÓn ®æi trang bÞ Th­¬ng ¦ng T­íng Qu©n c­êng hãa "..nOption.." trë lªn cÇn:\n"
		szSay = szSay .. "  + Kh«i, Gi¸p Trang: C­êng hãa "..nOption.." trë lªn, 10 Thiªn Th¹ch Tinh Th¹ch, 2.000 vµng\n"
		szSay = szSay .. "NhËn l¹i trang bÞ Th­¬ng ¦ng T­íng Qu©n <color=yellow>+"..nOption.."<color>, mÊt hiÖu qu¶ §Þnh hån, §¹i ®Þnh hån.\n"
	else
		szSay = "ChuyÓn ®æi ngäc béi Th­¬ng ¦ng T­íng Qu©n cÇn:\n"
		szSay = szSay .. "  + Phï, LÖnh, Kú: 20 Thiªn Th¹ch Tinh Th¹ch, 4.000 vµng\n"
	end
	szSay = szSay .. "<color=red>Tû lÖ thµnh c«ng 100%<color>"
	tbSay = {
		"TiÕn hµnh chuyÓn ®æi/#ThuongUngTuongQuanChange_Done("..nOption..")",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(g_szNpcName..szSay,getn(tbSay),tbSay)
end

function ThuongUngTuongQuanChange_Done(nOption)
--	if abs(GetTask(701)) < 250000 then
--		Talk(1,"",g_szNpcName.."C«ng tr¹ng ng­¬i Ýt vËy ta ch¼ng muèn ra tay gióp ®ì. H·y cè g¾ng ®¹t 250000 c«ng tr¹ng, ta sÏ nghÜ l¹i...")
--		return 0
--	end
--	if abs(GetTask(704)) < 5 then
--		Talk(1,"",g_szNpcName.."Ta chØ nhËn lµm cho c¸c vÞ T­íng Qu©n th«i, cho nªn.... ng­¬i h·y cè g¾ng thªm n÷a nhÐ!")
--		return 0
--	end
	SetTaskTemp(TSK_TMP_CHUYENDOITRANGBI, nOption)
	PutinItemBox("ChuyÓn ®æi trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn chuyÓn ®æi?", THUONGUNGTUONGQUANCHANGE_FILE, 1)
end


function NguLongTuongQuanChange_Form(nOption)
	local szSay = ""
	if nOption >=0 then
		szSay = "ChuyÓn ®æi trang bÞ Ngù Long T­íng Qu©n c­êng hãa "..nOption.." trë lªn cÇn:\n"
		szSay = szSay .. "  + Kh«i, Gi¸p Trang: C­êng hãa "..nOption.." trë lªn, 5 Thiªn Th¹ch Tinh Th¹ch, 1.000 vµng\n"
		szSay = szSay .. "NhËn l¹i trang bÞ Ngù Long T­íng Qu©n <color=yellow>+"..nOption.."<color>, mÊt hiÖu qu¶ §Þnh hån, §¹i ®Þnh hån.\n"
	else
		szSay = "ChuyÓn ®æi ngäc béi Ngù Long T­íng Qu©n cÇn:\n"
		szSay = szSay .. "  + Phï, LÖnh, Kú: 10 Thiªn Th¹ch Tinh Th¹ch, 2.000 vµng\n"
	end
	szSay = szSay .. "<color=red>Tû lÖ thµnh c«ng 100%<color>"
	tbSay = {
		"TiÕn hµnh chuyÓn ®æi/#NguLongTuongQuanChange_Done("..nOption..")",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(g_szNpcName..szSay,getn(tbSay),tbSay)
end

function NguLongTuongQuanChange_Done(nOption)
--	if abs(GetTask(701)) < 250000 then
--		Talk(1,"",g_szNpcName.."C«ng tr¹ng ng­¬i Ýt vËy ta ch¼ng muèn ra tay gióp ®ì. H·y cè g¾ng ®¹t 250000 c«ng tr¹ng, ta sÏ nghÜ l¹i...")
--		return 0
--	end
--	if abs(GetTask(704)) < 5 then
--		Talk(1,"",g_szNpcName.."Ta chØ nhËn lµm cho c¸c vÞ T­íng Qu©n th«i, cho nªn.... ng­¬i h·y cè g¾ng thªm n÷a nhÐ!")
--		return 0
--	end
	SetTaskTemp(TSK_TMP_CHUYENDOITRANGBI, nOption)
	PutinItemBox("ChuyÓn ®æi trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn chuyÓn ®æi?", NGULONGTUONGQUANCHANGE_FILE, 1)
end


function DaiNguyenSoaiChange_Form()
	local szSay = "ChuyÓn ®æi trang bÞ §¹i Nguyªn So¸i cÇn:\n"
	szSay = szSay .. "  + Kh«i, Gi¸p Trang: C­êng hãa 13 trë lªn, 20 Thiªn Th¹ch Tinh Th¹ch, 4.000 vµng\n"
	szSay = szSay .. "  + Phï, LÖnh, Kú: 35 Thiªn Th¹ch Tinh Th¹ch, 5.000 vµng\n"
	szSay = szSay .. "NhËn l¹i trang bÞ §¹i Nguyªn So¸i <color=yellow>+13<color>, mÊt hiÖu qu¶ §Þnh hån, §¹i ®Þnh hån.\n"
	szSay = szSay .. "<color=red>Tû lÖ thµnh c«ng 100%<color>"
	tbSay = {
		"TiÕn hµnh chuyÓn ®æi/DaiNguyenSoaiChange_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(g_szNpcName.. szSay,getn(tbSay),tbSay)
end

function DaiNguyenSoaiChange_Done()
	PutinItemBox("ChuyÓn ®æi trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn chuyÓn ®æi?", DAINGUYENSOAICHANGE_FILE, 1)
end


function ThuongUngNguyenSoaiChange_Form()
	local szSay = "ChuyÓn ®æi trang bÞ Th­¬ng ¦ng Nguyªn So¸i cÇn:\n"
	szSay = szSay .. "  + Kh«i, Gi¸p Trang: C­êng hãa 14 trë lªn, 35 Thiªn Th¹ch Tinh Th¹ch, 5.000 vµng\n"
	szSay = szSay .. "  + Phï, LÖnh, Kú: 50 Thiªn Th¹ch Tinh Th¹ch, 5.000 vµng\n"
	szSay = szSay .. "NhËn l¹i trang bÞ Th­¬ng ¦ng Nguyªn So¸i <color=yellow>+14<color>, mÊt hiÖu qu¶ §Þnh hån, §¹i ®Þnh hån.\n"
	szSay = szSay .. "<color=red>Tû lÖ thµnh c«ng 100%<color>"
	tbSay = {
		"TiÕn hµnh chuyÓn ®æi/ThuongUngNguyenSoaiChange_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(g_szNpcName.. szSay,getn(tbSay),tbSay)
end

function ThuongUngNguyenSoaiChange_Done()
	PutinItemBox("ChuyÓn ®æi trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn chuyÓn ®æi?", THUONGUNGNGUYENSOAICHANGE_FILE, 1)
end



function ThuongUngNguyenSoai_Form()
	tbSay = {
		"TiÕn hµnh n©ng cÊp/ThuongUngNguyenSoai_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(g_szNpcName.."N©ng cÊp trang bÞ §¹i Tèng-Liªu Nguyªn So¸i thµnh Th­¬ng ¦ng Nguyªn So¸i cÇn:\n* Nãn, gi¸p, quÇn: Trang bÞ §¹i Tèng-Liªu Nguyªn So¸i c­êng hãa 13 trë lªn, 15 B¹ch Kim Hång Bao (4000 vµng), 4 N÷ Oa Tinh Th¹ch, 1000 vµng <color=red>(thÊt b¹i sÏ mÊt 1000 vµng, 1 Hoµng Kim Hång Bao hoÆc 1 N÷ Oa Tinh Th¹ch)<color>\n* So¸i Hæ, So¸i LÖnh, So¸i Phï, So¸i Kú: 20 B¹ch Kim Hång Bao (4000 vµng), 6 N÷ Oa Tinh Th¹ch, 2000 vµng <color=red>(thÊt b¹i sÏ mÊt 2000 vµng, 1 Hoµng Kim Hång Bao hoÆc 1 N÷ Oa Tinh Th¹ch)<color>",getn(tbSay),tbSay)
end

function ThuongUngNguyenSoai_Done()
	if abs(GetTask(701)) <1500000 then
		Talk(1,"",g_szNpcName.."C«ng tr¹ng ng­¬i Ýt vËy ta ch¼ng muèn ra tay gióp ®ì. H·y cè g¾ng ®¹t 1500000 c«ng tr¹ng, ta sÏ nghÜ l¹i...")
		return 0
	end
	if abs(GetTask(704)) < 6 then
		Talk(1,"",g_szNpcName.."Ta chØ nhËn lµm cho c¸c vÞ Nguyªn So¸i th«i, cho nªn.... ng­¬i h·y cè g¾ng thªm n÷a nhÐ!")
		return 0
	end
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", THUONGUNGNGUYENSOAI_FILE, 1)
end

function LoiHoNguyenSoai_Form()
	tbSay = {
		"TiÕn hµnh n©ng cÊp/LoiHoNguyenSoai_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(g_szNpcName.."N©ng cÊp trang bÞ §¹i Tèng-Liªu Nguyªn So¸i thµnh L«i Hæ Nguyªn So¸i cÇn:\n* Trang bÞ cÇn n©ng cÊp (Nãn, gi¸p, quÇn: CÇn c­êng hãa 13 trë lªn)\n* 3 nguyªn liÖu: 200 Hu©n Ch­¬ng Anh Hïng, 16 Cöu Thiªn V« Cùc §¬n, 120000 ®iÓm tÝch lòy chiÕn tr­êng.\n<color=red>L­u ý: tû lÖ thµnh c«ng 100%.<color>",getn(tbSay),tbSay)
end

function LoiHoNguyenSoai_Done()
	
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", LOIHONGUYENSOAI_FILE, 1)
end

function npc_convert_talk()
		local tSay = {			
			"* ChuyÓn ®æi trang bÞ Tiªn Phong (cÇn 1 Tö Kim Hång Bao + 100 vµng)/#do_upgrade(22,0)",			
			"* ChuyÓn ®æi trang bÞ T­íng Qu©n (cÇn 1 Tö Kim Hång Bao + 100 vµng)/#do_upgrade(23,0)",
			"* ChuyÓn ®æi trang bÞ Thiªn Chi T­íng Qu©n (cÇn 1 Tö Kim Hång Bao + 100 vµng)/#do_upgrade(24,0)",
			"T¹i h¹ chØ tiÖn ghÐ ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Chän lo¹i trang bÞ Tèng Liªu muèn chuyÓn ®æi?",getn(tSay),tSay)
end

function create_bpy()
	local tSay = {
		"* ChÕ t¹o vò khÝ Bé Phi Yªn ngÉu nhiªn (cÇn 3 Phi Yªn Th¹ch + 100 vµng)/#do_upgrade(1,0)",
		"* ChÕ t¹o vò khÝ Bé Phi Yªn tù chän (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/select_bpy_1",
		"* N©ng cÊp vò khÝ Bé Phi Yªn (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Vò KhÝ Bé Phi Yªn (s¬ cÊp) c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(21,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta chÕ t¹o lo¹i vò khÝ nµo? <color=red>L­u ý: tû lÖ thµnh c«ng 100%.<color>",getn(tSay),tSay)
end

function select_bpy_1()
	local tSay = {	}
	for i=1, 8 do
		tinsert(tSay,format("ChÕ t¹o %s/#do_upgrade(%d,%d)",tb_upgrade_weapon_bpy_low[i][1],2,i))
	end
	tinsert(tSay,"Trang sau/select_bpy_2")
	tinsert(tSay,"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing")
	Say(g_szNpcName.."C¸c h¹ muèn ta chÕ t¹o lo¹i vò khÝ nµo?",getn(tSay),tSay)
end

function select_bpy_2()
	local tSay = {	}
	for i=9, getn(tb_upgrade_weapon_bpy_low) do
		tinsert(tSay,format("ChÕ t¹o %s/#do_upgrade(%d,%d)",tb_upgrade_weapon_bpy_low[i][1],2,i))
	end
	tinsert(tSay,"Trang tr­íc/select_bpy_1")
	tinsert(tSay,"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing")
	Say(g_szNpcName.."C¸c h¹ muèn ta chÕ t¹o lo¹i vò khÝ nµo?",getn(tSay),tSay)
end

function upgrade_emperor()
	local tSay = {
		"* N©ng cÊp Thiªn Chi Viªm §Õ Kh«i (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Viªm §Õ Kh«i c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(3,0)",
		"* N©ng cÊp Thiªn Chi Viªm §Õ Gi¸p (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Viªm §Õ Gi¸p c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(4,0)",
		"* N©ng cÊp Thiªn Chi Viªm §Õ Trang (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Viªm §Õ Trang c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(5,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo? <color=red>L­u ý: thÊt b¹i tiªu hao 1 N÷ Oa Tinh Th¹ch hoÆc 1 Phi Yªn Th¹ch vµ 100 vµng. Tû lÖ thµnh c«ng phô thuéc vµo møc c­êng hãa cña vËt phÈm.<color>",getn(tSay),tSay)
end


function upgrade_tq_emperor()
	local tSay = {
		"* N©ng cÊp Viªm §Õ Kh«i (cÇn 1 Tö Kim Hång Bao + 1 N÷ Oa Tinh Th¹ch + 1 Tö Quang Viªm §Õ Kh«i c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(69,0)",
		"* N©ng cÊp Viªm §Õ Gi¸p (cÇn 1 Tö Kim Hång Bao + 1 N÷ Oa Tinh Th¹ch + 1 Tö Quang Viªm §Õ Gi¸p c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(70,0)",
		"* N©ng cÊp Viªm §Õ Trang (cÇn 1 Tö Kim Hång Bao + 1 N÷ Oa Tinh Th¹ch + 1 Tö Quang Viªm §Õ Trang c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(71,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo? <color=red>L­u ý: thÊt b¹i tiªu hao 1 N÷ Oa Tinh Th¹ch hoÆc 1 Tö Kim Hång Bao vµ 100 vµng. Tû lÖ thµnh c«ng phô thuéc vµo møc c­êng hãa cña vËt phÈm.<color>",getn(tSay),tSay)
end

function do_upgrade_tq_type(nType)
	local tSay = {
		format("Nam Tiªu ChuÈn/#do_upgrade(%d,1)",nType),
		format("Nam Kh«i Ng«/#do_upgrade(%d,2)",nType),
		format("N÷ Gîi C¶m/#do_upgrade(%d,3)",nType),
		format("KiÒu N÷/#do_upgrade(%d,4)",nType),		
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo? <color=red>L­u ý: Tû lÖ thµnh c«ng phô thuéc vµo møc c­êng hãa cña vËt phÈm.<color>",getn(tSay),tSay)
end

function change_cangjiang()
	local tSay = {
		"* ChuyÓn ®æi Tµng KiÕm Tö Kim M·o (cÇn 1 Tµng KiÕm LÖnh + 1 N÷ Oa Tinh Th¹ch + 1 Tµng KiÕm Tö Kim M·o c­êng hãa 7 trë lªn + 100 vµng)/#change_cangjiang_type(6)",
		"* ChuyÓn ®æi Kim Lò Th­êng (cÇn 1 Tµng KiÕm LÖnh + 1 N÷ Oa Tinh Th¹ch + 1 Kim Lò Th­êng c­êng hãa 7 trë lªn + 100 vµng)/#change_cangjiang_type(7)",
		"* ChuyÓn ®æi Tµng KiÕm ¤ Kim Phôc (cÇn 1 Tµng KiÕm LÖnh + 1 N÷ Oa Tinh Th¹ch + 1 Tµng KiÕm ¤ Kim Phôc c­êng hãa 7 trë lªn + 100 vµng)/#change_cangjiang_type(8)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta chuyÓn ®æi lo¹i trang bÞ nµo? <color=red>L­u ý: tû lÖ thµnh c«ng 100%.<color>",getn(tSay),tSay)
end

function change_cangjiang_type(nType)
	local tSay = {
		format("Nam Tiªu ChuÈn/#do_upgrade(%d,1)",nType),
		format("Nam Kh«i Ng«/#do_upgrade(%d,2)",nType),
		format("N÷ Gîi C¶m/#do_upgrade(%d,3)",nType),
		format("KiÒu N÷/#do_upgrade(%d,4)",nType),		
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta chuyÓn ®æi lo¹i trang bÞ nµo? <color=red>L­u ý: tû lÖ thµnh c«ng 100%.<color>",getn(tSay),tSay)
end

function upgrade_cangjiang()
	local tSay = {
		"* C¶i t¹o Tµng KiÕm B¶o Ch©u (cÇn 1 Tµng KiÕm LÖnh + 1 N÷ Oa Tinh Th¹ch + 1 Tµng KiÕm B¶o Ch©u + 100 vµng)/#do_upgrade(9,0)",
		"* C¶i t¹o Tµng KiÕm Kú Th¹ch (cÇn 1 Tµng KiÕm LÖnh + 1 N÷ Oa Tinh Th¹ch + 1 Tµng KiÕm Kú Th¹ch + 100 vµng)/#do_upgrade(10,0)",
		"* C¶i t¹o Tµng KiÕm Kim Ên (cÇn 1 Tµng KiÕm LÖnh + 1 N÷ Oa Tinh Th¹ch + 1 Tµng KiÕm Kim Ên + 100 vµng)/#do_upgrade(11,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta c¶i t¹o lo¹i trang bÞ nµo? <color=red>L­u ý: tû lÖ thµnh c«ng 100%, thuéc tÝnh nhËn ®­îc lµ ngÉu nhiªn.<color>",getn(tSay),tSay)
end

function upgrade_tqc()
	local tSay = {
		"* N©ng cÊp vò khÝ Tö Quang (cÇn 1 Tö Quang ThÇn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Vò khÝ Tö Quang c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(12,0)",
		"* N©ng cÊp trang søc Tö Quang (cÇn 1 Tö Quang ThÇn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Toµn Th¹ch Giíi ChØ + 1 Hång PhØ Thóy Hé Phï + 100 vµng)/#do_upgrade(13,0)",
		"* N©ng cÊp trang søc Tö Quang (cÇn 1 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Toµn Th¹ch Giíi ChØ + 1 Hång PhØ Thóy Hé Phï + 100 vµng)/#do_upgrade(14,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo? <color=red>L­u ý: thÊt b¹i tiªu hao 1 N÷ Oa Tinh Th¹ch hoÆc 1 Tö Quang ThÇn Th¹ch hoÆc 1 Phi Yªn Th¹ch hoÆc 1 Trang Søc,  vµ 100 vµng. Tû lÖ thµnh c«ng phô thuéc vµo møc c­êng hãa cña vËt phÈm.<color>",getn(tSay),tSay)
end

function upgrade_tqvd()
	local tSay = {
		"* C¶i t¹o thµnh Tö Quang Viªm §Õ Kh«i (cÇn 2 Phi Yªn Th¹ch, 1 N÷ Oa Tinh Th¹ch, 999 Vâ L©m Hoµng Kim LÖnh, 1 Tö Quang Viªm §Õ Trang BÞ c­êng hãa 7 trë lªn + 1000 vµng + 1000 ®iÓm Tö Quang)/#do_upgrade(32,0)",
		"* C¶i t¹o thµnh Tö Quang Viªm §Õ Gi¸p (cÇn 2 Phi Yªn Th¹ch, 1 N÷ Oa Tinh Th¹ch, 999 Vâ L©m Hoµng Kim LÖnh, 1 Tö Quang Viªm §Õ Trang BÞ c­êng hãa 7 trë lªn + 1000 vµng + 1000 ®iÓm Tö Quang)/#do_upgrade(33,0)",
		"* C¶i t¹o thµnh Tö Quang Viªm §Õ Trang (cÇn 2 Phi Yªn Th¹ch, 1 N÷ Oa Tinh Th¹ch, 999 Vâ L©m Hoµng Kim LÖnh, 1 Tö Quang Viªm §Õ Trang BÞ c­êng hãa 7 trë lªn + 1000 vµng + 1000 ®iÓm Tö Quang)/#do_upgrade(34,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta c¶i t¹o thµnh lo¹i trang bÞ nµo? <color=red>L­u ý: 999 Vâ L©m Hoµng Kim LÖnh ph¶i ®Ó trong hµnh trang, kh«ng ®Æt vµo trong « nguyªn liÖu.<color>",getn(tSay),tSay)
end

function upgrade_songliao()
	local tSay = {
		"* N©ng cÊp trang bÞ Ngù Long T­íng Qu©n/upgrade_gen1",
		--"* N©ng cÊp trang bÞ Ngù Long T­íng Qu©n tû lÖ thµnh c«ng 100%/upgrade_gen2",
		"* N©ng cÊp trang bÞ Ngù Long T­íng Qu©n tû lÖ thµnh c«ng 100%/upgrade_gen2_100",
		"* C¶i t¹o trang bÞ Ngù Long T­íng Qu©n/upgrade_nltq_clothes",
		"* N©ng cÊp trang bÞ T­íng Qu©n/upgrade_gen",
		"* N©ng cÊp trang bÞ T­íng Qu©n (thµnh c«ng 100%)/upgrade_gen_100",
		"* N©ng cÊp trang bÞ Nguyªn So¸i/upgrade_mar",
		"* N©ng cÊp trang bÞ Ngù Long - ThiÖu Th¸nh Nguyªn So¸i/upgrade_upper_mar",
		"* N©ng cÊp trang bÞ Ngù Long - ThiÖu Th¸nh Nguyªn So¸i thµnh c«ng 100%/upgrade_upper_mar_100",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	
	Say(g_szNpcName.."C¸c h¹ muèn n©ng cÊp lo¹i trang bÞ nµo?", getn(tSay), tSay)
end

function upgrade_gen()
	local tSay = {
		"* N©ng cÊp T­íng Qu©n ChiÕn Kh«i (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 T­íng Qu©n ChiÕn Kh«i c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(15,0)",
		"* N©ng cÊp T­íng Qu©n ChiÕn Bµo (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 T­íng Qu©n ChiÕn Bµo c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(16,0)",
		"* N©ng cÊp T­íng Qu©n ChiÕn Trang (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 T­íng Qu©n ChiÕn Trang c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(17,0)",
		"* N©ng cÊp T­íng Qu©n LÖnh Bµi (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 T­íng Qu©n LÖnh Bµi + 100 vµng)/#do_upgrade(18,0)",
		"* N©ng cÊp T­íng Qu©n Cê LÖnh (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 T­íng Qu©n Cê LÖnh + 100 vµng)/#do_upgrade(19,0)",
		"* N©ng cÊp T­íng Qu©n LÖnh Phï (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 T­íng Qu©n LÖnh Phï + 100 vµng)/#do_upgrade(20,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo? <color=red>L­u ý: thÊt b¹i tiªu hao 1 N÷ Oa Tinh Th¹ch hoÆc 1 Phi Yªn Th¹ch vµ 100 vµng. Tû lÖ thµnh c«ng phô thuéc vµo møc c­êng hãa cña vËt phÈm.<color>",getn(tSay),tSay)
end

function upgrade_gen_100()
	local tSay = {
		"*TiÕn hµnh n©ng cÊp/#do_upgrade(78,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N©ng cÊp T­íng Qu©n thµnh Thiªn Chi T­íng Qu©n thµnh c«ng 100% ph¶i cÇn <color=yellow>4 N÷ Oa Tinh Th¹ch, 4 B¹ch Kim Hång Bao (4000v), 400 vµng<color>. Nãn, ¸o, quÇn muèn n©ng cÊp ph¶i <color=red>c­êng hãa 7<color> trë lªn.",getn(tSay),tSay)
end

-- N©ng cÊp trang bÞ Ngù Long T­íng Qu©n
function upgrade_gen1()
	local tSay = {
		"* N©ng cÊp Ngù Long T­íng Qu©n ChiÕn Kh«i (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n ChiÕn Kh«i c­êng hãa 7 trë lªn + 300 vµng)/#do_upgrade(51,0)",
		"* N©ng cÊp Ngù Long T­íng Qu©n ChiÕn Bµo (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n ChiÕn Bµo c­êng hãa 7 trë lªn + 300 vµng)/#do_upgrade(52,0)",
		"* N©ng cÊp Ngù Long T­íng Qu©n ChiÕn Trang (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n ChiÕn Trang c­êng hãa 7 trë lªn + 300 vµng)/#do_upgrade(53,0)",
		"* N©ng cÊp T­íng Qu©n LÖnh Bµi (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n LÖnh Bµi  + 300 vµng)/#do_upgrade(56,0)",
		"* N©ng cÊp T­íng Qu©n Cê LÖnh (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n LÖnh Kú  + 300 vµng)/#do_upgrade(54,0)",
		"* N©ng cÊp T­íng Qu©n LÖnh Phï (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n LÖnh Phï  + 300 vµng)/#do_upgrade(55,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo? <color=red>L­u ý: thÊt b¹i tiªu hao 3 N÷ Oa Tinh Th¹ch hoÆc 1 Thiªn Qu¸i Th¹ch vµ 300 vµng. Tû lÖ thµnh c«ng phô thuéc vµo møc c­êng hãa cña vËt phÈm.<color>",getn(tSay),tSay)
end
-- N©ng cÊp trang bÞ Ngù Long T­íng Qu©n (100%) thµnh c«ng
function upgrade_gen2()
	local tSay = {
		"* N©ng cÊp Ngù Long T­íng Qu©n ChiÕn Kh«i (cÇn 680 Thiªn Ngo¹i L­u Tinh + 1 §Þnh Hån Thiªn Th¹ch + Mét Thiªn Th¹ch Linh Th¹ch + 2 N÷ Oa Tinh Th¹ch  +1Tèng/Liªu T­íng Qu©n ChiÕn Kh«i c­êng hãa 10 trë lªn)/#do_upgrade(57,0)",
		"* N©ng cÊp Ngù Long T­íng Qu©n ChiÕn Bµo (cÇn 680 Thiªn Ngo¹i L­u Tinh + 1 §Þnh Hån Thiªn Th¹ch + Mét Thiªn Th¹ch Linh Th¹ch + 2 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n ChiÕn Bµo c­êng hãa 10 trë lªn)/#do_upgrade(58,0)",
		"* N©ng cÊp Ngù Long T­íng Qu©n ChiÕn Trang (cÇn 680 Thiªn Ngo¹i L­u Tinh + 1 §Þnh Hån Thiªn Th¹ch + Mét Thiªn Th¹ch Linh Th¹ch + 2 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n ChiÕn Trang c­êng hãa 10 trë lªn)/#do_upgrade(59,0)",
		"* N©ng cÊp T­íng Qu©n LÖnh Bµi (cÇn 680 Thiªn Ngo¹i L­u Tinh + 1 §Þnh Hån Thiªn Th¹ch + Mét Thiªn Th¹ch Linh Th¹ch + 2 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n LÖnh Bµi)/#do_upgrade(62,0)",
		"* N©ng cÊp T­íng Qu©n Cê LÖnh (cÇn 680 Thiªn Ngo¹i L­u Tinh + 1 §Þnh Hån Thiªn Th¹ch + Mét Thiªn Th¹ch Linh Th¹ch + 2 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n LÖnh Kú)/#do_upgrade(60,0)",
		"* N©ng cÊp T­íng Qu©n LÖnh Phï (cÇn 680 Thiªn Ngo¹i L­u Tinh + 1 §Þnh Hån Thiªn Th¹ch + Mét Thiªn Th¹ch Linh Th¹ch + 2 N÷ Oa Tinh Th¹ch + 1 Tèng/Liªu T­íng Qu©n LÖnh Phï)/#do_upgrade(61,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo? <color=red>L­u ý: Tû lÖ thµnh c«ng 100%.<color>",getn(tSay),tSay)
end

function upgrade_mar()
	local tSay = {
		"* N©ng cÊp Nguyªn So¸i ChiÕn Kh«i (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i ChiÕn Kh«i c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(25,0)",
		"* N©ng cÊp Nguyªn So¸i ChiÕn Bµo (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i ChiÕn Bµo c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(26,0)",
		"* N©ng cÊp Nguyªn So¸i ChiÕn Phôc (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i ChiÕn Phôc c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(27,0)",
		"* N©ng cÊp Nguyªn So¸i Phï (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i Phï + 100 vµng)/#do_upgrade(28,0)",
		"* N©ng cÊp Nguyªn So¸i Hæ Phï (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i Hæ Phï + 100 vµng)/#do_upgrade(29,0)",
		"* N©ng cÊp Nguyªn So¸i Kú (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i Kú + 100 vµng)/#do_upgrade(30,0)",
		"* N©ng cÊp Nguyªn So¸i LÖnh Kú (cÇn 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i LÖnh Kú + 100 vµng)/#do_upgrade(31,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo? <color=red>L­u ý: thÊt b¹i tiªu hao 1 N÷ Oa Tinh Th¹ch hoÆc 1 Phi Yªn Th¹ch vµ 100 vµng. Tû lÖ thµnh c«ng phô thuéc vµo møc c­êng hãa cña vËt phÈm vµ qu©n c«ng.<color>",getn(tSay),tSay)
end

function upgrade_upper_mar()
	local tSay = {
		"* N©ng cÊp Nguyªn So¸i ChiÕn Kh«i (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i ChiÕn Kh«i c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(37,0)",
		"* N©ng cÊp Nguyªn So¸i ChiÕn Gi¸p (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i ChiÕn Gi¸p c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(38,0)",
		"* N©ng cÊp Nguyªn So¸i ChiÕn Trang (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i ChiÕn Phôc c­êng hãa 7 trë lªn + 100 vµng)/#do_upgrade(39,0)",
		"* N©ng cÊp Nguyªn So¸i HiÖu Phï (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i HiÖu Phï + 100 vµng)/#do_upgrade(40,0)",
		"* N©ng cÊp Nguyªn So¸i Hæ Phï (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i Hæ Phï + 100 vµng)/#do_upgrade(41,0)",
		"* N©ng cÊp Nguyªn So¸i HiÖu Kú (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i HiÖu Kú + 100 vµng)/#do_upgrade(42,0)",
		"* N©ng cÊp Nguyªn So¸i LÖnh Kú (cÇn 3 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 1 Nguyªn So¸i LÖnh Kú + 100 vµng)/#do_upgrade(43,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo?",getn(tSay),tSay)
end

function upgrade_PlatinumEmperor()
	local tSay = {
		"* B¹ch Kim Viªm §Õ (cÇn trang bÞ bé Thiªn Chi Viªm §Õ [+7] + 3 bao B¹ch Kim §¹i Hång Bao (chøa 4000 vµng))/#confirm_PlatinumEmperor(1)",
		"* B¹ch Kim Viªm §Õ (cÇn trang bÞ bé Thiªn Chi Viªm §Õ [+10] + 2 bao B¹ch Kim §¹i Hång Bao (chøa 4000 vµng))/#confirm_PlatinumEmperor(2)",
		"* B¹ch Kim Viªm §Õ (cÇn trang bÞ bé Thiªn Chi Viªm §Õ [+13] + 1 bao B¹ch Kim §¹i Hång Bao (chøa 4000 vµng))/#confirm_PlatinumEmperor(3)",	
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo?",getn(tSay),tSay)
end

function confirm_PlatinumEmperor(nSelected)
	local tSay = {
		"* NhËn B¹ch Kim Viªm §Õ Kh«i (cÇn "..tbCheck_BKVD[nSelected][1].." Thiªn Chi Viªm §Õ Kh«i [+"..tbCheck_BKVD[nSelected][3].."] + "..tbCheck_BKVD[nSelected][2].." bao B¹ch Kim §¹i Hång Bao (chøa 4000 vµng))/#do_upgrade(72,1,"..nSelected..")",
		"* NhËn B¹ch Kim Viªm §Õ Gi¸p (cÇn "..tbCheck_BKVD[nSelected][1].." Thiªn Chi Viªm §Õ Gi¸p [+"..tbCheck_BKVD[nSelected][3].."] + "..tbCheck_BKVD[nSelected][2].." bao B¹ch Kim §¹i Hång Bao (chøa 4000 vµng))/#do_upgrade(73,2,"..nSelected..")",
		"* NhËn B¹ch Kim Viªm §Õ Trang(cÇn "..tbCheck_BKVD[nSelected][1].." Thiªn Chi Viªm §Õ Trang [+"..tbCheck_BKVD[nSelected][3].."] + "..tbCheck_BKVD[nSelected][2].." bao B¹ch Kim §¹i Hång Bao (chøa 4000 vµng))/#do_upgrade(74,3,"..nSelected..")",	
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	
	Say(g_szNpcName.."C¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo?",getn(tSay),tSay)
end

function do_upgrade(nUpgradeType,nSelected, nFirstSelected)
	if nUpgradeType == 0 then
		return 0;
	end
--	local nCT = GetTask(701)
--	if nUpgradeType == 69 or nUpgradeType == 70 or nUpgradeType == 71 then
--		if nCT > -150000 and nCT < 150000  then
--			Talk(1, "", g_szNpcName.."Nh©n vËt ph¶i cã 150000 ®iÓm c«ng tr¹ng trë lªn míi cã thÓ tham gia n©ng cÊp ®å Tö Quang Viªm §Õ ®­îc!!!");
--			return 0;
--		end
--	end
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "", g_szNpcName.."Ph¶i gia nhËp hÖ ph¸i ta míi gióp ng­¬i ®­îc!");
		return 0;
	end
	if GetCash() < 1000000 then
		Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ!");
		return 0;
	end
	
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
	
	SetTaskTemp(TSK_TMP_UPGRADE,nUpgradeType)
	SetTaskTemp(TSK_TMP_SELECT,nSelected)	
	if nFirstSelected then
		SetTaskTemp(TSK_TMP_FIRSTSELECT,nFirstSelected)	
	end
	local nSlot = tb_upgrade_needed[nUpgradeType][1]		
	if nUpgradeType >= 72 and nUpgradeType <= 74 then 
		nSlot = tbCheck_BKVD[nFirstSelected][1]
	end
	PutinItemBox("ChÕ t¹o trang bÞ" ,nSlot , "X¸c nhËn muèn thùc hiÖn chÕ t¹o?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local nUpgradeType = GetTaskTemp(TSK_TMP_UPGRADE)
	local nSelected = GetTaskTemp(TSK_TMP_SELECT)
	local nFirstSelected = GetTaskTemp(TSK_TMP_FIRSTSELECT)
	if nUpgradeType == 0 then
		return 0;
	end
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
	if param ~= 1 then
		return 0;
	end
	
	local tb_item = tb_upgrade_needed[nUpgradeType][3]
	for i = 1, getn(tb_item) do
		local nG, nD, nP, nCount = gf_UnPack(tb_item[i])
		if (genre == nG and detail == nD and particular == nP) then	
			if (nUpgradeType >= 6 and nUpgradeType <= 11) or  (nUpgradeType >= 22 and nUpgradeType <= 24) or (nUpgradeType >= 45 and nUpgradeType <= 50) then
				if GetItemSpecialAttr(idx,"LOCK") == 1 then --Ëø¶¨ÅÐ¶Ï
					Talk(1,"",g_szNpcName.."VËt phÈm nµy lµ vËt phÈm khãa, më khãa råi ®æi nhÐ!");
					return 0;
				end
			end
			if nUpgradeType ~= 22 and nUpgradeType ~= 23 and nUpgradeType ~= 24 then
				if (genre == 0 and detail ~= 102 and GetEquipAttr(idx,2) < 7) then
					Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
					return 0;			
				elseif (genre == 0 and detail == 102 and (nUpgradeType == 13 or nUpgradeType == 14)) then
					local nMofa1,nLv1 = GetItemAttr(idx,1)
					local nMofa2,nLv2 = GetItemAttr(idx,2)
					local nMofa3,nLv3 = GetItemAttr(idx,3)	
					if nMofa1~= 24 or nLv1 ~= 2 or nMofa2 ~= 14 or nLv2 ~= 3 then
						Talk(1,"",g_szNpcName.."Ph¶i lµ nhÉn cã thuéc tÝnh T¨ng tèc ®é xuÊt chiªu 9%, Mçi 10 gi©y sinh lùc håi phôc 3%.");
						return 0;
					end
				end
			end
			--B¹ch Kim Viªm §Õ
			if  nUpgradeType >= 72 and nUpgradeType <= 74 then 
				if GetEquipAttr(idx,2) < tbCheck_BKVD[nFirstSelected][3] then
					Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm Thiªn Chi Viªm §Õ ph¶i tõ "..tbCheck_BKVD[nFirstSelected][3].." trë lªn");
					return 0;			
				end				
			end
			-- C¶i t¹o Thiªn Chi Tµng KiÕm
			if  nUpgradeType == 63 or nUpgradeType == 64 or nUpgradeType == 65 then 
				local nLev = GetEquipAttr(idx,2)
				if  genre == 0 then
					SetTaskTemp(TSK_TEMP_TQVD, nLev)
				end
			end
			
			-- N©ng cÊp Tö Quang Viªm §Õ lªn Viªm §Õ
			if  nUpgradeType >= 69 and nUpgradeType <= 71 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and detail == 100  then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
					if  genre == 0 and detail == 101  then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
					if  genre == 0 and detail == 103 then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
				end
			end
			
			-- N©ng cÊp Tö Quang Viªm §Õ lªn Viªm §Õ thµnh c«ng 100%
			if  nUpgradeType >= 75 and nUpgradeType <= 77 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and detail == 100  then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
					if  genre == 0 and detail == 101  then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
					if  genre == 0 and detail == 103 then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
				end
			end
			
			-- N©ng cÊp trang bÞ t­íng qu©n thµnh c«ng 100%
			if nUpgradeType == 78 then
				if GetEquipAttr(idx,2)<7 then
					if genre==0 and (detail==100 or detail==101 or detail==103) then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0
					end
				end
			end
			
			-- N©ng cÊp Ngù Long T­íng Qu©n
			if  nUpgradeType >= 51 and nUpgradeType <= 56 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and detail == 100  then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
					if  genre == 0 and detail == 101  then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
					if  genre == 0 and detail == 103 then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
				end
			end
-- N©ng cÊp Ngù Long T­íng Qu©n 100%
--			if  nUpgradeType >= 57 and nUpgradeType <= 62 then 
--				if (GetEquipAttr(idx,2) < 10) then
--					if  genre == 0 and detail == 100  then
--						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 10 trë lªn");
--						return 0;			
--					end
--					if  genre == 0 and detail == 101  then
--						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 10 trë lªn");
--						return 0;			
--					end
--					if  genre == 0 and detail == 103 then
--						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 10 trë lªn");
--						return 0;			
--					end
--				end
--			end
-- N©ng cÊp Ngù Long T­íng Qu©n 100% (ver 2)
			if  nUpgradeType == 79 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and (detail == 100  or detail == 101 or detail == 103) then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
				end
			end
-- N©ng cÊp Tèng/Liªu Nguyªn So¸i 100%
			if  nUpgradeType == 80 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  genre == 0 and (detail == 100  or detail == 101 or detail == 103) then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;			
					end
				end
			end
-- N©ng cÊp Vò khÝ ViÖt Yªn + §¹i ViÖt Yªn + S­ M«n
			if  nUpgradeType == 81 or nUpgradeType == 82 or nUpgradeType == 83  or nUpgradeType == 85 then 
				if (GetEquipAttr(idx,2) < 7) then
					if  detail ~= 102 then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 7 trë lªn");
						return 0;
					end
				end
			end
-- N©ng cÊp B¹ch Kim Viªm §Õ			
			if  nUpgradeType == 84 then 
				if (GetEquipAttr(idx,2) < 10) then
					if  detail ~= 102 then
						Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 10 trë lªn");
						return 0;
					end
				end
			end
			
			if nUpgradeType == 44 and genre == 0 then
				local tCheckList = 
				{
					[1] = {"Ph¸ Yªn §ao trung cÊp",{0,3,6001},{0,3,6001,1,1,6,85,7,263,7,264,-1,6}},
					[2] = {"Ph¸ Yªn C«n trung cÊp",{0,5,6002},{0,5,6002,1,1,6,85,7,263,7,264,-1,6}},
					[3] = {"Phï Yªn Tr­îng trung cÊp",{0,8,6003},{0,8,6003,1,1,6,86,7,267,7,263,-1,6}},
					[4] = {"Hµm Yªn Thñ trung cÊp",{0,0,6004},{0,0,6004,1,1,6,86,7,267,7,263,-1,6}},
					[5] = {"Tµng Yªn Ch©m trung cÊp",{0,1,6005},{0,1,6005,1,1,4,281,7,265,7,264,-1,6}},
					[6] = {"Phi Yªn KiÕm trung cÊp",{0,2,6006},{0,2,6006,1,1,6,86,4,292,4,293,-1,6}},
					[7] = {"VËn Yªn CÇm trung cÊp",{0,10,6007},{0,10,6007,1,1,2,27,7,266,7,265,-1,6}},
					[8] = {"V©n Yªn Thñ trung cÊp",{0,0,6008},{0,0,6008,1,1,6,85,7,264,7,263,-1,6}},
					[9] = {"L­u Yªn C«n trung cÊp",{0,5,6009},{0,5,6009,1,1,3,268,7,265,7,266,-1,6}},
					[10] = {"HuyÒn Yªn KiÕm trung cÊp",{0,2,6010},{0,2,6010,1,1,6,86,7,267,7,266,-1,6}},
					[11] = {"Vò Yªn Bót trung cÊp",{0,9,6011},{0,9,6011,1,1,3,268,7,266,7,265,-1,6}},
					[12] = {"Hµ Tiªm Th­¬ng trung cÊp",{0,6,6012},{0,6,6012,1,1,6,85,7,264,7,263,-1,6}},
					[13] = {"Hµnh Yªn Cung trung cÊp",{0,4,6013},{0,4,6013,1,1,3,268,7,265,7,264,-1,6}},
					[14] = {"Träc Yªn NhÉn trung cÊp",{0,7,6014},{0,7,6014,1,1,4,281,7,265,7,264,-1,6}},
					[15] = {"Yªu Yªn Tr¶o trung cÊp",{0,11,6015},{0,11,6015,1,1,5,285,7,266,7,267,-1,6}},		
				}
				local nMofa1,nLv1 = GetItemAttr(idx,1)
				local nMofa2,nLv2 = GetItemAttr(idx,2)
				local nMofa3,nLv3 = GetItemAttr(idx,3)
				for i = 1, getn(tCheckList) do
					if (genre == tCheckList[i][3][1] and detail == tCheckList[i][3][2] and particular == tCheckList[i][3][3] and nLv1 == tCheckList[i][3][6] and nMofa1== tCheckList[i][3][7] and nLv2 == tCheckList[i][3][8] and nMofa2== tCheckList[i][3][9] and nLv3 == tCheckList[i][3][10] and nMofa3== tCheckList[i][3][11]) then
						return 1
					end
				end
				Talk(1,"",g_szNpcName.."Ph¶i lµ vò khÝ Bé Phi Yªn Trung cÊp.");
				return 0
			end
			return 1;
		end
	end	
	Talk(1, "", g_szNpcName.."ChØ cã thÓ bá vµo "..tb_upgrade_needed[nUpgradeType][2]);
	return 0;
end
	
function OnPutinComplete(param)
	local nUpgradeType = GetTaskTemp(TSK_TMP_UPGRADE)
	local nSelect = GetTaskTemp(TSK_TMP_SELECT)
	local nFirstSelected = GetTaskTemp(TSK_TMP_FIRSTSELECT)
	if nUpgradeType == 0 then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng.");
		return 0;
	end
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng..");
		return 0;
	end
	local t = GetPutinItem()
	local nupgrade_needed = tb_upgrade_needed[nUpgradeType][1]
	if nUpgradeType >= 72 and nUpgradeType <= 74 then 
		nupgrade_needed = tbCheck_BKVD[nFirstSelected][1]
	end
	if getn(t) ~= nupgrade_needed then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng...");
		return 0;
	end
	local tb_item = tb_upgrade_needed[nUpgradeType][3]
	local nCheck = 1
	local nFlag = 0
	local nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed, nLock
	local tItem = {}
	-- Ph©n biÖt item tiªu hao vµ trang bÞ bá vµo
	for i = 1, getn(tb_item) do
		local nG, nD, nP, nCount = gf_UnPack(tb_item[i])
		if nG == 0 then			
			if get_item_count(t, nG, nD, nP) == nCount then
				nFlag = nFlag + 1
				_, nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed, nLock = get_item_count(t, nG, nD, nP)
				tinsert(tItem,tb_item[i])
			end
		else		
			if get_item_count(t, nG, nD, nP) ~= nCount then
				nCheck = 0;
				break;
			end			
		end
	end
	
	if tb_upgrade_needed[nUpgradeType][5] == 0 then
		nFlag = 1
	end
	if nCheck == 0 or nFlag < 1 then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng....");
		return 0;
	end
	
	local tbItemIndex = GetPutinItem()
	
	if GetCash() < 1000000 then
		Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
		return 0;
	end
	
-- N©ng cÊp Thiªn Chi T­íng Qu©n 100%
	if nUpgradeType==75 or nUpgradeType==76 or nUpgradeType==77 then
		if GetCash()<6000000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
		-- N÷ Oa Tinh Th¹ch
		if GetItemCount(2,1,504)<4 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè N÷ Oa Tinh Th¹ch ta cÇn.");
			return 0;
		end
		-- Hoµng Kim §¹i Hång Bao 999 vµng
		if GetItemCount(2,1,539)<6 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè Hoµng Kim §¹i Hång Bao ta cÇn.");
			return 0;
		end
	end
-- N©ng cÊp T­íng Qu©n Bé 1 100%
	if nUpgradeType==78 then
		if GetCash()<4000000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
		-- N÷ Oa Tinh Th¹ch
		if GetItemCount(2,1,504)<4 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè N÷ Oa Tinh Th¹ch ta cÇn.");
			return 0;
		end
		-- B¹ch Kim §¹i Hång Bao 4000 vµng (2,1,30229)
		if GetItemCount(2,1,30229)<4 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè B¹ch Kim §¹i Hång Bao ta cÇn.");
			return 0;
		end
	end
	
	if nUpgradeType >= 51 and nUpgradeType <= 62 then
		if GetCash() < 3000000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
	end
	if nUpgradeType >= 32 and nUpgradeType <= 34 then
		if GetTask(GLB_TASK_ZIGUANGGE) < 1000 then
			Talk(1, "", g_szNpcName.."Ch­a ®ñ 1000 ®iÓm Tö Quang ®Ó c¶i t¹o trang bÞ!")
			return 0
		end
		if GetCash() < 10000000 then
			Talk(1, "", g_szNpcName.."Ch­a ®ñ 1000 vµng ®Ó c¶i t¹o trang bÞ!")
			return 0
		end
		if GetItemCount(2, 1, 30284) < 999 then
			Talk(1, "", g_szNpcName.."Ph¶i cã Ýt nhÊt 999 Vâ L©m Hoµng Kim LÖnh trong hµnh trang míi cã thÓ c¶i t¹o trang bÞ!")
			return 0
		end
	end
	-- N©ng cÊp B¹ch Kim Viªm §Õ
	if nUpgradeType >= 72 and nUpgradeType <= 74 then
		local nItemNum1 = tbCheck_BKVD[nFirstSelected][2]
		if GetItemCount(2, 1, 30229) < nItemNum1 then
			Talk(1, "", g_szNpcName.."Ph¶i cã Ýt nhÊt "..nItemNum1.." B¹ch Kim Hång Bao trong hµnh trang míi cã thÓ c¶i t¹o trang bÞ!")
			return 0
		end
	end
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
-- N©ng cÊp Ngù Long T­íng Qu©n 100%
--	if nUpgradeType >= 57 and nUpgradeType <= 62 then
--		if GetItemCount(2, 1, 30321) < 680 then
--			Talk(1, "", g_szNpcName.."Ph¶i cã Ýt nhÊt 680 Thiªn Ngo¹i L­u Tinh trong hµnh trang míi cã thÓ c¶i t¹o trang bÞ!")
--			return 0
--		end
--		if GetItemCount(2, 1, 30229) < 3 then
--			Talk(1, "", g_szNpcName.."Ph¶i cã Ýt nhÊt 3 B¹ch Kim Hång Bao trong hµnh trang míi cã thÓ c¶i t¹o trang bÞ!")
--			return 0
--		end
--	end
-- N©ng cÊp Ngù Long T­íng Qu©n 100% (ver 2)
	if nUpgradeType == 79 then
		if GetCash()<8000000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
		-- N÷ Oa Tinh Th¹ch
		if GetItemCount(2,1,504)<1 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè N÷ Oa Tinh Th¹ch ta cÇn.");
			return 0;
		end
		-- B¹ch Kim §¹i Hång Bao 4000 vµng (2,1,30229)
		if GetItemCount(2,1,30229)<4 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè B¹ch Kim §¹i Hång Bao ta cÇn.");
			return 0;
		end
		-- Thiªn Th¹ch Linh Th¹ch
		if GetItemCount(2,1,1068)<3 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè Thiªn Th¹ch Linh Th¹ch  ta cÇn.");
			return 0;
		end
	end

-- N©ng cÊp Nguyªn So¸i bé 4 100%
	if nUpgradeType == 80 then
		if GetCash()<5000000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
		-- B¹ch Kim §¹i Hång Bao 4000 vµng (2,1,30229)
		if GetItemCount(2,1,30229)<5 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè B¹ch Kim §¹i Hång Bao ta cÇn.");
			return 0;
		end
		if tbItemIndex[1][3] == 102 then
			-- §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch: 2,1,1067
			if GetItemCount(2,1,1067) < 3 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch ta cÇn.");
				return 0;
			end
			-- Thiªn Cang LÖnh: 2,95,204
			if GetItemCount(2,95,204) < 5 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè Thiªn Cang LÖnh ta cÇn.");
				return 0;
			end
		else
			-- §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch: 2,1,1067
			if GetItemCount(2,1,1067) < 2 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch ta cÇn.");
				return 0;
			end
			-- Thiªn Cang LÖnh: 2,95,204
			if GetItemCount(2,95,204) < 4 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè Thiªn Cang LÖnh ta cÇn.");
				return 0;
			end
		end
	end

-- N©ng cÊp vò khÝ ViÖt Yªn
	if nUpgradeType == 81 then
		if GetCash()<2000000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
		-- N÷ Oa Tinh Th¹ch
		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè N÷ Oa Tinh Th¹ch ta cÇn.");
			return 0;
		end
		-- Thiªn Th¹ch Linh Th¹ch
		if GetItemCount(2,1,1068) < 2 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè Thiªn Th¹ch Linh Th¹ch ta cÇn.");
			return 0;
		end
		-- B¹ch Kim §¹i Hång Bao 4000 vµng (2,1,30229)
		if GetItemCount(2,1,30229) < 3 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè B¹ch Kim §¹i Hång Bao ta cÇn.");
			return 0;
		end
	end

-- C¶i t¹o vò khÝ §¹i ViÖt Yªn
	if nUpgradeType == 82 then
		if GetCash()<2000000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
		-- N÷ Oa Tinh Th¹ch
		if GetItemCount(2,1,504) < 2 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè N÷ Oa Tinh Th¹ch ta cÇn.");
			return 0;
		end
		-- Hoµng Kim Hång Bao
		if GetItemCount(2,1,539)<2 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè Hoµng Kim §¹i Hång Bao ta cÇn.");
			return 0;
		end
	end

-- N©ng cÊp trang bÞ s­ m«n
	if nUpgradeType == 83 then
		if GetCash()<12000000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
		if tbItemIndex[1][3] == 102 then
			-- Hoµng Kim Hång Bao
			if GetItemCount(2,1,539) < 15 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè Hoµng Kim §¹i Hång Bao ta cÇn.");
				return 0;
			end
			-- N÷ Oa Tinh Th¹ch
			if GetItemCount(2,1,504) < 1 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè N÷ Oa Tinh Th¹ch ta cÇn.");
				return 0;
			end
		elseif tbItemIndex[1][3] == 100 or tbItemIndex[1][3] == 101 or tbItemIndex[1][3] == 103 then
			-- Hoµng Kim Hång Bao
			if GetItemCount(2,1,539) < 12 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè Hoµng Kim §¹i Hång Bao ta cÇn.");
				return 0;
			end
			-- N÷ Oa Tinh Th¹ch
			if GetItemCount(2,1,504) < 4 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè N÷ Oa Tinh Th¹ch ta cÇn.");
				return 0;
			end
		else
			-- Hoµng Kim Hång Bao
			if GetItemCount(2,1,539) < 20 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè Hoµng Kim §¹i Hång Bao ta cÇn.");
				return 0;
			end
			-- N÷ Oa Tinh Th¹ch
			if GetItemCount(2,1,504) < 1 then
				Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng cã ®ñ sè N÷ Oa Tinh Th¹ch ta cÇn.");
				return 0;
			end
		end
	end
	
	-- N©ng cÊp trang bÞ b¹ch kim viªm ®Õ
	if nUpgradeType == 84 then
		if GetCash() < 9990000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
		if GetItemCount(2,1,30346) < 39 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng mang ®ñ 39 m¶nh b¹ch kim!");
			return 0;
		end
		if GetItemCount(2,1,30229) < 10 then
			Talk(1,"","Ta cÇn 10 b¹ch kim ®¹i hång bao, ng­¬i ®· cã ®ñ ch­a?")
			return 0
		end
	end
	
	-- N©ng cÊp trang bÞ thiªn chi viªm ®Õ
	if nUpgradeType == 85 then
		if GetCash() < 3000000 then
			Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
			return 0;
		end
		if GetItemCount(2,1,30346) < 15 then
			Talk(1, "", g_szNpcName.."C¸c h¹ kh«ng mang ®ñ 15 m¶nh b¹ch kim!");
			return 0;
		end
		if GetItemCount(2,1,539) < 15 then
			Talk(1,"","Ta cÇn 15 hoµng kim ®¹i hång bao, ng­¬i ®· cã ®ñ ch­a?")
			return 0
		end
	end
	
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
	if Pay(1000000) == 1 then
		if nUpgradeType >= 32 and nUpgradeType <= 44 then
			SetTask(GLB_TASK_ZIGUANGGE, GetTask(GLB_TASK_ZIGUANGGE) - 1000)
		end
		
		-- Trõ tiÒn n©ng cÊp Ngù Long T­íng Qu©n
		if nUpgradeType >= 51 and nUpgradeType <= 62 then
			if Pay(2000000) == 0 then
				Talk(1,"","N©ng cÊp thÊt b¹i")
				return
			end
		end
		
		local nRand = random(1,100)
		local nMax = tb_upgrade_needed[nUpgradeType][4]
		if tb_upgrade_needed[nUpgradeType][4] < 100 then
			if nUpgradeType <= 44 then
				nMax = nMax + tb_percent_plus[nQianghua]
			elseif nUpgradeType >= 45 and nUpgradeType <= 50 then
				local tb_percent_plus_tk = 
				{
					[0]   = 0,
					[1]   = 0,
					[2]   = 0,
					[3]   = 0,
					[4]   = 0,
					[5]   = 0,
					[6]   = 0,
					[7]   = 0,
					[8]   = 3,
					[9]   = 3,
					[10] = 5,
					[11] = 5,
					[12] = 7,
					[13] = 7,
					[14] = 9,
					[15] = 9,	
				}
				nMax = nMax + tb_percent_plus_tk[nQianghua]
			end
		end
		
		if nUpgradeType >= 25 and nUpgradeType <= 31 then
			local nBonus = 0
			local nPoint = abs(GetTask(701))
			for i = 1, getn(tb_percent_ranking_plus) do
				if nPoint >= tb_percent_ranking_plus[i][1] then
					nBonus =  tb_percent_ranking_plus[i][2]
					break
				end
			end
			nMax = nMax + nBonus
		end
		
		if nUpgradeType >= 37 and nUpgradeType <= 43 then
			local nBonus = 0
			local nPoint = abs(GetTask(701))
			for i = 1, getn(tb_upper_percent_ranking_plus) do
				if nPoint >= tb_upper_percent_ranking_plus[i][1] then
					nBonus =  tb_upper_percent_ranking_plus[i][2]
					break
				end
			end
			nMax = nMax + nBonus
		end
		--- N©ng cÊp trang bÞ Ngù Long t­íng Qu©n
		
		if nUpgradeType >= 51 and nUpgradeType <= 56 then
			
				local tb_percent_plus_tk = 
					{
						[0]   = 0,
						[1]   = 0,
						[2]   = 0,
						[3]   = 0,
						[4]   = 0,
						[5]   = 0,
						[6]   = 0,
						[7]   = 0,
						[8]   = 1,
						[9]   = 1,
						[10] = 2,
						[11] = 2,
						[12] = 3,
						[13] = 4,
						[14] = 6,
						[15] = 10,	
					}
				nMax = nMax + tb_percent_plus_tk[nQianghua]
			
			local nBonus = 0
			local nPoint = abs(GetTask(701))
			for i = 1, getn(tb_upper_percent_ranking_plus) do
				if nPoint >= tb_upper_percent_ranking_plus[i][1] then
					nBonus =  tb_upper_percent_ranking_plus[i][2]
					break
				end
			end
			nMax = nMax + nBonus
		end
		
	    if nRand <= nMax  then	
			local nResult = 1;
			for i = 1, getn(t) do			
				if DelItemByIndex(t[i][1], -1) ~= 1 then
					nResult = 0;
					break;
				end
			end
			if nResult == 1 then
				SetTaskTemp(TSK_TMP_UPGRADE,0)
				SetTaskTemp(TSK_TMP_SELECT,0)
				SetTaskTemp(TSK_TMP_FIRSTSELECT,0)
				local nRet, nItemIdx = 0,0
				if nUpgradeType == 1 then
					local nRandWeapon = random(1,getn(tb_upgrade_weapon_bpy_low))			
					nRet, nItemIdx = gf_AddItemEx(tb_upgrade_weapon_bpy_low[nRandWeapon][2], tb_upgrade_weapon_bpy_low[nRandWeapon][1]);
					if nRet == 1 then
						Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_weapon_bpy_low[nRandWeapon][1])
					else
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem thÊt b¹i")
					end
				elseif nUpgradeType == 2 then
					nRet, nItemIdx = gf_AddItemEx(tb_upgrade_weapon_bpy_low[nSelect][2], tb_upgrade_weapon_bpy_low[nSelect][1]);
					if nRet == 1 then
						Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_weapon_bpy_low[nSelect][1])
					else
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem thÊt b¹i")
					end				
				elseif nUpgradeType == 6 or nUpgradeType == 7 or nUpgradeType == 8 then
					local nG, nD, nP = gf_UnPack(tItem[1])
					nP = 95 + nSelect - 1					
					nRet, nItemIdx = gf_AddItemEx({nG,nD,nP,1,1, -1,-1, -1, -1, -1, -1, -1,6}, "Trang bÞ Tµng KiÕm");
					if nRet == 1 then
						--if nDing > 0 then
							--SetItemSpecialAttr(nItemIdx,"DING7",1)
						--end
						--if nLock > 0 then
							--SetItemSpecialAttr(nItemIdx,"LOCK",1)
						--end
						Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, "Trang bÞ Tµng KiÕm")
					else
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem thÊt b¹i")
					end	
				elseif nUpgradeType == 13 or nUpgradeType == 14 then
					nRoute = GetPlayerRoute()
					if random(1,100) <= 50 then
						nRet, nItemIdx = gf_AddItemEx(tb_upgrade_jew_dau[nRoute][2], tb_upgrade_jew_dau[nRoute][1]);
						if nRet == 1 then
							Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_jew_dau[nRoute][1])
						else
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem thÊt b¹i")
						end	
					else
						nRet, nItemIdx = gf_AddItemEx(tb_upgrade_jew_chien[nRoute][2], tb_upgrade_jew_chien[nRoute][1]);
						if nRet == 1 then
							Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_jew_chien[nRoute][1])
						else
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem thÊt b¹i")
						end	
					end
				elseif nUpgradeType == 22 or nUpgradeType == 23 or nUpgradeType == 24 then				
					local nG, nD, nP = gf_UnPack(tItem[1])
					local nGet = 0					
					for i=1,getn(tb_convert_item) do
						if nG == tb_convert_item[i][2][1] and nD == tb_convert_item[i][2][2] and nP == tb_convert_item[i][2][3] then
							nGet = i							
							break;
						end					
					end
					if nGet > 0 then
						nRet, nItemIdx = gf_AddItemEx({tb_convert_item[nGet][3][1],tb_convert_item[nGet][3][2],tb_convert_item[nGet][3][3],1,1,-1,-1,-1,-1,-1,-1,0,nQianghua}, tb_convert_item[nGet][1]);
						if nRet == 1 then
							if nDing > 0 then
								SetItemSpecialAttr(nItemIdx,"DING7",1)
							end
							--if nLock > 0 then
								--SetItemSpecialAttr(nItemIdx,"LOCK",1)
							--end
							Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, tb_convert_item[nGet][1])
						else
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem thÊt b¹i")
						end										
					end
				elseif nUpgradeType >= 32 and nUpgradeType <= 34 then
					Pay(9000000)
					if DelItem(2, 1, 30284, 999) == 1 then
						local nBody = GetBody()
						local nGenre = 103
						local szType = "Tö Quang Viªm §Õ Kh«i"
						if nUpgradeType == 33 then
							nGenre = 100
							szType = "Tö Quang Viªm §Õ Gi¸p"
						elseif nUpgradeType == 34 then
							nGenre = 101
							szType = "Tö Quang Viªm §Õ Trang"
						end
						gf_AddItemEx2({0, nGenre, 8050 + nBody, 1, 1, -1,-1,-1,-1,-1,-1, 0, 6})
						Talk(1,"",g_szNpcName.."C¶i t¹o trang bÞ míi thµnh c«ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, szType)	
					end
---- N©ng cÊp Trang BÞ Ngù Long T­íng Qu©n 100%
--				elseif nUpgradeType >= 57 and nUpgradeType <= 62 then
--					if DelItem(2, 1, 30321, 680) == 1 and DelItem(2, 1, 30229, 3) == 1 then
--						local nG, nD, nP = gf_UnPack(tItem[1])
--						local nGet = 0
--						for i=1,getn(tb_upgrade_item) do
--							if nG == tb_upgrade_item[i][2][1] and nD == tb_upgrade_item[i][2][2] and nP == tb_upgrade_item[i][2][3] then
--								nGet = i
--								break;
--							end					
--						end
--						if nGet > 0 then
--							nRet, nItemIdx = gf_AddItemEx(tb_upgrade_item[nGet][3], tb_upgrade_item[nGet][1]);
--							if nRet == 1 then
--								Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
--								WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_item[nGet][1])
--							else
--								WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem thÊt b¹i")
--							end										
--						end	
--					end
-- N©ng cÊp Trang BÞ Ngù Long T­íng Qu©n 100% (ver 2)
				elseif nUpgradeType == 79 then
					if Pay(7000000)==1 and DelItem(2,1,504,1)==1 and DelItem(2,1,30229,4)==1 and DelItem(2,1,1068,3)==1 then
						for i=233,280 do
							if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
								local nGenLevel = 0
								if  tb_upgrade_item[i][3][2]==100 or  tb_upgrade_item[i][3][2]==101 or  tb_upgrade_item[i][3][2]==103 then
									 nGenLevel = 6
								end
								nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, nGenLevel}, tb_upgrade_item[i][1]);
								Talk(1,"",g_szNpcName.."ChÕ t¹o thµnh c«ng! "..tb_upgrade_item[i][1].." nµy lµ cña c¸c h¹.")
								WriteLogEx("NangCapTrangBi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_item[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
					end
 --N©ng cÊp Nguyªn So¸i bé 4 100%
				elseif nUpgradeType == 80 then
					if tbItemIndex[1][3] == 102 then
						if Pay(4000000)==1 and DelItem(2,1,30229,5) == 1 and DelItem(2,1,1067,3) == 1 and DelItem(2,95,204,5) == 1 then
							for i=293, 348 do
								if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_upgrade_item[i][1]);
									Talk(1,"",g_szNpcName.."ChÕ t¹o thµnh c«ng! "..tb_upgrade_item[i][1].." nµy lµ cña c¸c h¹.")
									WriteLogEx("NANG CAP TRANG BI NGUYEN SOAI 3","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_item[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
						end
					else
						if Pay(4000000)==1 and DelItem(2,1,30229,5) == 1 and DelItem(2,1,1067,2) == 1 and DelItem(2,95,204,4) == 1 then
							for i=293, 348 do
								if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_upgrade_item[i][1]);
									Talk(1,"",g_szNpcName.."ChÕ t¹o thµnh c«ng! "..tb_upgrade_item[i][1].." nµy lµ cña c¸c h¹.")
									WriteLogEx("NANG CAP TRANG BI NGUYEN SOAI 3","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_item[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
						end
					end
--N©ng cÊp vò khÝ ViÖt Yªn
				elseif nUpgradeType == 81 then
					if Pay(1000000)==1 and DelItem(2,1,504,1)==1 and DelItem(2,1,1068,2)==1 and DelItem(2,1,30229,3)==1 then
						for i=1,15 do
							if get_item_count(t, tb_daivietyen[i][2][1], tb_daivietyen[i][2][2], tb_daivietyen[i][2][3]) >=1 then
								nRet, nItemIdx = gf_AddItemEx({tb_daivietyen[i][3][1], tb_daivietyen[i][3][2], tb_daivietyen[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, tb_daivietyen[i][3][13]}, tb_daivietyen[i][1]);
								Talk(1,"",g_szNpcName.."ChÕ t¹o thµnh c«ng! "..tb_daivietyen[i][1].." nµy lµ cña c¸c h¹.")
								WriteLogEx("NANG CAP VU KHI VIET YEN","type "..nUpgradeType.." thµnh c«ng",1, tb_daivietyen[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
					end
--C¶i t¹o vò khÝ §¹i ViÖt Yªn
				elseif nUpgradeType == 82 then
					if Pay(1000000)==1 and DelItem(2,1,504,2)==1 and DelItem(2,1,539,2)==1 then
						for i=16,30 do
							if get_item_count(t, tb_daivietyen[i][2][1], tb_daivietyen[i][2][2], tb_daivietyen[i][2][3]) >=1 then
								nRet, nItemIdx = gf_AddItemEx({tb_daivietyen[i][3][1], tb_daivietyen[i][3][2], tb_daivietyen[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, tb_daivietyen[i][3][13]}, tb_daivietyen[i][1]);
								Talk(1,"",g_szNpcName.."ChÕ t¹o thµnh c«ng! "..tb_daivietyen[i][1].." nµy lµ cña c¸c h¹.")
								WriteLogEx("CAI TAO VU KHI DAI VIET YEN","type "..nUpgradeType.." thµnh c«ng",1, tb_daivietyen[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
					end
-- N©ng cÊp trang bÞ s­ m«n
				elseif nUpgradeType == 83 then
					if tbItemIndex[1][3] == 102 then
						if Pay(11000000)==1 and DelItem(2,1,504,1) == 1 and DelItem(2,1,539,15) == 1 then
							for i=1, 278 do
								if get_item_count(t, tb_sumon[i][2][1], tb_sumon[i][2][2], tb_sumon[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_sumon[i][3][1], tb_sumon[i][3][2], tb_sumon[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_sumon[i][1]);
									Talk(1,"",g_szNpcName.."N©ng cÊp thµnh c«ng! "..tb_sumon[i][1].." nµy lµ cña c¸c h¹.")
									WriteLogEx("NANG CAP TRANG BI SU MON 3","type "..nUpgradeType.." thµnh c«ng",1, tb_sumon[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
						end
					elseif tbItemIndex[1][3] == 100 or tbItemIndex[1][3] == 101 or tbItemIndex[1][3] == 103 then
						if Pay(11000000)==1 and DelItem(2,1,504,4) == 1 and DelItem(2,1,539,12) == 1 then
							for i=1, 278 do
								if get_item_count(t, tb_sumon[i][2][1], tb_sumon[i][2][2], tb_sumon[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_sumon[i][3][1], tb_sumon[i][3][2], tb_sumon[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_sumon[i][1]);
									Talk(1,"",g_szNpcName.."N©ng cÊp thµnh c«ng! "..tb_sumon[i][1].." nµy lµ cña c¸c h¹.")
									WriteLogEx("NANG CAP TRANG BI SU MON 3","type "..nUpgradeType.." thµnh c«ng",1, tb_sumon[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
						end
					else
						if Pay(11000000)==1 and DelItem(2,1,504,1) == 1 and DelItem(2,1,539,20) == 1 then
							for i=1, 278 do
								if get_item_count(t, tb_sumon[i][2][1], tb_sumon[i][2][2], tb_sumon[i][2][3]) >=1 then
									nRet, nItemIdx = gf_AddItemEx({tb_sumon[i][3][1], tb_sumon[i][3][2], tb_sumon[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, 0}, tb_sumon[i][1]);
									Talk(1,"",g_szNpcName.."N©ng cÊp thµnh c«ng! "..tb_sumon[i][1].." nµy lµ cña c¸c h¹.")
									WriteLogEx("NANG CAP TRANG BI SU MON 3","type "..nUpgradeType.." thµnh c«ng",1, tb_sumon[i][1])
									break
								end
							end
						else
							Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
						end
					end
-- N©ng cÊp trang bÞ B¹ch Kim Viªm §Õ
				elseif nUpgradeType == 84 then
					if Pay(8990000) == 1 and DelItem(2,1,30346,39) == 1 and DelItem(2,1,30229,10) == 1 then
						LIB_Award.szLogTitle = "NANG CAP TRANG BI BACH KIM VIEM DE"
						LIB_Award.szLogAction = "thµnh c«ng"
						if tbItemIndex[1][3] == 100 then
							LIB_Award:AwardByBody(tbBKVD_Giap)
						elseif tbItemIndex[1][3] == 101 then
							LIB_Award:AwardByBody(tbBKVD_Trang)
						elseif tbItemIndex[1][3] == 103 then
							LIB_Award:AwardByBody(tbBKVD_Khoi)
						end
					else
						Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
					end
--N©ng cÊp Thiªn Chi Viªm §Õ
				elseif nUpgradeType == 85 then
					if Pay(2000000)==1 and DelItem(2,1,539,15)==1 and DelItem(2,1,30346,15)==1 then
						for i=1,12 do
							if get_item_count(t, tbThienChiViemDe[i][2][1], tbThienChiViemDe[i][2][2], tbThienChiViemDe[i][2][3]) >=1 then
								nRet, nItemIdx = gf_AddItemEx({tbThienChiViemDe[i][3][1], tbThienChiViemDe[i][3][2], tbThienChiViemDe[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, tbThienChiViemDe[i][3][13]}, tbThienChiViemDe[i][1]);
								Talk(1,"",g_szNpcName.."ChÕ t¹o thµnh c«ng! "..tbThienChiViemDe[i][1].." nµy lµ cña c¸c h¹.")
								WriteLogEx("NANG CAP THIEN CHI VIEM DE","type "..nUpgradeType.." thµnh c«ng",1, tbThienChiViemDe[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
					end
-------------------------------
				elseif nUpgradeType == 35 then
					local nG, nD, nP = gf_UnPack(tItem[1])
					for i = 1, getn(tb_upgrade_weapon_vy) do
						if nG == tb_upgrade_weapon_vy[i][2][1] and nD == tb_upgrade_weapon_vy[i][2][2] and nP == tb_upgrade_weapon_vy[i][2][3] then
							nRet, nItemIdx = gf_AddItemEx(tb_upgrade_weapon_vy[i][3], tb_upgrade_weapon_vy[i][1])
							break
						end
					end
				elseif nUpgradeType == 44 then
					local nG, nD, nP = gf_UnPack(tItem[1])
					local tUpgradeListVY = 
					{
						[1] = {"ViÖt Yªn Phi Tinh §ao",{0,3,6001},{0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[2] = {"ViÖt Yªn Phi Tinh C«n",{0,5,6002},{0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[3] = {"ViÖt Yªn Phi Tinh Tr­îng",{0,8,6003},{0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[4] = {"ViÖt Yªn Phi Tinh Thñ",{0,0,6004},{0,0,30004, 1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[5] = {"ViÖt Yªn Phi Tinh Ch©m",{0,1,6005},{0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[6] = {"ViÖt Yªn Phi Tinh KiÕm",{0,2,6006},{0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[7] = {"ViÖt Yªn Phi Tinh CÇm",{0,10,6007},{0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[8] = {"ViÖt Yªn Phi Tinh Thñ",{0,0,6008},{0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[9] = {"ViÖt Yªn Tr¶m NguyÖt C«n",{0,5,6009},{0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[10] = {"ViÖt Yªn Tr¶m NguyÖt KiÕm",{0,2,6010},{0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[11] = {"ViÖt Yªn Tr¶m NguyÖt Bót",{0,9,6011},{0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[12] = {"ViÖt Yªn Tr¶m NguyÖt Th­¬ng",{0,6,6012},{0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[13] = {"ViÖt Yªn Tr¶m NguyÖt Cung",{0,4,6013},{0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[14] = {"ViÖt Yªn Tr¶m NguyÖt NhÉn",{0,7,6014},{0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},
						[15] = {"ViÖt Yªn Tr¶m NguyÖt Tr¶o",{0,11,6015},{0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nQianghua}},	
					}
					for i = 1, getn(tUpgradeListVY) do
						if nG == tUpgradeListVY[i][2][1] and nD == tUpgradeListVY[i][2][2] and nP == tUpgradeListVY[i][2][3] then
							nRet, nItemIdx = gf_AddItemEx(tUpgradeListVY[i][3], tUpgradeListVY[i][1])
							break
						end
					end
					if nRet == 1 then
						if nDing > 0 then
							SetItemSpecialAttr(nItemIdx,"DING7",1)
						end
						Talk(1,"",g_szNpcName.."C¶i t¹o trang bÞ míi thµnh c«ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, szType)	
					end
				elseif nUpgradeType >= 48 and nUpgradeType <= 50 then
					local nG, nD, nP = gf_UnPack(tItem[1])
					local tbAccesoriesTK =
					{
						[1] = {"Thiªn Chi Tµng KiÕm B¶o Ch©u",{0,102,38}},
						[2] = {"Thiªn Chi Tµng KiÕm Kú Th¹ch",{0,102,39}},
						[3] = {"Thiªn Chi Tµng KiÕm Kim Ên",{0,102,40}},				
					}
					
					for i = 1, getn(tbAccesoriesTK) do
						if nG == tbAccesoriesTK[i][2][1] and nD == tbAccesoriesTK[i][2][2] and nP == tbAccesoriesTK[i][2][3] then
							nRet, nItemIdx = gf_AddItemEx({0, 102, 30000 + (3 * (GetBody() - 1) + i),1,1,-1,-1,-1,-1,-1,-1,-1}, tbAccesoriesTK[i][1])
							break
						end
					end
					
					if nRet == 1 then
						Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, szType)	
					end
-- C¶i t¹o trang bÞ Thiªn Chi Tµng KiÕm					
				elseif nUpgradeType == 63 or nUpgradeType == 64 or nUpgradeType == 65  then
					local nLevItem = GetTaskTemp(TSK_TEMP_TQVD)
					local nG, nD, nP = gf_UnPack(tItem[1])
					nRet, nItemIdx = gf_AddItemEx({nG,nD,nP,1,1, -1,-1, -1, -1, -1, -1, -1,nLevItem}, "Trang bÞ Thiªn Chi Tµng KiÕm");
					if nRet == 1 then
						if nDing > 0 then
							SetItemSpecialAttr(nItemIdx,"DING7",1)
						end
						Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
						WriteLogEx("Cai tao trang bi","type "..nUpgradeType.." thµnh c«ng",1, "Trang bÞ Thiªn Chi Tµng KiÕm")
					else
						WriteLogEx("Cai tao trang bi","type "..nUpgradeType.." additem thÊt b¹i")
					end
-- N©ng cÊp Thiªn Chi T­íng Qu©n 100%
				elseif nUpgradeType == 75 or nUpgradeType == 76 or nUpgradeType == 77  then
					if Pay(5000000)==1 and DelItem(2,1,504,4)==1 and DelItem(2,1,539,6)==1 then
						for i=281,292 do
							if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
								nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1,7}, tb_upgrade_item[i][1]);
								Talk(1,"",g_szNpcName.."ChÕ t¹o thµnh c«ng! "..tb_upgrade_item[i][1].." nµy lµ cña c¸c h¹.")
								WriteLogEx("NangCapTrangBi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_item[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
						return
					end		
-- N©ng cÊp T­íng Qu©n 100%
				elseif nUpgradeType == 78 then
					if Pay(3000000)==1 and DelItem(2,1,504,4)==1 and DelItem(2,1,30229,4)==1 then
						for i=31,78 do
							if get_item_count(t, tb_upgrade_item[i][2][1], tb_upgrade_item[i][2][2], tb_upgrade_item[i][2][3]) >=1 then
								local nGenLevel = 0
								if  tb_upgrade_item[i][3][2]==100 or  tb_upgrade_item[i][3][2]==101 or  tb_upgrade_item[i][3][2]==103 then
									 nGenLevel = 7
								end
								nRet, nItemIdx = gf_AddItemEx({tb_upgrade_item[i][3][1], tb_upgrade_item[i][3][2], tb_upgrade_item[i][3][3],1,1, -1,-1, -1, -1, -1, -1, -1, nGenLevel}, tb_upgrade_item[i][1]);
								Talk(1,"",g_szNpcName.."ChÕ t¹o thµnh c«ng! "..tb_upgrade_item[i][1].." nµy lµ cña c¸c h¹.")
								WriteLogEx("NangCapTrangBi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_item[i][1])
								break
							end
						end
					else
						Talk(1,"","Kh«ng ®ñ vËt phÈm cÇn thiÕt, trang bÞ kh«ng ®­îc n©ng cÊp")
					end
				elseif nUpgradeType == 66 or nUpgradeType == 67 or nUpgradeType == 68  then
					local nG, nD, nP = gf_UnPack(tItem[1])
					nRet, nItemIdx = gf_AddItemEx({nG,nD,nP,1,1, -1,-1, -1, -1, -1, -1, -1}, "Trang bÞ Thiªn Chi Tµng KiÕm");
					if nRet == 1 then
						Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
						WriteLogEx("Cai tao trang bi","type "..nUpgradeType.." thµnh c«ng",1, "Trang bÞ Thiªn Chi Tµng KiÕm")
					else
						WriteLogEx("Cai tao trang bi","type "..nUpgradeType.." additem thÊt b¹i")
					end	
					
				elseif nUpgradeType == 72 or nUpgradeType == 73 or nUpgradeType == 74  then
						local nbody = GetBody()
						local nItemBKVD = tbBKVD_suc[nSelect][2][nbody]
						local nItemNum = tbCheck_BKVD[nFirstSelected][2]
						if DelItem(2,1,30229, nItemNum) == 1 then			
							gf_AddItemEx2(nItemBKVD, "N©ng cÊp trang bÞ thµnh c«ng", "NANG CAP TRANG BI BKVD 1", "n©ng cÊp thµnh c«ng")
							Talk(1,"","Chóc mõng b¹n nhËn ®­îc 1 trang bÞ B¹ch Kim Viªm §Õ!")					
						end
				elseif nUpgradeType == 69 or nUpgradeType == 70 or nUpgradeType == 71  then
						local nG, nD, nP = gf_UnPack(tItem[1])
						local nGet = 0
						for i=1,getn(tb_upgrade_item) do
							if nG == tb_upgrade_item[i][2][1] and nD == tb_upgrade_item[i][2][2] and nP == tb_upgrade_item[i][2][3] then
								nGet = i
								break;
							end					
						end
						if nGet > 0 then
							nRet, nItemIdx = gf_AddItemEx(tb_upgrade_item[nGet][3], tb_upgrade_item[nGet][1]);
							if nRet == 1 then
								Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
								WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_item[nGet][1])
							else
								WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem thÊt b¹i")
							end										
						end			
				else
					local nG, nD, nP = gf_UnPack(tItem[1])
					local nGet = 0
					for i=1,getn(tb_upgrade_item) do
						if nG == tb_upgrade_item[i][2][1] and nD == tb_upgrade_item[i][2][2] and nP == tb_upgrade_item[i][2][3] then
							nGet = i
							break;
						end					
					end
					if nGet > 0 then
						nRet, nItemIdx = gf_AddItemEx(tb_upgrade_item[nGet][3], tb_upgrade_item[nGet][1]);
						if nRet == 1 then
							--if nDing > 0 then
								--SetItemSpecialAttr(nItemIdx,"DING7",1)
							--end
							--if nLock > 0 then
								--SetItemSpecialAttr(nItemIdx,"LOCK",1)
							--end
							Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thµnh c«ng!")
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thµnh c«ng",1, tb_upgrade_item[nGet][1])
						else
							WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." additem thÊt b¹i")
						end										
					end			
				end				
			else
				WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." xãa trang bÞ thÊt b¹i")
			end
		else -- chÕ t¹o item míi thÊt b¹i trõ random item ®· ®Æt vµo			
			local nDelG, nDelD, nDelP = 0,0,0
			local nLossItem = gf_GetRandItemByTable(tb_upgrade_needed[nUpgradeType][6],100,1)			
			nDelG, nDelD, nDelP = gf_UnPack(tb_upgrade_needed[nUpgradeType][6][nLossItem][1])			
			for i = 1, getn(t) do	
				if t[i][2] == nDelG and t[i][3] == nDelD and t[i][4] == nDelP then
					if DelItemByIndex(t[i][1], -1) == 1 then
						WriteLogEx("Nang cap trang bi","type "..nUpgradeType.." thÊt b¹i",1,nLossItem, nDelG..","..nDelD..","..nDelP )
						break;
					end
				end
			end
			Talk(1,"",g_szNpcName.."ChÕ t¹o vËt phÈm míi thÊt b¹i!")
			Msg2Player("ChÕ t¹o vËt phÈm míi thÊt b¹i.")			
		end
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	local nQianghua, nDing, nRandSeed, nLock = 0,0,0,0
	local nMofa1,nLv1 = 0,0
	local nMofa2,nLv2 = 0,0
	local nMofa3,nLv3 = 0,0
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
			if t[i][2] == 0 then
				nQianghua = GetEquipAttr(t[i][1],2)
				nDing = GetItemSpecialAttr(t[i][1],"DING7")
				nLock = GetItemSpecialAttr(t[i][1],"LOCK") 
				nRandSeed = GetItemRandSeed(t[i][1])				
				nMofa1,nLv1 = GetItemAttr(t[i][1],1)
				nMofa2,nLv2 = GetItemAttr(t[i][1],2)
				nMofa3,nLv3 = GetItemAttr(t[i][1],3)		
			end
		end
	end
	return nCount, nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed,nLock;
end

function make_tianguashi()
	local tSay = {			
			"* ChÕ t¹o Thiªn Qu¸i Th¹ch (cÇn 1 Phi Yªn Th¹ch + 100 vµng)/make_tianguashi_1",			
			"* ChÕ t¹o Thiªn Qu¸i Th¹ch (cÇn 3 Phi Yªn Th¹ch + 100 vµng)/make_tianguashi_3",
			"T¹i h¹ chØ tiÖn ghÐ ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Chän lo¹i chÕ t¹o?",getn(tSay),tSay)
end

function make_tianguashi_1()
	if GetItemCount(2,1,30130) < 1 then
		Talk(1,"",g_szNpcName.."§¹i hiÖp vui lßng mang ®ñ 1 Phi Yªn Th¹ch råi h·y ®Õn gÆp ta!")
		return
	end
	if GetCash() < 1000000 then
		Talk(1,"",g_szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ 100 vµng th× sao chÕ t¹o ®­îc!")
		return
	end
	
	local nRand = random(1, 100)
	if DelItem(2,1,30130,1) == 1 and Pay(1000000) == 1 and nRand <= 30 then
		gf_AddItemEx2({2,0,1084,1}, "Thiªn Qu¸i Th¹ch", "Nang cap trang bi", "chÕ t¹o Thiªn Qu¸i Th¹ch 30%")
		Talk(1,"","B¹n nhËn ®­îc 1 Thiªn Qu¸i Th¹ch.")
	else
		Talk(1,"","ThËt ng¹i qu¸! ChÕ t¹o thÊt b¹i råi!")
		return
	end	
end

function make_tianguashi_3()
	if GetItemCount(2,1,30130) < 3 then
		Talk(1,"",g_szNpcName.."§¹i hiÖp vui lßng mang ®ñ 3 Phi Yªn Th¹ch råi h·y ®Õn gÆp ta!")
		return
	end
	if GetCash() < 1000000 then
		Talk(1,"",g_szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ 100 vµng th× sao chÕ t¹o ®­îc!")
		return
	end
	
	if DelItem(2,1,30130,3) == 1 and Pay(1000000) == 1 then
		gf_AddItemEx2({2,0,1084,1}, "Thiªn Qu¸i Th¹ch", "Nang cap trang bi", "chÕ t¹o Thiªn Qu¸i Th¹ch 100%")
		Talk(1,"","NhËn ®­îc 1 Thiªn Qu¸i Th¹ch.")
	end	
end

function upgrade_vy()
	local tSay = {			
			"* N©ng cÊp vò khÝ Bé Phi Yªn thµnh ViÖt Yªn (cÇn 1 Vò KhÝ Bé Phi Yªn hoÆc Bé Phi Yªn trung cÊp (c­êng hãa + 7 trë lªn) + 3 Phi Yªn Th¹ch + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(35,0)",			
			"* N©ng cÊp vò khÝ Bé Phi Yªn trung cÊp thµnh ViÖt Yªn (cÇn 1 Vò KhÝ Bé Phi Yªn trung cÊp (c­êng hãa + 7 trë lªn) + 1 Thiªn Qu¸i Th¹ch + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(44,0)",
			"* N©ng cÊp vò khÝ ViÖt Yªn thµnh §¹i ViÖt Yªn (cÇn 1 Vò KhÝ ViÖt Yªn + 3 Thiªn Qu¸i Th¹ch + 1 §Þnh Hån Thiªn Th¹ch + 100 vµng)/#do_upgrade(36,0)",
			"T¹i h¹ chØ tiÖn ghÐ ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Chän lo¹i vò khÝ muèn n©ng cÊp?",getn(tSay),tSay)
end

function upgrade_tk_equipment()
	local tSay = {			
			"* N©ng cÊp Thiªn Chi Tµng KiÕm Tö Kim M·o thµnh Thiªn Chi Tµng KiÕm Tö Kim M·o (cÇn 1 Tµng KiÕm Tö Kim M·o (c­êng hãa + 7 trë lªn) + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(45,0)",
			"* N©ng cÊp Thiªn Chi Tµng KiÕm Kim Lò Th­êng thµnh Thiªn Chi Tµng KiÕm Kim Lò Th­êng (cÇn 1 Tµng KiÕm Kim Lò Th­êng (c­êng hãa + 7 trë lªn) + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(46,0)",
			"* N©ng cÊp Thiªn Chi Tµng KiÕm ¤ Kim Phôc thµnh Thiªn Chi Tµng KiÕm ¤ Kim Phôc (cÇn 1 Tµng KiÕm ¤ Kim Phôc (c­êng hãa + 7 trë lªn) + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(47,0)",
			"* N©ng cÊp Thiªn Chi Tµng KiÕm Kim Ên thµnh Thiªn Chi Tµng KiÕm Kim Ên (cÇn 1 Tµng KiÕm Kim Ên + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(48,0)",
			"* N©ng cÊp Thiªn Chi Tµng KiÕm Kú Th¹ch thµnh Thiªn Chi Tµng KiÕm Kú Th¹ch (cÇn 1 Tµng KiÕm Kú Th¹ch + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(49,0)",
			"* N©ng cÊp Thiªn Chi Tµng KiÕm B¶o Ch©u thµnh Thiªn Chi Tµng KiÕm B¶o Ch©u (cÇn 1 Tµng KiÕm B¶o Ch©u + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(50,0)",
			"T¹i h¹ chØ tiÖn ghÐ ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Chän lo¹i trang bÞ muèn n©ng cÊp?",getn(tSay),tSay)
end

function upgrade_tctk_equipment()
	local tSay = {			
			"* C¶i t¹o Thiªn Chi Tµng KiÕm Tö Kim M·o (cÇn 1 Thiªn Chi Tµng KiÕm Tö Kim M·o (c­êng hãa + 7 trë lªn) + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(63,0)",
			"* C¶i t¹o Thiªn Chi Tµng KiÕm Kim Lò Th­êng (cÇn 1 Thiªn Chi Tµng KiÕm Kim Lò Th­êng (c­êng hãa + 7 trë lªn) + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(64,0)",
			"* C¶i t¹o Thiªn Chi Tµng KiÕm ¤ Kim Phôc (cÇn 1 Thiªn Chi Tµng KiÕm ¤ Kim Phôc (c­êng hãa + 7 trë lªn) + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(65,0)",
			"* C¶i t¹o Thiªn Chi Tµng KiÕm Kim Ên (cÇn 1 Thiªn Chi Tµng KiÕm Kim Ên + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(66,0)",
			"* C¶i t¹o Thiªn Chi Tµng KiÕm Kú Th¹ch (cÇn 1 Thiªn Chi Tµng KiÕm Kú Th¹ch + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(67,0)",
			"* C¶i t¹o Thiªn Chi Tµng KiÕm B¶o Ch©u (cÇn 1 Thiªn Chi Tµng KiÕm B¶o Ch©u + 1 Hoµng Kim §¹i Hång Bao(cã vµng) + 1 N÷ Oa Tinh Th¹ch + 100 vµng)/#do_upgrade(68,0)",
			"T¹i h¹ chØ tiÖn ghÐ ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta c¶i t¹o lo¹i trang bÞ nµo? <color=red>L­u ý: tû lÖ thµnh c«ng 100%, thuéc tÝnh nhËn ®­îc lµ ngÉu nhiªn.<color>",getn(tSay),tSay)
end

function do_upgrade_type(nType)
	local tSay = {
		format("Nam Tiªu ChuÈn/#do_upgrade(%d,1)",nType),
		format("Nam Kh«i Ng«/#do_upgrade(%d,2)",nType),
		format("N÷ Gîi C¶m/#do_upgrade(%d,3)",nType),
		format("KiÒu N÷/#do_upgrade(%d,4)",nType),		
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¸c h¹ muèn ta c¶i t¹o lo¹i trang bÞ nµo? <color=red>L­u ý: tû lÖ thµnh c«ng 100%.<color>",getn(tSay),tSay)
end

function make_shimen_tier4()
	local tSay = {			
			"* ChÕ t¹o Mò s­ m«n 4 t­¬ng øng víi m«n ph¸i (cÇn 999 Vâ L©m Hoµng Kim LÖnh, 2 N÷ Oa Tinh Th¹ch, 2000 vµng, 2000 ®iÓm S­ M«n)/#confirm_make_shimen_tier4(1)",
			"* ChÕ t¹o Th­îng Y s­ m«n 4 t­¬ng øng víi m«n ph¸i (cÇn 999 Vâ L©m Hoµng Kim LÖnh, 2 N÷ Oa Tinh Th¹ch, 2000 vµng, 2000 ®iÓm S­ M«n)/#confirm_make_shimen_tier4(2)",
			"* ChÕ t¹o H¹ Y s­ m«n 4 t­¬ng øng víi m«n ph¸i (cÇn 999 Vâ L©m Hoµng Kim LÖnh, 2 N÷ Oa Tinh Th¹ch, 2000 vµng, 2000 ®iÓm S­ M«n)/#confirm_make_shimen_tier4(3)",
			"* ChÕ t¹o Trang Søc s­ m«n 4 lo¹i 1 t­¬ng øng víi m«n ph¸i (cÇn 999 Vâ L©m Hoµng Kim LÖnh, 2 N÷ Oa Tinh Th¹ch, 2000 vµng, 2000 ®iÓm S­ M«n)/#confirm_make_shimen_tier4(4)",
			"* ChÕ t¹o Trang Søc s­ m«n 4 lo¹i 2 t­¬ng øng víi m«n ph¸i (cÇn 999 Vâ L©m Hoµng Kim LÖnh, 2 N÷ Oa Tinh Th¹ch, 2000 vµng, 2000 ®iÓm S­ M«n)/#confirm_make_shimen_tier4(5)",
			"T¹i h¹ chØ tiÖn ghÐ ngang!/gf_DoNothing"
	}
	Say(g_szNpcName.."Chän lo¹i trang bÞ muèn chÕ t¹o?",getn(tSay),tSay)
end

function confirm_make_shimen_tier4(nUpgradeType)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "", g_szNpcName.."Ph¶i gia nhËp hÖ ph¸i ta míi gióp ng­¬i ®­îc!");
		return 0;
	end
	
	if gf_JudgeRoomWeight(2,500,g_szNpcName) == 0 then
		return 0;
	end
	
	if GetTask(336) < 2000 or GetCash() < 20000000 then
		Talk(1, "", g_szNpcName.."CÇn cã Ýt nhÊt 2000 vµng vµ 2000 ®iÓm S­ M«n míi cã thÓ thùc hiÖn chÕ t¹o!");
		return 0
	end
	
	if GetItemCount(2, 1, 30284) < 999 or GetItemCount(2, 1, 504) < 2 then
		Talk(1, "", g_szNpcName.."CÇn cã 999 Vâ L©m Hoµng Kim LÖnh vµ 2 N÷ Oa Tinh Th¹ch míi cã thÓ thùc hiÖn chÕ t¹o!");
		return 0
	end
	-- ChØ sè base cña c¸c trang bÞ theo m«n ph¸i
	local tbShimen4Equip =
	{
		[2] =  {"ThiÕu L©m tôc gia", 230}, 
		[3] =  {"ThiÕu L©m thiÒn t¨ng", 330}, 
		[4] =  {"ThiÕu L©m vâ t«ng", 430}, 
		[14] =  {"Vâ §ang ®¹o gia", 1430}, 
		[15] =  {"Vâ §ang tôc gia", 1530}, 
		[8] =  {"Nga My phËt gia", 830}, 
		[9] =  {"Nga My tôc gia", 930}, 
		[11] =  {"C¸i Bang tÜnh y", 1130}, 
		[12] =  {"C¸i Bang « y", 1230}, 
		[6] =  {"§­êng M«n", 630}, 
		[17] =  {"D­¬ng Gia th­¬ng", 1730}, 
		[18] =  {"D­¬ng Gia cung", 1830}, 
		[20] = {"Ngò §éc hiÖp ®éc", 2030}, 
		[21] = {"Ngò §éc tµ ®éc", 2130}, 
	}
	
	local tbUpgradeTypes =
	{
		[1] = {"Mò", 103},
		[2] = {"Th­îng Y", 100},
		[3] = {"H¹ Y", 101},
		[4] = {"Trang Søc 1", 102},
		[5] = {"Trang Søc 2", 102},
	}
	
	-- X¸c ®Þnh sè G, D, P ®Ó add item
	local nPRoute = GetPlayerRoute()
	local nG = 0
	local nD = tbUpgradeTypes[nUpgradeType][2]
	local nP = tbShimen4Equip[nPRoute][2] + GetBody()
	if nUpgradeType == 5 then
		nP = nP + 4
	end
	if nPRoute == 8 or nPRoute == 9 then
		nP = nP - 2
	end
	
	local szEquipmentName = tbUpgradeTypes[nUpgradeType][1].." s­ m«n cÊp 4 m«n ph¸i "..tbShimen4Equip[nPRoute][1]
	
	if Pay(20000000) == 1 and DelItem(2, 1, 30284, 999) == 1 and DelItem(2, 1, 504, 2) == 1 then
		SetTask(336, GetTask(336) - 2000)
		gf_AddItemEx2({nG, nD, nP, 1, 1, -1, -1, -1, -1, -1, -1}, szEquipmentName, "Che tao Trang bi Su Mon 4", "chÕ t¹o thµnh c«ng")
	end
end


function upgrade_tq_emperor_100()
	local tSay = {
		"* N©ng cÊp Viªm §Õ Kh«i (cÇn 4 N÷ Oa Tinh Th¹ch + 06 Hoµng Kim §¹i Hång Bao (999 vµng) + 600 vµng  + 1 Tö Quang Viªm §Õ Kh«i c­êng hãa 7 trë lªn)/#do_upgrade(75,0)",
		"* N©ng cÊp Viªm §Õ Gi¸p (cÇn 4 N÷ Oa Tinh Th¹ch + 06 Hoµng Kim §¹i Hång Bao (999 vµng) + 600 vµng  + 1 Tö Quang Viªm §Õ Gi¸p c­êng hãa 7 trë lªn)/#do_upgrade(76,0)",
		"* N©ng cÊp Viªm §Õ Trang (cÇn 4 N÷ Oa Tinh Th¹ch + 06 Hoµng Kim §¹i Hång Bao (999 vµng) + 600 vµng  + 1 Tö Quang Viªm §Õ Trang c­êng hãa 7 trë lªn)/#do_upgrade(77,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."Ta ®¶m b¶o thµnh c«ng 100%, c¸c h¹ muèn ta n©ng cÊp lo¹i trang bÞ nµo?",getn(tSay),tSay)
end


function upgrade_gen2_100()
	local tSay = {
		"*TiÕn hµnh n©ng cÊp/#do_upgrade(79,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N©ng cÊp Thiªn Chi T­íng Qu©n thµnh c«ng 100% ph¶i cÇn <color=yellow>3 Thiªn Th¹ch Linh Th¹ch, 1 N÷ Oa Tinh Th¹ch, 4 B¹ch Kim Hång Bao (4000v), 800 vµng<color>. Nãn, ¸o, quÇn muèn n©ng cÊp ph¶i <color=red>c­êng hãa 7<color> trë lªn.",getn(tSay),tSay)
end


function upgrade_upper_mar_100()
	local tSay = {
		"*TiÕn hµnh n©ng cÊp/#do_upgrade(80,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N©ng cÊp Ngù Long/Chiªu Th¸nh Nguyªn So¸i thµnh §¹i Tèng/Liªu Nguyªn So¸i thµnh c«ng 100% cÇn:\n* Nãn, ¸o, quÇn: 2 ®Þnh hån thiªn th¹ch thÇn th¹ch, 4 thiªn cang lÖnh, 5 b¹ch kim hång bao, 500 vµng, trang bÞ +7\n* Kú, phï: 3 ®Þnh hån thiªn th¹ch thÇn th¹ch, 5 thiªn cang lÖnh, 5 b¹ch kim hång bao, 500 vµng, kú hoÆc phï t­¬ng øng",getn(tSay),tSay)
end


function upgrade_vietyen()
	local tSay = {
		"*TiÕn hµnh n©ng cÊp/#do_upgrade(81,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N©ng cÊp vò khÝ ViÖt Yªn thµnh §¹i ViÖt Yªn cÇn: Vò khÝ ViÖt Yªn+7 trë lªn, 1 N÷ Oa Tinh Th¹ch, 2 Thiªn Th¹ch Linh Th¹ch, 3 B¹ch Kim Hång Bao, 200 vµng",getn(tSay),tSay)
end


function remake_daivietyen()
	local tSay = {
		"*TiÕn hµnh n©ng cÊp/#do_upgrade(82,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."C¶i t¹o vò khÝ §¹i ViÖt Yªn cÇn: Vò khÝ ViÖt Yªn+7 trë lªn, 2 N÷ Oa Tinh Th¹ch, 2 Hoµng Kim Hång Bao, 200 vµng",getn(tSay),tSay)
end


function upgrade_sumon4()
	local tSay = {
		"*TiÕn hµnh n©ng cÊp/#do_upgrade(83,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N©ng cÊp s­ m«n bé 3 thµnh s­ m«n bé 4 cÇn:\n* Nãn, ¸o, quÇn: Trang bÞ s­ m«n bé 3 c­êng hãa 7 trë lªn + 4 N÷ Oa Tinh Th¹ch + 12 Hoµng Kim Hång Bao + 1200 vµng\n* Ngäc béi: Ngäc béi s­ m«n bé 3 + 1 N÷ Oa Tinh Th¹ch + 15 Hoµng Kim Hång Bao + 1200 vµng\n*Vò khÝ: Vò khÝ s­ m«n bé 3 c­êng hãa 7 trë lªn + 1 N÷ Oa Tinh Th¹ch + 20 Hoµng Kim Hång Bao + 1200 vµng\n\n<color=red>Tû lÖ thµnh c«ng 100%<color>",getn(tSay),tSay)
end


function upgrade_bachkimviemde()
	local tSay = {
		"*TiÕn hµnh n©ng cÊp/#do_upgrade(84,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N©ng cÊp Thiªn Chi Viªm §Õ thµnh B¹ch Kim Viªm §Õ cÇn: trang bÞ Thiªn Chi Viªm §Õ [+10] + 39 m¶nh b¹ch kim + 10 b¹ch kim ®¹i hång bao (4000 vµng) + 999 vµng.\n<color=red>Tû lÖ thµnh c«ng 100%<color>",getn(tSay),tSay)
end


function upgrade_thienchiviemde()
	local tSay = {
		"*TiÕn hµnh n©ng cÊp/#do_upgrade(85,0)",
		"T¹i h¹ chØ tiÖn ghÐ ngang/gf_DoNothing"
	}
	Say(g_szNpcName.."N©ng cÊp Viªm §Õ thµnh Thiªn Chi Viªm §Õ cÇn 15 m¶nh b¹ch kim + 15 hoµng kim ®¹i hång bao (999 vµng) + 300 vµng.\n<color=red>Tû lÖ thµnh c«ng 100%<color>",getn(tSay),tSay)
end


function upgrade_bachkimviemde_100_Form()
	tbSay = {
		"TiÕn hµnh n©ng cÊp/upgrade_bachkimviemde_100_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(g_szNpcName.."N©ng cÊp trang bÞ Thiªn Chi Viªm §Õ thµnh B¹ch Kim Viªm §Õ cÇn:\n - Trang bÞ Thiªn Chi Viªm §Õ c­êng hãa 13 trë lªn.\n - 68 M¶nh b¹ch kim.\n - 199 Thiªn th¹ch tinh th¹ch.\n - 3999 vµng.\n<color=red>(Tû lÖ thµnh c«ng 100%)<color>",getn(tbSay),tbSay)
end


function upgrade_bachkimviemde_100_Done()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", BACHKIMVIEMDE100_FILE, 1)
end

function RenLaiVuKhi_Form()
	local szSay = "NÕu vò khÝ ®ang dïng kh«ng ®ñ søc m¹nh chinh phôc vâ l©m, h·y ®­a ta rÌn l¹i cho. Cã ®iÒu ph¶i tr¶ c«ng ta xøng ®¸ng nhÐ\n"
	szSay = szSay .. "+ Vò khÝ 76 (c­êng hãa 11)  thµnh  vò khÝ 86 (c­êng hãa 0): 390 Thiªn Th¹ch, 290 M¶nh Thiªn Th¹ch, 79 Thiªn Th¹ch Tinh Th¹ch\n"
	szSay = szSay .. "+ Vò khÝ 86 (c­êng hãa 11)  thµnh  vò khÝ 96 (c­êng hãa 0): 390 Thiªn Th¹ch, 290 M¶nh Thiªn Th¹ch, 99 Thiªn Th¹ch Tinh Th¹ch\n"
	szSay = szSay .. "<color=red>L­u ý: Sau khi rÌn l¹i, thuéc tÝnh vò khÝ sÏ kh«ng thay ®æi.<color>"
	tbSay = {
		"B¾t ®Çu rÌn/RenLaiVuKhi_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(g_szNpcName..szSay,getn(tbSay),tbSay)
end

function RenLaiVuKhi_Done()
	PutinItemBox("RÌn l¹i vò khÝ" ,1 , "X¸c nhËn muèn rÌn l¹i?", RENLAIVUKHI_FILE, 1)
end



-- Nang cap Thien Chi Tuong Quan 100%
function ThienChiTuongQuan100Upgrade_Form()
	local szSay = g_szNpcName.."N©ng cÊp trang bÞ T­íng Qu©n thµnh Thiªn Chi T­íng Qu©n cÇn:\n"
	szSay = szSay .. "<color=red>*<color> <color=yellow>Nãn, gi¸p, quÇn:<color> T­íng Qu©n c­êng hãa 7 trë lªn, 01 Thiªn Th¹ch Linh Th¹ch, 01 §inh Hån Thiªn Th¹ch ThÇn Th¹ch, 01 §¹i §Þnh Hån, 5.000 Vµng.\n"
	szSay = szSay .. "<color=red>*<color> <color=yellow>LÖnh, kú, phï:<color> 02 Thiªn Th¹ch Linh Th¹ch, 01 §inh Hån Thiªn Th¹ch ThÇn Th¹ch, 01 §¹i §Þnh Hån, 5.000 Vµng.\n"
	szSay = szSay .. "<color=red>Tû lÖ thµnh c«ng 100%<color>"
	tbSay = {
		"TiÕn hµnh n©ng cÊp/ThienChiTuongQuan100Upgrade_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function ThienChiTuongQuan100Upgrade_Done()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp thµnh Thiªn Chi T­íng Qu©n?", THIENCHITUONGQUAN100_FILE, 1)
end


-- Nang cap Ngu Long Tuong Quan 100%
function NguLongTuongQuan100Upgrade_Form()
	local szSay = g_szNpcName.."N©ng cÊp trang bÞ Thiªn Chi T­íng Qu©n thµnh Ngù Long T­íng Qu©n cÇn:\n"
	szSay = szSay .. "<color=red>*<color> <color=yellow>Nãn, gi¸p, quÇn:<color> C­êng hãa 7 trë lªn, 2 Thiªn Th¹ch Linh Th¹ch, 1 §inh Hån Thiªn Th¹ch ThÇn Th¹ch, 01 §¹i §Þnh Hån, 5.000 Vµng.\n"
	szSay = szSay .. "<color=red>*<color> <color=yellow>LÖnh, kú, phï:<color> 2 Thiªn Th¹ch Linh Th¹ch, 2 §inh Hån Thiªn Th¹ch ThÇn Th¹ch, 01 §¹i §Þnh Hån, 5.000 Vµng.\n"
	szSay = szSay .. "<color=red>Tû lÖ thµnh c«ng 100%<color>"
	tbSay = {
		"TiÕn hµnh n©ng cÊp/NguLongTuongQuan100Upgrade_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function NguLongTuongQuan100Upgrade_Done()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp thµnh Thiªn Chi T­íng Qu©n?", NGULONGTUONGQUAN100_FILE, 1)
end


function NguLong2ThuongUngTuongQuan100Upgrade_Form()
	local szSay = g_szNpcName.."N©ng cÊp trang bÞ Ngù Long T­íng Qu©n thµnh Th­¬ng ¦ng T­íng Qu©n cÇn:\n"
	szSay = szSay .. "* Nãn, gi¸p, quÇn: Trang bÞ c­êng hãa 13 trë lªn, 9 Thiªn Cang LÖnh, 19 Thiªn M«n Kim LÖnh, 3.000 vµng\n"
	szSay = szSay .. "* LÖnh, kú, phï: 9 Thiªn Cang LÖnh,,19 Thiªn M«n Kim LÖnh, 5.000 vµng.\n"
	szSay = szSay .. "<color=red>Tû lÖ thµnh c«ng 100%<color>"
	tbSay = {
		"TiÕn hµnh n©ng cÊp/NguLong2ThuongUngTuongQuan100Upgrade_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function NguLong2ThuongUngTuongQuan100Upgrade_Done()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NGULONG2THUONGUNGTUONGQUAN100_FILE, 1)
end


function TuongQuan2ThuongUngTuongQuan_Form()
	local szSay = g_szNpcName.."N©ng cÊp trang bÞ T­íng Qu©n thµnh Th­¬ng ¦ng T­íng Qu©n cÇn:\n"
	szSay = szSay .. "* Nãn, gi¸p, quÇn: Trang bÞ T­íng Qu©n c­êng hãa 7 trë lªn, 13 Thiªn Cang LÖnh, 13 Thiªn M«n Kim LÖnh, 3 N÷ Oa Tinh Th¹ch, 60 Thiªn Th¹ch Tinh Th¹ch, 6.000 Vµng\n"
	szSay = szSay .. "* LÖnh, kú, phï: 13 Thiªn Cang LÖnh, 13 Thiªn M«n Kim LÖnh, 3 N÷ Oa Tinh Th¹ch, 60 Thiªn Th¹ch Tinh Th¹ch, 8.000 Vµng\n"
	szSay = szSay .. "<color=red>Tû lÖ thµnh c«ng 100%<color>"
	tbSay = {
		"TiÕn hµnh n©ng cÊp/TuongQuan2ThuongUngTuongQuan_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function TuongQuan2ThuongUngTuongQuan_Done()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", TUONGQUAN2THUONGUNGTUONGQUAN_FILE, 1)
end


function ThienChi2ThuongUngTuongQuan_Form()
	local szSay = g_szNpcName.."N©ng cÊp trang bÞ Thiªn Chi T­íng Qu©n thµnh Th­¬ng ¦ng T­íng Qu©n cÇn:\n"
	szSay = szSay .. "* Nãn, gi¸p, quÇn: Trang bÞ T­íng Qu©n c­êng hãa 7 trë lªn, 11 Thiªn Cang LÖnh, 11 Thiªn M«n Kim LÖnh, 3 N÷ Oa Tinh Th¹ch, 50 Thiªn Th¹ch Tinh Th¹ch, 3.000 Vµng\n"
	szSay = szSay .. "* LÖnh, kú, phï: 11 Thiªn Cang LÖnh, 11 Thiªn M«n Kim LÖnh, 3 N÷ Oa Tinh Th¹ch, 70 Thiªn Th¹ch Tinh Th¹ch, 4.000 Vµng\n"
	szSay = szSay .. "<color=red>Tû lÖ thµnh c«ng 100%<color>"
	tbSay = {
		"TiÕn hµnh n©ng cÊp/ThienChi2ThuongUngTuongQuan_Done",
		"Ta chØ xem th«i/gf_DoNothing",	
	}
	Say(szSay,getn(tbSay),tbSay)
end

function ThienChi2ThuongUngTuongQuan_Done()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", THIENCHITUONGQUAN2THUONGUNGTUONGQUAN_FILE, 1)
end


function NguLongTuongQuanChange_Menu()
	local tbSay = {
		"Trang bÞ C­êng Hãa + 10 trë lªn/#NguLongTuongQuanChange_Form(10)",
		"Trang bÞ C­êng hãa + 13 trë lªn/#NguLongTuongQuanChange_Form(13)",
		"Trang bÞ C­êng hãa + 14 trë lªn/#NguLongTuongQuanChange_Form(14)",
		"3 Lo¹i Ngäc Béi/#NguLongTuongQuanChange_Form(-1)",
		"Ta chØ xem th«i/gf_DoNothing",
	}
	Say(g_szNpcName.."C¸c h¹ h·y chän lo¹i c­êng hãa phï hîp víi trang bÞ m×nh cã.", getn(tbSay), tbSay)
end


function ThuongUngTuongQuanChange_Menu()
	local tbSay = {
		"Trang bÞ C­êng Hãa + 10 trë lªn/#ThuongUngTuongQuanChange_Form(10)",
		"Trang bÞ C­êng hãa + 13 trë lªn/#ThuongUngTuongQuanChange_Form(13)",
		"Trang bÞ C­êng hãa + 14 trë lªn/#ThuongUngTuongQuanChange_Form(14)",
		"3 Lo¹i Ngäc Béi/#ThuongUngTuongQuanChange_Form(-1)",
		"Ta chØ xem th«i/gf_DoNothing",
	}
	Say(g_szNpcName.."C¸c h¹ h·y chän lo¹i c­êng hãa phï hîp víi trang bÞ m×nh cã.", getn(tbSay), tbSay)
end


function VoSong_Menu()
	local szTalkStr = "Thiªn h¹ v« song ®óng lµ Thiªn h¹ v« song, muèn cã nã thËt sù kh«ng dÔ. Ng­¬i sÏ cã bé thiªn h¹ tuyÖt thÕ chi b¶o nµy nÕu ®¸p øng ®ñ 1 trong 3 ®iÒu kiÖn sau:\n"
	szTalkStr = szTalkStr .. "1. Nguyªn bé Vâ L©m B¸ Chñ <color=yellow>+15<color>, <color=red>14<color> Cöu Thiªn V« Cùc §¬n, <color=red>14<color> ThÇn Tµi B¶o R­¬ng.\n"
	szTalkStr = szTalkStr .. "2. Nguyªn bé Vâ L©m B¸ Chñ <color=yellow>+14<color>, <color=red>29<color> Cöu Thiªn V« Cùc §¬n, <color=red>29<color> ThÇn Tµi B¶o R­¬ng.\n"
	szTalkStr = szTalkStr .. "3. Nguyªn bé Vâ L©m B¸ Chñ <color=yellow>+13<color>, <color=red>44<color> Cöu Thiªn V« Cùc §¬n, <color=red>44<color> ThÇn Tµi B¶o R­¬ng."
	local tbSay = {
		"Ta muèn Thiªn H¹ V« Song/VoSong_Upgrade",
		"Ta ®Õn xem th«i/gf_DoNothing",
	}
	Say(szTalkStr, getn(tbSay), tbSay)
end


function VoSong_Upgrade()
	PutinItemBox("N©ng cÊp trang bÞ" ,3 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", BACHU2VOSONG_FILE, 1)
end


function ThuongUngNguyenSoai100_Form()
	local szSay = g_szNpcName.."N©ng cÊp trang bÞ §¹i Tèng-Liªu Nguyªn So¸i thµnh Th­¬ng ¦ng Nguyªn So¸i cÇn:\n"
	szSay = szSay  .. "* Nãn, gi¸p, quÇn: Trang bÞ §¹i Tèng-Liªu Nguyªn So¸i c­êng hãa 13 trë lªn, 9 N÷ Oa Tinh Th¹ch, 19 Thiªn Cang LÖnh, 29 Thiªn M«n Kim LÖnh, 3900 xu vËt phÈm.\n"
	szSay = szSay  .. "* So¸i Hæ, So¸i LÖnh, So¸i Phï, So¸i Kú: 9 N÷ Oa Tinh Th¹ch, 21 Thiªn Cang LÖnh, 29 Thiªn M«n Kim LÖnh, 7900 xu vËt phÈm.\n"
	szSay = szSay  .. "<color=red>(Tû lÖ thµnh c«ng 100%)<color>"
	tbSay = {
		"TiÕn hµnh n©ng cÊp/ThuongUngNguyenSoai100_Done",
		"Ta chØ xem th«i/gf_DoNothing",
	}
	Say(szSay,getn(tbSay),tbSay)
end


function ThuongUngNguyenSoai100_Done()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", THUONGUNGNGUYENSOAI100_FILE, 1)
end


function LoiHo_Menu()
	local tbSay = {}
--	tinsert(tbSay, "NhËn qu©n c«ng anh hïng/QuanCongAnhHung_Menu")
	tinsert(tbSay, "N©ng cÊp Th­¬ng ¦ng T­íng Qu©n thµnh L«i Hæ T­íng Qu©n/TuongQuan_ThuongUng2LoiHo");
	tinsert(tbSay, "N©ng cÊp Th­¬ng ¦ng Nguyªn So¸i thµnh L«i Hæ Nguyªn So¸i/NguyenSoai_ThuongUng2LoiHo");
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say("Trang bÞ L«i Hæ ®· xuÊt hiÖn trªn giang hå, liÖu c¸c h¹ cã ®ñ søc së h÷u?",getn(tbSay),tbSay)
end


function TuongQuan_ThuongUng2LoiHo()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", THUONGUNGTUONGQUAN2LOIHOTUONGQUAN_FILE, 1)
end


function NguyenSoai_ThuongUng2LoiHo()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", THUONGUNGNGUYENSOAI2LOIHONGUYENSOAI_FILE, 1)
end


function QuanCongAnhHung_Menu()
	local tbSay = {}
	tinsert(tbSay, "NhËn 1 qu©n c«ng anh hïng (tiªu hao 189 xu vËt phÈm/#QuanCongAnhHung_Nhan(1)")
	tinsert(tbSay, "NhËn 10 qu©n c«ng anh hïng (tiªu hao 1890 xu vËt phÈm/#QuanCongAnhHung_Nhan(10)")
	tinsert(tbSay, "Ta ch­a muèn nhËn/gf_DoNothing")
	Say("LuËn vÒ Anh Hïng còng cã n¨m b¶y c¸ch, lµm ta ng­ìng mé còng lµ mét c¸ch.",getn(tbSay),tbSay)
end


function QuanCongAnhHung_Nhan(nQty)
	nQty = nQty or 0
	local tbNguyenLieu = {item={{gdp={2,1,30230,189*nQty}}}}
	if gf_JudgeRoomWeight(1,100) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, h·y s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbNguyenLieu)
	if nCheck == 0 then
		return 0
	end
	LIB_Award.szLogTitle = "LOI HO - NHAN QUAN CONG ANH HUNG"
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:PayMaterial(tbNguyenLieu)
	local tbAward = {item={{gdp={2,1,30499,nQty}}}}
	LIB_Award:Award(tbAward)
end