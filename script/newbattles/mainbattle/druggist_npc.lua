--filename:druggist_npc.lua
--create date:2006-12-19
--describe:Ö÷Õ½³¡ÖĞÕ½³¡Ò©Æ·¾üĞè¹Ù½Å±¾
Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
g_NpcName = "Qu©n nhu quan";
function main()
	local nNpcIndex = GetTargetNpc();
	local selTab = {
				"NhËn miÔn phİ d­îc phÈm chiÕn tr­êng/get_free_medicine",
				"§æi ®iÓm tİch lòy lÊy d­îc phÈm chiÕn tr­êng/buy_medicine",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	local nPlayerCamp = BT_GetCamp();
	local nResourceCamp = GetGlbValue(GLB_RESOURCE);
	local szSaySth = "";
	if nPlayerCamp ~= nResourceCamp then
		tremove(selTab,1);	--Ê§°Ü·½²»ÄÜÁìÈ¡Ãâ·ÑÒ©
		tremove(selTab,1);	--Ê§°Ü·½²»ÄÜÓÃ»ı·Ö»»×¨ÓÃÒ©
		if random(1,100) == 1 then
			NpcChat(nNpcIndex,"HiÖn ch­a cã d­îc phÈm, xin quay l¹i sau!");
		end;
		szSaySth = "HiÖn ch­a cã d­îc phÈm, xin quay l¹i sau!";
	else
		if random(1,100) == 1 then
			NpcChat(nNpcIndex,"Muèn mua d­îc phÈm cø ®Õn chç ta xem thö.");
		end;
		szSaySth = "Chç ta cung cÊp mét sè thuèc miÔn phİ, mêi xem qua!";
	end;
	Say("<color=green>"..g_NpcName.."<color>: "..szSaySth,getn(selTab),selTab);
end;

function get_free_medicine()
	if BT_GetData(PTNC_GOT_MEDICINE) == 1 then
		Talk(1,"main","<color=green>"..g_NpcName.."<color>: D­îc phÈm kh«ng nhiÒu, mçi ng­êi chØ ®­îc nhËn mét lÇn.");
		return 0;
	end;
	if gf_Judge_Room_Weight(3,300) == 1 then
		give_medicine();
	else
		Talk(1,"","<color=green>"..g_NpcName.."<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
	end;
end;

function give_medicine()
	BT_SetData(PTNC_GOT_MEDICINE,1);
	AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],30);
	AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],30);
	AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],30);
	Msg2Player("B¹n nhËn ®­îc mét İt thuèc chuyªn dông");
end;

function buy_medicine()

end;