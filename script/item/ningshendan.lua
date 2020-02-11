--ÄıÉñµ¤£ºÏúPKÖµ1µã
function OnUse()

local PlayerPK = GetPKValue();
	
	if PlayerPK > 0 then
		AddPKValue(-1);
		DelItem(2,0,137,1,1);
		Say("TrŞ PK cña b¹n gi¶m xuèng <color=yellow>1<color>!",0);
	else
		Say("TrŞ Pk cña b¹n lµ <color=yellow>0<color>, vËt phÈm sö dông v« hiÖu!",0);
		
	end;
	
end;	