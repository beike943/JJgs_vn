--½Å±¾¹¦ÄÜ£ºÊ¦ÃÅNPCÕûºÏ-ÊÛÂô
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2011-4-2
--ÐÞ¸Ä¼ÇÂ¼£º
--¶Ò»»Ñ¡ÏîºÍÖ÷¶Ô»°·µ»Ø
Include("\\script\\faction\\faction_head.lua")
function faction_buysell_main(nFactionId)
	return 
	format("<color=green>%s<color>:".."VÞ %s nµy, t×m ta cã viÖc g× kh«ng?",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()]),
	{
		"Ta muèn mua mét sè vËt dông./#normal_buy("..nFactionId..")",
		"Ta nghe nãi s­ m«n cã 1 thÇn binh b¶o gi¸p thÝch hîp víi giang hå t©n thñ? Ta muèn xem xem nh­ thÕ nµo./#faction_buy("..nFactionId..",2)",
		"Ta nghe nãi s­ m«n cã 1 bé thÇn binh b¶o gi¸p giµnh cho vâ l©m cao thñ? H·y cho ta xem!/#faction_buy("..nFactionId..",3)",
		"Ta nghe nãi s­ m«n cã 1 bé thÇn binh b¶o gi¸p giµnh cho tuyÖt thÕ cao thñ? H·y cho ta xem!/#faction_buy("..nFactionId..",4)",
		"Lµm thÕ nµo ®Ó nhËn ®­îc ®é cèng hiÕn s­ m«n./#contribution_get("..nFactionId..")",
		"Rêi khái./cancel",
	}
end
--ÆÕÍ¨¹ºÂò
function normal_buy(nFactionId)
	Sale(TFACTION_INFO[nFactionId].tShopId[1])
end
--Ê¦ÃÅ×°±¸¹ºÂò
function faction_buy(nFactionId,nShopStep)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ng­¬i kh«ng ph¶i ®Ö tö %s ta, sao cã thÓ mua mËt tÞch cña bæ m«n ®­îc?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	else
		Sale(TFACTION_INFO[nFactionId].tShopId[nShopStep])
	end
end
--Ê¦ÃÅ¹±Ï×¶ÈÌáÐÑ
function contribution_get(nFactionId)
	local sDiaHead = format("<color=green>%s<color>#%s nªn quay vÒ t×m ch­ëng m«n quý ph¸i ®Ó nhËn nhiÖm vô s­ m«n, hoµn thµnh cã thÓ nhËn ®­îc <color=red>§iÓm cèng hiÕn s­ m«n<color>.",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	if GetPlayerFaction() == nFactionId then
		sDiaHead = format("<color=green>%s<color>#®Õn t×m ch­ëng m«n bæn ph¸i ®Ó nhËn nhiÖm vô s­ m«n, hoµn thµnh cã thÓ nhËn ®­îc <color=red>§iÓm cèng hiÕn s­ m«n<color>#",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	end
	Say(sDiaHead,
		2,
		"Trë l¹i./main",
		"Rêi khái./cancel"
	)
end
--½áÊø¶Ô»°
function cancel()
end