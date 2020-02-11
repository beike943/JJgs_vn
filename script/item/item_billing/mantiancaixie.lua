Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	if in_fields() ~= 1 then
		Talk(1,"","Ph¸o nµy chØ sö dông ë khu vùc kÕt h«n.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		DoFireworks(871, 1);
	end;
end;