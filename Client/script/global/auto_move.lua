--������ Begin

--��ѯ�����;�
AUTO_MOVE_QUERY_COST = 20;

--������ End


function CanQueryTargetPlayerPos(nMaxDurability)

	if (nMaxDurability < AUTO_MOVE_QUERY_COST) then
		return 0, "��������Ҫ"..AUTO_MOVE_QUERY_COST.."���;õġ������ر��������б��䡱����Ѱ��"
	end

	return 1, ""

end