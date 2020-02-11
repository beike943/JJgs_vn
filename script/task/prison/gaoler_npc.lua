--author:yanjun
--date:06-12-13
--describe:²¶¿ì½Å±¾
Include("\\script\\task\\prison\\jail_head.lua");
g_NpcName = "Bé kho¸i"
function main()
	local selTab = {
			"Ta téi ¸c tµy trêi, ta ph¶i tù thó/surrender",
			"B»ng h÷u ta ë ®©y, h·y ®Ó ta vµo th¨m./visit_a_prisoner",
			"T×m hiÓu t×nh h×nh/know_detail",
			"Kh«ng cã g×/nothing",
			}
	Say("<color=green>"..g_NpcName.."<color>: ë ®©y lµ thiªn lao, kh«ng cã viÖc cho ng­¬i!",getn(selTab),selTab);
end;

function surrender()
	local nPKValue = GetPKValue();
	local nLevel = GetLevel();
	local nNeededMoney = floor(nLevel^3*nPKValue/6);	--µ¥Î»ÊÇÍ­
	local sStringMoney = gf_GetMoneyString(nNeededMoney);
	if nPKValue > 0 then
		if GetCash() < nNeededMoney then
			Talk(1,"main","<color=green>"..g_NpcName.."<color>: Kh«ng cã tiÒn muèn ®Õn nhµ lao ngåi µ? Kh¸ cho ng­¬i l¾m!");
		else
			local selTab = {
						"§ñ råi/surrender_confirm",
						"Ngåi thiªn lao còng ph¶i tèn tiÒn!/nothing",
						}
			Say("<color=green>"..g_NpcName.."<color>: Xem ng­¬i gian x¶o nh­ vËy, ®­a <color=yellow>"..sStringMoney.."<color> cho ®¹i ca, ®¹i ca sÏ cho ng­¬i vui vÎ mét tÝ.",getn(selTab),selTab);
		end;
	else
		Talk(2,"main","<color=green>"..g_NpcName.."<color>: TiÓu tö ng­¬i kh«ng cã viÖc g× ®õng ch¹y lung tung, muèn chÕt µ?","§õng nãng giËn chí, ta còng ®©u cè ý ®©u.");
	end;
end;

function surrender_confirm()
	local nPKValue = GetPKValue();
	local nLevel = GetLevel();
	local nNeededMoney = floor(nLevel^3*nPKValue/6);
	local sStringMoney = gf_GetMoneyString(nNeededMoney);
	local nCash = GetCash();
	if nCash < nNeededMoney then
		Talk(1,"main","<color=green>"..g_NpcName.."<color>: Kh«ng cã tiÒn muèn ®Õn nhµ lao ngåi µ? Kh¸ cho ng­¬i l¾m!");
		return 0;
	end;
	local sString = "";
	local selTab = {};
	local nSeizureMoney = nCash - nNeededMoney;
	if nSeizureMoney > 0 then
		sString = "Ng­¬i vÉn cßn <color=red>";
		sString = sString..gf_GetMoneyString(nSeizureMoney);
		sString = sString.."<color>, nÕu ng­¬i kh«ng cã ý kiÕn th× ta ch¼ng thu lµm g×";
		tinsert(selTab,"Kh«ng sao, ng­¬i cÇm ®i/#enter_jail(1)");
	else
		sString = "Ng­¬i kh«ng mang ®ñ ng©n l­îng ­?"
		tinsert(selTab,"Ta ®i cïng víi ng­¬i/#enter_jail(1)");
	end;
	tinsert(selTab,"§îi ®·, ta muèn gÆp b»ng h÷u/nothing");
	Say("<color=green>"..g_NpcName.."<color>: Ta cßn ch­a tÞch thu sè tiÒn d­ cña ng­¬i, xem nµo trõ tiÒn ngåi lao ra cßn <color=yellow>"..sStringMoney.."<color> vµo,"..sString,getn(selTab),selTab);
end;

function enter_jail(nType)
	CleanInteractive();
	local nCash = GetCash();
	if nType == 1 then	--Èç¹ûÊÇÀ´×ÔÊ×µÄ
		if Pay(nCash) == 1 then
			if NewWorld(tJailEnterPoint[1],tJailEnterPoint[2],tJailEnterPoint[3]) == 1 then
				ForbidRead(1)	--²»ÄÜÐÞÊé
				UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç
				SetCanRestorePK(1);	--4±¶ËÙ¶ÈÏûPKÖµ
			else
				Earn(nCash);
			end;
		else
			Talk(1,"main","<color=green>"..g_NpcName.."<color>: Kh«ng cã tiÒn muèn ®Õn nhµ lao ngåi µ? Kh¸ cho ng­¬i l¾m!");
		end;
	elseif nType == 2 then	--Ì½¼àµÄ
		if Pay(10000) == 1 then
			if NewWorld(tJailEnterPoint[1],tJailEnterPoint[2],tJailEnterPoint[3]) == 1 then
				ForbidRead(1)	--²»ÄÜÐÞÊé
				UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç
			else
				Earn(10000);
			end;
		else
			Talk(1,"main","<color=green>"..g_NpcName.."<color>: Kh«ng cã tiÒn muèn ®Õn nhµ lao ngåi µ? Kh¸ cho ng­¬i l¾m!");
		end;
	end;
end;

function visit_a_prisoner()
	if GetPKValue() > 0 then
		Talk(2,"","<color=green>"..g_NpcName.."<color>: To gan! Lµm chuyÖn cµng quÊy cßn ngoan cè µ?","Cã viÖc cho ng­¬i thö ®©y!");
		return 0;
	end;
	local selTab = {
				"§ång ý/#enter_jail(2)",
				"Hñy bá/nothing",
				}
	Say("<color=green>"..g_NpcName.."<color>: L·o gia ta d¹o nµy cã h¬i khã kh¨n, cÇn <color=yellow>1 tiÒn vµng<color>.",getn(selTab),selTab);
end;

function know_detail()
	Talk(1,"main","<color=green>"..g_NpcName.."<color>: <color=yellow>4 giê online gi¶m 1 ®iÓm PK<color>, nÕu cã ng©n l­îng th× ®iÓm PK sÏ gi¶m nhanh h¬n.");
end;
