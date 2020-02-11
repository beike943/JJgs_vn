
function OnUse()
	local selTab = {
		"§­îc! Ta muèn më bao l× x×./open",
		"T¹m thêi ta ch­a muèn më./nothing"
		}
	Say("Tr­íc khi më bao l× x×, h·y xem hµnh trang cã ®ñ « trèng vµ søc lùc hay kh«ng, nh»m tr¸nh nh÷ng tæn thÊt kh«ng ®¸ng. B¹n cã ®ång ý më nã kh«ng?",2,selTab)
end

function open()
	if DelItem(2,1,265,1) == 1 then
		WriteLog("[Ho¹t ®éng mïa xu©n (bao l× x×)]:"..GetName().." ®· sö dông 1 bao l× x× n¨m míi.")
		AddItem(2,1,266,1)
		AddItem(2,1,267,1)
		AddItem(2,1,268,1)
		AddItem(2,1,269,1)
		Msg2Player("B¹n nhËn ®­îc 4 c¸i b¸nh tæ.")
	end
end

function nothing()

end