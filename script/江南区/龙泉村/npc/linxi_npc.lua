--ÁÕÏ«£¬´«ËÍÈË£¬´«ËÍÖÁÒ£ÏÉ¶´

g_szInfoHeader = "<color=green>L©m TŞch<color>: ";

function main()
	Say(g_szInfoHeader.."T×m ta cã viÖc g× kh«ng?",2,"Ta muèn ®Õn Dao Tiªn ®éng/go_to_yaoxiandong","Kh«ng cã g×/nothing");
end;

function go_to_yaoxiandong()
	local nLevel = GetLevel();
	if nLevel < 85 then
		Talk(1,"",g_szInfoHeader.."§¼ng cÊp thÊp h¬n <color=yellow>85<color> kh«ng thÓ vµo Dao Tiªn ®éng.");
		return 0;
	end;
	NewWorld(118,1616,3211);
end;

function nothing()

end;