Include("\\script\\newbattles\\functions.lua");
Include("\\script\\vng\\config\\newserver.lua");

TSK_EXCHANGE_JUNGONG_TIME = 2154

tbTOUCHEN = 
{
	[1] = {"§Çu thµnh tÝn",2,1,9980,15000},
	[2] = {"§Çu thµnh th­",2,1,9979,50000},
	[3] = {"§Çu thµnh biÓu",2,1,9978,120000},
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","Ch­a ®Õn thêi gian cho phÐp, vËt phÈm nµy kh«ng thÓ sö dông.")
			return
		end
	end
	if nDate < 20131005 then
		Talk(1,"","Ch­a ®Õn thêi gian cho phÐp, vËt phÈm nµy kh«ng thÓ sö dông.")
		return
	end
	
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","B¹n dïng sai dông cô");
		return 0;
	end;
	local selTab = {
				"KÝch ho¹t sö dông vËt phÈm/kick_off",
				"Hñy bá kÝch ho¹t sö dông vËt phÈm/turn_off",
				format("§ång ý/#use(%d,%d)",nItemIdx,nType),
				"Hñy bá/nothing",
				}
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	local nMaxTranslateJG = tbTOUCHEN[nType][5];
	local szItemName = tbTOUCHEN[nType][1];
	local nCamp = 0;
	if nCurJunGong > 0 then
		nCamp = 1;
	elseif nCurJunGong < 0 then
		nCamp = 2;
	end;
	if nCamp == 0 then
		Talk(1,"","§iÓm chiÕn c«ng hiÖn t¹i cña b¹n lµ <color=yellow>0<color>. Kh«ng thÓ sö dông "..szItemName..".");
		return 0;
	end;
	Say("sö dông <color=yellow>"..szItemName.."<color>Cã thÓ dïng ®iÓm c«ng tr¹ng hiÖn cã ®æi t­¬ng ®­¬ng víi ®iÓm chiÕn c«ng trËn doanh ®èi ph­¬ng, nhiÕu nhÊt cã thÓ ®æi <color=yellow>"..nMaxTranslateJG.."<color> ®iÓm c«ng tr¹ng trËn doanh ®èi ph­¬ng. HiÖn t¹i ng­¬i cã <color=yellow>"..tCampNameZ[nCamp].."_c«ng tr¹ng"..abs(nCurJunGong).." ®iÓm<color>, ng­¬i ®ång ý dïng"..szItemName.."?",getn(selTab),selTab);
end;

function kick_off()
	local nCurTime = GetTime()
	if GetTask(TSK_EXCHANGE_JUNGONG_TIME) > 0 then
		Say("B¹n ®· kÝch ho¹t sö dông vËt phÈm nµy råi!",0)
		return
	end
	SetTask(TSK_EXCHANGE_JUNGONG_TIME,nCurTime)
	Say("KÝch ho¹t sö dông vËt phÈm thµnh c«ng. Sau 72 giê b¹n cã thÓ sö dông vËt phÈm nµy.",0)
	WriteLogEx("Chuyen doi cong trang","kÝch ho¹t sö dông",tonumber(date("%Y%m%d%H%M")))
end

function turn_off()
	SetTask(TSK_EXCHANGE_JUNGONG_TIME,0)
	Say("Hñy bá kÝch ho¹t sö dông vËt phÈm thµnh c«ng.",0)
	WriteLogEx("Chuyen doi cong trang","hñy bá kÝch ho¹t",tonumber(date("%Y%m%d%H%M")))
end

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(tbTOUCHEN) do
		if genre == tbTOUCHEN[i][2] and detail == tbTOUCHEN[i][3] and particular == tbTOUCHEN[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nItemIdx,nType)
	if GetTask(TSK_EXCHANGE_JUNGONG_TIME) == 0 then
		Say("B¹n ch­a kÝch ho¹t sö dông vËt phÈm nµy!",0)
		return
	end	
	if GetTime() - GetTask(TSK_EXCHANGE_JUNGONG_TIME) < 72*60*60 then
		Say("Thêi gian kÝch ho¹t vËt phÈm ch­a ®ñ 72 giê!",0)
		return
	end
	if GetTime() - GetTask(TSK_EXCHANGE_JUNGONG_TIME) > 96*60*60 then
		Say("Thêi gian kÝch ho¹t vËt phÈm ®· qua 96 giê, b¹n ph¶i kÝch ho¹t l¹i míi cã thÓ sö dông vËt phÈm!",0)
		SetTask(TSK_EXCHANGE_JUNGONG_TIME,0)
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nCurJunGong = BT_GetData(PT_RANKPOINT);
		local nMaxTranslateJG = tbTOUCHEN[nType][5];
		local szItemName = tbTOUCHEN[nType][1];	
		local nCamp = 0;
		if nCurJunGong > 0 then
			nCamp = 1;
		elseif nCurJunGong < 0 then
			nCamp = 2;
		end;
		local nTranslateJG = 0;
		if nCurJunGong >= nMaxTranslateJG then
			nTranslateJG = nMaxTranslateJG;
		elseif nCurJunGong <= -nMaxTranslateJG then
			nTranslateJG = -nMaxTranslateJG;
		else
			nTranslateJG = nCurJunGong;
		end;
		BT_SetData(PT_RANKPOINT,-nTranslateJG);
		SetRankPoint(5,701,1);	--¼ÓÈë¾ü¹¦ÅÅÐÐ°ñ
		SetTask(TSK_EXCHANGE_JUNGONG_TIME,0)
		Msg2Player("B¹n ®Æt thµnh c«ng "..tCampNameZ[nCamp].."Ph­¬ng "..abs(nCurJunGong).." ®iÓm c«ng tr¹ng ®æi thµnh"..tCampNameZ[3-nCamp].."Ph­¬ng "..abs(nTranslateJG).." ®iÓm c«ng tr¹ng");
		WriteLog("[ChiÕn tr­êng Nh¹n M«n Quan]:"..GetName().."Sö dông 1	"..szItemName.."ChuyÓn ®æi "..abs(nCurJunGong).." ®iÓm"..tCampNameZ[nCamp].."_c«ng tr¹ng");
	end;
end;
