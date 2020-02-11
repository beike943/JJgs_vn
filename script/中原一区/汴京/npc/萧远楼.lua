--Code by PhucnG 23-10-2014
--Event Den Bu Server Hoa Phung
Include("\\script\\newbattles\\sign_up_npc.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\lib\\globalfunctions.lua");


--g_sNpcName = "Tiªu ViÔn L©u";
g_sNpcName = "TiÓu Ngäc";
g_nNpcCamp = LIAO_ID;
szNpcName = "<color=green>Tiªu ViÔn L©u: <color>"

function main()

		if GetTargetNpcName() == "Tiªu ViÔn L©u" then
			-- if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then -- Server Háa Phông
				local tbSay = {}
				local nDate = tonumber(date("%Y%m%d"))
				if nDate >= 20141121 then
					tinsert(tbSay,"Ta muèn nhËn ®iÓm cña chiÕn tr­êng 4x/Denbu_NhanThuong4x")
					tinsert(tbSay,"Ta muèn nhËn ®iÓm cña chiÕn tr­êng 6x/Denbu_NhanThuong6x")
				end
				
				tinsert(tbSay,"Rêi khái/gf_DoNothing")
				Say(szNpcName.."§Ó cã thÓ bï ®¾p hÕt mäi lçi lÇm, c¸c h¹ h·y chän phÇn th­ëng cho m×nh. \n",getn(tbSay),tbSay)
				return
			-- else
				--Talk(1,"",szNpcName.."Tr¨ng thanh giã m¸t, c¸c h¹ cã viÖc cÇn chi?")
				--return
			-- end
		end		
		
		if random(1,50) == 1 then
				NpcChat(GetTargetNpc(),"§Ó khİch lÖ t­íng sÜ §¹i Liªu ta anh dòng giÕt giÆc, nh÷ng ai tham gia trËn ®¸nh Nh¹n m«n quan ®Òu ®­îc nhËn Linh Th¹ch!");
		end;
		battle_main();			
end;

function Denbu_NhanThuong4x()
	local tbSay = {}
	tinsert(tbSay,"NhËn 600 ®iÓm c«ng tr¹ng vµ 10.000.000 ®iÓm kinh nghiÖm/#Denbu_NhanThuong4x_01(1)")
	tinsert(tbSay,"NhËn 1200 ®iÓm c«ng tr¹ng vµ 15.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ch­¬ng)/#Denbu_NhanThuong4x_01(2)")
	tinsert(tbSay,"NhËn 3000 ®iÓm c«ng tr¹ng vµ 20.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ®¹i)/#Denbu_NhanThuong4x_01(3)")
	tinsert(tbSay,"NhËn 6000 ®iÓm c«ng tr¹ng vµ 30.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng huy hoµng)/#Denbu_NhanThuong4x_01(4)")
	tinsert(tbSay,"NhËn 8400 ®iÓm c«ng tr¹ng vµ 45.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng vinh dù)/#Denbu_NhanThuong4x_01(5)")
	tinsert(tbSay,"Rêi khái/gf_DoNothing")
	Say(szNpcName.."C¸c h¹ muèn nhËn g× nµo? \n",getn(tbSay),tbSay)
end

function Denbu_NhanThuong4x_01(nChoice)
	if gf_GetTaskByte(TSK_DENBU_HOAPHUNG,3) == 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng trong ngµy. Xin vui lßng quay l¹i ngµy h«m sau!")
		return
	end
	
	if nChoice == 1 then
		gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
		--NhËn C«ng tr¹ng
		gf_EventGiveCustomAward(31, 600, 1, "DenBuHoaPhung", "Nhan")
		
		--NhËn kinh nghiÖm
		gf_EventGiveCustomAward(1, 10000000, 1, "DenBuHoaPhung", "Nhan")
	elseif nChoice == 2 then
		if GetItemCount(2,1,9999) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Ch­¬ng trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		if DelItem(2,1,9999,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 1200, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 15000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 3 then
		if GetItemCount(2,1,9998) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng §¹i trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,9998,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 3000, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 20000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 4 then
		if GetItemCount(2,1,9977) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Huy Hoµng trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,9977,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 6000, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 30000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 5 then
		if GetItemCount(2,1,30642) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Ch­¬ng Vinh Dù trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,30642,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
		
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 8400, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 45000000, 1, "DenBuHoaPhung", "Nhan")
		end
	end
end

function Denbu_NhanThuong6x()
	local tbSay = {}
	tinsert(tbSay,"NhËn 1200 ®iÓm c«ng tr¹ng vµ 20.000.000 ®iÓm kinh nghiÖm/#Denbu_NhanThuong6x_01(1)")
	tinsert(tbSay,"NhËn 2400 ®iÓm c«ng tr¹ng vµ 30.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ch­¬ng)/#Denbu_NhanThuong6x_01(2)")
	tinsert(tbSay,"NhËn 6000 ®iÓm c«ng tr¹ng vµ 40.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ®¹i)/#Denbu_NhanThuong6x_01(3)")
	tinsert(tbSay,"NhËn 12000 ®iÓm c«ng tr¹ng vµ 60.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng huy hoµng)/#Denbu_NhanThuong6x_01(4)")
	tinsert(tbSay,"NhËn 16800 ®iÓm c«ng tr¹ng vµ 90.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng vinh dù)/#Denbu_NhanThuong6x_01(5)")
	tinsert(tbSay,"Rêi khái/gf_DoNothing")
	Say(szNpcName.."C¸c h¹ muèn nhËn g× nµo? \n",getn(tbSay),tbSay)
end

function Denbu_NhanThuong6x_01(nChoice)
	if gf_GetTaskByte(TSK_DENBU_HOAPHUNG,4) == 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng trong ngµy. Xin vui lßng quay l¹i ngµy h«m sau!")
		return
	end

	if nChoice == 1 then
		gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
		--NhËn C«ng tr¹ng
		gf_EventGiveCustomAward(31, 1200, 1, "DenBuHoaPhung", "Nhan")
		
		--NhËn kinh nghiÖm
		gf_EventGiveCustomAward(1, 20000000, 1, "DenBuHoaPhung", "Nhan")
	elseif nChoice == 2 then
		if GetItemCount(2,1,9999) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Ch­¬ng trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		if DelItem(2,1,9999,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 2400, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 30000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 3 then
		if GetItemCount(2,1,9998) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng §¹i trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,9998,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 6000, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 40000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 4 then
		if GetItemCount(2,1,9977) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Huy Hoµng trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,9977,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 12000, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 60000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 5 then
		if GetItemCount(2,1,30642) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Ch­¬ng Vinh Dù trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,30642,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 16800, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 90000000, 1, "DenBuHoaPhung", "Nhan")
		end
	end
end


