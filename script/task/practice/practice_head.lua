--闭关练习
--create by lizhi
--2005-9-10 15:52
--闭关修炼的头文件
--created by lizhi
--2005-9-11 11:50
--说明：任务变量使用情况：1700，1701，1702，记录玩家进入修炼之前的坐标；1703代表是否回答超时
--触发器使用情况：400～414


Include("\\script\\class\\ktabfile.lua");

--是否有提问
IsAskQuestion = 0;

--计时触发器
TIME_RANDOM_QUESTION = 410;
TIME_PRACTICE = 411;
TIME_ANSWER = 412;

LEAVE_MAP = 413;    --rect触发器
LEAVE_GAME = 414;   --log触发器

--修炼的任务变量，用了3个，分别记录坐标
TASK_PRACTICE = 1700;
TASK_ANSWER = 1703; --代表是否超过时间，暂时使用
SKILLENABLE = 1906;		--是否能够使用武功，和擂台使用相同的任务变量

NORMAL_SPEED = 0;   --普通修炼速度
DOUBLE_SPEED = 1;   --一倍速度修炼(为原来的2倍)

ANSWER_TIME = 60;   --回答问题的时限为60秒
--门派对应的rect触发器
--GetPlayerFaction()
--少林  1
--武当  2
--峨嵋  3
--丐帮  4
--唐门  5
--杨门	6
--五毒	7
rect_trigger_table = {
    {1500, 400},
    {1501, 400},
    {1502, 400},
    {1503, 400},
    {1504, 400},
    {1505, 400},
    {1506, 400}
};

--各个门派的师门令牌
--门派顺序：少林，武当，峨嵋，丐帮，唐门，杨门，五毒
cards_table = {
    {2, 0, 205},
    {2, 0, 206},
    {2, 0, 207},
    {2, 0, 208},
    {2, 0, 209},
    {2, 0, 350},
    {2, 0, 390},
};

--门派对应的修炼地图
--顺序还是为少林，武当，峨嵋，丐帮，唐门，杨门，五毒
room_table = {
    {814, 1623, 3164},
    {812, 1608, 3219},
    {816, 1623, 3164},
    {815, 1360, 3136},
    {813, 1686, 2994},
    {817, 1457, 2972},
    {422, 1628,	3508},
};

--记录问题的表格
QT_FILE = new(KTabFile, "\\settings\\task\\question_table.txt");
--表头（列名称）
QT_TYPE = {
    ["QuestionID"] = 1,
    ["Question"] = 2,
    ["CorrectAnswer"] = 3,
    ["Answer2"] = 4,
    ["Answer3"] = 5,
    ["Answer4"] = 6,
    ["AwardPopurMin"] = 7,
    ["AwardPopurMax"] = 8,
    ["AwardMoney"] = 9
};
--表总行数
QT_ROWCOUNT = tonumber(QT_FILE:getRow());