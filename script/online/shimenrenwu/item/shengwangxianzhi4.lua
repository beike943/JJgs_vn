function CanEquip()
	if GetTask(336) < 9000 then
		Msg2Player("B¹n cÇn cã 9000 ®iÓm danh väng s­ m«n míi cã thÓ mÆc bé trang bÞ nµy");
		return 1;	--²»ÄÜ´©
	end;
	return 0;
end;

function OnUse()
	return 0;
end;

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0;
end
