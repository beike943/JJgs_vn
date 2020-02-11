-- VNG Library
-- Created by TriHM
-- 06/2011

Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");

function vf_AddPetGrow(nPoint)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 1 then
		Talk(1,"","§¹i hiÖp ch­a cã B¹n §ång Hµnh, kh«ng thÓ t¨ng ®iÓm tr­ëng thµnh!")			
		return
     end
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (nPoint * 100))
	Msg2Player("B¹n nhËn ®­îc "..nPoint.." §iÓm N©ng CÊp B¹n §ång Hµnh")
end

function vf_AddPetSoul(nPoint)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 2 then
		Talk(1,"","§¹i hiÖp ch­a cã B¹n §ång Hµnh cÊp 2 trë lªn, kh«ng thÓ t¨ng ®iÓm linh lùc!")			
		return
     end
	Pet_AddGP(nPoint)
	Msg2Player("B¹n nhËn ®­îc "..nPoint.." §iÓm Linh Lùc B¹n §ång Hµnh")
end