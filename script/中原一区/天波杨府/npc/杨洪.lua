function main()
	if (GetSex()==2 and GetPlayerFaction() == 6) then
		Say("С����, ��Ҫ��ȥ��?",2,"�ţ��鷳��ܼ���/outyangmen","���ã�������������ܼ�!/no")
	elseif	(GetSex()==2 and GetPlayerFaction() ~= 6) then
		Say("С����, ��Ҫ��ȥ��?",2,"�ţ��鷳��ܼ���/outyangmen","���ã�������������ܼ�!/no")
	elseif	(GetSex()~=2 and GetPlayerFaction() == 6) then
		Say("С�ֵ�, ��Ҫ��ȥ��?",2,"�ţ��鷳��ܼ���/outyangmen","���ã�������������ܼ�!/no")
	else
		Say("С�ֵ�, ��Ҫ��ȥ��?",2,"�ţ��鷳��ܼ���/outyangmen","���ã�������������ܼ�!/no")
	end
end;


function outyangmen()
	if(GetPKValue() >3 ) then
		Msg2Player("���˲��ó����첨�.")	
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

