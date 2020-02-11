--¾­ÂöÏµÍ³Ñ¨Î»ÌØÊâĞèÇóÄ£°å

function _get_this_node_index(nNodeId)
	local nThisIndex = 0
	for i= 1, getn(t_node_id_list) do
		if t_node_id_list[i] == nNodeId then
			nThisIndex = i
			break
		end
	end
	return nThisIndex
end

function _get_require_level(nLevel)
	return nLevel - 1
end

t_node_id_list = {3}
t_require_node_list =
{
	--require node id, require node name, require node level function
	{51, "ThiÕu Xung", _get_require_level}
}

--Ö¸¶¨Ñ¨Î»Ö¸¶¨µÈ¼¶µÄÌØÊâĞèÇóÌõ¼şÊÇ·ñ´ï³É
--1=ÒÑ´ï³É
--0=Î´´ï³É
function CheckCondition(nNodeId, nLevel, bNotify)
	local nThisIndex = _get_this_node_index(nNodeId)
	if nThisIndex > 0 then
		for i= 1, getn(t_node_id_list) do
			local nRequireLevel = t_require_node_list[i][3](nLevel)
    		local nCheckNodeId = t_require_node_list[i][1]
    		local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0
    		if nCheckNodeLevel < nRequireLevel then
    			if 1 == bNotify then
    				Msg2Player(format("%s huyÖt vŞ ch­a ®¹t ®Õn tÇng %d, ®iÓm huyÖt thÊt b¹i", t_require_node_list[i][2], nRequireLevel))
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
	local str = ""
	if _get_this_node_index(nNodeId) > 0 then
		for i = 1, getn(t_require_node_list) do
			local nRequireLevel = t_require_node_list[i][3](nLevel)
			if nRequireLevel >= 1 then
				local strTemp = format("%s huyÖt vŞ ®· ®¹t tÇng %d", t_require_node_list[i][2], nRequireLevel)
				if i == 1 then
					str = strTemp
				else
					local strOld = str;
					str = format("%s\n%s", strOld, strTemp)
				end
			end
		end
	end
	return str;
end

--Ñ¨Î»Éı¼¶ºóÌØÊâĞèÇóĞèÒªÖ´ĞĞµÄ²Ù×÷
--1=²Ù×÷³É¹¦
--0=²Ù×÷Ê§°Ü
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	return 1;
end