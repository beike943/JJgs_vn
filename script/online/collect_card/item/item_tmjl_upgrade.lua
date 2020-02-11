Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	nItem = tonumber(nItem);
	local nTime = tonumber(date("%Y%m%d"));
	
	if nTime < CC_UPGRADE_DATE then
		Talk(1, "", "§¹i hiÖp t¹m thêi ng­¬i kh«ng thÓ më lÔ bao nµy, lÔ bao n©ng cÊp nµy chØ cã thÓ më sau khi <color=red> m«n ph¸i míi ®· s¸ng lËp <color> míi ®­îc.");
		return 0;
	end
	
	if 1 ~= gf_CheckPlayerRoute() then
		Talk(1, "", "ChØ cã nh÷ng ng­êi ch¬i gia nhËp l­u ph¸i míi cã thÓ më!");
		return 0;
	end
	
	local nRoute = GetPlayerRoute();
	if GetLevel() < CC_LEVEL_LIMIT and (nRoute == 23 or nRoute == 29 or nRoute == 30) then
		Talk(1,"",format("ChØ cã nh÷ng ng­êi ch¬i cã ®¼ng cÊp ®¹t ®Õn %d míi më ®­îc", CC_LEVEL_LIMIT));
		return 0;
	end
	
	local strTab = {
		format("Ta muèn më lÔ bao n©ng cÊp/#OnUse_1(%d)", nItem),
		"§Ó ta suy nghÜ/nothing",
	};
	Say("<color=green> LÔ Bao N©ng CÊp: <color> x¸c nhËn më LÔ Bao N©ng CÊp nµy kh«ng?", getn(strTab), strTab);
end

function OnUse_1(nItem)
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if nRoute ~= 23 and nRoute ~= 29 and nRoute ~= 30 then
		--ÀÏÁ÷ÅÉ
		if DelItemByIndex(nItem, 1) == 1 then
			gf_AddItemEx2({2, 1, 30370, CC_TMGL_COST_NUM}, "Thiªn M«n Kim LÖnh", CC_LOG_TITLE, "Sö dông LÔ Bao N©ng CÊp Thiªn M«n Kim LÖnh", 0, 1);
		end
		return 0;
	else
		--ÐÂÁ÷ÅÉ
		if DelItemByIndex(nItem, 1) == 1 then
			gf_AddItemEx2({2, 1, 30370, CC_TMGL_UPGRADE_NUM}, "Thiªn M«n Kim LÖnh", CC_LOG_TITLE, "Sö dông LÔ Bao N©ng CÊp Thiªn M«n Kim LÖnh", 0, 1);
			gf_Modify("Exp", CC_TMGL_UPGRADE_EXP);
			Msg2Global(format("Chóc mõng ng­êi ch¬i %s më %s nhËn ®­îc %s + %d", GetName(), "LÔ bao Thiªn M«n Kim LÖnh N©ng CÊp", "Thiªn M«n Kim LÖnh", CC_TMGL_UPGRADE_NUM));
		end
		return 0;
	end
end



