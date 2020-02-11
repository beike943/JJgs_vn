Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");

function main()
local nTaskValuem = FN_GetTaskState(FN_YMM);

	if (nTaskValuem==3) then
		task_007();
		return
  end;
	i=random(1,4)
	if i==1 then 
		Talk(1,"","§øng l¹i! Ch¸n sèng råi sao d¸m x©m nhËp hoµng cung!")
	elseif i==2 then
		Talk(1,"","£! Më to con m¾t xem ®©y lµ ®©u! Cót xÐo!")
	elseif i==3 then
		Talk(1,"","CÊm ®Þa hoµng cung tù ý x«ng vµo giÕt kh«ng tha!")
	else
		Talk(1,"","Quan viªn d­íi tø phÈm ch­a ®­îc truyÒn kh«ng ®­îc phÐp vµo cung tr¸i lÖnh chÐm!")
	end
end
