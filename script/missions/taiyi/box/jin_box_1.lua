--½ð±¦Ïä
Include("\\script\\missions\\taiyi\\mission.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function main()
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");	
	local tRequire = {};
	for i = 1, 8 do
		tinsert(tRequire, {TYT_IB_ITEM[2],TYT_IB_ITEM[3],TYT_IB_ITEM[4], 1});
	end
	MA_Mission_OpenUI(this.missionID, 0, "\\script\\missions\\taiyi\\box\\jin_box_1.lua", "TY_RollCardCallBack", tRequire);
	gf_TeamOperateEX(vaf_award_api, "tTYTJinBox")
end