-- ¾«Ó¢°ï»áÕ½ head
-- by windle 2009-2-13 15:11

--TASKID_JYBHZ_USE_HONGBAO = 2669;	-- Ê¹ÓÃºì°ü
--TASKID_JYBHZ_GET_HONGBAO = 2670;	-- ÁìÈ¡ºì°ü

function addLonghuNpc()
	local npcIdx = CreateNpc("Vâ L©m Minh Chñ1","Long Hæ Sø", 300, 1921, 3511);
	SetNpcScript(npcIdx, "\\script\\online\\viet_event\\longhu\\longhu_npc.lua");
	return npcIdx;
end


function nothing()
end