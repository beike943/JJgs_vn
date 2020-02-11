-- »ú¹ØÈË£¬ ¿ªÆôÅúÁ¿ÖÆÔì¹¦ÄÜ

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	Say("B¹n muèn dïng c¬ quan nh©n? Nã cã thÓ gióp b¹n më mét sè chøc n¨ng trong 1 giê.", 2, "§óng/#yes_use("..nItemIndex..")", "Sai/no_say")
end

function yes_use(nItemIndex)
	if GetTask(2509) > 0 then
		Say("B¹n ®· dïng mét c¬ quan nh©n.", 0)
	else
		if DelItem(2,1,1011,1) == 1 then
			SetTask(2509, 3600 * 18)
			Msg2Player("B¹n ®· dïng 1 c¬ quan nh©n ")
		end
	end
end