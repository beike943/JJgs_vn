Include("\\script\\lib\\globalfunctions.lua") 

function OnUse(nItemIdx)
	local nZhanGong = GetTask(701)
	local sCampName = "";
	if nZhanGong < 0 then
		sCampName = "Liªu";
	elseif nZhanGong > 0 then
		sCampName = "Tèng";
	else
		sCampName = "Trung lËp";
	end; 
	local selTab = {
				"§« thèng_Tèng/#change_camp(1,"..nItemIdx..")",
				"§« thèng phe Liªu/#change_camp(2,"..nItemIdx..")",
				"Sau nµy míi sö dông/nothing",
				}
				
	Say("HiÖn b¹n thuéc: <color=yellow>"..sCampName.."<color>, chiÕn c«ng hiÖn t¹i <color=yellow>"..abs(nZhanGong).."<color> ®iÓm. Sö dông ChiÕn ThÇn hoµn cã thÓ gióp b¹n trë thµnh <color=yellow>§« thèng<color> cña mét phe ®ång thêi chiÕn c«ng ®­îc <color=yellow>50000 ®iÓm<color>, muèn sö dông kh«ng?",
		getn(selTab),
		selTab)
end;

function change_camp(nCamp,nItemIdx)
	local nZhanGong = GetTask(701)
	local sCampName = ""
	
	if nZhanGong < 0 then
		sCampName = "Liªu"
	elseif (nZhanGong > 0) then
		sCampName = "Tèng"
	else
		sCampName = "Trung lËp"
	end
	
	if abs(nZhanGong) >= 50000 then	--Èç¹ûµ±Ç°¾ü¹¦¾ø¶ÔÖµ´óÓÚµÈÓÚ50000
		Talk(1, "", "HiÖn b¹n thuéc: <color=yellow>"..sCampName.."<color>, chiÕn c«ng hiÖn t¹i <color=yellow>"..abs(nZhanGong).."<color> ®iÓm, v­ît møc <color=red>50000<color> kh«ng thÓ dïng ChiÕn ThÇn hoµn.")
		return 0
	end
	
	if (DelItemByIndex(nItemIdx,1) == 1) then
		if (nCamp == 1) then						--³ÉÎªËÎ·½¶¼Í³
			SetTask(701, 50000)						--ÉèÖÃËÎ·½¾ü¹¦
			SetTask(704, 3)							--ÉèÖÃËÎ·½µ±Ç°¾üÏÎ
			if (GetTask(745) < 3) then				--Èç¹ûÖ®Ç°ËÎ·½¾üÏÎĞ¡ÓÚ¶¼Í³
				SetTask(745, 3)						--ÉèÖÃËÎ·½×î¸ß¾üÏÎ
			end
			if GetTask(702) < 50000 then
				SetTask(702,50000);	--ÉèÖÃËÎ·½×î¸ß¾ü¹¦
			end;
			Say("B¹n ®­îc phong lµm Tèng §« thèng.", 0)
		elseif (nCamp == 2) then					--³ÉÎªÁÉ·½¶¼Í³
			SetTask(701, -50000)					--ÉèÖÃÁÉ·½¾ü¹¦
			SetTask(704, -3)						--ÉèÖÃÁÉ·½µ±Ç°¾üÏÎ
			if GetTask(746) > -3 then	--Èç¹ûÖ®Ç°ÁÉ·½¾üÏÎĞ¡ÓÚ¶¼Í³
				SetTask(746,-3)	--ÉèÖÃÁÉ·½×î¸ß¾üÏÎ
			end;
			if GetTask(703) < 50000 then
				SetTask(703,50000);	--ÉèÖÃÁÉ·½×î¸ß¾ü¹¦
			end;
			Say("B¹n ®­îc phong lµm Liªu §« thèng",0);
		end;
		gf_WriteLogEx("SU DUNG CHIEN THAN HOAN", "sö dông thµnh c«ng", 1, "Sö dông ChiÕn ThÇn Hoµn")
	end;
end;