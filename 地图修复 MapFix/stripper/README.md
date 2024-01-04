### [什么是 Stripper:Source](#)
    这是一款小巧而灵活的插件，可让您在地图替换或过滤并添加实体，与 botman 为《半条命 1》开发的 Stripper2 非常相似。你可以用特定值或正则表达式过滤掉实体，或声明要添加的新实体。你还可以指定每个地图的配置选项。

### [如何安装地图 Stripper:Source](#)
1. 首先，确保运行环境支持库已安装。 你需要的 Metamod:source 1.8.6 或者更高的版本.
2. 根据你的操作系统下载相对应的版本
3. 解压ZIP文件到你的ADDONS目录下
4. 完成!


#### Stripper下载地址 : [Stripper:source](http://www.bailopan.net/stripper/)  
推荐下载整合基础包 : [SM基础包](https://github.com/ZBzibing/Left4Dead/tree/main/SM%E5%9F%BA%E7%A1%80%E5%8C%85)

### [如何使用 Stripper:Source](#)
```c
modify:
{
	match:
	{	
	"model" "models/props_junk/garbage_metalcan002a.mdl"
	"classname" "prop_physics_multiplayer"
	}
	replace:
	{
	"classname" "hostage_entity"
	}
	delete:
	{
	"model" "models/props_junk/garbage_metalcan002a.mdl"
	}
	insert:
	{
	"scale" "0.99"
	}
}
```
匹配(match) : 匹配所有列出的实体模型和类名。 您可以使用正则表达式(/ /)的键值。  
替换(replace): 取代任何属性的值,有相同的键名。 在这个例子中,“ prop_physics_multiplayer ”将成为“ hostage_entity   
删除(delete)  : 删除任何属性匹配的键名称和值的字符串。 值字符串正则表达式(/ /)。 在这个例子中,垃圾桶的模型属性被移除。  
插入(insert) : 指定要插入任何额外的键值对。 在这里,一个任意缩放值添加到实体。

```c
//过滤医疗包
filter:
{
"classname" "weapon_first_aid_kit_spawn"
}
```
```c
//添加物品(重机枪)
add:
{
"origin" "164 -610 129"
"solid" "6"
"model" "models/w_models/weapons/w_minigun.mdl"
"MinPitch" "-300"
"MinAnimTime" "50"
"MaxYaw" "360"
"MaxPitch" "600"
"MaxAnimTime" "100"
"angles" "0 150 0"
"classname" "prop_mounted_machine_gun"
}
```

[模型与属性说明](#https://blog.csdn.net/ZBzibing/article/details/41955539)