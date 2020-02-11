--File name:npc_qmtransportin.lua
--Describe:2008ÄêÉ¨Ä¹´«ËÍÈË£¨´«½ø£©
--Create Date:2008-3-18
--Author:ChenMoxian
Include("\\script\\online\\qingming08\\head_qingming.lua")--ÇåÃ÷Í·ÎÄ¼ş

function main()


	if is_qingming_opened() == -1 then
		Talk(1,"","<color=green>"..get_transport_name()..":<color> Thanh Minh s¾p ®Õn råi, h·y giµnh chót thêi gian ®Ó cóng tæ tiªn.");
	elseif is_qingming_opened() == 0 then
		Talk(1,"","<color=green>"..get_transport_name()..":<color> TiÕt Thanh Minh ®· qua, "..get_player_sex().."nhí n¨m sau ®Õn cóng tÕ tæ tiªn.");
	elseif is_qingming_opened() == 2 then
		Talk(1,"","<color=green>"..get_transport_name()..":<color> Ho¹t ®éng Thanh Minh ®· ®ãng.");
	elseif is_qingming_opened() == 1 then
		local selTab = {
					"§Õn "..get_tomb_name().." cóng b¸i./#gotocemetery("..get_type()..")",
					"NhËn 1 quyÓn chØ nam ho¹t ®éng TiÕt Thanh Minh./#AddItem(2,0,685,1)",
					"Ho¹t ®éng TiÕt Thanh Minh./knowdetail",
					"H·y quay l¹i cóng tÕ sau nhĞ!/nothing",
					}
		Say("<color=green>"..get_transport_name()..":<color> Trong tiÕt Thanh Minh, "..get_player_sex().." cã muèn ®Õn "..get_tomb_name().." b¸i tÕ, bµy tá thµnh ı kh«ng?",getn(selTab),selTab);
	else
		WriteLog("TiÕt Thanh Minh 2008: Kh«ng thÓ nhËn ®­îc tr¹ng th¸i ho¹t ®éng tiÕt Thanh Minh.");
		return FALSE;--³ö´í
	end;
end;

--´«ËÍÍæ¼Òµ½²»Í¬µÄÄ¹Ô°
function gotocemetery(MapIndex)
	if GetLevel() < 11 then
		Say("<color=green>"..get_transport_name()..":<color> Ng­¬i vÒ luyÖn ®Õn <color=yellow>cÊp 11<color> míi ®Õn ®©y t×m ta.",0);
		return FALSE;
	end
	NewWorld(EnterPointTab[MapIndex][1],EnterPointTab[MapIndex][2],EnterPointTab[MapIndex][3]);
end;

function knowdetail()
	Talk(4,"","<color=green>"..get_transport_name()..":<color> Ho¹t ®éng TiÕt Thanh Minh diÔn ra vµo <color=yellow>3/4-12/4<color>, ng­êi ch¬i <color=yellow>cÊp 11<color> ®Òu cã thÓ tham gia b»ng c¸ch ®i t¶o mé c¸c ®¹i hiÖp.",
				"<color=green>"..get_transport_name()..": <color>Cóng<color=yellow> b¸i mé phÇn c¸c vŞ nh­<color> Hoµng ®¹i hiÖp, Hµn ®¹i hiÖp, Hiªn Viªn ®¹i hiÖp. Thêi gian diÔn ra ho¹t ®éng chØ cÇn cóng b¸i bÊt kú mé phÇn cña mét vŞ ®¹i hiÖp b»ng c¸ch <color=yellow>'v¸i l¹y'<color> lµ ®­îc.",
				"<color=green>"..get_transport_name()..":<color> BŞ ®¹i hiÖp khİch lÖ, sÏ khiÕn cho kinh nghiÖm giang hå cña ng­¬i t¨ng kh«ng İt. Cßn cã c¬ héi nhËn ®­îc gÊp 10 lÇn kinh nghiÖm giang hå. NÕu trong thêi gian diÔn ra ho¹t ®éng, mçi ngµy ®Òu thµnh t©m cóng b¸i, cóng b¸i <color=yellow>8<color> ngµy, sÏ nhËn ®­îc khİch lÖ lín.",
				"<color=green>"..get_transport_name()..":<color> NÕu mçi ngµy tr­íc khi cóng tÕ cã thÓ dïng mét vµi ®¹o cô cóng sÏ t¨ng ®é thµnh ı, cã c¬ héi nhËn ®­îc <color=yellow>10<color> lÇn kinh nghiÖm giang hå.");
end;