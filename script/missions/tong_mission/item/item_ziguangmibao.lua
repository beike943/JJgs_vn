--create date:2007-08-13 20:44
--author:yanjun
--describe:ÊðÃûµÄ¼Ì³ÐÊé£¬Ê¹ÓÃÔö¼Ó×Ô¼º100µã×Ï¹â¸ó»ý·Ö
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = " Tö Quang MËt Báa";
g_tbItem = {
	[1] = {2,0,735,"Tö Quang LiÖt Viªm CÈm",1},
	[2] = {2,0,736,"Tö Quang Kú L©n Vò",1},
	[3] = {2,0,737,"Tö Quang Kim Tµm Ti",2},
	[4] = {2,0,738,"M¶nh TiÖt Hoµnh Thó",4},
	[5] = {2,0,739,"Th­îng Cæ Kú L©n HuyÕt",3},
	}
function OnUse(nItemIdx)
	local selTab = {};
	for i=1,getn(g_tbItem) do
		tinsert(selTab,format("%s (cÇn %d %s)/#make_it(%d)",g_tbItem[i][4],g_tbItem[i][5],g_szItemName,i));
	end;
	tinsert(selTab,"§Ó ta nghÜ l¹i ®·/nothing");
	Say("§¹i hiÖp muèn hîp thµnh vËt phÈm nµo bªn d­íi?",getn(selTab),selTab);
end;

function make_it(nType)
	if gf_JudgeRoomWeight(2,20) == 0 then
		Talk(1,"","Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang!");
		return 0;
	end;
	local nNeedItemCount = g_tbItem[nType][5];
	if GetItemCount(2,0,761) < nNeedItemCount then
		Talk(1,"","Sè l­îng "..g_szItemName.." trªn hµnh trang cña ®¹i hiÖp kh«ng ®ñ!");
		return 0;
	end;
	if DelItem(2,0,761,nNeedItemCount) == 1 then
		AddItem(g_tbItem[nType][1],g_tbItem[nType][2],g_tbItem[nType][3],1);
		WriteLog("[Bang héi v­ît ¶i]:"..GetName().."Sö dông 1	"..g_szItemName..", hîp thµnh 1 "..g_tbItem[nType][4]);
	end;
end;