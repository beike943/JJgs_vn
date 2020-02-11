Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")
Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,232,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(TITLE_GENRE,5) == 1 then
			SetCurTitle(TITLE_GENRE,5)
			SetTask(TASK_TITLE_OLD,5)
			WriteLog("[Ho¹t ®éng mïa xu©n (thiÖp chóc)]:"..GetName().."§· sö dông thiÖp chóc n¨m míi 5. ")
			Msg2Player("B¹n nhËn ®­îc danh hiÖu nh­ ý c¸t t­êng.")
		end
	end
end

