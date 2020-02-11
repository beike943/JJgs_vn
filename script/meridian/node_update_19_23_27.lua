--¾­ÂöÏµÍ³Ñ¨Î»ÌØÊâĞèÇóÄ£°å

t_node_id_list = {19, 23, 27}

--Ö¸¶¨Ñ¨Î»Ö¸¶¨µÈ¼¶µÄÌØÊâĞèÇóÌõ¼şÊÇ·ñ´ï³É
--1=ÒÑ´ï³É
--0=Î´´ï³É
function CheckCondition(nNodeId, nLevel, bNotify)
	local nThisIndex = 0
	for i= 1, getn(t_node_id_list) do
		if t_node_id_list[i] == nNodeId then
			nThisIndex = i
			break
		end
	end
	if nThisIndex > 0 then
		for i= 1, getn(t_node_id_list) do
    		local nCheckNodeId = t_node_id_list[i]
    		local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0
    		if nCheckNodeLevel > 0 and nCheckNodeId ~= nNodeId then
    			if 1 == bNotify then
    				--Msg2Player("ĞüÊà¡¢ÖÁÑô¡¢ÉíÖùÈıÑ¨Ñ¨Î»Ïà³å£¬µãÑ¨Ê§°Ü")
    				Talk(1, "", format("HuyÒn Khu, Chİ D­¬ng, Th©n Trô 3 huyÖt vŞ t­¬ng xung, ®iÓm huyÖt thÊt b¹i"));
    			end
    			return 0
    		end
		end
	end

	return 1;
end

--»ñÈ¡Ö¸¶¨Ñ¨Î»Ö¸¶¨µÈ¼¶µÄÌØÊâĞèÇóÃèÊöÎÄ±¾
--·µ»ØszDescription
function GetConditionDesc(nNodeId, nLevel)
	local str = "HuyÒn Khu, Chİ D­¬ng, Th©n Trô 3 huyÖt t­¬ng xung"
	return str;
end

--Ñ¨Î»Éı¼¶ºóÌØÊâĞèÇóĞèÒªÖ´ĞĞµÄ²Ù×÷
--1=²Ù×÷³É¹¦
--0=²Ù×÷Ê§°Ü
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	return 1;
end