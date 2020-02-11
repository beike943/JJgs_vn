Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,334,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(4,11) == 1 then
			SetCurTitle(4,11)
			WriteLog("[Ho¹t ®éng mïa xu©n (thiÖp chóc)]:"..GetName().."§· sö dông thiÖp t×nh yªu vµ nguyªn tiªu 1. ")
			Msg2Player("B¹n nhËn ®­îc 1 danh hiÖu.")
		end
	end
end