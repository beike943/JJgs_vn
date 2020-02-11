
function main()
	local selTab = {
			"§èt lªn/light_up",
			"Th«i! LÇn sau ®i!/nothing",
			}
	Say("Ng­¬i ®èt lÔ hoa chø?",getn(selTab),selTab);
end;

function light_up()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	SetNpcLifeTime(nNpcIndex,0);
	nNpcIndex = CreateNpc("Ng­êi V« h×nh"," ",nMapID,nMapX,nMapY);
	SetCurrentNpcSFX(nNpcIndex,936,1,1);
	SetNpcLifeTime(nNpcIndex,2*60*60);
	SetNpcScript(nNpcIndex,"\\script\\½á»é\\npc\\µãÈ¼ºóµÄÀñ»¨.lua");
end;

function nothing()

end;