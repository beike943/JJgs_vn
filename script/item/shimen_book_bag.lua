Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
BOOK_BAG_G=2
BOOK_BAG_D=1
BOOK_BAG_P=30627
function OnUse(nItem)
	local tSay = {
		format("%s/%s","§ång ý","onUse_Confirm"),
		format("%s/%s","Ra khái","nothing"),
	}

	Say("Tói mËt tÞch s­ m«n cao cÊp: më ra ngÉu nhiªn nhËn ®­îc mét mËt tÞch s­ m«n cao cÊp, cã x¸c nhËn më kh«ng?", getn(tSay), tSay);
end

function onUse_Confirm()
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	if DelItem(BOOK_BAG_G,BOOK_BAG_D, BOOK_BAG_P, 1) ~= 1 then
		return 0;
	end
	MA_GiveFactionBook({1,100},"Tói mËt tÞch s­ m«n cao cÊp")
end

function nothing()
end