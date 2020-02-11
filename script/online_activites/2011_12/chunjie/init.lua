--by liubo
--2012Äê´º½Ú»î¶¯

Include("\\script\\lib\\globalfunctions.lua")

--ÁºÉ½Ã¿ÈÕÈÎÎñ»ñµÃ½±Àø
function get_award_liangshan_chunjie(nNum)
	--ÊÇ·ñ¿ªÆô»î¶¯ÅĞ¶Ï
	if VietCheckEventDate() ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
  end
	gf_AddItemEx2({2,1,30353,50},"§ång tiÒn may m¾n","Hoat dong thang 1 nam 2012","L­¬ng S¬n v­ît ¶i nhiÖm vô h»ng ngµy",0,1)
end
--ÁºÉ½¿ªÆô¾ÛÒå±¦Ïä»ñµÃ½±Àø
function get_award_juyibox_chunjie()
	if VietCheckEventDate() ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
  end
	gf_AddItemEx2({2,1,30353,10},"§ång tiÒn may m¾n","Hoat dong thang 1 nam 2012","L­¬ng S¬n Tô NghÜa B¶o R­¬ng",0,1)
end

--²Î¼ÓÒ»³¡ÌìÃÅÕó
function get_award_tianmenzhen_chunjie(nType)
	--ÊÇ·ñ¿ªÆô»î¶¯ÅĞ¶Ï
	if VietCheckEventDate() ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
  end
	if nType == 1 then
		gf_AddItemEx2({2,1,30353,50},"§ång tiÒn may m¾n","Hoat dong thang 1 nam 2012","Thiªn M«n trËn",0,1)
	elseif nType == 2 then
		gf_AddItemEx2({2,1,30353,100},"§ång tiÒn may m¾n","Hoat dong thang 1 nam 2012","Thiªn M«n trËn",0,1)
	elseif nType == 3 then
		gf_AddItemEx2({2,1,30353,300},"§ång tiÒn may m¾n","Hoat dong thang 1 nam 2012","Thiªn M«n trËn",0,1)
	else
		gf_AddItemEx2({2,1,30353,30},"§ång tiÒn may m¾n","Hoat dong thang 1 nam 2012","Thiªn M«n trËn",0,1)
	end
end

------------------------------------------------
function ServerStartUp()

end
function PlayerLogin()

end
