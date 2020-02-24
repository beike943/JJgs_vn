Include("\\script\\lib\\globalfunctions.lua");

g_ItemName = "和谐中华包";
TSK_COUNTER = 1797;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("我要打开/#open(%d)",nItemIdx),
				"看看里面有什么/see_item",
				"暂时不打开/nothing",
				}
	Say("这是你第<color=yellow>"..nCurCount.."<color>次打开<color=yellow>"..g_ItemName.."<color>。请注意:打开2袋将获得1个军功章和1个武器银宝箱,打开8袋将获得1个大包7级鉴定符,打开10袋将获得1个御用白玉石,打开80袋将获得1个龙血丸,打开150袋将获得1个战神丸,打开200袋将获得奔宵或腾雾马随机1匹，您确认要打开<color=yellow>"..g_ItemName.."<color>吗？请确保你有17格背包空间和300的负重力。",getn(selTab),selTab);
end;

function see_item()
	Talk(1,"","每个"..g_ItemName.."可获得:磐龙璧1个, 50至100随机声望,20至30随机师门贡献度,杀手堂面具1个,3本生员证书,3本秀才证书,3本举人证书,军功章,1个武器银宝箱,1个大包7级鉴定符,御用白玉石,龙血丸,战神丸,奔宵或腾雾随机1匹，祝你好运！");
end;

function open(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--当前是第几次开启
	local szItemName = "";
	if gf_JudgeRoomWeight(17,300) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			nRetCode,nItemIdx = AddItem(2,1,1000,1);	--磐龙璧1个时限7天
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("你获得1个磐龙璧");
			ModifyReputation(random(50,100),0);	--50至100随机声望
			if GetPlayerRoute() ~= 0 then
				nRand = random(20,30);
				SetTask(336,GetTask(336)+nRand);	--20至30随机师门贡献度
				Msg2Player("你获得"..nRand.."点师门贡献度");
			end;
			nRetCode,nItemIdx = AddItem(2,1,1087,1);	--杀手堂面具1个	时限7天
			--SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("你获得1个杀手堂面具");
			nRand = random(1,100);
			if nRand <= 60 then
				AddItem(2,0,597,3);
				Msg2Player("你获得3本生员证书");			
			elseif nRand <= 90 then
				AddItem(2,0,598,3);
				Msg2Player("你获得3本秀才证书");			
			else
				AddItem(2,0,599,3);
				Msg2Player("你获得3本举人证书");			
			end;
			if mod(nCurCount,2) == 0 then	--军功章,武器银宝箱,时限7天
				nRetCode,nItemIdx = AddItem(2,1,9999,1);
				--SetItemExpireTime(nItemIdx,7*24*3600);
				Msg2Player("你获得1个军功章");
				nRetCode,nItemIdx = AddItem(2,1,1147,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				Msg2Player("你获得1个武器银宝箱");
			end;
			nRand = random(1,100);
			szItemName = "你获得1个大包7级鉴定符";
			if nRand <= 5 then
				nRetCode,nItemIdx = AddItem(2,1,1058,1);	--大包7级鉴定符	时限7天
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,8) == 0 then	
				nRetCode,nItemIdx = AddItem(2,1,1058,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			nRand = random(1,100);
			szItemName = "1个御用白玉石";
			if nRand <= 5 then
				nRetCode,nItemIdx = AddItem(2,1,1024,1);	--御用白玉石 时限7天
				--SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,10) == 0 then
				nRetCode,nItemIdx = AddItem(2,1,1024,1);	--御用白玉石 时限7天
				--SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			nRand = random(1,1000);
			szItemName = "1个龙血丸";
			if nRand <= 5 then 
				nRetCode,nItemIdx = AddItem(2,1,1002,1);	--龙血丸 时限7天
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,80) == 0 then
				nRetCode,nItemIdx = AddItem(2,1,1002,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;		
			nRand = random(1,1000);
			szItemName = "1个战神丸";
			if nRand <= 4 then 
				nRetCode,nItemIdx = AddItem(2,1,1005,1);	--战神丸 时限7天
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,150) == 0 then
				nRetCode,nItemIdx = AddItem(2,1,1005,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			nRand = random(1,1000);
			if nRand <= 2 then 		--奔宵或腾雾随机1匹
				if random(1,2) == 1 then
					szItemName = "一匹奔宵马";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				else
					szItemName = "一匹腾雾马";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				end;
			end;
			if mod(nCurCount,200) == 0 then
				if random(1,2) == 1 then
					szItemName = "一匹奔宵马";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				else
					szItemName = "一匹腾雾马";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				end;			
			end;
			WriteLog("["..g_ItemName.."]:"..GetName().."th?"..nCurCount.." m? "..g_ItemName);
		end;
	else
		Talk(1,"","你的背包空间或负重力不够，请先确认一下背包！"..g_ItemName.."!");
	end;
end;

function show_msg(szItemName)
	Msg2Player("你获得"..szItemName);
	Msg2Global(GetName().."打开'"..g_ItemName.."获得"..szItemName);
	WriteLog("["..g_ItemName.."]:"..GetName().."获得"..szItemName);	
end;

function nothing()

end;
