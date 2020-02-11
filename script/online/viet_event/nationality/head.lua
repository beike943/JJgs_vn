Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\lib\\globalfunctions.lua")
THOIHANNHAPQUOCTICH = 1
TB_NATION_SERVERLIST =
{
	{1,"Hµng Long"},
	{2,"Tµng Long"},
	{3,"B¹ch Hæ"},
	{4,"Hoµng Hæ"},
	{5,"Ngäa Hæ"},	--	Merge víi 68-Quang Long
	{6,"Phi Hæ"},
--	{7,"Thanh Long"},
	{7,"Song Long"},
	{8,"Phôc Hæ"},
	{9,"M·nh Hæ"},
--	{10,"V­¬ng Hæ"},
	{10,"TiÕu Hæ"},		--20/05/2014: Merge víi 82-Thóy Yªn M«n
	{11,"XÝch Long"},	-- 12/11/2013: Merge víi 55-XÝch Long
	{12,"ChÝnh ¦ng"},
	{13,"H¾c Hæ"},	-- 12/11/2013: Merge víi 62-Huy ¦ng
	{14,"D¹ Hæ"},
	{15,"Kú Hæ"},
	{16,"Thiªn Phông"},
	{17,"TrÝ Long"},
	{18,"L«i Hæ"},
	{19,"Th¨ng Long"},	-- 12/11/2013: Merge víi 66-Quang ¦ng
--	{20,"Cuång Long"},
	{20,"Ngäc Long"},	--03/06/2014 Merge víi 85-C¸i Bang Ph¸i
	--{21,"B¸ Long"},		--27/05/2014 Merge víi 88-Minh Gi¸o Ph¸i
	{22,"Thiªn Long"},
	{23,"§¹i Hæ"},		--27/05/2014 Merge víi 87-Nga My Ph¸i
	{24,"Ngò Hæ"},		--20/05/2014 Merge víi 80-C«n L«n §iÖn
	{25,"Háa Long"},		--27/05/2014 Merge víi 77-ThiÕu L©m Tù
	{26,"Háa ¦ng"},
--	{28,"Truy Long"},
--	{29,"ThiÕt Hæ"},		--20/05/2014 Merge víi 86-§­êng M«n Ph¸i
	{30,"§Þa Hæ"},
	{31,"Ch©u Long"},
	{32,"ThÇn Hæ"},		--27/05/2014 Merge víi 79-Ngò §éc Gi¸o
	{33,"ThÇn Long"},
	{35,"Song Hæ"},		--22/09/2014 Merge víi 29-ThiÕt Hæ--20/05/2014 Merge víi 81-Thóy Yªn LÇu
--	{36,"V©n Long"},
	{37,"Phong Hæ"},
--	{38,"Uy Long"},
	{39,"Qu¸n Hæ"},	--22/09/2014 Merge víi 21-B¸ Long --03/06/2014 Merge víi 84-Vâ §ang S¬n
	{43,"Tiªn Phông"},  --22/09/2014 Merge víi 73-Kim ¦ng
--	{45,"B¹ch Phông"},
	{46,"QuyÒn Long"},
	{47,"B¹ch ¦ng"},
--	{47,"H¾c ¦ng"},
--	{49,"Thiªn ¦ng"},
	{50,"§¹i ¦ng"},		--03/06/2014 Merge víi 83-D­¬ng Gia T­íng
	{51,"Phi ¦ng"},		
--	{52,"ViÖt ¦ng"},
--	{53,"Ngäc Phông"},
--	{54,"Phi Phông"},
--	{55,"T­êng Phông"},
	{55,"XÝch Long"},
	{58,"Hoµng ¦ng"},
	{59,"Hång ¦ng"},	-- Merve víi 71-Ph­¬ng Phông
	{60,"Hoµng Phông"},	-- Merge víi 10-V­¬ng Hæ
	{61,"§¶o HiÖp Kh¸ch"},
--	{62,"Huy ¦ng"},
	{62,"H¾c Hæ"},			--03/06/2014 Merge víi 53-Ngäc Phông
	{63,"T©n Phông"},	--03/06/2014 Merge víi 52-ViÖt ¦ng
--	{66,"Quang ¦ng"},
	{66,"Th¨ng Long"},
	{67,"Duy Long"},	-- Merge víi 7-Thanh Long 
--	{68,"Quang Long"},
	{68,"Song ¦ng"},
	{70,"Thµnh Long"},
--	{71, "Ph­¬ng Phông"},
	{71, "Linh Phông"},
	{99,"LOCAL 1"},
	{97,"LOCAL 2"},
	{96,"LOCAL 3"},
	{95,"LOCAL 4"},
	{34,"§Êu tr­êng 1"},
	{98,"§Êu tr­êng 2"},
	{40,"§Êu tr­êng 3"},
	{41,"§Êu tr­êng 4"},
	{48,"§Êu tr­êng 5"},
	{72,"Minh Hæ"}, -- Merge víi 20-Cuång Long
	--{73,"Kim ¦ng"},
	{74,"Th­¬ng ¦ng"},
--	{75,"TiÓu Long"},
	{76,"Tóy Hæ"},
--	{77,"ThiÕu L©m Tù"},
--	{79,"Ngò §éc Gi¸o"},
--	{80,"C«n L«n §iÖn"},
--	{81,"Thóy Yªn LÇu"},
--	{82,"Thóy Yªn M«n"},
--	{83,"D­¬ng Gia T­íng"},
--	{84,"Vâ §ang S¬n"},
--	{85, "C¸i Bang Ph¸i"},
--	{86, "§­êng M«n Ph¸i"},
--	{87, "Nga My Ph¸i"},
--	{88, "Minh Gi¸o Ph¸i"},
	{89, "Linh B¶o S¬n"},
	{90, "Ngäa Hæ"},
	{91, "Ngäa Long"},
	{92, "Háa Phông"},
	{150,"Liªn ®Êu Local"},
	{151,"Liªn ®Êu 1"},
	{152,"Liªn ®Êu 2"},
	{153,"Liªn ®Êu 3"},
	{154,"Liªn ®Êu 4"},
	{155,"Liªn ®Êu 5"},
	{156,"Liªn ®Êu 6"},
	{157,"Liªn ®Êu 7"},
	{158,"Liªn ®Êu 8"},
}

function change_nationality()
	local nDate = tonumber(date("%Y%m%d"))
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanNhapQuocTich[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanNhapQuocTich[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","Ch­a ®Õn thêi gian ®¨ng ký nhËp quèc, ng­¬i h·y quay l¹i sau nhÐ.")
			return 0
		end
	end
	
	local tHead = format("%s Ng­¬i muèn gia nhËp <color=yellow>%s quèc<color> ph¶i kh«ng?", g_szInfoHeader, szNation)
	local tSay =
	{
		"V·n bèi ®ång ý gia nhËp b¶n quèc, xin h·y t©u víi Hoµng Th­îng/reg_change_nationality",
		"§· ®ñ "..THOIHANNHAPQUOCTICH.." ngµy, xin cho v·n bèi gia nhËp b¶n quèc/confirm_change_nationality",
		"Ta muèn suy nghÜ l¹i/do_nothing",
	}
	Say(tHead,getn(tSay),tSay);
end

function reg_change_nationality()
	local nCurNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	local nNewNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW)
	local nServerNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local szServerNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	
	if nCurNationality == nServerNation then
		Talk(1,"",format("%s Ng­¬i ®· lµ thÇn d©n cña <color=yellow>%s quèc<color> råi, kh«ng cÇn ph¶i ®¨ng ký n÷a!",g_szInfoHeader, szServerNation))
		return
	end
	if nNewNationality == nServerNation then
		Talk(1,"",format("%s Ng­¬i ®· ®¨ng ký gia nhËp <color=yellow>%s quèc<color> råi, kh«ng cÇn ph¶i ®¨ng ký n÷a!", g_szInfoHeader, szServerNation))
		return
	end
	
	gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, nServerNation)
	SetTask(TSK_SERVER_ID_TIME, GetTime())
	Talk(1,"",format("%s Chóc mõng ng­¬i ®· ®¨ng ký gia nhËp <color=yellow>%s quèc<color>. Sau <color=yellow>"..THOIHANNHAPQUOCTICH.." ngµy<color> h·y ®Õn gÆp ta ®Ó x¸c nhËn gia nhËp.", g_szInfoHeader,szServerNation))
end

function confirm_change_nationality()
	local nRegTime = GetTask(TSK_SERVER_ID_TIME)
	local nCurNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	local nNewNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW)	
	local nServerNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local szServerNation = get_nationality_name(nServerNation)
	local nDay, nHour, nMin = get_waiting_time(GetTask(TSK_SERVER_ID_TIME))
	
	if nCurNationality == nServerNation then
		Talk(1,"",format("%s Ng­¬i ®· lµ thÇn d©n cña <color=yellow>%s quèc<color> råi, kh«ng cÇn ph¶i ®¨ng ký n÷a!", g_szInfoHeader,szServerNation))
		return
	end
	if nNewNationality ~= nServerNation then
		Talk(1,"",g_szInfoHeader.."Ng­¬i ch­a ®¨ng ký gia nhËp nªn kh«ng thÓ x¸c nhËn!")
		return
	end
	if nDay >= 0 and nHour >= 0 and nMin > 0 then
		Talk(1,"",format("%s Thêi gian ®Ó x¸c nhËn gia nhËp cßn <color=yellow>%d ngµy %d giê %d phót<color>. H·y quay trë l¹i ®Ó x¸c nhËn sau.", g_szInfoHeader, nDay, nHour, nMin))
		return
	else
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, nServerNation)
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, 0)
		SetTask(TSK_SERVER_ID_TIME, 0)
		Talk(1,"",format("%s Tõ giê trë ®i ng­¬i lµ thÇn d©n cña <color=yellow>%s quèc<color>, xin chóc mõng!", g_szInfoHeader, szServerNation))
		return
	end
end

function get_nationality_name(nID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if TB_NATION_SERVERLIST[i][1] == nID then
			return TB_NATION_SERVERLIST[i][2]
		end
	end	
	return ""
end

function get_waiting_time(nRegTime)
	nCurTime = GetTime()
	nDif = THOIHANNHAPQUOCTICH*86400 - nCurTime + nRegTime
	nDay = floor(nDif/86400)
	nHour = floor(mod(nDif, 86400) / 3600)
	nMin = floor(mod(mod(nDif, 86400), 3600) / 60)

	return nDay, nHour, nMin
end

function do_nothing()

end