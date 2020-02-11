
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ç®×¯ÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==19) then
	
		Teach_Level07_02()
		
	else
		
		Talk(1,"","MÊy n¨m nay Thµnh §« bu«n b¸n Õ Èm, TiÒn Trang ®· ®ãng cöa, xin h·y ®Õn BiÖn Kinh ®Ó nhËn.");
	
	end
	
	return

end