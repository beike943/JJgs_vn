--create date:2007-08-13 20:03
--author:yanjun
--describe:ÊðÃûµÄ¼Ì³ÐÊé£¬Ê¹ÓÃÔö¼Ó×Ô¼º100µã×Ï¹â¸ó»ý·Ö
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = "Tö Quang LÖnh";
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(TSK_POINT,GetTask(TSK_POINT)+100);
		Msg2Player("B¹n ®· thu ®­îc 100 ®iÓm Tö Quang C¸c");
		WriteLog("[Bang héi v­ît ¶i]:"..GetName().."Sö dông 1	"..g_szItemName);
	end;
end;