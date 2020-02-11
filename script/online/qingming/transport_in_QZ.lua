--File name:transport_in_BJ.lua
--Describe:É¨Ä¹´«ËÍÈË£¨´«½ø£©
--Create Date:2006-3-16
--Author:yanjun
--ĞŞ¸Ä¼ÇÂ¼£º´å³¤ÓÚ2007Äê3ÔÂ13ÈÕ½øĞĞÁË2007ÄêÇåÃ÷½Ú»î¶¯µÄĞŞ¸Ä
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
EnterPointTab = {									--¼ÇÂ¼Èı¸öµØÍ¼µÄ½øÈë×ø±ê¡£
			[1] = {818,1636,3181},					--ÈªÖİ
			[2] = {820,1636,3181},					--ãê¾©
			[3] = {819,1636,3181},					--³É¶¼
			}
--================================ÒÔÏÂÊÇÈ«¾Ö±äÁ¿=======================================

--================================ÒÔÉÏÊÇÈ«¾Ö±äÁ¿========================================
function main()
	if tomb_sweep_2007_date_chk() == -1 then
		Talk(1,"","TiÕt Thanh Minh s¾p ®Õn, c¸c vŞ nhí giµnh thêi gian cóng b¸i tæ tiªn!");
	elseif tomb_sweep_2007_date_chk() == 0 then
		Talk(1,"","TiÕt Thanh Minh ®· qua, vŞ"..Zgc_pub_sex_name().."nhí n¨m sau ®Õn cóng tÕ tæ tiªn.");
	else
		local selTab = {
					"§Õn cóng b¸i mé phÇn Chu ®¹i hiÖp./#gotocemetery(1)",
					"NhËn 1 quyÓn chØ nam ho¹t ®éng TiÕt Thanh Minh./#AddItem(2,0,685,1)",
					"Ho¹t ®éng TiÕt Thanh Minh./knowdetail",
					"H·y quay l¹i cóng tÕ sau nhĞ!/nothing",
					}
		Say("VŞ "..Zgc_pub_sex_name().."muèn ®Õn mé phÇn <color=red>Chu ®¹i hiÖp<color> cóng b¸i ®Ó tá lßng thµnh kİnh?",getn(selTab),selTab);
	end;
end;

--´«ËÍÍæ¼Òµ½²»Í¬µÄÄ¹Ô°
function gotocemetery(MapIndex)
	if GetLevel() < 11 then
		Say("Ng­¬i vÒ luyÖn ®Õn <color=yellow>cÊp 11<color> míi ®Õn ®©y t×m ta.",0);
		return FALSE;
	end
	NewWorld(EnterPointTab[MapIndex][1],EnterPointTab[MapIndex][2],EnterPointTab[MapIndex][3]);
end;
function knowdetail()
	Talk(4,"","Ho¹t ®éng TiÕt Thanh Minh diÔn ra vµo <color=yellow>30/3 - 8/4<color>, ng­êi ch¬i <color=yellow>cÊp 11<color> cã thÓ tham gia b»ng c¸ch ®i t¶o mé c¸c ®¹i hiÖp.",
				"Cóng b¸i mé phÇn c¸c vŞ nh­ <color=yellow>Chu ®¹i hiÖp, Hµn ®¹i hiÖp, Hiªn Viªn ®¹i hiÖp<color>. Thêi gian diÔn ra ho¹t ®éng chØ cÇn cóng b¸i bÊt kú mé phÇn cña mét vŞ ®¹i hiÖp b»ng c¸ch <color=yellow>v¸i l¹y<color> lµ ®­îc.",
				"Do "..Zgc_pub_sex_name().."thµnh t©m cóng b¸i nhËn ®­îc mËt ®å nhiÖm vô cña thñ l¨ng nh©n, lµm xong ®Õn <color=yellow>thñ l¨ng nh©n<color> nhËn th­ëng.",
				"<color=green>MËt ®å Thanh Minh<color> ghi l¹i mçi ngµy chØ lµm ®­îc <color=yellow>1<color> lÇn, nh­ng cã thÓ dïng <color=yellow>giÊy cóng tÕ<color> t¨ng sè lÇn hoµn thµnh nhiÖm vô, <color=yellow>giÊy cóng tÕ<color> mçi ngµy chØ dïng ®­îc <color=yellow>2<color> lÇn!"
			);
end
