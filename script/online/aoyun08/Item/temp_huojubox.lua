--ÁÙÊ±»ğ¾æÊÖ·şÊÎ
--by vivi
--2008/06/11

function OnUse()
	local nBody = GetBody();
	if DelItem(2,1,3379,1) == 1 then
		AddItem(0,105,40+nBody,1);
	end
end