--File name:mooncake_tool_item.lua 
--Describe:Èý½ÚÁ¬¹ý£¬ÖÆÔìÔÂ±ýµÄ¶«¶«
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\lib\\time.lua")

function OnUse()
	if tonumber(date("%y%m%d")) > 081007 then
		Talk(1,"","TÕt Trung Thu ®· qua, tiÕp tôc lµm b¸nh còng ch¼ng cßn ý nghÜa");
		return 0;
	end;
	local nTimeElapse = GetTime()-GetTask(TASK_FIREUP_TIME);
	local bTempChecked = GetTask(TASK_TEMPERATURE_CHECKED);
	if nTimeElapse >= COOKING_TIME and GetTask(TASK_FIREUP_TIME) ~= 0 then	--Ê±¼äµ½£¬¿ÉÒÔÈ¡ÔÂ±ýÁË
		local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
		if nCurTemp <= 0 then	--Èç¹ûÎÂ¶ÈµÍÓÚ0¶È
			local selTab = {
						"Më lß xem thö/open_stove",
						}
			Say("Löa trong lß cña b¹n ®· t¾t, ch¾c b¸nh Trung Thu còng ®· h­.",getn(selTab),selTab);
			return 0;
		end;
		local selTab = {
					"LÊy b¸nh Trung Thu ra/get_mooncake",
					"Thªm nhiªn liÖu/ask_fuel",
					"T¹m thêi kh«ng lÊy b¸nh ra/nothing",
					}
		Say("B¸nh Trung Thu cña b¹n ®· lµm xong. B¹n muèn lÊy chóng ra chø? Nghe nãi khi nhiÖt ®é lß lµ 180 ®é lµ cã thÓ lÊy b¸nh ra, nÕu b¹n kh«ng biÕt lµm sao khèng chÕ nhiÖt ®é, Kh¸nh §iÓn Sø Gi¶ cã b¸n mét sè nguyªn liÖu chÝnh, b¹n cã thÓ mua thö xem.",getn(selTab),selTab);
	elseif GetTask(TASK_FIREUP_TIME) == 0 then	--¿ªÊ¼ÖÆ×÷
		local selTab = {
					"Ta muèn thö xem!/ask_main_res",
					"Sau nµy sÏ thö!/nothing",
					}
		Say("B¹n muèn b¾t ®Çu lµm b¸nh Trung Thu? Chó ý: Thêi gian lß cã hiÖu lùc lµ <color=yellow>11/9 ®Õn 7/10<color>.",getn(selTab),selTab);	
	else	--ÖÆ×÷¹ý³ÌÖÐ
		local selTab = {
					"Ta muèn xem nhiÖt ®é lß/see_temperature",
					"Ta muèn thªm nhiªn liÖu/ask_fuel",
					"Ta muèn dïng lß nµy/give_up",
					"Kh«ng cã g×/nothing",
					}
		local sTimeStr = "";
		if bTempChecked == 1 or nTimeElapse > 3*60 then	--Èç¹û¿´¹ýÎÂ¶È»ò³¬¹ý3·ÖÖÓ
			tremove(selTab,1);
		else
			sTimeStr = "Chó ý: Sau <color=yellow>"..Get_Time_String(COOKING_TIME-GetTime()+GetTask(TASK_FIREUP_TIME)-120).."<color> sau kh«ng thÓ ®o nhiÖt ®é."
		end;
		Say("§Ó t©m míi cã thÓ lµm ra b¸nh Trung Thu h¶o h¹ng. Sau <color=yellow>"..Get_Time_String(COOKING_TIME-GetTime()+GetTask(TASK_FIREUP_TIME)).."<color> míi cã thÓ lÊy b¸nh ra."..sTimeStr,getn(selTab),selTab);
	end;
end;

function ask_main_res()	--Ñ¯ÎÊ¼ÓÈëÊ²Ã´Ö÷ÁÏ
	local selTab = {
				"Ng.liÖu chÝnh1/#ask_sub_res(1)",
				"Ng.liÖu chÝnh2/#ask_sub_res(2)",
				"Ng.liÖu chÝnh3/#ask_sub_res(3)",
				"T¹m thêi ch­a cÇn!/cancel",
				}
	Say("B¹n muèn thªm nguyªn liÖu nµo vµo?",getn(selTab),selTab);
end;

function ask_sub_res(nMainResType)	--Ñ¯ÎÊ¼ÓÈëÊ²Ã´¸¨ÁÏ
	if nMainResType ~= 0 then
		if GetItemCount(tMaterial[nMainResType][2],tMaterial[nMainResType][3],tMaterial[nMainResType][4]) == 0  then
			Talk(1,"ask_main_res","B¹n kh«ng cã nguyªn liÖu nµy!");
			return 0;
		end;
	end;
	SetTaskTemp(TT_MAIN_RES,nMainResType)
	local selTab = {
				"Phô liÖu1/#ask_fire_seed(1)",
				"Phô liÖu2/#ask_fire_seed(2)",
				"Phô liÖu3/#ask_fire_seed(3)",
				"T¹m thêi ch­a cÇn!/cancel",
				}
	Say("B¹n muèn cho phô liÖu nµo vµo?",getn(selTab),selTab);
end;

function ask_fire_seed(nSubResType)	--Ñ¯ÎÊ¼ÓÈëÊ²Ã´È¼ÁÏ
	if nSubResType ~= 0 then
		if GetItemCount(tMaterial[nSubResType+3][2],tMaterial[nSubResType+3][3],tMaterial[nSubResType+3][4]) == 0 then
			Talk(1,"#ask_sub_res("..GetTaskTemp(TT_MAIN_RES)..")","B¹n kh«ng cã lo¹i phô liÖu nµy!");
			return 0;
		end;
	end;
	SetTaskTemp(TT_SUB_RES,nSubResType)
	local selTab = {
				"Sö dông than ®Ó t¨ng nhiÖt ®é/#final_confirm(1)",
				"Dïng cñi ®Ó t¨ng nhiÖt ®é/#final_confirm(2)",
				"T¹m thêi ch­a cÇn!/cancel",
				}
	Say("B¹n muèn dïng lo¹i nhiªn liÖu nµo ®Ó t¨ng nhiÖt ®é lß?",getn(selTab),selTab);
end;

function final_confirm(nFireSeedType)
	if GetItemCount(tMaterial[nFireSeedType+6][2],tMaterial[nFireSeedType+6][3],tMaterial[nFireSeedType+6][4]) == 0 then
		Talk(1,"#ask_fire_seed("..GetTaskTemp(TT_SUB_RES)..")","B¹n kh«ng cã lo¹i nhiªn liÖu nµy");
		return 0;
	end;
	local selTab = {
				"§ång ý/begin_to_make",
				"Ta suy nghÜ l¹i!/cancel",
				}
	SetTaskTemp(TT_FIRE_SEED,nFireSeedType)
	local sContent = "";
	local nMainRes = GetTaskTemp(TT_MAIN_RES);
	local nSubRes = GetTaskTemp(TT_SUB_RES);
	local nFireSeed = nFireSeedType;
	sContent = sContent.."B¹n ®· cho <color=yellow>"..tMaterial[nMainRes][1].."<color> vµ <color=yellow>"..tMaterial[nSubRes+3][1].."<color> vµo,";
	sContent = sContent.."sö dông <color=yellow>"..tMaterial[nFireSeed+6][1].."<color> ®Ó t¨ng nhiÖt ®é lß.";
	Say(sContent.."B¹n muèn dïng sè nguyªn liÖu nµy ®Ó lµm b¸nh Trung Thu?",getn(selTab),selTab);
end;

function begin_to_make()
	local nRandTemp = 0;
	local nCurTemp = 0;
	local nMainRes = GetTaskTemp(TT_MAIN_RES);
	local nSubRes = GetTaskTemp(TT_SUB_RES);
	local nFireSeed = GetTaskTemp(TT_FIRE_SEED);
	if DelItem(tMaterial[nMainRes][2],tMaterial[nMainRes][3],tMaterial[nMainRes][4],1) == 1 and DelItem(tMaterial[nSubRes+3][2],tMaterial[nSubRes+3][3],tMaterial[nSubRes+3][4],1) == 1 and DelItem(tMaterial[nFireSeed+6][2],tMaterial[nFireSeed+6][3],tMaterial[nFireSeed+6][4],1) == 1 then
		if GetTaskTemp(TT_FIRE_SEED) == 1 then
			--nRandTemp = random(550,650);
			nRandTemp = 600;
		elseif GetTaskTemp(TT_FIRE_SEED) == 2 then
			--nRandTemp = random(250,350);
			nRandTemp = 300;
		end;
		SetTask(TASK_MAIN_RES,nMainRes);
		SetTask(TASK_SUB_RES,nSubRes);
		SetTask(TASK_FIREUP_TIME,GetTime());
		SetTask(TASK_ADD_FUEL_TIME,GetTime());
		SetTask(TASK_TEMPERATURE,nRandTemp);
		Talk(1,"","B¹n ®· nhãm löa lß thµnh c«ng, khi thªm nhiªn liÖu chó ý <color=yellow>nhiÖt ®é cña lß<color>, ®õng ®Ó löa t¾t hoÆc b¸nh ch¸y khÐt.");
	end;
end;

function cancel()
	SetTaskTemp(TT_MAIN_RES,0);
	SetTaskTemp(TT_SUB_RES,0);
	SetTaskTemp(TT_FIRE_SEED,0);
end;

function give_up()
	local selTab = {
				"§ång ý/confirm_give_up",
				"§Ó ta suy nghÜ!/OnUse",
				}
	Say("B¹n kh«ng muèn dïng lß nµy?",getn(selTab),selTab);
end;

function confirm_give_up()
	SetTask(TASK_MAIN_RES,0);
	SetTask(TASK_SUB_RES,0);
	SetTask(TASK_FIREUP_TIME,0);
	SetTask(TASK_ADD_FUEL_TIME,0);
	SetTask(TASK_TEMPERATURE,0);
	SetTask(TASK_TEMPERATURE_CHECKED,0);
	Say("B¹n cã thÓ b¾t ®Çu lµm b¸nh l¹i!",0);
end;

function ask_fuel()
	local selTab = {
				"Ta muèn thªm than/#add_fuel(1)",
				"Ta muèn thªm cñi/#add_fuel(2)",
				"Kh«ng cÇn ®©u!/cancel",
				}
	Say("B¹n muèn thªm lo¹i nhiªn liÖu nµo?",getn(selTab),selTab);
end;

function add_fuel(nFuelType)
	if GetItemCount(tMaterial[nFuelType+6][2],tMaterial[nFuelType+6][3],tMaterial[nFuelType+6][4]) == 0 then
		Talk(1,"OnUse","B¹n kh«ng cã lo¹i nhiªn liÖu nµy");
		return 0;
	end;
	if DelItem(tMaterial[nFuelType+6][2],tMaterial[nFuelType+6][3],tMaterial[nFuelType+6][4],1) == 1 then
		local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
		local nRandTemp = 0;
		if nFuelType == 1 then
			--nRandTemp = random(550,650);
			nRandTemp = 600;
		else
			--nRandTemp = random(250,350);
			nRandTemp = 300;
		end;
		local nTotalTemp = nCurTemp+nRandTemp;
		if nTotalTemp > 900 then
			SetTask(TASK_MAIN_RES,0);
			SetTask(TASK_SUB_RES,0);
			SetTask(TASK_FIREUP_TIME,0);
			SetTask(TASK_ADD_FUEL_TIME,0);
			SetTask(TASK_TEMPERATURE,0);
			SetTask(TASK_TEMPERATURE_CHECKED,0);
			AddItem(tMoonCake[19][2],tMoonCake[19][1],tMoonCake[19][4],1);
			Say("NhiÖt ®é lß cao h¬n 900 ®é, b¸nh Trung Thu ®· bÞ ch¸y hÕt. B¹n nhËn ®­îc 1 <color=yellow>"..tMoonCake[19][1].."<color>",0);
			return 0;
		end;
		SetTask(TASK_TEMPERATURE,nTotalTemp);
		SetTask(TASK_ADD_FUEL_TIME,GetTime());
		Say("B¹n ®· thªm mét Ýt nhiªn liÖu vµo, nhiÖt ®é lß t¨ng lªn <color=yellow>"..nRandTemp.."<color> ®é",0);
	end;
end;

function see_temperature()	--²é¿´ÎÂ¶È
	local selTab = {
				"§ång ý/confirm_see_temperature",
				"Ch­a cÇn xem véi!/OnUse",
				}
	Say("Trong qu¸ tr×nh lµm b¸nh chØ cã thÓ xem nhiÖt ®é 1 lÇn, b¹n muèn xem chø?",getn(selTab),selTab);
end;

function confirm_see_temperature()
	local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
	SetTask(TASK_TEMPERATURE_CHECKED,1);
	Talk(1,"OnUse","NhiÖt ®é cña lß lµ: <color=yellow>"..nCurTemp.."<color> ®é");
end;

function get_mooncake()
	local nCurTemp = get_temperature(GetTask(TASK_TEMPERATURE),GetTime()-GetTask(TASK_ADD_FUEL_TIME));
	local nMaterial1 = GetTask(TASK_MAIN_RES);
	local nMaterial2 = GetTask(TASK_SUB_RES);
	SetTask(TASK_MAIN_RES,0);
	SetTask(TASK_SUB_RES,0);
	SetTask(TASK_FIREUP_TIME,0);
	SetTask(TASK_ADD_FUEL_TIME,0);
	SetTask(TASK_TEMPERATURE,0);
	SetTask(TASK_TEMPERATURE_CHECKED,0);
	Give_MoonCake(nMaterial1,nMaterial2,nCurTemp);
end;

function get_temperature(nInitTemp,nElapseTime)	--¸ù¾Ý³õÊ¼ÎÂ¶ÈºÍ¾­¹ýÊ±¼äµÃµ½Ä¿Ç°µÄÎÂ¶È
	local nTemp = 0;
	local nTime1 = sqrt((40000000+3)/nInitTemp);
	local nTime2 = nElapseTime + nTime1;
	nTemp = 40000000/(nTime2)^2 - 3;
	if nTemp < 0 then
		nTemp = 0;
	end; 
	return floor(nTemp)
end;

function open_stove()	--ÎÂ¶È½µµ½0¶Èºó´ò¿ªÂ¯×Ó
	if random(1,100) < 50 then
		AddItem(tMoonCake[11][2],tMoonCake[11][3],tMoonCake[11][4],1);
		Say("B¹n nhËn ®­îc 1 <color=yellow>"..tMoonCake[11][1].."<color>, kh«ng biÕt mïi vÞ thÕ nµo?",0);
	else
		Say("B¹n kiÓm tra s¬ qua b¸nh Trung Thu trong lß råi kÕt luËn: B¸nh Trung Thu nµy kh«ng thÓ ¨n ®­îc råi!",0);
	end;
	SetTask(TASK_MAIN_RES,0);
	SetTask(TASK_SUB_RES,0);
	SetTask(TASK_FIREUP_TIME,0);
	SetTask(TASK_ADD_FUEL_TIME,0);
	SetTask(TASK_TEMPERATURE,0);
	SetTask(TASK_TEMPERATURE_CHECKED,0);
end;