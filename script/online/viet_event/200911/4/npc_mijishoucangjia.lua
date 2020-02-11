--=============================================
--create by baiyun 2009.10.15
--describe:Ô½ÄÏ°æ11ÔÂ·İ»î¶¯ ÃØ¼®ÊÕ²Ø¼ÒNPC½Å±¾ÎÄ¼ş
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
g_szNpcName = "<color=green>Nhµ S­u TÇm MËt TŞch: <color>";
FILE_NAME = "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua";


function main()
	Say(g_szNpcName.."Trong thêi gian tõ ngµy 06-11-2009 ®Õn 06-12-2009. §ång ®¹o cã thÓ sö dông 3 cuèn Tø Linh ChiÕn ı Phæ (lo¹i 2 phô lôc) ®Ó n©ng cÊp thµnh Tø Linh ChiÕn ı Phæ (lo¹i 4 phô lôc)".."<enter><color=red>§¹i hiÖp ph¶i thiÕt ®Æt mËt khÈu hµnh trang vµ më khãa hµnh trang míi cã thÓ nép<color>",
			2,
			"Ta muèn n©ng cÊp mËt tŞch/get_miji",
			"T¹i h¹ chØ tiÖn ghĞ ngang./nothing"
	);
end


function get_miji()
	PutinItemBox("N©ng cÊp mËt tŞch" ,9 , "§¹i hiÖp ph¶i bá 3 tø linh chiÕn ı phæ vµ 6 tu ch©n yÕu quyÕt ®Ó n©ng cÊp thµnh tø linh chiÕn ı phæ (4 phô lôc). C¸c h¹ x¸c nhËn muèn cËp nhËt?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if (genre ~= 0 or detail ~= 107 or particular ~= 159) and (genre ~= 2 or detail ~= 0 or particular ~= 554) then
		Talk(1, "", g_szNpcName.."ChØ cã thÓ bá vµo tø linh chiÕn ı phæ hoÆc tu ch©n yÕu quyÕt.");
		return 0;
	end
	return 1;
end
	
function OnPutinComplete(param)
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= 9 then		-- ¶îÍâ¼ì²â
		return 0;
	end
	if get_item_count(t, 0, 107, 159) ~= 3 or get_item_count(t, 2, 0, 554) ~= 6 then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng");
		return 0;
	end
	
	if GetCash() < 1000000 then
		Talk(1, "", g_szNpcName.."Ng©n l­îng trªn ng­êi kh«ng ®ñ");
		return 0;
	end
	
	local nResult = 1;
	for i = 1, getn(t) do
		local nCount = 0;
		if t[i][4] == 159 then
			nCount = -1;
		else
			nCount = 1;
		end
		if DelItemByIndex(t[i][1], nCount) ~= 1 then
			nResult = 0;
		end
	end
	if nResult == 1 and Pay(1000000) == 1 then
		--Ìí¼ÓĞÂÃØ¼®
		gf_AddItemEx({0, 107, 162, 1}, "Tø Linh ChiÕn ı Phæ");
		WriteLogEx("Hoat dong thang 11","n©ng cÊp",1,"Tø Linh ChiÕn ı Phæ")
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

function nothing()

end