--create date:2007-08-13 20:03
--author:yanjun
--describe:¿Õ°×µÄ¼Ì³ÐÊé£¬Ê¹ÓÃ¸ÃµÀ¾ß¿Û³ýÍæ¼Ò1000µã×Ï¹â¸ó»ý·Ö£¬
--¿Û³ýÒ»¸ö¿Õ°×µÄ¼Ì³ÐÊé£¬²¢¸ø¸ÄÍæ¼ÒÔö¼Ó5¸öÐÂµÀ¾ß£ºÊðÃûµÄ¼Ì³ÐÊé
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = "Tö Quang Bµi";
function OnUse(nItemIdx)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 1000 then
		Talk(1,"","§iÓm tÝch lòy Tö Quang C¸c cña ®¹i hiÖp <color=yellow> "..nPoint.." <color>®iÓm, vÉn ch­a ®ñ <color=yellow>1000<color> ®ñ, kh«ng thÓ sö dông "..g_szItemName..".");
		return 0;
	end;
	local selTab = {
				format("§ång ý/#use(%d)",nItemIdx),
				"Hñy bá/nothing",
				}
	Say("Ng­¬i ®ång ý sö dông <color=yellow>"..g_szItemName.."<color> ? Sau khi sö dông sÏ thu ®­îc <color=yellow>5 Tö Quang LÖnh<color>, ®ång thêi sÏ trõ <color=yellow>1000<color> ®iÓm Tö Quang C¸c cña ®¹i hiÖp.",getn(selTab),selTab);
end;

function use(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang!");
		return 0;
	end;
	local nExpireTime = GetItemExpireTime(nItemIdx) or 30 * 24 * 60 * 60
	if DelItemByIndex(nItemIdx,1) == 1 then		
		for i=1,5 do
			local nRet,nIdx = AddItem(2,0,763,1);
			if nRet == 1 then
				SetItemExpireTime(nIdx,nExpireTime)
			end			
		end
		SetTask(TSK_POINT,GetTask(TSK_POINT)-1000);
		Msg2Player("C¸c h¹ nhËn ®­îc 5 Tö Quang LÖnh");
		Msg2Player("§iÓm Tö Quang C¸c cña ®¹i hiÖp bÞ trõ 1000.");
		WriteLog("[Bang héi v­ît ¶i]:"..GetName().."Sö dông 1	"..g_szItemName);
	end;
end;