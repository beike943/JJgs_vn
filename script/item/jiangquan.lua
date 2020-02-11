--奖券:使用有几率获得100、500、1000、2000、5000、8000、1W、2W、5W、50W经验值。

function OnUse()

local nNum = random(1,286505);

	local bIsExist = 0;
	bIsExist = DelItem(2,0,225,1,1);
	if bIsExist ~= 1 then
		return
	end

	if nNum <= 5 then
		ModifyExp(500000);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>500000<color> 甶觤 kinh nghi謒!");
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 500000 甶觤 kinh nghi謒!");
		--AddGlobalCountNews("恭喜玩家"..GetName().."通过抽取奖券获得500000经验值！",3);
	end;
	
	if nNum > 5 and nNum <= 505 then
		ModifyExp(50000);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>50000<color> 甶觤 kinh nghi謒!");
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 50000 甶觤 kinh nghi謒!");	
	end;
	
	if nNum > 505 and nNum <= 2505 then
		ModifyExp(20000);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>20000<color> 甶觤 kinh nghi謒!");	
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 20000 甶觤 kinh nghi謒!");
	end;
	
	if nNum > 2505 and nNum <= 8505 then
		ModifyExp(10000);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>10000<color> 甶觤 kinh nghi謒!");
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 10000 甶觤 kinh nghi謒!");
	end;
	
	if nNum > 8505 and nNum <= 16505 then
		ModifyExp(8000);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>8000<color> 甶觤 kinh nghi謒!");
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 8000 甶觤 kinh nghi謒!");
	end;
	
	if nNum > 16505 and nNum <= 26505 then
		ModifyExp(5000);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>5000<color> 甶觤 kinh nghi謒!");
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 5000 甶觤 kinh nghi謒!");
	end;
	
	if nNum > 26505 and nNum <= 46505 then
		ModifyExp(2000);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>2000<color> 甶觤 kinh nghi謒!");
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 2000 甶觤 kinh nghi謒!");
	end;
	
	if nNum > 46505 and nNum <= 96505 then
		ModifyExp(1000);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>1000<color> 甶觤 kinh nghi謒!");
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 1000 甶觤 kinh nghi謒!");
	end;
	
	if nNum > 96505 and nNum <= 186505 then
		ModifyExp(500);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>500<color> 甶觤 kinh nghi謒!");
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 500 甶觤 kinh nghi謒!");
		--AddGlobalCountNews("恭喜玩家"..GetName().."通过抽取奖券获得500经验值！",3);
	end;
	
	if nNum > 186505 then
		ModifyExp(100);
		Talk(1,"","Ch骳 m鮪g b筺 t╪g th猰 <color=yellow>100<color> 甶觤 kinh nghi謒!");
		Msg2Player("Ch骳 m鮪g b筺 t╪g th猰 100 甶觤 kinh nghi謒!");
		--AddGlobalCountNews("恭喜玩家"..GetName().."通过抽取奖券获得100经验值！",3);
	end;

end;
