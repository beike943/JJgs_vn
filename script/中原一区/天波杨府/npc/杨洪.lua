function main()
	if (GetSex()==2 and GetPlayerFaction() == 6) then
		Say("Ti�u c� n��ng, mu�n ra ngo�i kh�ng?",2,"L�m phi�n qu�n gia qu�/outyangmen","Ta ��n th�m l�o qu�n gia th�i m�!/no")
	elseif	(GetSex()==2 and GetPlayerFaction() ~= 6) then
		Say("Ti�u c� n��ng, mu�n ra ngo�i kh�ng?",2,"L�m phi�n qu�n gia qu�/outyangmen","Ta ��n th�m D��ng qu�n gia th�i m�!/no")
	elseif	(GetSex()~=2 and GetPlayerFaction() == 6) then
		Say("Ti�u huynh ��, c� mu�n ra ngo�i kh�ng?",2,"L�m phi�n qu�n gia qu�/outyangmen","Ta ��n th�m l�o qu�n gia th�i m�!/no")
	else
		Say("Ti�u huynh ��, c� mu�n ra ngo�i kh�ng?",2,"L�m phi�n qu�n gia qu�/outyangmen","Ta ��n th�m D��ng qu�n gia th�i m�!/no")
	end
end;


function outyangmen()
	if(GetPKValue() >3 ) then
		Msg2Player("Ng��i l�m vi�c �c c�m ra v�o th�n tr�n.")	
	else
    		SetFightState(0)
		i=random(1,4)
		if i==1 then
			NewWorld(200, 1501,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else   
			NewWorld(200, 1249,2732)
		end
	end
end;

