Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")
Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,236,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(TITLE_GENRE,9) == 1 then
			SetCurTitle(TITLE_GENRE,9)
			SetTask(TASK_TITLE_OLD,9)
			WriteLog("[Ho¹t ®éng mïa xu©n (thiÖp chóc)]:"..GetName().."§· sö dông thiÖp chóc n¨m míi 9. ")
			Msg2Player("B¹n nhËn ®­îc danh hiÖu ®¹i c¸t ®¹i lîi.")
		end
	end
end

