Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	if in_fields() ~= 1 then
		Talk(1,"","Ph¸o hoa chØ cã thÓ sö dông ë khu vùc kÕt h«n.");
		return 0;
	end;
	local selTab = {
				"§­îc/#set_up_fireworks("..nItemIdx..")",
				"§Ó ta nghÜ l¹i/nothing",
				}
	Say("B¹n muèn ®èt ph¸o hoa ë ®©y kh«ng?",getn(selTab),selTab);

end;

function set_up_fireworks(nItemIdx)
	local nMapID = GetWorldPos();
	local nFieldType = map_field2type[nMapID];
	local nLihuaCount = GetMissionV(27);
	if nLihuaCount >= field_lihua_limit[nFieldType] then
		Talk(1,"","Khu vùc nµy kh«ng thÓ ®èt thªm ph¸o hoa!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nNpcIndex = CreateNpc("Ng­êi V« h×nh","Ph¸o hoa ch­a ®èt",GetWorldPos());
		SetNpcLifeTime(nNpcIndex,2*60*60);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
		SetNpcScript(nNpcIndex,"\\script\\½á»é\\npc\\Àñ»¨.lua")
		SetMissionV(27,nLihuaCount+1)
	end;
end;