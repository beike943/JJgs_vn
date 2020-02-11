-- ĞŞÕæÒª¾÷
-- Ôö¼ÓĞŞÎªµãÊı1000µã
-- lizhi 2006-11-2 11:53

nInsPopur = 1000

function OnUse()
	-- ÅĞ¶ÏÔö¼ÓºóĞŞÎªÊÇ·ñµ½´ïÉÏÏŞ
	nCount = GetItemCount(2,0,554)
	AskClientForNumber("TuChan_use", 0, nCount,"(0-999)")
end

function yes_say()
	if DelItem(2, 0, 554, 1) == 1 then
		ModifyPopur(nInsPopur)
		Msg2Player("B¹n ®· dïng Tu Ch©n yÕu quyÕt, t¨ng"..nInsPopur.." ®iÓm tu luyÖn")
	end
end


function TuChan_use(nCount)
	if nCount == 0 then
		return 0
	end
	
	local nPopurLimit = GetPopurLimit()
	local nPopur = GetPopur()
	if (nPopur + (nInsPopur*nCount)) > nPopurLimit then
		Talk(1,"","Sè ®iÓm céng v­ît qu¸ giíi h¹n, kh«ng thÓ sö dông <color=green>Tu Ch©n yÕu quyÕt<color>!")
		return 0
	end
	
	if DelItem(2, 0, 554, nCount) == 1 then
		ModifyPopur(nInsPopur*nCount)
		Msg2Player("B¹n ®· dïng "..nCount.." Tu Ch©n yÕu quyÕt, t¨ng "..(nInsPopur*nCount).." ®iÓm tu luyÖn.")
	else
		Talk(1,"","Sè l­îng <color=green>Tu Ch©n yÕu quyÕt<color> trong hµnh trang kh«ng ®ñ.")
		return 0
	end
end


function no_say()

end