--File name:boss_npc.lua 
--Describe:三节连过，策划BOSS对话NPC脚本
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function main()
	local seltab = {
					"Ta mu鑞 i/get_award",
					"L祄 phi襫 r錳!/nothing",
					}
	local sNpcName = GetTargetNpcName();
	Say("<color=green>"..sNpcName.."<color>: ",getn(selTab),selTab);
end;

function get_award()
	
end;