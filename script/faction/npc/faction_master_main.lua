--½Å±¾¹¦ÄÜ£ºÊ¦ÃÅNPC-Ê¦¸¸Ö÷½Å±¾
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2011-4-7
--ĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\faction\\faction_head.lua")
function master_dia_sel_main(nFactionId,nRouteId)
	--e:\Ô½ÄÏ_¿ª·¢\2011Äê\fore_work\ĞÂÃÅÅÉ\ÃÅÅÉÍ³Ò»ÕûÀí_4-13\faction_master_main.lua ÄÚÓÃ¶ÔÓ¦ÄÚÈİ
end
--¼ÓÈëÁ÷ÅÉµÄ²Ù×÷
function join_route_main(nRouteId)
	--±³°ü¿Õ¼ä¼ì²â
	local nNeedItemRoom = 5
	if nRouteId == 30 or nRouteId == 2 then
		nNeedItemRoom = 6 
	end
	if gf_Judge_Room_Weight(nNeedItemRoom,200,format("<color=green>"..GetTargetNpcName().."<color>: nÕu ®· quyÕt vµo m«n ph¸i ta, bæn s­ sÏ tÆng ng­¬i mét vµi trang bŞ t©n thñ xem nh­ lµ quµ nhËp m«n, h·y chØnh lı l¹i hµnh trang vµ quay l¹i t×m ta nhËn lÊy (cÇn <color=yellow>%d<color> « trèng hµnh trang!#",nNeedItemRoom)) ~= 1 then
		
		return 0
	end
	--Ê¦ÃÅ×°±¸Ôö¼Ó
	Add_Faction_Equipment(nRouteId,GetBody(),40)
	return 1
end
