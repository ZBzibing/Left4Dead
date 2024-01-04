#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required
 
public Plugin myinfo = 
{
	name = "[ZB]尸潮引发修复",
	author = "作者:紫冰",
	description = "防止开启机关后,人类快速通过机关,没有丧尸与感染者",
	version = "1.0",
	url = ""
}

public void OnPluginStart()
{
	RegAdminCmd("sm_zmob", Command_ZspawnMob, ADMFLAG_ROOT, "触发尸潮.");
	RegServerCmd("sm_zmobs", Scmd_zspawnmob, "服务器触发尸潮");
	HookEvent("explain_lift_button", Event_explainliftbutton, EventHookMode_PostNoCopy);
}

public void Event_explainliftbutton(Event event, const char[] name, bool dontBroadcast)
{
	CreateTimer(0.5, Timer_zmob);
}

public Action Timer_zmob(Handle timer)
{
	ZspawnMob(timer);
}

public Action Command_ZspawnMob(int client, int args)
{
	ZspawnMob(client);
}

public Action Scmd_zspawnmob(int args)
{
	zspawnmob();
}

public Action zspawnmob()
{
	int mobs = 3;
	int flags = GetCommandFlags("z_spawn");
	SetCommandFlags("z_spawn", flags & ~FCVAR_CHEAT);
	for(int i=0; i<mobs; i++)
	{
		ServerCommand("z_spawn mob auto");
	}
	SetCommandFlags("z_spawn", flags);
	PrintToChatAll("\x04[紫冰] \x03服务器尸潮指令触发了!!!");
}

public void ZspawnMob(int client)
{
	int mobs = 3;
	int flags = GetCommandFlags("z_spawn");
	SetCommandFlags("z_spawn", flags & ~FCVAR_CHEAT);
	for(int i=0; i<mobs; i++)
	{
		FakeClientCommand(client, "z_spawn mob");
	}
	SetCommandFlags("z_spawn", flags);
	PrintToChatAll("\x04[紫冰]\x03机关尸潮修复!!!");
}

stock void GiveCommand(int client, char[] strCommand, char[] strParam1)
{
	int flags = GetCommandFlags(strCommand)
	SetCommandFlags(strCommand, flags & ~FCVAR_CHEAT)
	FakeClientCommand(client, "%s %s", strCommand, strParam1)
	SetCommandFlags(strCommand, flags)
}

stock void GiveWeapon(int client) // give client random weapon
{
	GiveCommand(client, "z_spawn", "mob auto")
}