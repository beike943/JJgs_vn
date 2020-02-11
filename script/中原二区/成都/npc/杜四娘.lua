--Éú²ú¼¼ÄÜ½ä×Ó²ÄÁÏÖÆ×÷
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

DSN_NPC = "<color=green>§ç Tø N­¬ng<color>: ";

function main()
	local tSay = {
		format("\nTiÖm Linh §å Giíi ChØ/#show_equip_shop(%d)", 3044),
		--format("\nºÀÏÀ×°±¸ÉÌµê/#show_equip_shop(%d)", 3045),
		--format("\n¸ß¼¶²ÄÁÏÉÌµê/#show_equip_shop(%d)", 3043),
		"\nT«i chØ xem xem th«i/nothing",
	}		
	Say(DSN_NPC..format("%s cã thÓ gióp ®­îc g× kh«ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end
