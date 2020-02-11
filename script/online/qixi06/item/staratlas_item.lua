--file name:staratlas_item.lua
--author:yanjun
--create date:2006-6-26
--describe:06ÄêÆßÏ¦»î¶¯ÐÇÐÇµØÍ¼½Å±¾
Include("\\script\\online\\qixi06\\qixi06_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
IB_VERSION = 1;

function OnUse()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
		SetTask(TASK_FIND_STAR_COUNT,0);
	end;
	local nFindNum = GetTask(TASK_FIND_STAR_COUNT);
	if nFindNum >= 7 then
		gf_ShowMsg("H«m nay ng­¬i ®· t×m ®­îc 7 ng«i sao, mçi ng­êi mçi ngµy nhiÒu nhÊt chØ cã thÓ t×m <color=yellow>7<color> ng«i sao.",0)
		return 0;
	end;
	local sMapName = "";
	local nMapID,nMapX,nMapY = 0,0,0;
	local nCurMapID = GetWorldPos();
	local nRow = 0;
	local nRetCode = 0;
	local nRandomNum = 0;
	local nOldPlayerIndex = PlayerIndex;
	if GetTask(TASK_POS_INDEX) ~= 0 then
		nRow = GetTask(TASK_POS_INDEX);
		if nRow < 3 then
			WriteLog("[Lçi ho¹t ®éng ThÊt TÞch]:"..GetName().."Khi nhËn ®­îc h­íng dÉn vÞ trÝ ng«i sao, nRandomRow nhá h¬n 3, trÞ lµ:"..nRow)
			SetTask(TASK_POS_INDEX,3);	--ÉèÎª£³
		end;
		sMapName = tabPos:getCell(nRow,3);
		nMapID = tonumber(tabPos:getCell(nRow,4));
		nMapX = tonumber(tabPos:getCell(nRow,5));
		nMapY = tonumber(tabPos:getCell(nRow,6));
		local nItemIdx = 0;
		if nCurMapID == nMapID then
			if is_around_the_star() == 1 then
				if DelItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],1) == 1 then
					nRetCode,nItemIdx = AddItem(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4],1);
					SetItemExpireTime(nItemIdx,get_time_left());
					nFindNum = nFindNum + 1;
					if nRetCode == 1 then
						Talk(1,"","Theo täa ®é b¶n ®å, chç nµy lµ n¬i Sao b¨ng r¬i, b¹n nhËn ®­îc <color=yellow>"..t7XiItem["star"][1].."<color>");
						WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."NhËn ®­îc"..t7XiItem["star"][1]);
						Msg2Player("H«m nay ng­¬i nhËn ®­îc "..nFindNum.." "..t7XiItem["star"][1]);
					else
						WriteLog("[Lçi ho¹t ®éng ThÊt TÞch]:"..GetName().."Lçi khi nhËn ®­îc Sao b¨ng, trÞ quay l¹i chØ lÖnh AddItem:"..nRetCode);
					end;
					SetTask(TASK_FIND_STAR_COUNT,nFindNum);
					SetTask(TASK_POS_INDEX,0);
					local nExpAward = 0;
					local nLevel = GetLevel();
					if Is_Lovers_Team() == 1 then
						for i=1,2 do
							PlayerIndex = GetTeamMember(i);						
							nLevel = GetLevel();	
							if nOldPlayerIndex == PlayerIndex then
								if random(1,100) <= 80 then
									nRetCode,nItemIdx = AddItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],1);
									Msg2Player("Chóc mõng ng­¬i nhËn ®­îc 1 tÊm "..t7XiItem["atlas"][1]);
									WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."NhËn ®­îc thªm 1 tÊm Tinh Tinh §Þa §å");
								end;
							else
								if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
									SetTask(TASK_FIND_STAR_COUNT,0);
								end;
							end;
							if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
								SetTask(TASK_ADDED_AWARD_FINDSTAR_DATE,nDate);
								if nLevel ~= 99 then
									if IB_VERSION == 0 then
										nExpAward = floor((nLevel^2)/(80^2)*5180000);
									else
										nExpAward = floor((nLevel^2)/(80^2)*4680000);
									end;
									ModifyExp(nExpAward);
									Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");
									WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."§· nhËn phÇn th­ëng song nh©n th¾p sao ThÊt TÞch"..nExpAward.." ®iÓm kinh nghiÖm");										
								else
									AddItem(2,1,2642,2);
									Msg2Player("B¹n nhËn ®­îc 2 Tói b¶o th¹ch");
									WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."NhËn phÇn th­ëng song nh©n th¾p sao ThÊt TÞch: 2 Tói b¶o th¹ch");
								end;
							else
								Msg2Player("H«m nay ng­¬i ®· nhËn phÇn th­ëng kinh nghiÖm th¾p sao (hoÆc Tói b¶o th¹ch), lÇn nµy ng­¬i kh«ng nhËn ®­îc phÇn th­ëng kinh nghiÖm (hoÆc Tói b¶o th¹ch)");
							end;
						end;
						PlayerIndex = nOldPlayerIndex;
					else
						if GetTask(TASK_ADDED_AWARD_FINDSTAR_DATE) < nDate then
							SetTask(TASK_ADDED_AWARD_FINDSTAR_DATE,nDate);
							if nLevel ~= 99 then
								if IB_VERSION == 0 then
									nExpAward = floor((nLevel^2)/(80^2)*5180000*0.8);
								else
									nExpAward = floor((nLevel^2)/(80^2)*4680000*0.8);
								end;
								ModifyExp(nExpAward);
								Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");
								WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."§· nhËn phÇn thuëng ThÊt TÞch t×m sao c¸ nh©n:"..nExpAward.." ®iÓm kinh nghiÖm");										
							else
								AddItem(2,1,2642,2);
								Msg2Player("B¹n nhËn ®­îc 2 Tói b¶o th¹ch");
								WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."NhËn phÇn thuëng ThÊt TÞch t×m sao c¸ nh©n: 2 Tói b¶o th¹ch");
							end;
						else
							Msg2Player("H«m nay ng­¬i ®· nhËn phÇn th­ëng kinh nghiÖm th¾p sao (hoÆc Tói b¶o th¹ch), lÇn nµy ng­¬i kh«ng nhËn ®­îc phÇn th­ëng kinh nghiÖm (hoÆc Tói b¶o th¹ch)");
						end;
					end;
					WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."T×m ®­îc 1 ng«i sao");
				end;
			else
				Talk(1,"","Theo täa ®é b¶n ®å, chç nµy kh«ng ph¶i lµ n¬i Sao b¨ng r¬i nh­ng b¹n ph¸t hiÖn ë <color=yellow>"..floor(nMapX/8)..","..floor(nMapY/16).."(täa ®é)<color> cã vËt ®ang ph¸t s¸ng.");
			end;
		else
			Talk(1,"","Theo täa ®é b¶n ®å, chç nµy kh«ng ph¶i lµ n¬i Sao b¨ng r¬i, hay lµ b»ng h÷u ®Õn <color=yellow>"..sMapName.."<color> xem thö!");
		end;
	else
		local nTotalPosCount = tabPos:getRow();	--µÃµ½×ÜÐÐÊý
		local nRandomRow = random(3,nTotalPosCount);	--Ëæ»úÒ»¸öÎ»ÖÃ
		if nRandomRow < 3 then
			WriteLog("[Lçi ho¹t ®éng ThÊt TÞch]:"..GetName().."Khi nhËn ®­îc h­íng dÉn vÞ trÝ ng«i sao, nRandomRow nhá h¬n 3, trÞ lµ:"..nRandomRow..", trÞ sè nTotalPosCount:"..nTotalPosCount)
			SetTask(TASK_POS_INDEX,3);	--ÉèÎª£³
		end;
		sMapName = tabPos:getCell(nRandomRow,3);
		nMapID = tonumber(tabPos:getCell(nRandomRow,4));
		nMapX = tonumber(tabPos:getCell(nRandomRow,5));
		nMapY = tonumber(tabPos:getCell(nRandomRow,6));
		SetTask(TASK_POS_INDEX,nRandomRow);
		Talk(1,"","GÇn ®©y th«n d©n ®ån r»ng thÊy 1 ng«i sao r¬i ë <color=yellow>"..sMapName.."<color>, v« cïng tr¸ng lÖ.");
	end;
end;
--ÅÐ¶ÏÊÇ·ñÔÚÄ¿±êµØµã¸½½ü
function is_around_the_star()
	local nCurMapID,nCurMapX,nCurMapY = GetWorldPos();
	local nMapID,nMapX,nMapY = 0,0,0;
	local nRow = GetTask(TASK_POS_INDEX);
	nMapID = tonumber(tabPos:getCell(nRow,4));
	nMapX = tonumber(tabPos:getCell(nRow,5));
	nMapY = tonumber(tabPos:getCell(nRow,6));
	if nCurMapID == nMapID then
		if floor(nCurMapX/8) == floor(nMapX/8) and floor(nCurMapY/16) == floor(nMapY/16) then
			return 1;
		else
			return 0;
		end;
	else
		return 0;
	end;
end;

function get_time_left()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nTimeLeft = (23-nHour)*3600+(59-nMin)*60+(59-nSec)
	return nTimeLeft;
end;
