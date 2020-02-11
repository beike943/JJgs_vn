-- ³ÇÊÐ½±ÕÂ°ü

Include("\\script\\online\\zgc_public_fun.lua")

function OnUse(idx)
	Say("Më bao huy ch­¬ng nhËn ®­îc <color=yellow>50<color> huy ch­¬ng, huy ch­¬ng kh«ng ®­îc trao ®æi, muèn më bao kh«ng?",
		2,
		"X¸c nhËn më/tongcitywar_kai_bao",
		"KÕt thóc ®èi tho¹i/no_say")
end

function tongcitywar_kai_bao()
	if Zgc_pub_goods_add_chk(1, 0) == 1 then
		if DelItem(2,0,766,1) == 1 then
			AddItem(2,0,765,50,1)
			Say("Ban nhËn ®­îc 50 huy ch­¬ng",0)
		end
	end
end

function no_say()
end