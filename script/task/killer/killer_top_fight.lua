-- ====================== ÎÄ¼şĞÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñ¶¥¼¶É±ÊÖÕ½¶·ËÀÍö½Å±¾                  
-- Edited by starry night                                 
-- 2005/09/12 PM 14:17                                    
                                                          
-- ======================================================
Include("\\script\\lib\\lingshi_head.lua");
function OnDeath(NpcIndex)

	SetNpcLifeTime(NpcIndex,0);--Ê¹µÃÊ¬ÌåÏûÊ§
	SetNpcScript(NpcIndex,"");--³·Ïú¸ÃNpcËù¹Ò½Å±¾
	local nLevel = GetLevel();
	if random(1,100) <= 50 then
		local nLSLevel = 0;
		if nLevel <= 30 then
			nLSLevel = 1;		
		elseif nLevel <= 40 then
			nLSLevel = random(1,2);
		elseif nLevel <= 50 then
			nLSLevel = random(1,3);
		elseif nLevel <= 60 then
			nLSLevel = random(1,4);
		elseif nLevel <= 80 then
			nLSLevel = random(1,5);
		elseif nLevel <= 100 then
			nLSLevel = random(2,5);
		end;
		lspf_AddLingShiInBottle(nLSLevel,1);
		if nLSLevel ~= 0 then
			Msg2Player("B¹n nhËn ®­îc 1 "..nLSLevel.." (cÊp) Linh th¹ch, ®· nhËp vµo Tô Linh §Ønh");		
		end;		
	end;
end;
