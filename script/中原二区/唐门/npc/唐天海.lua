function main()
	Say("����Щʲô?",
		5,
		"����ʦ����Ʒ./PutongBuy",
		"�������ʦ����װ/ChujitaoBuy",
		"�����м�ʦ����װ/ZhongtaoBuy",
		"����߼�ʦ����װ/GaotaoBuy",
		"�ҿ�һ��./cancel")
end

function cancel()
end

function PutongBuy()
   Sale(48)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng��i kh�ng ph�i �� t? ���ng M�n, kh�ng th? mua v�t d�ng b? truy�n c�a b�n m�n.",0)
	return
else
   Sale(69)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng��i kh�ng ph�i �� t? ���ng M�n, kh�ng th? mua v�t d�ng b? truy�n c�a b�n m�n.",0)
	return
else
   Sale(70)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng��i kh�ng ph�i �� t? ���ng M�n, kh�ng th? mua v�t d�ng b? truy�n c�a b�n m�n.",0)
	return
else
   Sale(71)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng��i kh�ng ph�i �� t? ���ng M�n, ��i c�ch x�ng h? th? c? quan g??",0)
	return
else
   Sale(60)
end
end