--°ÙĞÕĞ¡´ä½Å±¾
Include("\\script\\task\\global_task\\task_id.lua")
function main()
	if GetTask(Task_id_003) ~= 2 then
		Talk(1,"","<color=green>B¸ t¸nh tiÓu Thóy: <color> nh÷ng con diÒu nµy thËt ®Ñp!");
	else
		local tbString = {
				"<color=green>"..GetName()..":<color>Tû tû, gÇn ®©y b¸ t¸nh trong vïng nµy ®Òu kháe chø?",
				"<color=green>B¸ t¸nh tiÓu Thóy: <color>NhËt NguyÖt ThÇn Gi¸o, NhÊt thèng giang hå, nhËt xuÊt ®«ng ph­¬ng, nhÊt thÕ bÊt b¹i.",
				"<color=green>"..GetName()..":<color>Cã ph¶i mäi ng­êi ®· tróng ®éc cña NhËt NguyÖt ThÇn Gi¸o kh«ng? §©y lµ lo¹i ®éc giµ, c¶ Long M«n TrÊn còng kh«ng mét ai cã thÓ b¸o cho ta biÕt ®­îc, Nh¹c ch­ëng m«n cã dÆn ta r»ng b¸ t¸nh t¹i BiÖn Kinh ®Òu tóc trİ ®a m­u, häc thøc uyªn b¸c, hi väng hä cã thÓ biÕt ®­îc ®Òu g× ®ã.",
			}
		Talk(3,"deal_task",tbString[1],tbString[2],tbString[3]);
	end
end

function deal_task()
		SetTask(Task_id_003,GetTask(Task_id_003)+1);
end