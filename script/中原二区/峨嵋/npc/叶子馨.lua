function main()
	Say("����ʲô?",
		5,
		"����ʦ����Ʒ/PutongBuy",
		"�������ʦ����װ/ChujitaoBuy",
		"�����м�ʦ����װ/ZhongtaoBuy",
		"����߼�ʦ����װ/GaotaoBuy",
		"�ҿ�һ��/cancel")
end

function cancel()
end

function PutongBuy()
   Sale(45)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng��i kh�ng ph�i �� t? Nga My, mua v�t ph�m b? truy�n c�a b�n m�n l�m g??",0)
	return
else
   Sale(72)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng��i kh�ng ph�i �� t? Nga My, mua v�t ph�m b? truy�n c�a b�n m�n l�m g??",0)
	return
else
   Sale(73)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng��i kh�ng ph�i �� t? Nga My, mua v�t ph�m b? truy�n c�a b�n m�n l�m g??",0)
	return
else
   Sale(74)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng��i kh�ng ph�i �� t? Nga My, thay ��i x�ng h? th? c? li�n quan g??",0)
	return
else
   Sale(61)
end
end