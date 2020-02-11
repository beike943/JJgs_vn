Include("\\settings\\static_script\\missions\\hunduantongtianding\\head.lua")

this = tbHDTTD;

function OnDeath(nKiller)
	local m = GetWorldPos();
	SetTempRevPos(m,1474*32,2961*32); --ÁÙÊ±ÖØÉúµã	
	if GetMissionV(MV_STAGE) == 1 then
		ttd_bossRestore();
	end
end

function ttd_bossRestore()
	local nNpcIDX = ttd_findNpc("HuyÕt HÇu Tiªu D­¬ng");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	if nNpcIDX ~= 0 then
		NpcChat(nNpcIDX,"TrËn chiÕn sinh tö lµ ph¶i m¹ng ®æi m¹ng, m¸u ®æ ®Çu r¬i, quyÕt chiÕn tíi cïng.");
		NpcChat(nQRSidx,"H·y cÈn thËn bän tµ ma ngo¹i ®¹o nµy giÕt ng­êi hót m¸u ®Ó håi phôc ch©n khÝ, v« cïng d· man!");
		local nMaxLife,nCurLife = GetUnitCurStates(nNpcIDX,1);
		local nAddLife = min(floor(nMaxLife*0.1),nMaxLife-nCurLife);
		ModifyNpcData(nNpcIDX,0,nAddLife,1);
	end		
end