function main()
Say ("Tæ tiªn ta ®· ®Şnh c­ ë ®©y rÊt l©u råi, ng­¬i cã thÓ lµm dÊu ë ®©y ®Ó khái l¹c ®­îc.",2,"Hay l¾m! Ta sÏ kh¾c kı hiÖu ë ®©y./yes","Ta tù t×m hiÓu vËy!/no")
end

function yes()
i=AddRecord()
if i==0 then
TaskTip("B¹n ch­a cã kü n¨ng luyÖn bïa, kh«ng thÓ lµm kı hiÖu!")
elseif i==1 then
TaskTip("Kü n¨ng luyÖn bïa cña b¹n ch­a ®¹t ®Õn cÊp 3, kh«ng thÓ lµm kı hiÖu!")
elseif i==2 then
TaskTip("B¹n qu¶ tinh m¾t! Tho¸ng chèc ®· nhí ®­îc vŞ trİ ë ®©y!")
else
end 
end

function no()
end
