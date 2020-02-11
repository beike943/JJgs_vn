--±¦ÏäD½Å±¾
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function main()
	if LSB_Check_LR() == 0 then
			return 0;
	end
	--ËùÊôÅĞ¶Ï
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex ~= GetTaskTemp(Mid_Boss_Index) then
		return 0;
	end
	--±³°ü¿Õ¼äÅĞ¶Ï
	if gf_Judge_Room_Weight(2,2) ~= 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
    return 0;
	end
	--¸ø½±ÀøB
	LSB_Get_Award_B();
	SetNpcLifeTime(nNpcIndex,0);
	SetTaskTemp(Mid_Boss_Index,0);
end