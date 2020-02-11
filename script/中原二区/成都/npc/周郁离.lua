Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")

function main()
	
	--ªÓ∂Ø
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
		local nRet = WN_201403_Talk1()
		if nRet == 1 then
			return
		end
	end	
	
	--------------
	
	Talk(1,"","Sao m‰i ng≠Íi g«n Æ©y Æ“u l«n l≠Ót d‰n Æi h’t?");
end;