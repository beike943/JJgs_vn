function main()
	Say("�кι��?",
		5,
		"����ʦ����Ʒ/PutongBuy",
		"����ʦ�ų�����װ/ChujitaoBuy",
		"����ʦ���м���װ/ZhongtaoBuy",
		"����ʦ�Ÿ߼���װ/GaotaoBuy",
		"�ҿ�һ��/cancel")
end

function cancel()
end

function PutongBuy()
   Sale(44)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng��i kh�ng ph�i l? �� t? c�a Thi�u L�m sao l�i mua v�t ph�m b? truy�n c�a b�n ph�i?",0)
	return
else
   Sale(66)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng��i kh�ng ph�i l? �� t? c�a Thi�u L�m sao l�i mua v�t ph�m b? truy�n c�a b�n ph�i?",0)
	return
else
   Sale(67)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng��i kh�ng ph�i l? �� t? c�a Thi�u L�m sao l�i mua v�t ph�m b? truy�n c�a b�n ph�i?",0)
	return
else
   Sale(68)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng��i kh�ng ph�i l? �� t? Thi�u L�m sao d�m l�a g�t ta?",0)
	return
else
   Sale(59)
end
end