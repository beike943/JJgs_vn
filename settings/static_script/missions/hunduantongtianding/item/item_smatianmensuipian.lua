--Ğ¡°üÍ¨ÌìÁîÅÆÊ¹ÓÃ½Å±¾
Include("\\script\\lib\\globalfunctions.lua")

function SmaTMSP_OnUse(nItem)
	--ÅĞ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
     return 0;
	end
	if GetItemCount(2,1,30411) < 1 then
		Talk(1,"","Trong hµnh trang kh«ng cã Bao Th«ng Thiªn LÖnh nhá");
		return 0;
	end
	if DelItem(2,1,30411,1) == 1 then
		AddItem(2,1,30409,10);
	end
	return 1;
end