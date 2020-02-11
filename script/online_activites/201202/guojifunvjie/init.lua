--by liubo
--2012Äê3ÔÂ¹ú¼Ê¸¾Å®½Ú»î¶¯

Include("\\script\\lib\\globalfunctions.lua")

AcitivityID = 56;
AwardTB = {2,1,30360,"V¶i lôa cao cÊp","Hoat dong thang 3 nam 2012 "};

--ÁºÉ½Ã¿ÈÕÈÎÎñ»ñµÃ½±Àø
function get_award_liangshan_funvjie(nNum)
	--ÊÇ·ñ¿ªÆô»î¶¯ÅÐ¶Ï
	if gf_CheckEventDateEx(AcitivityID) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
  end
	gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],50},AwardTB[4],AwardTB[5],"L­¬ng S¬n v­ît ¶i nhiÖm vô h»ng ngµy",0,1)
end
--ÁºÉ½¿ªÆô¾ÛÒå±¦Ïä»ñµÃ½±Àø
function get_award_juyibox_funvjie()
	if gf_CheckEventDateEx(AcitivityID) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
  end
	gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],10},AwardTB[4],AwardTB[5],"L­¬ng S¬n Tô NghÜa B¶o R­¬ng",0,1)
end

--²Î¼ÓÒ»³¡ÌìÃÅÕó
function get_award_tianmenzhen_funvjie(nType)
	--ÊÇ·ñ¿ªÆô»î¶¯ÅÐ¶Ï
	if gf_CheckEventDateEx(AcitivityID) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
  end
	if nType == 1 then
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],50},AwardTB[4],AwardTB[5],"Thiªn M«n trËn",0,1)
	elseif nType == 2 then
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],100},AwardTB[4],AwardTB[5],"Thiªn M«n trËn",0,1)
	elseif nType == 3 then
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],300},AwardTB[4],AwardTB[5],"Thiªn M«n trËn",0,1)
	else
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],30},AwardTB[4],AwardTB[5],"Thiªn M«n trËn",0,1)
	end
end

------------------------------------------------
function ServerStartUp()

end
function PlayerLogin()

end
