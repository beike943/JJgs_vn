--²Í×À½Å±¾
Include("\\script\\online\\tong_feast\\tf_head.lua")

function main()
	if tf_CheckCondition() ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local s = SDB(TF_FEAST_CHEF, 0, 2);
	s:apply2(callout(main_cb, npcIndex));
end

function main_cb(npcIndex, nCount, sdb)
	if nCount <= 0 then
		print("UDERROR: main_cb error")
		return 0;
	end
	local szTongName = GetTongName();
	local sData = sdb[szTongName];
	if not sData then
		main_cb_no();
		return 0;
	end
	for i =1, getn(sData) - 1 do
		if tonumber(sData[i]) == npcIndex then
			main_cb_yes();
			return 1;
		end
	end
	main_cb_no();
end

function main_cb_yes()
	local tSay = {
		"Ta muèn dïng tiÖc/tf_HaveDinner",
		"Ta muèn kÝnh töu/main_cb_yes_toast",
		"Sö dông TiÖc Cô Tinh ChÕ/main_cb_yes_UseIBtw",
		"Ta chØ tiÖn ®­êng ghÐ ngang/nothing",
	}
	Say("Th­ëng thøc mÜ vÞ?"..format("<color=red>( hiÖn t¹i bµn nµy ®· cã sè ng­êi lµ %d/10)<color>", GetNpcLevel(GetTargetNpc())),getn(tSay), tSay);
end

function main_cb_yes_toast()
	Say("Ng­¬i x¸c ®Þnh muèn kÝnh töu cho bµn tiÖc hiÖn t¹i kh«ng?", 2, "§ång ý/tf_Toast", "T¹i h¹ chØ xem qua th«i/nothing");
end

function main_cb_yes_UseIBtw()
	Say("Ng­¬i x¸c ®Þnh muèn sö dông Bé §å ¡n kh«ng?", 2, "§ång ý/tf_UseIBtw", "T¹i h¹ chØ xem qua th«i/nothing");
end

function main_cb_no()
	Talk(1,"","Bän hä ®ang th­ëng thøc c¸c mãn ¨n!");
end