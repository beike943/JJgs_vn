function main(sel)
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 410 then
		return
	end
	NewWorld(411, 1364 ,3481)
	SetFightState(1);
end;