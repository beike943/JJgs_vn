--�ű����ܣ���������NPC��Ӧ�ű�
--���ܿ������峤
--����ʱ�䣺2011-4-2
--�޸ļ�¼��
-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

Include("\\script\\faction\\npc\\buy_sell_main.lua")
function main()
	local sDiaHead,tDiaSel = faction_buysell_main(8)
	if getn(tDiaSel) > 0 then
		tinsert(tDiaSel, getn(tDiaSel), "����Ҫ������������/other_function");
	end
	Say(sDiaHead,getn(tDiaSel),tDiaSel)
end

function other_function()

	--���͹����ض���Ʊ
	if GetBit(GetTask(GIVE_TICKET_STATE),1) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"M�i v�t tr�n ��i ��u c? n�i t�m, ng��i h�nh y sao c? th? ��i x? thi�n v? v�i b�nh nh�n kh�c nhau?"},
		{"b�ch ng�c �i�u lan kim ty s�ng, c? k? th? k�t m�n chu ty v�ng, thu? tri �ang ni�n ca v? tr�ng"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--������Ʊ�ű�
function give_ticket_01()

local strTalk = {
	"Mai B�t Dung: Xin ch�o <sex>, ta �o�n ng��i c�ng bi�t chuy�n C? D��ng Th? b? Phi th��ng ��o nh�n l�i d�ng. Tr��c ��y khi n? b? thu ph�c �em l�n C�n Lu�n, S? huynh ni�m t�nh con th? n�y b? ng��i kh�c l�i d�ng n�n cho ph�p ta c�u n? �� thay ��i d��c l�c c�a H�a luy�n kim �an trong ng��i n?.",
	"Ng��i ch�i: Th? ra C? D��ng Th? sau khi b? thu ph�c �� ���c �em l�n C�n Lu�n, C�n Lu�n ph�i v�n l? ��o gia luy�n �an, d��c l�c trong ng��i C? D��ng Th? c? th? h�a gi�i?",
	"Mai B�t Dung: Ta �� chuy�n ��i b? ph�n c�a C? D��ng th? th�nh kim ��n nh�ng l�i ph�t hi�n n? b? cho �n Kim ��n l�u r�i, �� nh�p v�o m�u huy�t. C�n L�n s�n ti�n kh? m�nh nh�t, C? D��ng Th? ? ��y �� h�p th? tinh kh? c�a tr�i ��t s? kh�ng b? nhi�m t? kh?, nh? v�y c? th? gi�p n? h�a gi�i d��c l�c. Ch�ng ng? tr�i ch�ng chi�u l�ng ng��i, C? D��ng Th? sau khi l�c v�o {T�a Y�u Th�p} h�u s�n C�n Lu�n, C? D��ng Th? b�ng nhi�n tr? n�n hung �c.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Ng��i ch�i: ?? C? D��ng Th? d�m ��n g�y r�i, l? n�o C�n Lu�n kh�ng mu�n g�p n�n?",
	"Mai B�t Dung: L�c �� c�c �� t? ��u ngh? nh? th?, cho d? c? th? t�i thu ph�c C? D��ng Th?, ch? s? t�n th��ng nghi�m tr�ng, ta nghi�n c�u qua H�a luy�n kim �an c�a Phi th��ng ��o nh�n, n? ���c ch? t? {m�u huy�t ma},  khi ph�t t�c n�u kh�ng c? m�u t��i �p ch?, to�n th�n nh? b? l�a thi�u. Nh�ng �� t? C�n L�n khi mu�n ra tay kh�c ch? th? C? D��ng Th? v�ng d�y tr�n tho�t c�ng kh�ng l�m b? th��ng m�t ai.",
	"Ng��i ch�i: Th? ra c�n x�y ra nhi�u chuy�n nh? v�y, xem ra C? D��ng Th? qu? nhi�n l? linh th?, v�y n? �� ch�y �i ��u m�t r�i? C? ph�i c�n t�i h? {thu ph�c l�n n�a}?",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Mai B�t Dung: Ta lu�n cho r�ng v�n v�t tr�n ��i n�y ��u c? linh t�nh, n�n c�m th�y C? D��ng Th? l? v? bi�t �n C�n Lu�n cho n�n r�ng ch�u �au kh? m? tr�n tho�t, ta �o�n n? �� v? C? D��ng ��ng r�i. M�c d? s? huynh th��ng tr�ch ta kh�ng bi�t ph�n bi�t ch�nh t?, c? l�c c�n c�u c? y�u ma, nh�ng sinh linh ��u b�nh ��ng, ng��i h�c ��o sao l�i c? th? th�y ch�t m? kh�ng c�u? Cho n�n ta �� ch? {B�ch Di�u Thanh T�m ��n}, ph�t cho nh�n s? v? l�m. N�u <sex> c? duy�n nh�n ���c, hy v�ng c? th? �em thu�c n�y ��n C? D��ng ��ng m�t chuy�n, cho C? D��ng th? u�ng �� gi�p n? h�a gi�i d��c l�c trong ng��i, �em thu�c n�y giao cho �� t? C�n L�n ? trong ��ng c? th? �i C? D��ng m�t ��ng. N�u <sex> nh�n r�i sau n�y khi t�m ���c thu�c n�y c? th? �em ti�p cho n? u�ng, u�ng l�u ng�y nh�t ��nh c? th? h�a gi�i d��c l�c trong ng��i n?.",
	"Ng��i ch�i: Th��ng �� c? ��c hi�u sinh, c? n��ng c? ti�ng nh�n t? khi�n ng��i c�m k�ch, t�i h? s? ho�n th�nh t�m nguy�n c�a c? n��ng.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1031,1,1);--�õ��������ĵ�
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),1,1));
	
end