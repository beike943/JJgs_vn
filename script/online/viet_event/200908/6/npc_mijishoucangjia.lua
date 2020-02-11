--=============================================
--create by baiyun 2009.7.17
--describe:Ô½ÄÏ°æ8ÔÂ·İ»î¶¯¡¡ÃØ¼®ÊÕ²Ø¼Ò½Å±¾
--=============================================
Include("\\script\\online\\viet_event\\200908\\viet0908_head.lua");

function main()
	tbDialog = {
			"§æi mËt tŞch (T¹i h¹ cã 1 Linh Xµ HuyÕt + 100 Vµng)/Viet0908_LingSheXie_Miji",
			"KÕt thóc ®èi tho¹i/nothing"
	};
	Say("<color=green>Nhµ S­u TÇm MËt TŞch: <color>HiÖn t¹i chç ta ®ang cã mÊy cuèn mËt tŞch vâ häc míi tr«ng rÊt l¹. C¸c h¹ cã thÓ ®èi lÊy mËt tŞch míi t¹i chç cña ta. Nh­ng tr­íc tiªn h·y gióp ta t×m 1 chĞn Linh Xµ HuyÕt vµ 10 §ång TiÒn Vµng råi ®Õn gÆp ta ®Ó ®æi mËt tŞch nhĞ.", getn(tbDialog), tbDialog);
end

function nothing()
end