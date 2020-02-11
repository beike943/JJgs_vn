ITEM_LIANLIGUO 	 = {2, 1, 534}	-- Á¬Àí¹û

function OnUse(item)
	if (check_fruit(item) == 1) then
		local exp = GetItemParam(item, 0)
		Say(format("Liªn Lý qu¶ chøa <color=red>%d<color> ®iÓm kinh nghiÖm, b¹n muèn sö dông kh«ng?", exp),
			2,
			format("Sö dông /#use_fruit(%d)", item),
			"§Ó ta suy nghÜ l¹i/cancel")
	end
end

function get_string(num)
	return tonumber(num)
end

function check_fruit(item)
	local mate_name = GetMateName()
	if (mate_name == "") then
		Talk(1, "", "B¹n ch­a kÕt h«n kh«ng thÓ dïng Liªn Lý qu¶")
	else
		local self_code = GetItemParam(item, 1)
		local mate_code = GetItemParam(item, 2)
		if (get_string(self_code) ~= get_string(UnsignedHash(GetName()))) then
			Talk(1, "", "Liªn Lý qu¶ nµy kh«ng ph¶i cña b¹n, kh«ng thÓ sö dông")
		elseif (get_string(mate_code) ~= get_string(UnsignedHash(mate_name))) then
			Talk(1, "", "Liªn Lý qu¶ nµy kh«ng ph¶i phèi ngÉu cho b¹n, kh«ng thÓ sö dông")
		else
			return 1
		end
	end
	return 0
end

function cancel()
end

function use_fruit(item)
	if (ITEM_LIANLIGUO[1] ~= GetItemGenre(item) or
		ITEM_LIANLIGUO[2] ~= GetItemDetail(item) or
		ITEM_LIANLIGUO[3] ~= GetItemParticular(item)) then
		return
	end
	
	if (check_fruit(item) == 1) then
		local exp = GetItemParam(item, 0)
		ModifyExp(exp)
		DelItemByIndex(item, 1)
		Msg2Player(format("B¹n dïng 1 Liªn Lý qu¶, nhËn ®­îc %d ®iÓm kinh nghiÖm", exp))
		WriteLog("[KÕt h«n]:"..GetName().." ®· dïng 1 Liªn Lý qu¶, nhËn ®­îc"..exp.." ®iÓm kinh nghiÖm");
	end	
end
