function main()
	Say("����Щʲô?",
		5,
		"����ʦ����Ʒ/PutongBuy",
		"�������ʦ����װ/ChujitaoBuy",
		"�����м�ʦ����װ/ZhongtaoBuy",
		"����߼�ʦ����װ/GaotaoBuy",
		"��������./cancel")
end

function cancel()
end

function PutongBuy()
   Sale(55)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng��i kh�ng ph�i l? �� t? Ng? ��c, kh�ng th? mua v�t ph�m b�n gi�o",0)
	return
else
   Sale(84)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng��i kh�ng ph�i l? �� t? Ng? ��c, kh�ng th? mua v�t ph�m b�n gi�o",0)
	return
else
   Sale(85)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng��i kh�ng ph�i l? �� t? Ng? ��c, kh�ng th? mua v�t ph�m b�n gi�o",0)
	return
else
   Sale(86)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng��i kh�ng ph�i l? �� t? Ng? ��c, kh�ng th? thay ��i x�ng hi�u!",0)
	return
else
   Sale(65)
end
end