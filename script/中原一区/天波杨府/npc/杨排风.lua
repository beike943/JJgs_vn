
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���������������ŷ�ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

function main()
	Say("V� huynh �� n�y t�m ta c� vi�c g� kh�ng?",
		5,
		"Ta mu�n mua m�t s� v�t d�ng./PutongBuy",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho t�n th�? H�y cho ta xem!/ChujitaoBuy",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho v� l�m cao th�? H�y cho ta xem!/ZhongtaoBuy",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho tuy�t th� cao th�? H�y cho ta xem!/GaotaoBuy",
		"R�i kh�i./cancel")
end

function cancel()
end

function PutongBuy()
   Sale(51)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ng��i kh�ng ph�i l� �� t� c�a D��ng M�n sao l�i mua v�t ph�m b� truy�n c�a b�n m�n?",0)
	return
else
   Sale(81)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ng��i kh�ng ph�i l� �� t� c�a D��ng M�n sao l�i mua v�t ph�m b� truy�n c�a b�n m�n?",0)
	return
else
   Sale(82)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ng��i kh�ng ph�i l� �� t� c�a D��ng M�n sao l�i mua v�t ph�m b� truy�n c�a b�n m�n?",0)
	return
else
   Sale(83)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ng��i kh�ng ph�i �� t� D��ng M�n, d�m l�a g�t ta �?",0)
	return
else
   Sale(64)
end
end
