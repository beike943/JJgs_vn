--====================================================
--create by baiyun 2009.6.3
--describe:Ô½ÄÏ°æ7ÔÂ·İ»î¶¯Ö®ÆßÕù¶áÓ¢ĞÛÖ®Î»£¬åĞÒ£Ê¹Õß½Å±¾
--ps:¸Ã»î¶¯Ö»¾ÙĞĞÔÚĞÂ·ş£¬Ç°Ê®ÃûÓÉÈË¹¤Ñ¡³öÀ´£¬´Ë½Å±¾Ä¿Ç°Ö»ÊµÏÖ·¢½±
--====================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	do return end
end

function get_aword()
	if GetTask(TASK_YINGXIONG_GET) == 1 then
		Talk(1, "", "<color=green>Tiªu Dao Sø Gi¶<color>: §¹i hiÖp ®· nhËn phÇn th­ëng råi, kh«ng thÓ nhËn tiÕp ®­îc n÷a.");
		return
	end
	if GetExtPoint(1) < 2 then
		Talk(1, "", "<color=green>Tiªu Dao Sø Gi¶<color>: G¹t ta µ? Ng­¬i mµ còng lµ cao thñ sao?");
		return
	end
	--ÅĞ¶ÏÍæ¼ÒÊÇ·ñÓĞ×Ê¸ñ
		--ÕâÀïÌí¼ÓÅĞ¶ÏµÄ´úÂë
	--ÅĞ¶ÏÍê³É
	local nBody = GetBody();
	if gf_Judge_Room_Weight(3, 400, " ") == 0 then
		return
	end
	if GetExtPoint(1) == 2 then
		if PayExtPoint(1,2) == 1 then			
			for i = 1, 3 do
				local nRet = AddItem(tb_yingxiong_aword[i][nBody][2], tb_yingxiong_aword[i][nBody][3], tb_yingxiong_aword[i][nBody][4], 1,1,-1,-1,-1,-1,-1,-1)
				if nRet == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 ".. tb_yingxiong_aword[i][nBody][1])
					WriteLogEx("Hoat dong thang 6","Tiªu Giao Sø Gi¶",1, tb_yingxiong_aword[i][nBody][1])
				else
					WriteLogEx("Hoat dong thang 6","add item thÊt b¹i",1, tb_yingxiong_aword[i][nBody][1])
				end
			end			
			SetTask(TASK_YINGXIONG_GET, 1);
		end
	end
end

function nothing()
end