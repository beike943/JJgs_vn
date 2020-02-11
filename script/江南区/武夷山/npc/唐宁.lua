--ÔÚÑïÖÝÈÎÎñÌÆÄþ
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖÝ\\task_main.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖÝ\\task_two_main.lua");

function main()
    local nStep = GetTask(TASK_FIVE);
    if nStep == 27 then
        task_27_00();
        return
    elseif nStep == 28 then
        Talk(1,"","<color=green>§­êng Ninh<color>: H·y quay vÒ nh¾n víi <color=yellow>H¹ HÇu CÇm<color> yªn t©m, ®å ta ®· nhËn ®­îc råi!");
        return
    end;
    
    nStep = GetTask(TASK_YZ_TWO);
    if nStep == 5 then
        two_05_00();
        return
    elseif nStep == 6 then
        local szTalk = {
            "Ta ®· nãi hÕt chuyÖn ta biÕt cho ng­¬i. ChuyÖn cña {H¹ HÇu CÇm} h·y ®Ých th©n ®Õn hái!",
            "H¹ c« n­¬ng ®· kÓ hÕt cho ta biÕt. Rêi khái Xi Háa gi¸o, kh«ng sî hä lµm h¹i c« n­¬ng sao?",
            "Ta ®­êng ®­êng mang hä §­êng, chóng d¸m lµm g× ta!",
            "VËy ta yªn t©m! §­êng c« n­¬ng, xin b¶o träng!"
        };
        TalkEx("", szTalk);
        return
    end;

     Talk(1,"","<color=green>§­êng Ninh<color>: Cã chuyÖn g× kh«ng?");
end;