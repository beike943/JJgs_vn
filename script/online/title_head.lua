TITLE_QRYX_NUM = 30

function RemoveAllFestivalTitle()
	for i=1,3 do
		RemoveTitle(3,i)	--删除称号大类为3，小类为1,2,3的称号（大类为3的称号内容可参考title.txt）
	end
	for i=1,TITLE_QRYX_NUM do
		RemoveTitle(4,i)
	end
end