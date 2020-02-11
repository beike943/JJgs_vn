--file name:item_star.lua
--author:yanjun
--create date:2007-9-25
--describe:07年兔小丫天涯海角种许愿星
MAP_ID = 117;

function OnUse()
	local nMapID = GetWorldPos()
	if nMapID ~= MAP_ID then
		Talk(1,"","你只有在天涯海角才能点亮许愿星！");
		return 0;
	end;
	AskClientForString("create_star","",1,14,"请输入星星的名字：");
end;

function create_star(sName)
	local nMapID = GetWorldPos();
	if nMapID ~= MAP_ID then
		Talk(1,"","你只有在天涯海角才能点亮许愿星！");
		return 0;
	end;
	if DelItem(2,1,1171,1) == 1 then
		local nNpcIndex = CreateNpc("透明人",sName,GetWorldPos());
		Msg2Player("祝福你的心愿能够实现！");
		SetNpcLifeTime(nNpcIndex,1*60*60);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
	end;
end;