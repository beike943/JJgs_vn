Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
tNpcWords = {
	"真是英雄出少年啊，文武双全，啧啧啧……",
	"今天天气真好啊！是个好兆头。",
	"真想到处走一走，老是站在同一个地方跳来跳去太累了。",
	"想做状元吗？快来考试吧！",
	"今天你考试了吗？",
	"小白兔，白又白，两只耳朵竖起来，蹦蹦跳跳真可爱～",
	"都给我老老实实考，不许作弊！",
	"萝卜真好吃，又能美容，真是个好东西！",
	"如果不幸遇到对话框消失，还是可以接着考的哦！",
	"每天都要背一大堆的证书出来发 ，累死我了……",
}

function OnTimer()
	SetMissionV(MV_TIMER_TIME,GetMissionV(MV_TIMER_TIME)+1) --计时器运行时间+1
	if mod(GetMissionV(MV_TIMER_TIME),30) == 0 then
		if random(2) > 1 then
			NpcChat(GetMissionV(10),tNpcWords[random(getn(tNpcWords))])
		end
	end
	if GetMissionV(MV_TIMER_TIME) == (TIMER_TOTAL_TIME - 15*60) then  --NPC消失15分钟前停止答题
		SetMissionV(MV_TIMER_IDEL,1)
		Msg2SubWorld("兔小丫还有15分钟就要更换考场啦，现在已经停止接受科考报名，请大家抓紧下次机会！")
	elseif GetMissionV(MV_TIMER_TIME) >= TIMER_TOTAL_TIME then
		WriteLog("[科考统计]这个小时内参加高经验考试的人数为"..GetMissionV(MV_COUNT_PAY).."人,消耗红萝卜总数为"..GetMissionV(MV_COUNT_LUOBO).."个!")
		CloseMission(MISSION_ID)
	else
		local idx = 0;
		for i = 1, 200 do
			idx, pidx = GetNextPlayer(MISSION_ID, idx, 1);
				if pidx > 0 then
					PlayerIndex = pidx;
					if GetTask(ABLUEMOON_STATE) == 1 then
						local RestTime = ABLUEMOON_TIME - (GetGameTime() - GetTask(ABLUEMOON_TIMER))
						if RestTime > 10 then
							if mod(RestTime,10) == 0 then
								Msg2Player("["..RestTime.."/60]--倒计时")
							end
						elseif RestTime > 0 then
							Msg2Player("["..RestTime.."/60]--倒计时")
						else
							Msg2Player("答题时间到！")
							SetTask(ABLUEMOON_STATE,3) --答题失败
						end
					end
				end;
			if idx == 0 then
				break;
			end;
		end
	end
end