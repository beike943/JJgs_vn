function main()
	Say("�кι��?",
		5,
		"������Щʦ����Ʒ/PutongBuy",
		"�������ʦ����װ/ChujitaoBuy",
		"�����м�ʦ����װ/ZhongtaoBuy",
		"����߼�ʦ����װ/GaotaoBuy",
		"��������/cancel")
end

function cancel()
end

function PutongBuy()
   Sale(46)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("�㲻�Ǳ��ŵ���",0)	return
else
   Sale(78)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("�㲻�Ǳ��ŵ���",0)
	return
else
   Sale(79)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("�㲻�Ǳ��ŵ���",0)
	return
else
   Sale(80)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("�㲻�Ǳ��ŵ���",0)
	return
else
   Sale(63)
end
end