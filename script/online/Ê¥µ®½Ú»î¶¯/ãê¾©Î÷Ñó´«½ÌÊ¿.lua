--=============================================
--create by yanjun 2005.12.12
--describe:ãê¾©Î÷Ñó´«½ÌÊ¿(Ö°ÄÜNPC)½Å±¾
--=============================================
Include("\\script\\online\\Ê¥µ®½Ú»î¶¯\\christmas_head.lua")

function main()
	if GetTrigger(3000) == 0 then
		Say("Chóa sÏ phï hé b¹n!",0)
		return 0
	end
	SelTab = {
		"§· thu thËp ®ñ vËt liÖu cÇn thiÕt, ta muèn ®æi lÊy quµ Gi¸ng Sinh./get_hat_box",
		"Ta muèn t×m hiÓu ho¹t ®éng Gi¸ng Sinh./know_detail",
		"Merry Christmas, Gi¸ng Sinh vui vÎ!/no",
		}
	Say("Chóc b¹n Gi¸ng Sinh vui vÎ, Merry Christmas!",3,SelTab);

end

function know_detail()
	Talk(8,"","LÔ Gi¸ng Sinh b¾t nguån tõ Ph­¬ng T©y, sau ®ã ®­îc truyÒn ®Õn Trung Nguyªn.","Gi¸o héi chóng t«i ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u trªn nh÷ng c©y th«ng cã treo quµ gi¸ng sinh, mçi ngµy ®óng 21h vµ 23h sÏ ph©n ph¸t, mçi c©y th«ng sÏ ph¸t 100 phÇn quµ, tæng céng lµ 600 phÇn quµ gi¸ng sinh, mçi ngµy mçi ng­êi chØ nhËn 1 phÇn.","Trong thêi gian diÔn ra ho¹t ®éng lÔ Gi¸ng Sinh, n¹p thÎ sÏ cã c¬ héi nhËn ®­îc 1 trong 3 mãn ngo¹i trang Gi¸ng Sinh.","TiÖm Nam phôc, n÷ trang cã b¸n ngo¹i trang Gi¸ng Sinh.","TiÖm Kim hoµn cã b¸n thiÖp chóc Gi¸ng Sinh, sö dông sÏ nhËn ®­îc danh hiÖu Gi¸ng Sinh vui vÎ MERRY CHRISTMAS.","B¹n thu thËp ®ñ vËt liÖu cã thÓ quay l¹i ®©y ®æi lÊy quµ Gi¸ng Sinh, lÇn ®Çu cã thÓ nhËn ®­îc nãn Gi¸ng Sinh, nh÷ng lÇn sau sÏ nhËn ®­îc hép quµ Gi¸ng Sinh.","Trong qu¸ tr×nh ®¸nh qu¸i cã thÓ nhËn ®­îc ví Gi¸ng Sinh dïng ®Ó ®æi lÔ phÈm.","Thêi gian ho¹t ®éng cña LÔ Gi¸ng Sinh lµ tõ ngµy 23/12 ®Õn 28/12")
end

function get_hat_box()
	if CHRISTMAS_SWITCH == 0 then
		Say("Ho¹t ®éng Gi¸ng Sinh vÉn ch­a b¾t ®Çu mµ!",0)
		return 0
	end
	if GetLevel() < 10 then
		Say("Xin lçi! Quı kh¸ch ch­a ®¹t ®Õn cÊp <color=red>10<color> ch­a thÓ nhËn quµ.",0)
		return 0
	end
	if GetItemCount(2,2,62) >= 10 and GetItemCount(0,200,21) >= 1 and GetItemCount(2,9,1) >= 10 
		and GetItemCount(2,1,2) >= 10 and GetItemCount(2,2,21) >= 10 and GetItemCount(2,1,5) >= 10 
		and GetItemCount(2,2,30) >= 10 and GetItemCount(2,1,155) >= 10 then
		
		if GetTask(TASK_GOT_HAT) == 1 and GetItemCount(2,1,208) < 10 then --Èç¹ûÁìÈ¡¹ıÃ±×ÓÇÒÉíÉÏÊ¥µ®Ã±ÉÙÓÚ10¸ö
			Say("Ph¶i lÊy <color=yellow>10 ®«i ví Gi¸ng Sinh<color> míi ®æi ®­îc hép quµ Gi¸ng Sinh.",0)
			return 0
		end
		
		if DelItem(2,2,62,10) == 1 and DelItem(0,200,21,1) == 1 and DelItem(2,9,1,10) == 1
			and DelItem(2,1,2,10) == 1 and DelItem(2,2,21,10) == 1 and DelItem(2,1,5,10) == 1
			and DelItem(2,2,30,10) == 1 and DelItem(2,1,155,10) == 1 then
			local nBody = GetBody()
			if nBody == 1 then
				if GetTask(TASK_GOT_HAT) == 0 then --Ã»ÓĞÁì¹ıÊ¥µ®Ã±
					nRetCode = AddItem(0,108,109,1,1)--±ê×¼Ê¥µ®Ã±
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c¸i nãn gi¸ng sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then 
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 hép quµ gi¸ng sinh"
				end
			elseif nBody == 2 then
				if GetTask(TASK_GOT_HAT) == 0 then 
					nRetCode = AddItem(0,108,110,1,1)--¿ıÎàÊ¥µ®Ã±
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c¸i nãn gi¸ng sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 hép quµ gi¸ng sinh"
				end
			elseif nBody == 3 then
				if GetTask(TASK_GOT_HAT) == 0 then 
					nRetCode = AddItem(0,108,112,1,1)--ĞÔ¸ĞÊ¥µ®Ã±
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c¸i nãn gi¸ng sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 hép quµ gi¸ng sinh"
				end
			elseif nBody == 4 then
				if GetTask(TASK_GOT_HAT) == 0 then 
					nRetCode = AddItem(0,108,111,1,1)--½¿Ğ¡Ê¥µ®Ã±
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c¸i nãn gi¸ng sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 hép quµ gi¸ng sinh"
				end
			end
			if nRetCode == 0 then
				--Say("±³°üÀïµÄ¿Õ¼ä²»¹»£¬ÇëÕûÀíÒ»ÏÂ±³°üÀïÃæµÄ¶«Î÷ÔÙÀ´ÁìÈ¡¡£")
				Say("NhËn vËt phÈm thÊt b¹i!",0)
				return 0
			else
				Msg2Player("B¹n nhËn ®­îc "..strPresent..".")
			end
		end
	else
		local strSex
		local nSex = GetSex()
		if nSex == 1 then
			strSex = "Quı «ng"
		elseif nSex == 2 then
			strSex = "Quı Bµ"
		else
			strSex = "¤ng/Bµ"
		end
		Say("Xin lçi, h×nh nh­"..strSex.." vÉn ch­a ®ñ nguyªn liÖu lµm quµ Gi¸ng Sinh. CÇn cã: <color=red>10<color> <color=yellow>sîi ny l«ng<color>, <color=red>1<color> <color=yellow>Ngäc n÷ thoa<color>, <color=red>10<color> <color=yellow>L«ng thá<color>, <color=red>10<color> <color=yellow>§u«i thá<color>, <color=red>10<color> <color=yellow>V¶i ®en<color>, <color=red>10<color> <color=yellow>L«ng sãi<color>, <color=red>10<color> <color=yellow>Chu sa<color>, <color=red>10<color> <color=yellow>Hå b× mao<color>.",0)
	end		
end

function no()

end
