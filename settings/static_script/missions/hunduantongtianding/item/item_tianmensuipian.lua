--ÌìÃÅËéÆ¬Ê¹ÓÃ½Å±¾
Include("\\script\\lib\\globalfunctions.lua")

TMSP_NUM_NEED = 200;--ĞèÇóÌìÃÅËéÆ¬ÊıÁ¿

function TMSP_OnUse(nItem)
	Say("M¶nh Thiªn M«n ®­îc r¬i ra tõ Boss Th«ng Thiªn HuyÔn C¶nh, cã thÓ ghĞp thµnh Thiªn M«n Kim LÖnh.",2,format("%d M¶nh Thiªn M«n ghĞp thµnh 1 Thiªn M«n Kim LÖnh/combine_TMGL",TMSP_NUM_NEED),"Ra khái/nothing");
end

function combine_TMGL()
	--ÅĞ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
     return 0;
	end
	if GetItemCount(2,1,30410) < TMSP_NUM_NEED then
		Talk(1,"",format("Sè l­îng M¶nh Thiªn M«n kh«ng ®ñ<color>%d<color>",TMSP_NUM_NEED));
		return 0;
	end
	if DelItem(2,1,30410,TMSP_NUM_NEED) == 1 then
		gf_AddItemEx2({2,1,30370,1}, "Thiªn M«n Kim LÖnh", "GhĞp M¶nh Thiªn M«n thµnh Thiªn M«n Kim LÖnh", "M¶nh Thiªn M«n", 0, 1);
		AddRuntimeStat(14, 2, 0, 1)
	end
	return 1;
end