Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")
function OnUse()
	local nEatNum = GetByte(GetTask(TASK_EAT_NIANGAO),3)
	local pk1,pk2 = GetPKFlag();
	if pk1 == 1 or pk1 == 2 then
		Talk(1,"","D¹ng thøc phi luyÖn c«ng kh«ng thÓ sö dông vËt phÈm nµy.");
		return
	end	
	if nEatNum >= 100 then
		Say("Ng­êi ch¬i tèi ®a chØ cã thÓ ¨n 100 c¸i b¸nh tæ.",0)
		return 0
	end
	if DelItem(2,1,269,1) == 1 then
		CastState("state_move_speed_percent_add",20,60*10*18,1,1)	--µ¥Î»ÎªÖ¡¡£18Ö¡1Ãë¡£²»ÄÜµþ¼Ó¡£
		Msg2Player("Tèc ®é di chuyÓn cña b¹n t¨ng 20% trong vßng 10 phót.")
		WriteLog("[Ho¹t ®éng mïa xu©n (¨n b¸nh tæ)]:"..GetName().."B¹n ®· ¨n 1 c¸i b¸nh tæ nh©n thËp cÈm.")
		SetTask(TASK_EAT_NIANGAO,SetByte(GetTask(TASK_EAT_NIANGAO),3,nEatNum+1))
	end
end
