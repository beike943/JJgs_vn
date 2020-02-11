--create date:07-04-04
--author:yanjun
--describe:ËÄÉñÏÉNPC½Å±¾
Include("\\script\\online\\sixinghexi_ib_ob\\sixinghexi_head.lua")
function main()
	local nNpcIdx = GetTargetNpc()
	local szNpcName = GetNpcName(nNpcIdx);
	local nNpcType = get_npc_type(szNpcName);
	if nNpcType ~= 0 then
		dlg_main(nNpcType);
	end;
end
--»ñÈ¡NPCµÄÀàĞÍ
function get_npc_type(szNpcName)
	local nNpcType = 0;
	if szNpcName == "Phóc ThÇn" then
		nNpcType = 1;
	elseif szNpcName == "Tµi thÇn" then
		nNpcType = 2;
	elseif szNpcName == "ChiÕn thÇn" then
		nNpcType = 3;
	elseif szNpcName == "Thùc thÇn" then
		nNpcType = 4;
	end;
	return nNpcType;
end;
--»ñÈ¡µ±Ç°µØÍ¼µÄÃû×Ö
function get_curmap_info()
	local nCurMapID = GetWorldPos();
	for i,v in tbMapInfo_ib_ob do
		if nCurMapID == v[3][1][1] then
			return v[2],v[1];
		end;
	end;
	return "";
end;

function dlg_main(nType)
	local selTab = {
				"Tèt qu¸! Xin ®a t¹"..tbNpcInfo_ib_ob[nType][2].."!!/#get_present("..nType..")",
				"§a t¹, sè vËt phÈm nµy ®Ó dµnh tÆng cho b»ng h÷u./nothing",
				}
	Say("<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: "..tbNpcInfo_ib_ob[nType][3],getn(selTab),selTab);
end;

function get_present(nType)
	--Èç¹ûNPC²»¼ûÁË
	if GetTargetNpcName() ~= tbNpcInfo_ib_ob[nType][2] then
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	local nTime = tonumber(date("%y%m%d%H%M"));
	local szMapName,nGlbIdx = get_curmap_info();
	local nPresentLeft = MAX_PRESENT_COUNT - GetGlbValue(nGlbIdx);
	local nLastMapID = GetTask(TASK_MAPID);
	local nGotDate = GetTask(TASK_GOT_DATE);
	local nGotTime = GetTask(TASK_TIME);
	local nCurMapID = GetWorldPos();
	local nCurTime = GetTime();
	if nPresentLeft == 0 then	--Èç¹ûÃ»ÀñÎïÁË
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: Quµ ta mang ®Õn ®· ph¸t hÕt råi, phiÒn b»ng h÷u lÇn sau ®Õn sím nhĞ!");
		return 0;
	end;
	--ÅĞ¶ÏÊÇÍ¬Ò»Ê±¶ÎµÄ·½·¨£º
	--ÉÏ´ÎÁìÈ¡Ê±Ëù´¦µÄµØÍ¼ºÍµ±Ç°µØÍ¼ÏàÍ¬²¢ÇÒ
	--µ±Ç°Ê±¼ä¼õÈ¥ÉÏ´ÎÁìÈ¡ÀñÎïÊ±¼äĞ¡ÓÚNPCÉú´æÊ±¼ä
	if nLastMapID == nCurMapID and nCurTime - nGotTime < IB_OB_NPC_LIFE_TIME then	--±¾Ê±¶ÎÁìÈ¡¹ıÀñÎïÁË
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: Ng­¬i ®· nhËn quµ råi, muèn lµm h¶o h¸n th× kh«ng ®­îc tham nh­ vËy chø.");
		return 0;
	end;
	if nDate > nGotDate then	--ĞÂµÄÒ»ÌìÊı¾İÇå³ı
		SetTask(TASK_GOT_DATE,nDate);
		SetTask(TASK_PRESENT_TIMES,0);
	end;
	if GetTask(TASK_PRESENT_TIMES) >= MAX_GOT_TIMES then	--Èç¹ûµ±ÌìÁìÈ¡ÁË×ã¹»¶àµÄÀñÎï
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: H«m nay ng­¬i may m¾n ®· nhËn ®­îc nhiÒu quµ råi, chç cßn l¹i ®Ó nh­êng cho ng­êi kh¸c.");
		return 0;
	end;

	if gf_JudgeRoomWeight(2,200) == 0 then
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: Hµnh trang cña ng­¬i ®· kh«ng cßn chç trèng, h·y s¾p xÕp l¹i råi ®Õn nhËn quµ.");
		return 0;
	end;
	SetTask(TASK_PRESENT_TIMES,GetTask(TASK_PRESENT_TIMES)+1);
	SetTask(TASK_MAPID,nCurMapID);
	SetTask(TASK_TIME,nCurTime);
	SetGlbValue(nGlbIdx,GetGlbValue(nGlbIdx)+1);
	local nRand = 0;
	local szPresent = "";
	local szPlayerName = GetName();
	if nType == 1 then
		ModifyReputation(30,0);
		AddItem(2,5,7,5);
		Msg2Player("B¹n nhËn ®­îc 5 tÊm Gi¸m §Şnh phï cÊp 7.");
		Msg2Global("Ng­êi ch¬i"..szPlayerName.."T¹i"..szMapName.."GÆp ®­îc Phóc ThÇn nhËn v« sè quµ, thËt khiÕn cho ng­êi kh¸c ph¶i ganh tş!")
	elseif nType == 2 then
		nRand = random(1,100)
		if nRand <= 75 then
			Earn(80000);
			szPresent = "8 vµng";
		elseif nRand <= 95 then
			Earn(180000);
			szPresent = "18 tiÒn vµng";
		else
			Earn(280000);
			szPresent = "28 tiÒn vµng";
		end;
		Msg2Global("Ng­êi ch¬i"..szPlayerName.."T¹i"..szMapName.."GÆp ThÇn tµi nhËn ®­îc v« sè ng©n l­îng"..szPresent..", thËt khiÕn ng­êi kh¸c ph¶i ganh tş!");
	elseif nType == 3 then
		nRand = random(1,100)
		if nRand <= 85 then
			AddItem(2,1,481,1);
			Msg2Player("B¹n nhËn ®­îc mét tói Ngò Hoa Ngäc Lé Hoµn");
			szPresent = "Ngò Hoa Ngäc Lé Hoµn (tiÓu)";
		elseif nRand <= 90 then
			AddItem(2,1,483,1);
			Msg2Player("B¹n nhËn ®­îc mét tói Sinh Sinh Hãa T¸n");
			szPresent = "Sinh Sinh Hãa T¸n (tiÓu)";
		elseif nRand <= 95 then
			AddItem(2,1,489,1);
			Msg2Player("B¹n nhËn ®­îc mét tói Ngäc Cao T¸n");
			szPresent = "H¾c Ngäc §o¹n Tôc Cao (tiÓu)";
		else
			AddItem(2,1,495,1);
			Msg2Player("B¹n nhËn ®­îc mét tói V¹n VËt Quy Nguyªn ®¬n");
			szPresent = "V¹n VËt Quy Nguyªn §¬n (tiÓu)";
		end;
		Msg2Global("Ng­êi ch¬i"..szPlayerName.."T¹i"..szMapName.."GÆp ®­îc ChiÕn thÇn nhËn ®­îc v« sè vËt phÈm"..szPresent..", khiÕn ng­êi kh¸c ph¶i ®è kş!");
	elseif nType == 4 then
		nRand = random(1,100)
		if nRand <= 25 then
			AddItem(1,1,14,30);
			Msg2Player("B¹n nhËn ®­îc 30 C¬m chiªn trøng");
			szPresent = "30 phÇn c¬m chiªn trøng";
		elseif nRand <= 50 then
			AddItem(1,1,9,30);
			Msg2Player("B¹n nhËn ®­îc 30 C¶i xµo tái");
			szPresent = "30 C¶i xµo tái";
		elseif nRand <= 75 then
			AddItem(1,1,13,30);
			Msg2Player("B¹n nhËn ®­îc 30 Tóy Méng Töu");
			szPresent = "30 Tóy Méng Töu";
		elseif nRand <= 83 then
			AddItem(1,1,15,20);
			Msg2Player("B¹n nhËn ®­îc 20 b¸nh Bét vµng");		
			szPresent = "20 b¸nh Bét vµng";
		elseif nRand <= 91 then
			AddItem(1,1,17,20);
			Msg2Player("B¹n nhËn ®­îc 20 NhŞ thËp tø kiÒu Minh NguyÖt D¹");
			szPresent = "20 NhŞ thËp tø kiÒu Minh NguyÖt D¹";
		else
			AddItem(1,1,19,20);
			Msg2Player("B¹n nhËn ®­îc 20 T©y B¾c Väng");	
			szPresent = "20 T©y B¾c Väng";	
		end;
		Msg2Global("Ng­êi ch¬i"..szPlayerName.."T¹i"..szMapName.."GÆp ®­îc Thùc thÇn, nhËn ®­îc v« sè thùc phÈm"..szPresent..", khiÕn ng­êi kh¸c ph¶i ganh tş!");
	end;
	Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: PhÇn th­ëng cña ng­¬i ®©y, chóc vui vÎ!");
end;