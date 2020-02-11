--ÌìÃÅÕó²¹¸øÏä
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnUse(nItem)
	local tSay = {
		"\nKhëi ®éng trùc tiÕp/#ZQ_OpenTmzPak("..nItem..","..ZQ_OPEN_PAK_COST_L1..")",
		format("\nDïng %dXU khëi ®éng/#ZQ_OpenTmzPak(", ZQ_OPEN_PAK_COST_L2)..nItem..","..ZQ_OPEN_PAK_COST_L2..")",
		format("\nDïng %dXU khëi ®éng/#ZQ_OpenTmzPak(", ZQ_OPEN_PAK_COST_L3)..nItem..","..ZQ_OPEN_PAK_COST_L3..")",
	}
	tinsert(tSay, "\nT¹m thêi kh«ng cÇn/do_nothing");
	Say("H·y chän h×nh thøc khëi ®éng: ", getn(tSay), tSay);
end

function do_nothing()
end