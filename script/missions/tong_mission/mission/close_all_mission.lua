--create date:2007-08-06 15:30
--author:yanjun
--describe:systemtimetask.txtÅäÖÃ½Å±¾£¬ÓÃÀ´¹Ø±ÕËùÓĞµÄ¹Ø¿¨
Include("\\script\\missions\\tong_mission\\main_function.lua");
function main()
	local nWeekTime = tonumber(date("%w"));
	if nWeekTime == 0 then	--ĞÇÆÚÌì
		TM_CloseAllField();
		Msg2SubWorld("V­ît ¶i ®ang ë giai ®o¹n ®æi míi, tÊt c¶ cöa ¶i sÏ ®ãng. Xin mêi ng­êi ch¬i h·y ®îi mét chót råi míi tiÕp tôc v­ît ¶i.")
	end;
end;