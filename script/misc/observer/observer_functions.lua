Include("\\script\\ks2vng\\misc\\observer\\observer_vng_reg.lua")
Include("\\settings\\static_script\\misc\\observer\\observer_ksg_reg.lua")
function onGameStartup(id, data)
end

function onGameStartup2(id, data)
end

function ObserverImpt:Init()
--	self:register(OE_GameSvr_Startup, "onstart1", onGameStartup);
--	self:register(OE_GameSvr_Startup, "onstart2", "onGameStartup2");
--	self:register(OE_GameSvr_Startup, "onstart3", "\\script\\misc\\observer\\file2.lua", "onGameStartup3");
--	self:register(SYSEVENT_GAMESERVER_START,	"liangshan","\\script\\missions\\liangshan\\head.lua", "onGameStartup");
--	self:register(OE_GameSvr_Startup,	"onStart","\\script\\online\\2010\\callbackplayer\\main.lua", "onGameStartup");
--	self:register(OE_Cangjian_KillBoss, "npcDeath", 	"\\script\\online\\2010\\callbackplayer\\main.lua", "onBossDeath");
--	self:register(OE_NPC_DEATH,			"npcDeath",		"\\script\\online\\2010\\callbackplayer\\main.lua", "onBossDeath");
	
--	self:register(OE_Cangjian_KillBoss,	"suipian", "\\script\\西南区\\玉融峰\\npc\\npc_lihao.lua", "onEvent");
--	self:register(OE_TX_Pass_Mission,	"suipian", "\\script\\西南区\\玉融峰\\npc\\npc_lihao.lua", "onEvent");
--	self:register(OE_LIANGSHAN_KillBoss,	"suipian", "\\script\\西南区\\玉融峰\\npc\\npc_lihao.lua", "onEvent");
--	self:register(OE_TMZ_Get_Award,	"suipian", "\\script\\西南区\\玉融峰\\npc\\npc_lihao.lua", "onEvent");
--	self:register(OE_DIXUANGONG_Mission,	"suipian", "\\script\\西南区\\玉融峰\\npc\\npc_lihao.lua", "onEvent");
	
--	self:register(OE_GameSvr_Startup,	"8gua", "\\script\\gongsun.lua", "onGameStartup");
--	self:register(OE_Cangjian_KillBoss, "8gua", "\\script\\gongsun.lua", "onEvent");
--	self:register(OE_XIBEI_Pass_Mission, "8gua", "\\script\\gongsun.lua", "onEvent");
--	self:register(OE_TX_Pass_Mission, 	"8gua", "\\script\\gongsun.lua", "onEvent");
--	self:register(OE_TMZ_Victory, 		"8gua", "\\script\\gongsun.lua", "onEvent");
--	self:register(OE_LIANGSHAN_KillBoss, "8gua", "\\script\\gongsun.lua", "onEvent");
	
--	self:register(OE_LIANGSHAN_BOX, "catch_hare_2010", "\\script\\online\\2010\\catch_hare\\get_bottle.lua", "main")
--	self:register(OE_DIXUANGONG_BOX, "catch_hare_2010", "\\script\\online\\2010\\catch_hare\\get_bottle.lua", "main")
--	self:register(OE_TMZ_Get_Award, "catch_hare_2010", "\\script\\online\\2010\\catch_hare\\get_bottle.lua", "main")
	self:ksg_reg()
	self:vng_reg()
	self:show_regs()
end


ObserverImpt:Init()
