function OnUse(nItemIndex)
	if GetTaskTemp(242) ~= 0 or GetTask(1151) ~= 0 or check_map() == 0 then
		Msg2Player("Trong l«i ®µi kh«ng thÓ sö dông kü n¨ng nµy");
		return 1;
	end;
	--Î÷±±¹Ø¿¨Ê¹ÓÃÏŞÖÆ
	if nw_map_chk() == 1 then
		Msg2Player("¶i T©y B¾c kh«ng thÓ sö dông kü n¨ng nµy!")
		return 1
	end
	
	local nPlace = GetItemPlace(nItemIndex);
	if nPlace == 1 then
		if DoFireworks(861,1) == 1 then
			SetItemUseLapse(nItemIndex,5*60*18);	--ÀäÈ´Ê±¼ä£º5·ÖÖÓ
		end;
		return 1;
	end;
	return 0;
end;

function CanEquip()
	return 0;	--·µ»Ø·Ç1±íÊ¾ÄÜÓÒ¼ü×°±¸¡£·µ»Ø1±íÊ¾²»ÄÜ×°±¸
end

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0;
end

function check_map()
	local nMapID = GetWorldPos();
	if nMapID >= 839 and nMapID <= 842 or nMapID == 2010 or nMapID == 1010 or nMapID == 961 or nMapID == 962 or nMapID == 963 then
		return 0;
	else
		return 1;
	end;
end;
--Î÷±±¹Ø¿¨µØÍ¼ÏŞÖÆ
function nw_map_chk()
	local map_id = GetWorldPos()
	for i = 1,5 do
		for j = 0,6 do
			if map_id == (1000+ (i*100) +j) then
				return 1
			end
		end
	end
	return 0
end
