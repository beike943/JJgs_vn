function main(sel)
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 411 then
		return
	end
	NewWorld(410, 1851 ,3006)
	SetFightState(1);
end;