--Describe:Çå»ª×Ï¹âÊ¹ÕßNPC½Å±¾
--Create Date:2007-6-13
--Author:yanjun
Include("\\script\\lib\\globalfunctions.lua");
g_szInforHeader = "<color=green>Thanh Hoa Tö quang Sø gi¶<color>: ";
function main()
	local selTab = {
			"Gióp b¹n häc tËp tho¶i m¸i- Thanh Hoa Chi Tinh/talk1",
			"Gióp gia ®×nh cã kh«ng khİ vui vÎ- T©n ThŞ tuyÕn e/talk2",
			"Mµu ®en kinh ®iÓn- Laptop thÕ hÖ H8/talk3",
			"Ta thİch mãn nµy qu¸!/choose_the_favour",
			"LÇn sau sÏ quay l¹i xem/nothing",
			}
	Say(g_szInforHeader.."Ta lµ Tö Quang Sø gi¶, mang may m¾n ®Õn cho mäi ng­êi. TÆng c¸c h¹ b¸nh İt nµy! Xem thö vËn khİ cña c¸c h¹ nh­ thÕ nµo!",getn(selTab),selTab);
end;

function nothing()

end;

function talk1()
	Talk(1,"main",g_szInforHeader.."\n\n<color=yellow>H¹n chÕ gi¸o dôc<color>: ");
end;

function talk2()
	Talk(1,"talk2_1",g_szInforHeader.."\n\n<color=yellow>xem ®©y<color>: Ti vi tinh thÓ láng<color=red>3 tÊc/5tÊc<color>\n<color=yellow>Vi tİnh gia ®×nh<color>: <color=red>16: 10<color>");
end;

function talk2_1()
	Talk(1,"main",g_szInforHeader.."\n\n<color=yellow>ThiÕt kÕ chi tiÕt<color>: \n<color=yellow><color>: n©ng cÊp tİnh n¨ng <color=red>40##<color>, <color=red>40##<color>\nEasy ®¬n gi¶n, Enjoy s¶ng kho¸i, Ease tinh tÕ.");
end;

function talk3()
	Talk(1,"main",g_szInforHeader.."\n\n<color=yellow>Tù do tù t¹i<color>: ");
end;

function choose_the_favour()
	local selTab = {
				"Ta thİch Thanh Hoa Chi Tinh/select_one",
				"Ta thİch T©n ThŞ tuyÕn e/select_one",
				"Ta thİch Laptop thÕ hÖ H8/select_one",
				"Ta muèn xem giíi thiÖu s¶n phÈm/main",
				}
	Say(g_szInforHeader.."ThiÕu HiÖp thİch s¶n phÈm nµo?",getn(selTab),selTab);
end;

function select_one()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 070624 then
		Talk(1,"",g_szInforHeader.."B¸nh İt ®· t¨ng hÕt råi. Xin h·y ®îi kú ho¹t ®éng sau");
		return 0;
	end;
	if GetLevel() < 30 then
		Talk(1,"",g_szInforHeader.."ThiÕu hiÖp n¨ng lùc cßn yÕu qu¸. Xin luyÖn ®Õn cÊp <color=yellow>30<color> råi quay l¹i gÆp ta!");
		return 0;
	end;
	if GetTask(2357) ~= 0 then
		Talk(1,"",g_szInforHeader.."Mçi nh©n vËt chØ nhËn ®­îc b¸nh İt 1 lÇn th«i!");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Talk(1,"",g_szInforHeader.."Hµnh trang hoÆc søc lùc cña ng­¬i kh«ng ®ñ! H·y quay l¹i sau nhĞ!");
		return 0;
	end;
	SetTask(2357,1);
	Talk(1,"",g_szInforHeader.."§©y lµ chót quµ män! Xin ®õng chª!");
	local nRand = random(1,1000);
	if nRand <= 650 then
		AddItem(2,1,1123,1);
		Msg2Player("B¹n nhËn ®­îc 1 B¸nh İt Ng·i h­¬ng");
	elseif nRand <= 850 then
		AddItem(2,1,1124,1);
		Msg2Player("B¹n nhËn ®­îc 1 B¸nh İt thŞt n­íng");
	elseif nRand <= 950 then
		AddItem(2,1,1125,1);
		Msg2Player("B¹n nhËn ®­îc 1 B¸nh İt b¸t b¶o");
	elseif nRand <= 994 then
		AddItem(2,1,1126,1);
		Msg2Player("B¹n nhËn ®­îc 1 B¸nh İt Vui vÎ");
	elseif nRand <= 999 then
		AddItem(2,1,1127,1);
		Msg2Player("B¹n nhËn ®­îc 1 B¸nh İt May m¾n");
	else
		AddItem(2,1,1128,1);
		Msg2Player("B¹n nhËn ®­îc 1 B¸nh İt Thñy tinh");
	end;
end;

