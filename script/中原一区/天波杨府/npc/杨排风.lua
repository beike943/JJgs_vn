
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���������������ŷ�ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

function main()
	Say("��������ʲô��?",
		5,
		"������Щ����/PutongBuy",
		"�������ʦ����װ/ChujitaoBuy",
		"�����м�ʦ����װ/ZhongtaoBuy",
		"����߼���װ/GaotaoBuy",
		"��ֻ��������/cancel")
end

function cancel()
end

function PutongBuy()
   Sale(51)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("�㲻�Ǳ��ŵ���",0)
	return
else
   Sale(81)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("�㲻�Ǳ��ŵ���",0)
	return
else
   Sale(82)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("�㲻�Ǳ��ŵ���",0)
	return
else
   Sale(83)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("�㲻�Ǳ��ŵ��ӣ�����ƭ��?",0)
	return
else
   Sale(64)
end
end
