--脚本名称：黄帝重造图纸使用脚本
--脚本功能：给玩家显示重铸需要的材料
--策划人：小天天
--代码开发人：村长
--代码开发时间：2007-07-02
Tb_refound_mertiral = {
	{2,1,504,4,"女娲精石"},
	{2,0,555,2,"乾坤符"},
	{2,1,503,5,"无痕水"},
	{2,1,1009,200,"陨铁精石"},
}
function OnUse()
	local mertiral_need_dia = "<color=green>黄帝重铸图纸<color>:据我所知<color=red>重铸黄帝套装<color>需要以下材料"
	for i = 1, getn(Tb_refound_mertiral) do
		local num_color = "<color=red>"
		local mertiral_num = GetItemCount(Tb_refound_mertiral[i][1],Tb_refound_mertiral[i][2],Tb_refound_mertiral[i][3])
		if mertiral_num >= Tb_refound_mertiral[i][4] then
			num_color = "<color=green>"
		end
		mertiral_need_dia = mertiral_need_dia .."\n    <color=yellow>"..Tb_refound_mertiral[i][5]..Tb_refound_mertiral[i][4].."<color>,您当前已有"..num_color..mertiral_num.."<color>;"
	end
	Talk(1,"",mertiral_need_dia)
end
