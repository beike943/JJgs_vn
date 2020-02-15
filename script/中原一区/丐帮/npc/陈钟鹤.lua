Include("\\script\\task\\faction\\faction_main_gb.lua");

function main()

local nTaskValue = FN_GetTaskState(FN_GB);

	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_007();
		return
	
	else
		Say("<color=green>���Ӻ�<color>: M�c d? l? nh�ng k? xin �n, nh�ng l�i c? ni�m vui ti�u di�u t? t�i.",0)
	end

end;

function start()
	Talk(1,"start2","L�o Khi�u H�a c�ng ch�ng r? ngu�n g�c C�i Bang c? t? bao gi?. Ch? bi�t r�ng do thi�n tai nh�n h�a, cu�c s�ng qu? v�t v?, ��nh ph�i �i �n m�y. Tr�n ���ng kh�t th�c g�p mu�n v�n hi�m nguy, n�n c�c bang ch�ng �o�n k�t l�i ch�ng ch�i, t? �� c? C�i Bang. ��n nay, C�i Bang ta c�ng c? ch�t danh ti�ng trong giang h?!")
end;

function start2()
--  ÿ��������Եõ��Ľ���
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  ��ɽ�������õı��� Task(107) ����6��Bit����¼������������ÿ��Bit�ֱ��ʾ ����/ؤ��/�䵱/����/����/�ӵ�������
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 5) == 0) then
		SetTask(107, SetBit(GetTask(107), 5, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  ʮ������������ɺ����������������
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("<color=green>Tr�n Chung H�c<color>: M�c d? l? nh�ng k? xin �n, nh�ng l�i c? ni�m vui ti�u di�u t? t�i.",0)
end;

function zuzhi()
	Talk(1,"start2","C�c Khi�u H�a T? tuy ng�y th��ng hay s? x�a nh�ng t�n ti tr�t t? trong bang r�t nghi�m kh�c. C�i Bang do bang ch? th�ng l�nh, d��i tr��ng c? Ch�p Ph�p, H? C�n, Ch��ng B�t, Truy�n C�ng...t? ��i tr��ng l�o ch? tr? c�ng vi�c th��ng ng�y. D��i c�c tr��ng l�o c? c�c Thi�t �� ch? ? th�p ph��ng ph�n ��, ph? tr�ch thu th�p tin t�c h�ng ng�y v? truy�n tin �i c�c n�i. D��i tay c�c �� ch? l? c�c �� t? C�i Bang!")
end;

function tiaojian()
	Talk(3,"start2","Gia nh�p C�i Bang r�t ��n gi�n. Ch? c�n l? k? l��ng thi�n, ch�a gia nh�p m�n ph�i kh�c, kh�ng ph�i ph�n �� c�a b�n bang l? c? th? gia nh�p!","V�y ng��i gi�u c�ng c? th? gia nh�p C�i Bang sao?","Ng��i gi�u ch? c�n c? l�ng gi�p �� cho ��i, sao kh�ng gia nh�p ���c ch?? T�nh Y ph�i c�a b�n bang chuy�n thu nh�n nh�ng �� t? c? t�m l�ng b�c �i!")
end;

function rule()
	Talk(1,"start2","Khi�u H�a T? ch�ng c? ph�p t�c g?: Ch? c�n kh�ng l�m chuy�n �c, kh�ng k�t giao t? ma ngo�i ��o l? ���c!")
end;


function task()
	Talk(1,"start2","Sau khi nh�p m�n, c�c �� t? c? th? t�m bang ch? �� nh�n nhi�m v? s? m�n. N�u m�i ng�y ho�n th�nh li�n t�c 20 nhi�m v?, c? th? nh�n ���c th�i gian 2 gi? �i�m kinh nghi�m nh�n ��i!")
end;


function skill()
	Talk(1,"start2","Bang ch�ng chia th�nh hai h? T�nh Y v? ? Y. V? c�ng T�nh Y do H? C�n tr��ng l�o M? T�nh Sinh truy�n th?, ? Y do Tr? B�t tr��ng l�o T�ng Nguy�n An truy�n th?. C? th? h�y ��n hai v? tr��ng l�o t�m hi�u th�m!")
end;

function guanxi()
	Talk(1,"start2","�� t? b�n ph�i h�nh t�u giang h? n�n ch? ?, V? �ang, Nga My l? h�o bang c�a C�i Bang. Thi�u L�m, ���ng M�n, Th�y Y�n, C�n L�n, Thi�n Ba Ph? quan h? trung l�p v�i C�i Bang. C�i Bang c? th�m th? v�i Ng? ��c v? Minh Gi�o !")
end;

function no()
end;