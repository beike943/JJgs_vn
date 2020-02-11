--»ñÈ¡±í¸ñÖ§³Ö
Include("\\script\\class\\ktabfile.lua");
--ÒıÓÃ×Ö·û´®´¦ÀíÖ§³Ö
Include("\\script\\task\\world\\task_head.lua");

File_name = "\\script\\task\\teach\\ĞÂÊÖÖ¸Òıbook.lua"
--±í¸ñ³õÊ¼»¯
tabTaskInfo 	 =  new(KTabFile,"\\settings\\task\\task_info.txt");
tabNpcPos 		 =  new(KTabFile,"\\settings\\task\\npc_pos_info.txt");
tabLevelTaskInfo =  new(KTabFile,"\\settings\\task\\level_task.txt");
tabZXTaskInfo 	 =  new(KTabFile,"\\settings\\task\\task_info_zx.txt");


---------------------------------------------¹«¹²±äÁ¿¶¨ÒåÇø-----------------------------------------
Zgc_conf_task_goos_num = {						--ÈÎÎñÊÕ¼¯µÈ¼¶Îª9¼¶
	{2000,1},{4000,2},{8000,4},{12000,7},{16000,10},{20000,15},{24000,16},{28000,17},{32000,18}
}
--
Zgc_conf_task_goods_need = {50,90,140,200,400}

function OnUse()
	Say("VŞ b»ng h÷u nµy, muèn t×m hiÓu g×?",
		7,
		"T×m hiÓu nhiÖm vô./Renwuchaxun",
		"T×m hiÓu viÖc cÇn lµm./#ShowTaskInfo(1,1)",
		"H­íng dÉn sö dông vâ c«ng./wuogongmiji",
		"H¹n chÕ ®iÒu kiÖn më b¶n ®å./mapkaiqi",
		"T×m hiÓu vŞ trİ ng­êi chØ ®Şnh./Chaxunnpc",
		"T×m hiÓu thêi gian hiÖn t¹i./Timechaxun",
		"Rêi khái./cancel")
end

function cancel()
end

function Renwuchaxun()
	Say("Ng­¬i muèn hái chuyÖn g×?",
			3,
		"T×m hiÓu nhiÖm vô chñ tuyÕn./#ShowTaskInfo(1,2)",
		"T×m hiÓu nhiÖm vô phô tuyÕn./#ShowTaskInfo(1,3)",
		--"²½·ÇÑÌÖ®ÃÔÈÎÎñ²éÑ¯¡£/conf_task_inq",
		"Nh©n tiÖn ghĞ qua th«i!/cancel")
end

--**************************²½·ÇÑÌÖ®ÃÔÈÎÎñ²éÑ¯****************************
function conf_task_inq()
	if IsTongMember() == 0 then
		Say("B¹n ch­a gia nhËp bang héi nµo!",
			1,
			"Ta biÕt råi/cancel"
		)
	else
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackStepInq")
	end
end
function CallBackStepInq(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--Êı¾İÕûÀíÅĞ¶Ï--
	if tong_level_max == nil or tong_level_max <= 0 then
		ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
		return
	end
	--½áÊø--
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	local dialog_date_now = ""					--±¾ÂÖÈÎÎñ½áÊøÊ±¼ä
	local dialog_date_next =""					--ÏÂÂÖÈÎÎñ¿ªÊ¼Ê±¼ä
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date_now = "24h tèi nay "
		dialog_date_next = "24h tèi mai "
	else
		dialog_date_now = "24h tèi mai "
		dialog_date_next = "24h tèi mèt "
	end
	local dialog_conf = ""
	if tong_state == 1 then
		dialog_conf = "\n Quı bang vÉn ch­a nhËn chuçi nhiÖm vô nµy, nhiÖm vô nµy ®Õn <color=yellow>"..dialog_date_now.."<color> kÕt thóc."
	elseif tong_state == 2 then
		local cent = Zgc_conf_task_cent_date(0,956)
		local times = Zgc_conf_task_cent_date(1,956)
		if times ~= Zgc_conf_task_time_return() then
			cent = 0
		end
		dialog_conf = "\n Quı bang ®· nhËn nhiÖm vô, t×nh h×nh thu thËp vËt phÈm hiÖn lµ:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1]..", chuçi nhiÖm vô nµy ®Õn <color=yellow>"..dialog_date_now.."<color> kÕt thóc. \n NhiÖm vô cña b¹n hiÖn ®· hoµn thµnh:"..cent.."/"..Zgc_conf_task_num_max().."."
	elseif tong_state == 3 then
		dialog_conf = "\n Quı bang ®· hoµn thµnh nhiÖm vô lÇn nµy, bang chñ, phã bang chñ, tr­ëng l·o ®Òu cã thÓ ®Õn nhËn phÇn th­ëng. Chuçi nhiÖm vô nµy ®Õn <color=yellow>"..dialog_date_now.."<color> kÕt thóc."
	elseif tong_state == 4 then
		dialog_conf = "\n Quı bang ®· hoµn thµnh nhiÖm vô vµ nhËn ®­îc phÇn th­ëng. Chuçi nhiÖm vô lÇn sau ®Õn <color=yellow>"..dialog_date_now.."<color> kÕt thóc."
	end
	Say(dialog_conf,
		1,
		"Ta biÕt råi/cancel")
end
--**************************°ï»áÈÎÎñÊı¾İ×ªÒÆ************************
function CallBackDataRepair(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,GetTongName())
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if tong_level_max == nil or tong_level_max <= 0 then
		tong_ID = 0
		tong_level = 0
		tong_num = 0
		tong_state = 0
		tong_level_max = 1
	end
	local add_flag = AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	return
end
--**************************ÂÖ´Î¼ÆËãº¯Êı*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 57600)/(172800))
	return time_return
end
--**************************ÊıÁ¿ºÍÈÕÆÚ·Ö×°º¯Êı*************************
function Zgc_conf_task_cent_date(diff_flag,task_id)
	local cent_return = 0
	local date_return = 0
	local data_save = GetTask(task_id)
	if diff_flag == 0 then
		cent_return = floor (data_save/10000)
		return cent_return
	else
		date_return = data_save - ((floor (data_save/10000))*10000)
		return date_return
	end
end
--**************************ÏÂÒ»ÂÖÊ±¼ä¼ÆËã*****************************
function Zgc_conf_task_dist_date()
	local date_tomorrow = floor((GetTime() + 28800)/(172800))
	if Zgc_conf_task_time_return() == date_tomorrow then
		return 2
	else
		return 1
	end
end
--*************************¿ÉÊÕÈ¡ÊÕ¼¯Æ·ÉÏÏŞ¼ÆËãº¯Êı**********************
function Zgc_conf_task_num_max()
	local ruturn_num = 0
	if GetLevel() > 50 then
		ruturn_num = 400
	else
		local num_seq = floor(GetLevel()/10)
		ruturn_num = Zgc_conf_task_goods_need[num_seq]
	end
	return ruturn_num
end
--*******************************½áÊø**************************************
function Chaxunnpc()
	Say("Ng­¬i muèn hái ng­êi nµo?",
			2,
		"T×m ng­êi chØ ®Şnh./GetNpcName",
		"Nh©n tiÖn ghĞ qua th«i!/cancel")
end

function ShowTaskInfo(nNum,nType)

local i = 0;
local strTalk = "NhiÖm vô cña ng­¬i:";
local nTaskInfoStr = "";
local RowNumTab = SearchTaskInfoRowNum(nType);
local tabTaskFile = GetTaskTabFile(nType);

	if getn(RowNumTab) == 0 then
		TalkEx("",{"HiÖn ng­¬i kh«ng cã nhiÖm vô."})
		return
	end

	if nNum == 1 then
		if getn(RowNumTab) <= nNum then
			TalkEx("",{"NhiÖm vô cña ng­¬i:"..tabTaskFile:getCell(RowNumTab[nNum],"TaskInfo")})
		else
			nNum = nNum + 1;
			TalkEx("#ShowTaskInfo("..nNum..","..nType..")",{"NhiÖm vô cña ng­¬i:"..tabTaskFile:getCell(RowNumTab[nNum-1],"TaskInfo")})
		end
	elseif nNum >= getn(RowNumTab) then
		TalkEx("",{tabTaskFile:getCell(RowNumTab[nNum],"TaskInfo")})
	else
		nNum = nNum + 1;
		Talk(1,"#ShowTaskInfo("..nNum..","..nType..")",tabTaskFile:getCell(RowNumTab[nNum-1],"TaskInfo"))
	end
end

--¸ù¾İ½ÇÉ«µÈ¼¶£¬Ïà¹Ø±äÁ¿Öµ·µ»ØÄÜ×öÈÎÎñµÄID
function SearchTaskInfoRowNum(nType)

local i = 0;
local j = 0;
local nTaskID = 0;
local nTaskVaule = 0;
local nLevel = GetLevel();
local RowNumTab = {};
local tabTaskFile = GetTaskTabFile(nType);

	for i=3,tabTaskFile:getRow() do
		if nLevel >= tonumber(tabTaskFile:getCell(i,"Level")) then
			nTaskID = tonumber(tabTaskFile:getCell(i,"TaskID"));
			nTaskVaule = tonumber(tabTaskFile:getCell(i,"TaskValue"));
			if GetTask(nTaskID) == nTaskVaule then
				tinsert(RowNumTab,i);
			end
		end
	end

	return RowNumTab

end


function GetNpcName()

	Msg2Player("Xin nhËp täa ®é Npc muèn t×m.");
	AskClientForString("SearchNpcName","",1,31,"Xin nhËp tªn Npc");

end

function SearchNpcName(nNpcName,nNum)

local i = 0;
local nPosX = 0;
local nPosY = 0;
local nNpcNameS = "";
local nMapName = "";
local nTabName = "";
local strSay = {};
local NameTab = {};
local PosRowNumTab = {};

	--º¬ÓĞ·Ç·¨×Ö·û
--	for i=1,strlen(nNpcName) do
--		if strbyte(nNpcName,i) <= 127 then
--			TalkEx("GetNpcName",{"½­ºşÖ¸ÄÏ£ºÄãµÄÊäÈëº¬ÓĞ·ÇÖĞÎÄ×Ö£¬²»ÄÜ½øĞĞ²éÑ¯£¬ÇëÖØĞÂÊäÈë¡£"});
--			return
--		end
--	end

	if nNum == 0 then
		nNum = 1;
	end

	--²éÕÒÍêÈ«Æ¥ÅäÃû×Ö
	for i=3,tabNpcPos:getRow() do
		if nNpcName == tabNpcPos:getCell(i,"NpcName") then
			tinsert(PosRowNumTab,i);
		end
	end

	if getn(PosRowNumTab) >= 1 then
		tinsert(strSay,"Täa ®é Npc \n");
	else
		--²éÕÒº¬ÓĞÃû×Ö¹Ø¼ü×ÖÈËÃû
		for i=1,strlen(nNpcName) do
			tinsert(NameTab,strsub(nNpcName,i,i+1))
			i = i+1;
		end

		for i=1,getn(NameTab) do
			for j=3,tabNpcPos:getRow() do
				nTabName = tabNpcPos:getCell(j,"NpcName");
				for k=1,strlen(nTabName) do
					if NameTab[i] == strsub(nTabName,k,k+1) then
						tinsert(PosRowNumTab,j);
					else
						k = k + 1;
					end
				end
			end
		end

		if getn(PosRowNumTab) >= 1 then
			tinsert(strSay,"Kh«ng t×m thÊy täa ®é Npc, nh÷ng täa ®é liªn quan \n");
		else
			TalkEx("",{"Xin lçi! Kh«ng t×m thÊy täa ®é Npc, thö kiÓm tra l¹i tªn Npc!"});
			return
		end
	end

	if getn(PosRowNumTab) - nNum < 5 then
		for i=nNum,getn(PosRowNumTab) do
			nNpcNameS = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcNameS) do
				nNpcNameS = nNpcNameS.." ";
			end
			tinsert(strSay,nNpcNameS.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
			end
		if getn(PosRowNumTab) - nNum < nNum - 1 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang tr­íc/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		end
		tinsert(strSay,"Rêi khái/cancel");
		SelectSay(strSay)
		return
	else
		for i=nNum,nNum + 4 do
			nNpcNameS = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcNameS) do
				nNpcNameS = nNpcNameS.." ";
			end
			tinsert(strSay,nNpcNameS.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		end
		if nNum >= 5 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang tr­íc/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
			nNum = nNum + 8;
		else
			nNum = nNum + 4;
		end
		tinsert(strSay,"Trang kÕ/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		tinsert(strSay,"Rêi khái/cancel");
		SelectSay(strSay)
		return
	end
end

function ShowMapNpcPos(nNum)

local i = 0;
local j = 0;
local nPosX = 0;
local nPosY = 0;
local nMapName = "";
local nNpcName = "";
local strSay = {};
local PosRowNumTab = {};
local nMapID = GetWorldPos();

	for i=3,tabNpcPos:getRow() do
		if nMapID == tonumber(tabNpcPos:getCell(i,"MapID")) then
			tinsert(PosRowNumTab,i);
		end
	end

	if getn(PosRowNumTab) <= 0 then
		TalkEx("",{"Xin lçi! Khu vùc nµy kh«ng t×m thÇy täa ®é Npc."});
	elseif getn(PosRowNumTab) - nNum < 5 then
		tinsert(strSay,"Täa ®é Npc ë khu vùc nµy \n \n");
		for i=nNum,getn(PosRowNumTab) do
			nNpcName = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcName) do
				nNpcName = nNpcName.." ";
			end
			tinsert(strSay,nNpcName.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#ShowMapNpcPos("..nNum..")");
		end
		if getn(PosRowNumTab) - nNum < nNum - 1 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang tr­íc/#ShowMapNpcPos("..nNum..")");
		end
		tinsert(strSay,"Rêi khái/cancel");
		SelectSay(strSay)
	else
		tinsert(strSay,"Täa ®é Npc ë khu vùc nµy \n \n");
		for i=nNum,nNum + 4 do
			nNpcName = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,20-strlen(nNpcName) do
				nNpcName = nNpcName.." ";
			end
			tinsert(strSay,nNpcName..nMapName.."     "..nPosX.."     "..nPosY.."/#ShowMapNpcPos("..nNum..")");
		end
		if nNum >= 5 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang tr­íc/#ShowMapNpcPos("..nNum..")");
			nNum = nNum + 8;
		else
			nNum = nNum + 4;
		end
		tinsert(strSay,"Trang kÕ/#ShowMapNpcPos("..nNum..")");
		tinsert(strSay,"Rêi khái/cancel");
		SelectSay(strSay)
	end
end

--»ñÈ¡¶ÔÓ¦±í¸ñ
function GetTaskTabFile(nType)

local tabTaskFile;

	if nType==1 then
		tabTaskFile = tabLevelTaskInfo;
	elseif nType==2 then
		tabTaskFile = tabTaskInfo;
	elseif nType==3 then
		tabTaskFile = tabZXTaskInfo;
	end

	return tabTaskFile;

end

function Timechaxun()
	local sTimeLeft = "";
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	sTimeLeft = nHour.." giê "..nMin.." Phót "
	Talk(1,"","Thêi gian hiÖn t¹i cßn <color=yellow>"..sTimeLeft.."<color>. C¸c vŞ ®¹i hiÖp nhí n¾m b¾t thêi gian!");
end;

function wuogongmiji()		--Îä¹¦ºÍÃØ¼®µÄËµÃ÷
	Say("Ng­¬i muèn hái vÇn ®Ò g×?",
			3,
		"C¸ch sö dông vâ c«ng./Wugongshuoming",
		"C¸ch sö dông mËt tŞch./Mijishuoming",
		"Kh«ng cÇn ®©u!/cancel")
end

function Wugongshuoming()		--Îä¹¦ËµÃ÷
	Say("Ng­¬i muèn hái vÇn ®Ò g×?",
			6,
		"Lµm sao sö dông vâ c«ng./shiyongwugong",
		"Lµm sao chän ®¼ng cÊp vâ c«ng./xuanzewugongdengji",
		"Vâ c«ng chuét tr¸i vµ chuét ph¶i cã ph©n biÖt kh«ng?/zuojianyoujian",
		"Lµm sao  ®Ó sö dông c¸c sè phİm t¾t bªn d­íi?/bianjikuaijie",
		"Ngoµi thanh sè phİm t¾t ra cßn phİm t¾t vâ c«ng kh«ng?/qitakuaijie",
		"Kh«ng cÇn ®©u!/cancel")
end

function shiyongwugong()
		Say("\nGiao diÖn bªn d­íi lµ 2 « tr¸i ph¶i chøa kü n¨ng vâ c«ng, nhÊn vµo chän kü n¨ng muèn sö dông lµ ®­îc. \n\nThao t¸c: \nNhÊn vµo thanh vâ c«ng bªn d­íi - bªn ph¶i chän vâ c«ng - nhÊn chuét tr¸i lªn vâ c«ng", 0);
end;

function xuanzewugongdengji()
		Say("\nMuèn sö dông vâ c«ng kh¸c, ph¶i qua thao t¸c sau. \nTr­íc tiªn nhÊn chiªu thøc m«n ph¸i hoÆc F5. \n Sau ®ã chän vâ c«ng chñ ®éng (vâ c«ng bŞ ®éng kh«ng thÓ chän ®¼ng cÊp) sÏ hiÖn giao diÖn chän vâ c«ng. \n Cuèi cïng chän kü n¨ng thİch hîp, nhÊn phİm t¾t sè lµ ®­îc.",
		1,
		"Trang kÕ/xuanzewugongdengji2")
end

function xuanzewugongdengji2()
		Say("\n VÒ sau nhÊn phİm t¾t sè t­¬ng øng vâ c«ng lµ cã thÓ sö dông cho chuét ph¶i. \n\nThao t¸c: \nNhÊn F5 - më giao diÖn vâ c«ng - nhÊn vâ c«ng bÊt kú (trõ vâ c«ng bŞ ®éng) - më giao diÖn vâ c«ng lùa chän - nhÊn phİm t¾t sè t­¬ng øng vâ c«ng lµ cã thÓ sö dông cho chuét ph¶i.",0)
end

function zuojianyoujian()
		Say("\n Vâ c«ng chuét tr¸i khi nhÊn lªn qu¸i sÏ ®¸nh liªn tôc. \nVâ c«ng chuét ph¶i khi nhÊn lªn qu¸i nÕu ®ñ m¹nh chØ ®¸nh mét lÇn.", 0);
end;

function bianjikuaijie()
		Say("\nThanh phİm t¾t sè gåm 4 tæ cho ng­êi ch¬i sö dông \nNhÊn mòi tªn bªn ph¶i thanh phİm t¾t sè sÏ thÊy ®­îc giao diÖn S¾p xÕp, b¹n cã thÓ ®­a vâ c«ng, trang bŞ, mËt tŞch, ®¹o cô vµo thanh phİm t¾t. \nS¾p xÕp xong thanh phİm t¾t bªn ph¶i cã h×nh khãa mÆc ®Şnh, khãa l¹i lµ kh«ng thÓ thay ®æi. \nTa cã thÓ dïng mòi tªn lªn xuèng thay ®æi thanh phİm t¾t, hoÆc dïng dÊu ~.",
		1,
		"Trang kÕ/bianjikuaijie2")
end

function bianjikuaijie2()
		Say("\n MÆc ®Şnh thanh phİm t¾t theo thø tù 1 - 2 - 3 - 4. Sau khi khãa « phİm t¾t, khi sö dông sÏ bá qua « ®ã, vİ dô: Khãa « 3. theo thø tù sÏ lµ 1 - 2 - 4 - 1.", 0);
end;

function qitakuaijie()
		Say("\nNgoµi thanh phİm t¾t sè, trong thanh vâ c«ng nhÊn Q, W, E, A, S, D, Z, X, C ®Ó thiÕt lËp phİm t¾t nhanh cho vâ c«ng ®ã. \n", 0);
end;

function Mijishuoming()		--ÃØ¼®ËµÃ÷
	Say("Ng­¬i muèn hái vÇn ®Ò g×?",
			7,
		"MËt tŞch dïng ®Ó lµm g×?/mijizuoyong",
		"§Ó t¨ng c­êng vâ c«ng nªn dïng mËt tŞch g×?/jinengqianghua",
		"Ph­¬ng thøc tu luyÖn./xiuweishuoming",
		"Ta dïng bao nhiªu quyÕt yÕu, mËt tŞch ®©y?/qitashuoming",
		"Lµm c¸ch nµo ®Ó häc mËt tŞch?/mijixiulian",
		"Sao ph©n biÖt mËt tŞch?/haohuaipanduan",
		"Kh«ng cÇn ®©u!/cancel")
end

function mijizuoyong()
		Say("\n Mçi mËt tŞch ®Òu mang vâ c«ng, sau khi tu luyÖn ®¹t ®Õn mét tr×nh ®é nhÊt ®Şnh sÏ sö dông ®­îc mËt tŞch vâ c«ng ®ã. \nMËt tŞch g¾n quyÕt yÕu cã thÓ lµm m¹nh thªm vâ c«ng.", 0);
end;

function jinengqianghua()
		Say("\n Mçi mËt tŞch cã 4 gi¸ trŞ ph©n biÖt Thªm hÖ ®¸nh chñ ®éng ngo¹i c«ng; Thªm hÖ ®¸nh chñ ®éng néi c«ng; Thªm ®¸nh hç trî; Thªm phßng thñ. \n Mçi quyÕt yÕu t­¬ng øng víi 1 vâ c«ng vµ mang 1 trong 4 lo¹i trªn. Khi g¾n quyÕt yÕu vµo mËt tŞch sÏ c¨n cø trŞ sè vµ lo¹i h×nh tõ ®ã céng thªm cho vâ c«ng. \n NhÊn chuét ph¶i lªn quyÕt yÕu ®Ó g¾n vµo mËt tŞch. ",
		1,
		"Trang kÕ/xiuweishuoming2")
end

function jinengqianghua2()
		Say("\n Vİ dô: \n T¸c dông cña quyÕt yÕu Tİch D­¬ng kiÕm khİ lµ t¨ng tèc ®é thi triÓn, lín nhÊt 25%. Thuéc kü n¨ng chñ ®éng hÖ néi c«ng. \n Khi ®­îc g¾n vµo mËt tŞch hÖ ®¸nh chñ ®éng néi c«ng thªm 80% sÏ ph¸t huy tèc ®é thi triÓn chiªu ®ã (25%*80%) tøc 20%.", 0);
end;

function xiuweishuoming()
		Say("\n Tu luyÖn lµ chÕ t¹o mËt tŞch, th«ng qua thêi gian online. \n BÕ quan tu luyÖn gióp t¨ng tèc ®ång thêi mét sè chøc n¨ng vµ ho¹t ®éng nh­ Th¸i H­ HuyÔn c¶nh còng trùc tiÕp nhËn ®­îc tu luyÖn.", 0);
end;

function qitashuoming()
		Say("\n MËt tŞch g¾n ®­îc bao nhiªu quyÕt yÕu lµ do sè l­îng phô lôc. Mµ thªm sè trŞ mËt tŞch vµ sè l­îng phô lôc cã thÓ th«ng qua tu luyÖn mËt tŞch n©ng cao ®¼ng cÊp nhËn ®­îc.", 0);
end;

function mijixiulian()
		Say("\n Tr­íc tiªn trang bŞ mét quyÓn mËt tŞch, nhÊn nót chiªu thøc m«n ph¸i hoÆc F5 më giao diÔn vâ c«ng, sau ®ã nhÊn nót ph©n trang. NhÊn tiÕp tu luyÖn nhËp trŞ tu luyÒn cÇn tèn, x¸c ®Şnh ®Ó luyÖn mËt tŞch. \n \n Thao t¸c: \n NhÊn F5 më giao diÖn vâ c«ng - nhÊn ph©n trang mËt tŞch - nhÊn tu luyÖn - nhËp sè nhÊn *§ång ı* lµ ®­îc.",
		1,
		"Trang kÕ/mijixiulian2")
end

function mijixiulian2()
		Say("\n MËt tŞch cÊp 9 - cÊp 10, cÊp 19 - cÊp 20…cÊp 89 - cÊp 90, cÊp 98 - cÊp 99 ®Òu cã tû lÖ lÜnh ngé vâ c«ng, v× vËy tu luyÖn vÒ sau sÏ cao h¬n nhiÒu. H¬n n÷a ph¶i tu luyÖn ®ñ cÊp míi cã thÓ tiÕp tôc. MËt tŞch b¾t ®Çu tu luyÖn mçi lªn 1 cÊp sÏ cã tû lÖ t¨ng ®iÓm sè vµ sè trang phô lôc.", 0);
end;

function haohuaipanduan()
		Say("\n NhËn ®Şnh mËt tŞch b»ng c¸ch: \nThø 1. tÇng sè lÜnh ngé kü n¨ng. \n Thø 2. sè trang phô lôc. \nThø 3. trŞ céng thªm mËt tŞch. \n V× vËy mét quyÓn mËt tŞch lo¹i tèt ngoµi cÇn tÇn sè kü n¨ng cao ra quan träng sè trang phô lôc vµ céng thªm kü n¨ng.", 0);
end;

function mapkaiqi()		--µØÍ¼¿ªÆô²éÑ¯
	Say("Ng­¬i kh«ng vµo ®­îc n¬i nµo?",
			8,
		"§¹i th¶o nguyªn phİa b¾c Nh¹n M«n quan./dacaoyuan",
		"Bé l¹c V­¬ng Kú phİa b¾c §¹i th¶o nguyªn./wangqibulu",
		"Giang T©n Th«n ë h­íng ®«ng nam Thµnh §« phñ./jiangjincun",
		"Phong Ma ®éng ë Giang T©n Th«n./fengmodong",
		"Phong §« Quû thµnh phİa ®«ng Giang T©n Th«n./fengduguicheng",
		"§«ng H¶i H¶i T©n gÇn TuyÒn Ch©u./donghaihaibin",
		"Trang sau./mapkaiqi2",
		"Ta kh«ng cã b¶n ®å ®Ó vµo trong./cancel")
end

function mapkaiqi2()		--µØÍ¼¿ªÆô²éÑ¯
	Say("Ng­¬i kh«ng vµo ®­îc n¬i nµo?",
			8,
		"§µo Hoa ®¶o ë ngoµi biÓn./taohuadao",
		"Thanh Khª ®éng ë Long TuyÒn Th«n./qingxidong",
		"L­ìng Thñy ®éng ë Vò Di s¬n./liangshuidong",
		"Thiªn TÇm th¸p ë §¹i Lı./qianxunta",
		"T©y Song B¶n N¹p ë phİa nam §iÓm Th­¬ng s¬n./xishuangbanna",
		"Long Nh·n ®éng ë §iÓm Th­¬ng s¬n./longyandong",
		"Trang tr­íc./mapkaiqi",
		"Ta kh«ng cã b¶n ®å ®Ó vµo trong./cancel")
end

function dacaoyuan()
		Say("\nMuèn vµo §¹i th¶o nguyªn ph¶i më hÖ thèng nhiÖm vô Thiªn M«n trËn, hoµn thµnh xong t×m Hµn Trİ Nh­îng.", 0);
end;

function wangqibulu()
		Say("\nMuèn vµo bé l¹c V­¬ng Kú ph¶i më hÖ thèng nhiÖm vô Thiªn M«n trËn, sau khi hoµn thµnh nhiÖm vô §¹i th¶o nguyªn hèi lé cho lİnh canh bé l¹c hoÆc gióp Nhiªu L©n chuyÓn hµng.", 0);
end;

function jiangjincun()
		Say("\nMuèn vµo Giang T©n Th«n ph¶i më hÖ thèng nhiÖm vô Phong §« Quû thµnh, hoµn thµnh nhiÖm vô n¹n d©n Thµnh §«, t×m Tr­¬ng §×nh.", 0);
end;

function fengmodong()
		Say("\nMuèn vµo Phong Ma ®éng ph¶i më hÖ thèng nhiÖm vô Phong §« quû thµnh, gióp Tr­¬ng §×nh gi¶i ®éc xong b¾t ®Çu nhiÖm vô gióp D­¬ng NguyÖt s­ th¸i thu thËp U Linh.", 0);
end;

function fengduguicheng()
		Say("\nMuèn vµo Phong §« Quû thµnh ph¶i më hÖ thèng nhiÖm vô Phong §« quû thµnh, gióp chÕ t¹o §én Èn linh phï, mang vËt phÈm chØ ®Şnh.", 0);
end;

function donghaihaibin()
		Say("\nMuèn vµo §«ng H¶i H¶i T©n ph¶i tõ cÊp 50 trë lªn, nhËn nhiÖm vô ë ViÔn Tinh [(198.199) B¾c TuyÒn Ch©u].", 0);
end;

function taohuadao()
		Say("\nMuèn vµo §µo Hoa ®¶o ph¶i më nhiÖm vô §«ng H¶i H¶i T©n, phİa ®«ng §«ng H¶i H¶i T©n 2 t×m thuyÒn phu ngåi thuyÒn.", 0);
end;

function qingxidong()
		Say("\nMuèn vµo Thanh Khª ®éng ph¶i më hÖ thèng nhiÖm vô H¹ HÇu CÇm ë D­¬ng Ch©u, nhËn nhiÖm vô cøa L«i Th¾ng trong Thanh Khª ®éng.", 0);
end;

function liangshuidong()
		Say("\nMuèn vµo L­ìng Thñy ®éng ph¶i më hÖ thèng nhiÖm vô H¹ HÇu CÇm D­¬ng Ch©u, gióp L­u HuyÒn Thanh ®Õn Thanh Khª ®éng ®¸nh Th­¬ng thÇn.", 0);
end;

function qianxunta()
		Say("\nMuèn vµo Thiªn TÇm th¸p ®¼ng cÊp tõ 70 trë lªn.", 0);
end;

function xishuangbanna()
		Say("\nMuèn vµo T©y Song B¶n N¹p b¾c ®¼ng cÊp tõ 75 trë lªn.", 0);
end;

function longyandong()
		Say("\nMuèn vµo Long Nh·n ®éng ph¶i më hÖ thèng nhiÖm vô ë TrŞnh Qu¸n Chi §¹i Lı, nhËn nhiÖm vô t×m b¹n ®ång hµnh mÊt tİch ë Long Nh·n ®éng.", 0);
end;

function no()

end