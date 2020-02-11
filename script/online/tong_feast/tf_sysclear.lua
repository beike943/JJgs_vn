Include("\\script\\online\\tong_feast\\tf_head.lua")

function main()
	local today = Date();
	DebugOutput("today:week() =", today:week());
	if today:week() ~= 0 then
		return 0;
	end
	local _s = SDB(TF_FEAST_CHEF, 0, 1);
	_s:delete();
	DebugOutput("***Reset Tong Join record!***");
end