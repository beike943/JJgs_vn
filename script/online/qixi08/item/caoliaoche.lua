--¸ß¼¶²İÁÏ³µ
--by vivi
--2008/11/19

g_NpcInfo = "<color=green>Xe cá cao cÊp<color>: "
g_szThisFile = "\\script\\online\\qixi08\\item\\caoliaoche.lua";

function OnUse()
	Say(g_NpcInfo.."Dïng cho thÇn c©u vang danh thiªn h¹, bao gåm B¹ch NghÜa, HiÖp Dùc vµ ChiÕn M· Nguyªn So¸i cao cÊp. Ng­¬i muèn cho ngùa ¨n kh«ng? Muèn cho ¨n no cÇn ph¶i cã <color=yellow>3000 vµng<color>, Ng­¬i muèn chø? <color=red>Chó ı: Trang bŞ ngùa trªn ng­êi míi cã thÓ cho ¨n. Ngùa ®· ®­îc khãa còng cã thÓ cho ¨n, kh«ng cÇn biÕt ®é bÒn nh­ thÕ nµo, gi¸ c¶ vÉn nh­ thÕ.<color>",
		2,
		"\nSö dông/check_the_horse",
		"\nKh«ng cÇn/nothing")	
end

function check_the_horse()
	local nGold = GetCash();
	if nGold < 30000000 then
		Talk(1,"",g_NpcInfo.."Cho ngùa ¨n no cÇn cã <color=yellow>3000 vµng<color>, trªn ng­êi ng­¬i hiÖn giê kh«ng ®ñ.");
		return 0;
	end
	local tHorseId = {{"B¹ch NghÜa",0,105,49},{"HiÖp Dùc",0,105,50},{"ChiÕn M· Nguyªn So¸i cao cÊp (tr¾ng)",0,105,51},{"ChiÕn M· Nguyªn So¸i cao cÊp (®en)",0,105,52}};
	local nId1,nId2,nId3 = GetPlayerEquipInfo(10);
	local nCheck = 0;
	for i=1,getn(tHorseId) do
		if nId1 == tHorseId[i][2] and nId2 == tHorseId[i][3] and nId3 == tHorseId[i][4] then
			nCheck = i;
			break;
		end
	end	
	if nCheck == 0 then
		Say(g_NpcInfo.."Ta chØ cã thÓ cho B¹ch NghÜa, HiÖp Dùc hoÆc ChiÕn M· Nguyªn So¸i cao cÊp ¨n, ng­¬i mang theo kh«ng ph¶i nh÷ng lo¹i nµy.",0);
		return 0;
	else
		local nIdx = GetPlayerEquipIndex(10);
		local tb = GetItemInfoByIndex(nIdx,1);
		local d = tb["durability"];
		local md = tb["maxdurability"];		
		if d >= floor(md/2) then
			Talk(1,"",g_NpcInfo.."Ngùa cña ng­¬i ®é bÒn vÉn cßn cao, kh«ng cÇn ph¶i cho ¨n.");
			return 0;
		end
		if Pay(30000000) == 1 then
			ChangeItemDurability("horse");	
		end
	end	
end

function onthing()

end