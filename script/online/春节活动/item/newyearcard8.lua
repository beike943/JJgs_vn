Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")
Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,235,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(TITLE_GENRE,8) == 1 then
			SetCurTitle(TITLE_GENRE,8)
			SetTask(TASK_TITLE_OLD,8)
			WriteLog("[Ho¹t ®éng mïa xu©n (thiÖp chóc)]:"..GetName().."§· sö dông thiÖp chóc n¨m míi 8 ")
			Msg2Player("B¹n nhËn ®­îc danh hiÖu T©m t­ëng sù thµnh.")
		end
	end
end

