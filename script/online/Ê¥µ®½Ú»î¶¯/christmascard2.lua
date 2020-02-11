Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,211,1) == 1 then
		RemoveAllFestivalTitle()
		nRetCode = AddTitle(3,2)
		if nRetCode == 1 then 
			Msg2Player("ChÛc mıng bπn nhÀn Æ≠Óc 1 danh hi÷u gi∏ng sinh!")
		else
			Msg2Player("NhÀn danh hi÷u gi∏ng sinh th t bπi.")
		end
	end
end