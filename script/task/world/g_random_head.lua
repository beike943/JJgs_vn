--random的接口函数
--created by lizhi
--2005-9-28 18:44

--说明
--两个参数决定的概率是 n/MAX_MOD * 100%
--如果在这个几率里面返回1，否则返回nil

RAN_SEED = tonumber(date("%M%S"))

function g_probability(n, MAX_MOD)
    if GetGlbValue(300) == 0 then
        randomseed(GetGameLoop() + RAN_SEED);
        SetGlbValue(300, 1);
    end;
    rand = mod(random(1, 28564198), MAX_MOD);
    if rand <= n then
        --Msg2Player(rand);
        return 1;
    else
        return nil;
    end;
end;