Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")

function EnterMap()
	do
		return
	end
	if is_first_tong_jpz_open() == 0 then
		return
	end
	create_map_trigger();
	if check_time() == 1 and check_place() == 1 then
		SetDeathPunish(0);
		Msg2Player("Tõ 17: 00 ®Õn 19: 00 lµ thêi gian ho¹t ®éng bang héi tinh anh v× vËy ë b¶n ®å Long TuyÒn Th«n sÏ bá trõng ph¹t ®å s¸t.");
	end;
end;

function LeaveMap()
	SetDeathPunish(1);
	if is_first_tong_jpz_open() == 0 then
		return
	end
	create_map_trigger();
end;
