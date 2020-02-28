--安全强化

function OnUse()
	Say("使用安全强化功能来实施武器强化,，强化失败不会降低级别。 <color=red> (11级及以上可进行安全强化) <color>",2,"开始/StartEnhance","不需要/do_nothing")
end

function StartEnhance()
	if GetFightState() ~= 0 then
		Talk(1,"","现在不能使用这个道具");
		return 0;
	end
	EnhanceItem(3);
	return 1;
end

function do_nothing()
	--do nothing
end
