

--event ids see \script\misc\observer\observer_head.lua

--data maybe table/number
function example_event_handler_gs_start1(id,data)
end
function example_event_handler_gs_start2(id,data)
end

function ObserverImpt:vng_reg()
	if OBSERVER_DEGUG == 1 then
		print(format("ObserverImpt:vng_reg()"))
	end
	--self:register(OE_GameSvr_Startup, "vng_onstart1", example_event_handler_gs_start);
	--self:register(OE_GameSvr_Startup,	"vng_onstart2","\\script\\ks2vng\\misc\\observer\\observer_vng_reg.lua", "example_event_handler_gs_start2");
end
