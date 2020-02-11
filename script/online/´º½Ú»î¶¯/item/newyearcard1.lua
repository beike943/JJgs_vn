Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")
Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,228,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(TITLE_GENRE,1) == 1 then
			SetCurTitle(TITLE_GENRE,1)
			SetTask(TASK_TITLE_OLD,1)
			WriteLog("[Ho¹t ®éng mïa xu©n (thiÖp chóc)]:"..GetName().."§· sö dông thiÖp chóc n¨m míi 1. ")
			Msg2Player("B¹n nhËn ®­îc danh hiÖu t×nh yªu ngät ngµo.")
		end
	end
end

