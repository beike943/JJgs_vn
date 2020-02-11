--°ÙĞÕÀî»ª½Å±¾
Include("\\script\\task\\global_task\\task_id.lua")
function main()
	if GetTask(Task_id_003) ~= 1 then
		Talk(1,"","<color=green>B¸ t¸nh Lı Hoa: <color>thêi tiÕt h«m nay thËt ®Ñp!");
	else
		local tbString = {
				"<color=green>"..GetName()..":<color>§¹i ca, gÇn ®©y b¸ t¸nh trong vïng nµy ®Òu kháe chø?",
				"<color=green>B¸ t¸nh Lı Hoa:<color>NhËt NguyÖt ThÇn Gi¸o, NhÊt thèng giang hå, nhËt xuÊt ®«ng ph­¬ng, nhÊt thÕ bÊt b¹i.",
				"<color=green>"..GetName()..":<color>VŞ ®¹i ca nµy ®ang nãi g× thÕ, ta ®Õn xem vŞ ®¹i tû kia xem sao.",
			}
		Talk(3,"deal_task",tbString[1],tbString[2],tbString[3]);
	end
end

function deal_task()
	SetTask(Task_id_003,GetTask(Task_id_003)+1);
end