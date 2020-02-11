function main(sel)
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 410 then
		return
	end
	NewWorld(409, 1788 ,3526)
	SetFightState(1);
end;