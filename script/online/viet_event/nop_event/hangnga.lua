Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\lib\\globalfunctions.lua")

function main()
	if tonumber(date("%Y%m%d")) > 20101028 then
		return
	end
	local tSay = {}
	local szHeader = "Trung Thu n¨m nay nhén nhŞp thËt, nh­ng H»ng Nga ta ®ang cÇn mét sè l­îng lín b¸nh Trung Thu ®Ó tÆng cho chóng tiªn, ®¹i hiÖp cã thÓ gióp ®ì kh«ng?"
	
	tinsert(tSay, "TÆng B¸nh Trung Thu cho H»ng Nga (10 B¸nh Trung Thu)/give_mooncake_201009")
	tinsert(tSay, "§Ó lóc kh¸c nhĞ, giê ta ch­a cã b¸nh/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function give_mooncake_201009()
	local nUsedDate = floor(GetTask(EVENT201009_GIVE_CAKE) / 10)
	local nDate = tonumber(date("%y%m%d"))
	
	if nUsedDate ~= nDate then
		SetTask(EVENT201009_GIVE_CAKE, nDate * 10)
	end
	
	local nCount = mod(GetTask(EVENT201009_GIVE_CAKE), 10)	
	if nCount >= 3 then
		Talk(1,"","Mçi ngµy chØ cã thÓ tÆng b¸nh tèi ®a 3 lÇn mµ th«i!")
		return
	end
	if GetItemCount(2, 1, 30236) < 10 then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ B¸nh Trung Thu råi!")
		return
	end
	if DelItem(2, 1, 30236, 10) == 1 then
		ModifyExp(2000000)
		Msg2Player("NhËn ®­îc 2000000 ®iÓm kinh nghiÖm")
		gf_WriteLogEx("Hoat dong thang 9 n¨m 2010", "TÆng b¸nh Trung Thu nhËn 2000000 exp")
		SetTask(EVENT201009_GIVE_CAKE, GetTask(EVENT201009_GIVE_CAKE) + 1)
		if mod(GetTask(EVENT201009_GIVE_CAKE), 10) == 3 then
			gf_AddItemEx2({2,1,30239, 3}, "NÕn Vµng", "Hoat dong thang 9 nam 2010", "TÆng B¸nh Trung Thu nhËn NÕn Vµng", 24 * 3600)
		end
	end
end

function do_nothing()

end