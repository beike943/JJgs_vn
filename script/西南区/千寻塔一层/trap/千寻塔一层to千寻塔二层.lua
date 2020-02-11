function main(sel)
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 409 then
		return
	end
	NewWorld(410, 1442 ,3122)
	SetFightState(1);
end;