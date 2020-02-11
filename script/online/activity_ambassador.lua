--»î¶¯´óÊ¹½Å±¾
--Í³³ï
Include("\\script\\online\\liangshanboss\\npc\\»î¶¯´óÊ¹.lua")
Include("\\script\\online\\olympic\\npc\\activity_ds.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\online\\qianhe_tower\\npc\\activity_ds.lua")
Include("\\script\\online\\dazitie\\npc\\activity_ds.lua")
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\online\\collect_card\\cc_npc.lua")
Include("\\script\\online\\spring2014\\sp_npc.lua")
Include("\\script\\function\\lucky_box\\lb_head.lua")
Include("\\script\\function\\invite_code\\ic_head.lua")
Include("\\script\\function\\cdkey\\ck_head.lua")

function main()
	g_Act_Count = 0;
	g_Act_Dialog = {};
	g_Act_Title = {};
	g_Act_Select = {};
	
	--ÁºÉ½Boss»î¶¯
	if LSB_IsActivityOpen(LSB_ACTIVITY_ID) == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "BOSS L­¬ng S¬n";
		for i=1,getn(tbSay_201206) do 
			tinsert(g_Act_Dialog[g_Act_Count], tbSay_201206[i]);
		end
		g_Act_Title[g_Act_Count] = sTitle_201206;
	end
	
	--°ÂÔË»î¶¯
	if oly_IsActivityOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "¸o VËn Th¸nh Háa";
		for i=1,getn(tbSay_201207) do 
			tinsert(g_Act_Dialog[g_Act_Count], tbSay_201207[i]);
		end
		g_Act_Title[g_Act_Count] = sTitle_201207;
	end
	
	--Ç§Ñ°Ëþ»î¶¯
	if qht_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho¹t ®éng Thiªn TÇm Th¸p";
		for i=1,getn(Qht_Dialog_Table) do 
			tinsert(g_Act_Dialog[g_Act_Count], Qht_Dialog_Table[i]);
		end
		g_Act_Title[g_Act_Count] = Qht_Title;
	end
	
	--×·»Ø´ó×ÖÌû´ó×÷Õ½
	if dzt_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Tù ThiÕp §¹i T¸c ChiÕn";
		for i=1, getn(DZT_DIALOG_TABLE) do 
			tinsert(g_Act_Dialog[g_Act_Count], DZT_DIALOG_TABLE[i]);
		end
		g_Act_Title[g_Act_Count] = DZT_NPC..DZT_TITLE;
	end
	
	--ÐÂÃÅÅÉÊÕ¼¯¿¨ÅÆ»î¶¯
	if cc_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho¹t ®éng thu thËp thÎ bµi m«n ph¸i míi";
		for i=1, getn(CC_MAIN_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], CC_MAIN_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = CC_NPC..CC_TITLE;
	end
	
	--2014´º½Ú»î¶¯
	if sp_IsOpenActivity() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho¹t ®éng n¨m míi 2014";
		for i = 1, getn(SP_NPC_TALK) do 
			tinsert(g_Act_Dialog[g_Act_Count], SP_NPC_TALK[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..SP_TITLE;
	end
	
	--ÐÒÔË´ó±¦Ïä
	if lb_IsOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "R­¬ng May M¾n Lín";
		for i = 1, getn(LB_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], LB_NPC_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..LB_NPC_TITLE;
	end
	
	--ÑûÇëÂë»î¶¯
	if ic_IsOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho¹t ®éng m· mêi";
		for i = 1, getn(IC_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], IC_NPC_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..IC_NPC_TITLE;
	end	
	
	--CDKEY»î¶¯
	if ck_IsOpen() == 1 and ck_IsStatus() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Tµng KiÕm LÖnh 2";
		for i = 1, getn(CK_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], CK_NPC_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..CK_NPC_TITLE;
	end	
	
	-----------------------
	if g_Act_Count == 1 then
		if getn(g_Act_Dialog[g_Act_Count]) > 0 then
			Say(g_Act_Title[g_Act_Count], getn(g_Act_Dialog[g_Act_Count]), g_Act_Dialog[g_Act_Count]);
		else
			Say("<color=green> §¹i Sø ho¹t ®éng: <color>".."HiÖn t¹i kh«ng më hoÆt ®éng nµo ®©u", 0);
		end
	else
		local tbSay = {};
		for i = 1, getn(g_Act_Select) do
			tinsert(tbSay, format("\n%s/#aa_SayDialog(%d)", g_Act_Select[i], i));
		end
		tinsert(tbSay, "\nT«i chØ xem xem th«i/nothing");
		Say("<color=green> §¹i Sø ho¹t ®éng: <color>"..format("%s muèn tham gia ho¹t ®éng g×!", gf_GetPlayerSexName()), getn(tbSay), tbSay);
	end
end

function aa_SayDialog(nIndex)
	local nSelect = tonumber(nIndex);
	tinsert(g_Act_Dialog[nIndex], "T¹i h¹ chØ xem qua th«i/nothing");
	Say(g_Act_Title[nIndex], getn(g_Act_Dialog[nIndex]), g_Act_Dialog[nIndex]);
end

function nothing()
--do nothing
end