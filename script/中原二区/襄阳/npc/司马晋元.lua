-- Created by TuanNA5
-- 31/05/2010
-- Tµi nguyªn chiÕn

Include("\\script\\online\\qixi06\\mission_head.lua");

szNpcName = "<color=green>T­ M· TÊn Nguyªn<color> :"

function main()
	--local nDate = tonumber(date("%y%m%d"))
	--local nCurDate = GetTask(TSK_NEWRES_CALC_DAILY)
	--if nCurDate ~= nDate then

	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ph­¬ng ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ngäc ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta ");
			return 0;	
		end
	end

	local nSongCount, nLiaoCount = 0,0	
	nSongCount = BT_GetPlayerCount(SONG_ID)
	nLiaoCount = BT_GetPlayerCount(LIAO_ID)
	local tSay = {
--		"Khëi ®éng chiÕn tr­êng/open_newres",
		format("Ta muèn tham gia Thiªn M«n TrËn-Tµi Nguyªn ChiÕn (Sè ng­êi hiÖn t¹i Tèng: [%d] Liªu: [%d])/newres_sign_up",nSongCount, nLiaoCount),		
		"Ta ®ang bËn viÖc/gf_DoNothing",	
	}		
	Say(szNpcName.."T­ M· gia kh«ng cã tiÕng t¨m trªn giang hå lµ v× b¶o thñ, kh«ng biÕt n¾m b¾t thêi c¬ chñ ®éng xuÊt kİch. Tõ nay ta sÏ lµm thay ®æi t×nh h×nh nµy. Nghe nãi hai n­íc Tèng Liªu ®ang giao tranh cÇn rÊt nhiÒu tµi nguyªn. T­ M· ta më chiÕn dŞch khai th¸c tµi nguyªn chiÕn cho c¶ hai phe. Ng­¬i muèn tham gia kh«ng?",getn(tSay),tSay)
end