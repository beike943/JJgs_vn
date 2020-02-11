Include("\\script\\½á»é\\marriage_head.lua");
function OnEquip(item)
	if in_fields() == 1 then
		LearnSkill(SKILL_CANDY)
		Msg2Player("Sau khi mÆc ¸o chñ h«n, dïng chuét ph¶i ph©n ph¸t kÑo mõng cho quan kh¸ch")
	end;
	return 0
end

function OnUnEquip(item)
	if HaveLearnedSkill(SKILL_CANDY) == 1 then
		RemoveSkill(SKILL_CANDY)
	end;
	return 0;
end

function OnUse()
	return 0;
end

function CanEquip()
	return 0;
end
