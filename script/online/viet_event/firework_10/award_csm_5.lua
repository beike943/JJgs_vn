Include("\\script\\lib\\globalfunctions.lua")

CMS5_LOG_TITLE = "CSM 5 nam 2011"

function award_CSM5()
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 110805 then
		Talk(1,"","§· hÕt thêi gian nhËn th­ëng!")
		return
	end
	
	local nSaveDate = floor(GetTask(TSK_AWARD_CSM5) / 100)
	if gf_GetExtPointBit(1, 1) == 1 and nDate ~= nSaveDate then
		if gf_SetExtPointBit(1, 1, 0) == 1 then
			SetTask(TSK_AWARD_CSM5, (nDate * 100) + 4)
		end
	end
	
	local nUse = mod(GetTask(TSK_AWARD_CSM5), 100)

	local nExp = 2000000
	
	if GetLevel() < 77 then
		Talk(1, "", "§¼ng cÊp 77 trë lªn míi cã thÓ nhËn th­ëng!")
		return
	end
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "ThiÕu hiÖp ch­a gia nhËp m«n ph¸i nªn kh«ng thÓ nhËn th­ëng!" )
		return
	end
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "ThiÕu hiÖp ph¶i cã kü n¨ng cÊp 55 míi cã thÓ nhËn th­ëng!")
		return
	end
	
	if nUse == 0 then
		Talk(1,"", "H«m nay thiÕu hiÖp ®· nhËn th­ëng ®ñ 4 lÇn hoÆc ch­a kÝch ho¹t tõ hÖ thèng Game Menu!")
		return
	end

	local nDiff = GetTime() - GetTask(TSK_AWARD_CSM5_ACTIVE_TIME)
	if nDiff < 900 then
		local nWaitMin = floor(nDiff / 60)
		local nWaitSec = mod(nDiff, 60)
		Say("ThiÕu hiÖp cÇn "..(14 - nWaitMin).." phót "..(60 - nWaitSec).." gi©y sau míi cã thÓ nhËn th­ëng", 1, "KÕt thóc ®èi tho¹i/nothing");
		return 0;
	end
	
	SetTask(TSK_AWARD_CSM5, GetTask(TSK_AWARD_CSM5) - 1)
	SetTask(TSK_AWARD_CSM5_ACTIVE_TIME, GetTime())
	ModifyExp(nExp)
	Msg2Player("§¹i hiÖp ®· nhËn ®­îc phÇn th­ëng "..nExp.." ®iÓm kinh nghiÖm")
	gf_WriteLogEx(CMS5_LOG_TITLE, "NhËn th­ëng thµnh c«ng")
end

function nothing()

end