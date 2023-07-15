#include <sourcemod>
#include <sdktools>
#pragma newdecls required

#define ZB_PLUGINSNAME "[ZB]服务器名称设置"
#define ZB_AUTHOR "紫冰"
#define ZB_VERSION "1.0"
#define ZB_URL "http://blog.csdn.net/zbzibing"
#define DEBUG 1

char ZB_OWName[PLATFORM_MAX_PATH] = "【紫冰】";    //定义服务器归属者名称
char ZB_Default_Name[24] = "官方模式(纯净)";
char ZB_ModeName[PLATFORM_MAX_PATH]; //模式名称
char ZB_Description[PLATFORM_MAX_PATH]; //规则介绍
char ZB_Description1[PLATFORM_MAX_PATH] = " \n- 默认限制:投掷,大枪,医疗包\n- 刷枪点刷弹药点开放所有初级武器\n地图是作者重新设计,推荐专家难度体验\n模式更换指令: !tp (投票)\n游戏介绍指令: !ghelp | !hmod\n开发者&DEV:【紫冰】 "
char ZB_PanelTitle[256] ; 
static Handle ZB_SName_Switch,ZB_Default_Switch;


public Plugin myinfo =
{
    name = ZB_PLUGINSNAME,
    author = ZB_AUTHOR,
    description = "设定服务器名称显示功能",
    version = ZB_VERSION,
    url = ZB_URL
}
 
public void OnPluginStart()
{
    RegConsoleCmd("sm_hmod",GameHelp,"游戏模式说明");
    RegConsoleCmd("sm_ghelp",GameHelp,"游戏模式说明");
    RegAdminCmd("zb_realism", realism, ADMFLAG_RCON, "写实模式");
    RegAdminCmd("zb_realism2", realism2, ADMFLAG_RCON, "写实模式");
    RegAdminCmd("zb_bleedout", bleedout, ADMFLAG_RCON, "血流不止");
    RegAdminCmd("zb_bleedout2", bleedout2, ADMFLAG_RCON, "血流不止");

    ZB_SName_Switch = CreateConVar("l4d_sname_switch", "1", "插件开关 1:开启 0:关闭", FCVAR_NOTIFY, true, 0.0,true, 1.0);
    ZB_Default_Switch = CreateConVar("l4d_Default_switch", "1", "默认名称是否启用 1:开启 0:关闭", FCVAR_NOTIFY);
    // ZB_OWName = CreateConVar("l4d_OWName_cfg","【紫冰】","读取服务器名称",FCVAR_NOTIFY);

    /*HOOK事件*/
    HookEvent("round_start",Event_RoundStart); //回合开始

    // AutoExecConfig(true, "ZB_SName");

    SetServerName();
}

public void OnMapStart()
{
    SetServerName();
}

void SetServerName()
{
    if (GetConVarInt(ZB_SName_Switch) == 1)
    {
        if (GetConVarInt(ZB_Default_Switch) == 1)
        {
            // GetConVarString(ZB_OWName, ZB_ModeName, 128);   //取ZB_OWName保存的名称
            Format( ZB_PanelTitle, sizeof( ZB_PanelTitle ), "%s%s",ZB_OWName,ZB_Default_Name);
            SetConVarString(FindConVar("hostname"),ZB_PanelTitle);
        }
        else
        {
            Format( ZB_PanelTitle, sizeof( ZB_PanelTitle ), "%s%s",ZB_OWName,ZB_ModeName);
            SetConVarString(FindConVar("hostname"),ZB_PanelTitle);
        }
    }
}

public Action Event_RoundStart(Event event, const char[] name, bool dontBroadcast)
{
    SetServerName();
    CreateTimer(10.0, roundstart_timer); //提示游戏信息
    return Plugin_Handled;
}

public Action roundstart_timer(Handle timer)
{
    Panel Info = new Panel();
    for( int i = 1; i <= MaxClients; i++ )
    {
        if( GetConVarInt(ZB_Default_Switch) == 1 && i > 0 && IsClientInGame(i) )
        {
            PrintToChat(i,"\x04[紫冰] \x01当前模式:\x03 %s",ZB_Default_Name);
            PrintToChat(i,"\x04[紫冰] \x01规则说明,请输入指令:\x03 !ghelp,\x01查看.");
        }
        else if(i > 0 && IsClientInGame(i))
        {
            SetPanelTitle(Info, ZB_ModeName);
            DrawPanelText(Info, "\n▶ ------------------------------\n模式规则配置:");
            DrawPanelText(Info, ZB_Description);
            DrawPanelText(Info, ZB_Description1);
            Info.DrawItem("关闭");
            Info.Send(i, Handler_DoNothing, 30);

            PrintToChat(i,"\x04[紫冰] \x01当前模式:\x03 %s",ZB_ModeName);
            PrintToChat(i,"\x04[紫冰] \x01规则说明,请输入指令:\x03 !ghelp,\x01查看.");
        }
    }
    delete Info;

    
    return Plugin_Handled;
}

public Action realism(int client,int args)
{
    ZB_ModeName = "写实模式";
    Format( ZB_Description, sizeof( ZB_Description ), "① 无人物,物品光圈轮廓");
    return Plugin_Handled;
}
public Action realism2(int client,int args)
{
    ZB_ModeName = "写实模式2";
    Format( ZB_Description, sizeof( ZB_Description ), "① 无人物,物品光圈轮廓\n② 增加恶劣天气效果\n③ 倒地即死\n④ 丧尸攻击伤害提高\n⑥ 推人次数限制");
    return Plugin_Handled;
}
//血流不止
public Action bleedout(int client,int args)
{
	ZB_ModeName = "血流不止";
	Format( ZB_Description, sizeof( ZB_Description ), "① 开局人物虚血状态\n② 无投掷,无大枪,终点医疗包,只有药丸\n③ 刷枪点刷弹药点开放所有初级武器\n④ 安全屋过关玩家满血奖励");
	return Plugin_Handled;
}
public Action bleedout2(int client,int args)
{
	ZB_ModeName = "血流不止2特感速攻";
	Format( ZB_Description, sizeof( ZB_Description ), "① 开局人物虚血状态\n② 无投掷,无大枪,终点医疗包,只有药丸\n③ 刷枪点刷弹药点开放所有初级武器\n④ 特感复活时间减半\n⑤ 每关安全门出坦克\n⑥ ");
	return Plugin_Handled;
}

public Action GameHelp(int client, int args)
{
    Panel Info = new Panel();

    if( GetConVarInt(ZB_Default_Switch) == 1 )
    {
        SetPanelTitle(Info, ZB_Default_Name);
        DrawPanelText(Info, "\n▶ ------------------------------\n模式规则配置:");
        DrawPanelText(Info, "当前游戏为官方默认配置");
    }
    else
    {
        SetPanelTitle(Info, ZB_ModeName);
        DrawPanelText(Info, "\n▶ ------------------------------\n模式规则配置:");
        DrawPanelText(Info, ZB_Description);
    }
    DrawPanelText(Info, ZB_Description1);

    Info.DrawItem("关闭");
    Info.Send(client, Handler_DoNothing, MENU_TIME_FOREVER);
    
    CloseHandle(Info);

    #if DEBUG
        Format( ZB_PanelTitle, sizeof( ZB_PanelTitle ), "%s%s",ZB_OWName,ZB_ModeName);
        PrintToChatAll("\x04[紫冰] \x01当前模式:\x03 %s",ZB_ModeName);
    #endif

    return Plugin_Handled;
}

public int Handler_DoNothing(Menu menu, MenuAction action, int param1, int param2) 
{
    return 0;
}