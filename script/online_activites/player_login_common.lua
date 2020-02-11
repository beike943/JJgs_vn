PLC_ItemList = {
	{"CÈm Nang §¹i Sù KiÖn", 2, 1, 30045}
};

function PLC_OnPlayerLogin()
		for i=1,getn(PLC_ItemList) do
	    if GetItemCount(PLC_ItemList[i][2], PLC_ItemList[i][3], PLC_ItemList[i][4]) < 1 then
	        gf_AddItemEx2({PLC_ItemList[i][2], PLC_ItemList[i][3], PLC_ItemList[i][4], 1}, PLC_ItemList[i][1], "activity common", "give", 0, 1);
	    end
    end
end