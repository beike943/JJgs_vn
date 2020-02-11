--»ñÈ¡±í¸ñÖ§³Ö
Include("\\script\\class\\ktabfile.lua");
--ÒıÓÃ×Ö·û´®´¦ÀíÖ§³Ö
Include("\\script\\task\\world\\task_head.lua");
--±í¸ñ³õÊ¼»¯
tabTaskInfo 		 =  new(KTabFile,"\\settings\\task\\task_info.txt");
tabNpcPos 			 =  new(KTabFile,"\\settings\\task\\npc_pos_info.txt");
tabLevelTaskInfo =  new(KTabFile,"\\settings\\task\\level_task.txt");
tabZXTaskInfo 	 =  new(KTabFile,"\\settings\\task\\task_info_zx.txt");

function main()
	Say("VŞ b»ng h÷u nµy t×m ta cã chuyÖn g×?",
		8,
		"T×m hiÓu nhiÖm vô./Renwuchaxun",
		"T×m hiÓu viÖc cÇn lµm./#ShowTaskInfo(1,1)",
		"H­íng dÉn sö dông vâ c«ng./wuogongmiji",
		"H¹n chÕ ®iÒu kiÖn më b¶n ®å./mapkaiqi",				
		"T×m hiÓu vŞ trİ ng­êi chØ ®Şnh./Chaxunnpc",
		"T×m hiÓu thêi gian hiÖn t¹i./Timechaxun",
		"Ta muèn cã 1 quyÓn Giang hå chØ nam./yaoshu",		
		"Rêi khái./cancel")
end

function cancel()
end

function Renwuchaxun()
	Say("Ng­¬i muèn hái chuyÖn g×?",
			3,
		"T×m hiÓu nhiÖm vô chñ tuyÕn./#ShowTaskInfo(1,2)",
		"T×m hiÓu nhiÖm vô phô tuyÕn./#ShowTaskInfo(1,3)",
		"Nh©n tiÖn ghĞ qua th«i!/main")	
end

function Chaxunnpc()
	Say("Ng­¬i muèn hái ng­êi nµo?",
			3,
		"T×m ng­êi chØ ®Şnh./GetNpcName",
		"T×m hiÓu nh©n vËt trong thµnh./#ShowMapNpcPos(1)",
		"Nh©n tiÖn ghĞ qua th«i!/main")	
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
		TalkEx("#ShowTaskInfo("..nNum..","..nType..")",{tabTaskFile:getCell(RowNumTab[nNum-1],"TaskInfo")})
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
	AskClientForString("SearchNpcName","",1,14,"Xin nhËp tªn Npc");
	
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
	for i=1,strlen(nNpcName) do
		if strbyte(nNpcName,i) <= 127 then
			TalkEx("GetNpcName",{"Kh«ng thÓ t×m kiÕm, xin nhËp l¹i!"});
			return
		end
	end
	
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
		tinsert(strSay,"Rêi khái/main");
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
		tinsert(strSay,"Rêi khái/main");
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
		tinsert(strSay,"Rêi khái/main");
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
		tinsert(strSay,"Rêi khái/main");
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
	Talk(1,"main","Thêi gian hiÖn t¹i <color=yellow>"..sTimeLeft.."<color>. C¸c vŞ ®¹i hiÖp nhí n¾m b¾t thêi gian!");
end;

function wuogongmiji()		--Îä¹¦ºÍÃØ¼®µÄËµÃ÷
	Say("Ng­¬i muèn hái vÇn ®Ò g×?",
			3,
		"C¸ch sö dông vâ c«ng./Wugongshuoming",
		"C¸ch sö dông mËt tŞch./Mijishuoming",
		"Kh«ng cÇn ®©u!/main")	
end

function Wugongshuoming()		--Îä¹¦ËµÃ÷
	Say("Ng­¬i muèn hái vÇn ®Ò g×?",
			6,
		"Lµm sao sö dông vâ c«ng./shiyongwugong",
		"Lµm sao chän ®¼ng cÊp vâ c«ng./xuanzewugongdengji",
		"Vâ c«ng chuét tr¸i vµ chuét ph¶i cã ph©n biÖt kh«ng?/zuojianyoujian",
		"Lµm sao  ®Ó sö dông c¸c sè phİm t¾t bªn d­íi?/bianjikuaijie",		
		"Ngoµi thanh sè phİm t¾t ra cßn phİm t¾t vâ c«ng kh«ng?/qitakuaijie",	
		"Kh«ng cÇn ®©u!/main")	
end

function shiyongwugong()
		Say("\n Giao diÖn bªn d­íi lµ 2 « tr¸i ph¶i chøa kü n¨ng vâ c«ng, nhÊn vµo chän kü n¨ng muèn sö dông lµ ®­îc.\n \n Thao t¸c: \n NhÊn vµo thanh vâ c«ng bªn d­íi - bªn ph¶i chän vâ c«ng - nhÊn chuét tr¸i lªn vâ c«ng", 0);	
end;

function xuanzewugongdengji()
		Say("\n Muèn sö dông vâ c«ng kh¸c, ph¶i qua thao t¸c sau. \n Tr­íc tiªn nhÊn chiªu thøc m«n ph¸i hoÆc F5. \n Sau ®ã chän vâ c«ng chñ ®éng (vâ c«ng bŞ ®éng kh«ng thÓ chän ®¼ng cÊp) sÏ hiÖn giao diÖn chän vâ c«ng. \n Cuèi cïng chän kü n¨ng thİch hîp, nhÊn phİm t¾t sè lµ ®­îc.",
		1,
		"Trang kÕ/xuanzewugongdengji2")
end

function xuanzewugongdengji2()
		Say("\nVÒ sau nhÊn phİm t¾t sè t­¬ng øng vâ c«ng lµ cã thÓ sö dông cho chuét ph¶i. \n\nThao t¸c: \nNhÊn F5 - më giao diÖn vâ c«ng - nhÊn vâ c«ng bÊt kú (trõ vâ c«ng bŞ ®éng) - më giao diÖn vâ c«ng lùa chän - nhÊn phİm t¾t sè t­¬ng øng vâ c«ng lµ cã thÓ sö dông cho chuét ph¶i.",0)
end

function zuojianyoujian()
		Say("\n Vâ c«ng chuét tr¸i khi nhÊn lªn qu¸i sÏ ®¸nh liªn tôc. \n Vâ c«ng chuét ph¶i khi nhÊn lªn qu¸i nÕu ®ñ m¹nh chØ ®¸nh mét lÇn.", 0);	
end;

function bianjikuaijie()
		Say("\n Thanh phİm t¾t sè gåm 4 tæ cho ng­êi ch¬i sö dông \n NhÊn mòi tªn bªn ph¶i thanh phİm t¾t sè sÏ thÊy ®­îc giao diÖn S¾p xÕp, b¹n cã thÓ ®­a vâ c«ng, trang bŞ, mËt tŞch, ®¹o cô vµo thanh phİm t¾t. \n S¾p xÕp xong thanh phİm t¾t bªn ph¶i cã h×nh khãa mÆc ®Şnh, khãa l¹i lµ kh«ng thÓ thay ®æi. \nTa cã thÓ dïng mòi tªn lªn xuèng thay ®æi thanh phİm t¾t, hoÆc dïng dÊu ~.",
		1,
		"Trang kÕ/bianjikuaijie2")
end
		
function bianjikuaijie2()		
		Say("\n MÆc ®Şnh thanh phİm t¾t theo thø tù 1 - 2 - 3 - 4. Sau khi khãa « phİm t¾t, khi sö dông sÏ bá qua « ®ã, vİ dô: Khãa « 3. theo thø tù sÏ lµ 1 - 2 - 4 - 1.", 0);	
end;

function qitakuaijie()
		Say("\n Ngoµi thanh phİm t¾t sè, trong thanh vâ c«ng nhÊn Q, W, E, A, S, D, Z, X, C ®Ó thiÕt lËp phİm t¾t nhanh cho vâ c«ng ®ã. \n", 0);	
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
		"Kh«ng cÇn ®©u!/main")	
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
		Say("\n Tu luyÖn lµ chÕ t¹o mËt tŞch, th«ng qua thêi gian trªn m¹ng. \n BÕ quan tu luyÖn gióp t¨ng tèc ®ång thêi mét sè chøc n¨ng vµ ho¹t ®éng nh­ Th¸i H­ HuyÔn c¶nh còng trùc tiÕp nhËn ®­îc tu luyÖn.", 0);	
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
		Say("\n NhËn ®Şnh mËt tŞch b»ng c¸ch: \n Thø 1. tÇng sè lÜnh ngé kü n¨ng. \n Thø 2. sè trang phô lôc. \n Thø 3. trŞ céng thªm mËt tŞch. \n V× vËy mét quyÓn mËt tŞch lo¹i tèt ngoµi cÇn tÇn sè kü n¨ng cao ra quan träng sè trang phô lôc vµ céng thªm kü n¨ng.", 0);	
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
		"Ta kh«ng cã b¶n ®å ®Ó vµo trong./main")	
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
		"Ta kh«ng cã b¶n ®å ®Ó vµo trong./main")	
end

function dacaoyuan()
		Say("\n Muèn vµo §¹i th¶o nguyªn ph¶i më hÖ thèng nhiÖm vô Thiªn M«n trËn, hoµn thµnh xong t×m Hµn Trİ Nh­îng.", 0);	
end;

function wangqibulu()
		Say("\n Muèn vµo bé l¹c V­¬ng Kú ph¶i më hÖ thèng nhiÖm vô Thiªn M«n trËn, sau khi hoµn thµnh nhiÖm vô §¹i th¶o nguyªn hèi lé cho lİnh canh bé l¹c hoÆc gióp Nhiªu L©n chuyÓn hµng.", 0);	
end;

function jiangjincun()
		Say("\n Muèn vµo Giang T©n Th«n ph¶i lµm hÖ thèng nhiÖm vô Phong §« Quû thµnh, hoµn thµnh nhiÖm vô n¹n d©n Thµnh §«, t×m Tr­¬ng §×nh.", 0);	
end;

function fengmodong()
		Say("\n Muèn vµo Phong Ma ®éng ph¶i më hÖ thèng nhiÖm vô Phong §« quû thµnh, gióp Tr­¬ng §×nh gi¶i ®éc xong b¾t ®Çu nhiÖm vô gióp D­¬ng NguyÖt s­ th¸i thu thËp U Linh.", 0);	
end;

function fengduguicheng()
		Say("\n Muèn vµo Phong §« Quû thµnh ph¶i më hÖ thèng nhiÖm vô Phong §« quû thµnh, gióp chÕ t¹o §én Èn linh phï, mang vËt phÈm chØ ®Şnh.", 0);	
end;

function donghaihaibin()
		Say("\n Muèn vµo §«ng H¶i H¶i T©n ®¼ng cÊp ph¶i tõ 50 trë lªn, nhËn nhiÖm vô ë ViÔn Tinh [(198.199) B¾c TuyÒn Ch©u].", 0);	
end;

function taohuadao()
		Say("\n Muèn vµo §µo Hoa ®¶o ph¶i më nhiÖm vô §«ng H¶i H¶i T©n, phİa ®«ng §«ng H¶i H¶i T©n 2 t×m thuyÒn phu ngåi thuyÒn.", 0);	
end;

function qingxidong()
		Say("\n Muèn vµo Thanh Khª ®éng ph¶i më hÖ thèng nhiÖm vô H¹ HÇu CÇm ë D­¬ng Ch©u, nhËn nhiÖm vô cøa L«i Th¾ng trong Thanh Khª ®éng.", 0);	
end;

function liangshuidong()
		Say("\n Muèn vµo L­ìng Thñy ®éng ph¶i më hÖ thèng nhiÖm vô H¹ HÇu CÇm D­¬ng Ch©u, gióp L­u HuyÒn Thanh ®Õn Thanh Khª ®éng ®¸nh Th­¬ng thÇn.", 0);	
end;

function qianxunta()
		Say("\n Muèn vµo Thiªn TÇm th¸p ®¼ng cÊp tõ 70 trë lªn.", 0);	
end;

function xishuangbanna()
		Say("\n Muèn vµo T©y Song B¶n N¹p b¾c ®¼ng cÊp tõ 75 trë lªn.", 0);	
end;

function longyandong()
		Say("\n Muèn vµo Long Nh·n ®éng ph¶i më hÖ thèng nhiÖm vô ë TrŞnh Qu¸n Chi §¹i Lı, nhËn nhiÖm vô t×m b¹n ®ång hµnh mÊt tİch ë Long Nh·n ®éng.", 0);	
end;

function yaoshu()
		Say("Ng­¬i gi÷ kü, ®õng ®Ó mÊt n÷a nhĞ!", 0);	
		AddItem(2,0,505,1)
end;

function no()

end