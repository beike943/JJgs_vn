Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,339,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(4,16) == 1 then
			SetCurTitle(4,16)
			WriteLog("[Ho¹t ®éng mïa xu©n (thiÖp chóc)]:"..GetName().."§· sö dông thiÖp t×nh yªu vµ nguyªn tiªu 6. ")
			Msg2Player("B¹n nhËn ®­îc 1 danh hiÖu.")
		end
	end
end