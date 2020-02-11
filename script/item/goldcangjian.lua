function OnUse()
	DelItem(2,1,204,1)
	if GetLevel()< 50 then 
		i =random(1,10)
		if i==1 then 
			AddItem(0,0,11,1,1,3,86,5,98,3,64)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,0,11,1,1,3,86,5,98,3,64)")
		elseif i==2 then
			AddItem(0,2,24,1,1,3,86,5,98,3,64)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,2,24,1,1,3,86,5,98,3,64)")
		elseif i==3 then
			AddItem(0,0,11,1,1,3,85,5,95,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,0,11,1,1,3,85,5,95,3,63)")
		elseif i==4 then
			AddItem(0,1,50,1,1,3,85,5,96,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,1,50,1,1,3,85,5,96,3,63)")
		elseif i==5 then
			AddItem(0,9,83,1,1,3,85,5,97,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,9,83,1,1,3,85,5,97,3,63)")
		elseif i==6 then
			AddItem(0,2,24,1,1,6,42,5,98,2,99)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,2,24,1,1,6,42,5,98,2,99)")
		elseif i==7 then
			AddItem(0,10,72,1,1,3,86,5,98,3,64)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,10,72,1,1,3,86,5,98,3,64)")
		elseif i==8 then
			AddItem(0,8,94,1,1,3,86,5,98,3,64)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,8,94,1,1,3,86,5,98,3,64)")
		elseif i==9 then
			AddItem(0,5,37,1,1,3,85,5,95,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,5,37,1,1,3,85,5,95,3,63)")
		else
			AddItem(0,3,61,1,1,3,85,5,95,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,3,61,1,1,3,85,5,95,3,63)")
		end
	elseif GetLevel()< 70 then
		a =random(1,10)
		if a==1 then 
			AddItem(0,0,11,1,1,3,86,5,98,3,64)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,0,11,1,1,3,86,5,98,3,64)")
		elseif a==2 then
			AddItem(0,2,24,1,1,3,86,5,98,3,64)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,2,24,1,1,3,86,5,98,3,64)")
		elseif a==3 then
			AddItem(0,0,11,1,1,3,85,5,95,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,0,11,1,1,3,85,5,95,3,63)")
		elseif a==4 then
			AddItem(0,1,50,1,1,3,85,5,96,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,1,50,1,1,3,85,5,96,3,63)")
		elseif a==5 then
			AddItem(0,9,83,1,1,3,85,5,97,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,9,83,1,1,3,85,5,97,3,63)")
		elseif a==6 then
			AddItem(0,2,24,1,1,6,42,5,98,2,99)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,2,24,1,1,6,42,5,98,2,99)")
		elseif a==7 then
			AddItem(0,10,72,1,1,3,86,5,98,3,64)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,10,72,1,1,3,86,5,98,3,64)")
		elseif a==8 then
			AddItem(0,8,94,1,1,3,86,5,98,3,64)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,8,94,1,1,3,86,5,98,3,64)")
		elseif a==9 then
			AddItem(0,5,37,1,1,3,85,5,95,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,5,37,1,1,3,85,5,95,3,63)")
		else
			AddItem(0,3,61,1,1,3,85,5,95,3,63)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,3,61,1,1,3,85,5,95,3,63)")
		end
	else
		b=random(1,18)
		if b==1 then 
			AddItem(0,102,20,1,1,7,46,7,82,7,100)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,20,1,1,7,46,7,82,7,100)")
		elseif b==2 then
			AddItem(0,102,15,1,1,7,46,7,82,7,100)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,15,1,1,7,46,7,82,7,100)")
		elseif b==3 then
			AddItem(0,102,5,1,1,7,2,0,0,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,5,1,1,7,2,0,0,0,0)")
		elseif b==4 then
			AddItem(0,102,10,1,1,7,2,0,0,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,10,1,1,7,2,0,0,0,0)")
		elseif b==5 then
			AddItem(0,102,15,1,1,2,24,3,14,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,15,1,1,2,24,3,14,0,0)")
		elseif b==6 then
			AddItem(0,102,20,1,1,2,24,3,14,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,20,1,1,2,24,3,14,0,0)")
		elseif b==7 then
			AddItem(0,102,15,1,1,5,95,5,94,5,96)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,15,1,1,5,95,5,94,5,96)")
		elseif b==8 then
			AddItem(0,102,20,1,1,5,95,5,94,5,96)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,20,1,1,5,95,5,94,5,96)")
		elseif b==9 then
			AddItem(0,102,15,1,1,5,98,5,94,5,97)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,15,1,1,5,98,5,94,5,97)")
		elseif b==10 then
			AddItem(0,102,20,1,1,5,98,5,94,5,97)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,20,1,1,5,98,5,94,5,97)")
		elseif b==11 then
			AddItem(0,102,15,1,1,5,97,5,96,5,94)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,15,1,1,5,97,5,96,5,94)")
		elseif b==12 then
			AddItem(0,102,20,1,1,5,97,5,96,5,94)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,20,1,1,5,97,5,96,5,94)")
		elseif b==13 then
			AddItem(0,102,15,1,1,2,109,0,0,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,15,1,1,2,109,0,0,0,0)")
		elseif b==14 then
			AddItem(0,102,20,1,1,2,109,0,0,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,20,1,1,2,109,0,0,0,0)")
		elseif b==15 then
			AddItem(0,102,15,1,1,5,49,0,0,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,15,1,1,5,49,0,0,0,0)")
		elseif b==16 then
			AddItem(0,102,20,1,1,5,49,0,0,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,20,1,1,5,49,0,0,0,0)")
		elseif b==17 then
			AddItem(0,102,15,1,1,2,99,0,0,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,15,1,1,2,99,0,0,0,0)")
		else
			AddItem(0,102,20,1,1,2,99,0,0,0,0)
			WriteLog("#goldbag:"..GetName()..";AddItem(0,102,20,1,1,2,99,0,0,0,0)")
		end
	end
end
	
