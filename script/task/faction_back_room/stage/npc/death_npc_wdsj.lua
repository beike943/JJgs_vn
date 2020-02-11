--作者：严军
--创建日期：08年1月31日15:15
--NPC死亡脚本
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
	local nMaxNeiLi = GetMaxNeili();
	local nCurNeiLi = GetNeili();
	local nNeiLi = nCurNeiLi + floor(nMaxNeiLi*0.4)
	ModifyNeili(min(nNeiLi,nMaxNeiLi));
	Msg2Player("H錳 ph鬰 40% n閕 l鵦");
end;