# L4D1地图BUG点修复MapFix

#### 注意本程序需要 [Stripper:source](http://www.bailopan.net/stripper/) 插件库支持,可下载 [SM基础包](https://github.com/ZBzibing/Left4Dead/tree/main/SM%E5%9F%BA%E7%A1%80%E5%8C%85)

<font color=#30e3ca>
本修复原为猎人服的地图修复部分，因完善程度非常高。所以提取出为普通官方地图BUG进行修复。
</font>

- 2024-2-28
  - 修复 毫不留情04,铁架子卡坦克BUG点
- 2024-1-24
  - [X] 死亡丧钟 修复代码
  - 新增 坠机险途开启机关后不可穿越火墙
  - 修复 毫不留情03,机关处BUG点
- 2024-1-20
  - [X] 坠机险途 修复代码
- 2024-1-4
  - 提取地图修复代码,并重新整理优化
  - [X] 毫不留情 修复代码
- 默认修复内容

  - MINI GUN机关枪(加特林) 统一替换 MACHINE GUN重机枪
  - 高空坠落玩家视角卡住的BUG

## 修复地图目录列表

[毫不留情 No Mercy](#毫不留情-no-mercy)
<br>[坠机险途 Crash Course](#坠机险途-crash-course)
<br>[丧亡丧钟 Death Toll](#丧亡丧钟-death-toll)
<br>[寂静时分 Dead Air](#寂静时分-dead-air)
<br>[血腥收获 Blood Harvest](#血腥收获-blood-harvest)
<br>[牺牲 The Sacrifice](#牺牲-the-sacrifice)
<br>[最后一站 The Last Stand](#最后一站-the-last-stand-survival)

## 毫不留情 No Mercy
### 1. 公寓 The Apartments
- 起点屋顶可以跳楼的捷径修复  
  ![alt A101](./img/A101.jpg)  
  ![alt A102a](./img/A102a.jpg)  
  ![alt A102b](./img/A102b.jpg)

### 2. 地铁 The Subway
- MiniGun替换MachineGun  
  ![alt A201](./img/A201.jpg)
- 大厦外墙BUG点修复  
  ![alt A202](./img/A202.jpg)

### 3. 下水道 The Sewer
- 开机关后，快速往前冲，不刷丧尸和感染者的BUG，需要安装 [机关尸潮修复插件](https://github.com/ZBzibing/Left4Dead/blob/main/SP%E6%8F%92%E4%BB%B6/%E6%9C%BA%E5%85%B3%E5%B0%B8%E6%BD%AE%E8%A7%A6%E5%8F%91%E4%BF%AE%E5%A4%8D.sp)
- 机关处BUG点  
  ![alt](./img/A301.jpg)
- 车站卡坦克修复  
  ![alt](./img/A302.jpg)
- 救护车卡坦克修复  
  ![alt](./img/A303.jpg)

### 4. 医院 The Hospital

- 修复部分卡住感染者墙壁  
  ![alt A401](./img/A402.jpg)
- 修复坦克卡住BUG位置  
  ![A403](./img/A403.jpg)
- 修复高空坠落玩家视角卡住BUG

### 5. 屋顶(结局) Rooftop Finale
- 修复高空坠落玩家视角卡住BUG
- MiniGun替换MachineGun  
  ![alt](./img/A501.jpg)
- 屋顶BUG点  
  ![alt](./img/A502.jpg)
- 空调机BUG点  
  ![alt](./img/A503.jpg)

## 坠机险途 Crash Course
### 1. 小巷 The Alleys
- 修复多玩家初始地点错误<font color=#30e3ca>(本BUG仅在多人5+player超过4位玩家时出现的错误)</font>  
  ![alt](./img/B101.jpg)
- 坠机险途开启机关后不可穿越火墙  
  ![alt](./img/B102.jpg)  
  ![alt](./img/B102b.jpg)

### 2. 卡车库(结局) The Truck Depot Finale
- 修复玩家不触发警报车可抄捷径BUG  
  ![alt](./img/B201.jpg)
- 修复玩家挂灯卡感染者BUG  
  ![alt](./img/B202.jpg)

## 丧亡丧钟 Death Toll

### 1. 收费公路 The Turnpike

- 添加衔接坠机险途的撤离卡车<font color=#30e3ca>(让剧情细节更加完整)</font>  
  ![alt](./img/C101.jpg)
- 墙外BUG点  
  ![alt](./img/C102.jpg)
- 添加坦克防卡代码<font color=#30e3ca>(必须增加第一关有坦克的修复)</font>  
  ![alt](./img/C103.jpg)  
  ![alt](./img/C104.jpg)

### 2. 排水沟 The Drains

- 开机关点位<font color=#30e3ca>(本修复引用官方的生还者模式)</font>  
  ![alt](./img/C201a.jpg)
- 免开机关捷径BUG点  
  ![alt](./img/C201b.jpg)
- 下水道出口坦克卡位BUG点  
  ![alt](./img/C202.jpg)
- 安全室门口坦克卡位BUG点  
  ![alt](./img/C203.jpg)

### 3. 教会 The Church
- 丧尸无感应区BUG(NAV导航的BUG问题)  
  ![alt](./img/C301a.jpg)
  ![alt](./img/C301b.jpg)
- 终点安全室内厕所卡位无法通关BUG  
  ![alt](./img/C302.jpg)

### 4. 小镇 The Town
- 卡车BUG点  
  ![alt](./img/C401.jpg)
- 本关有机关尸潮BUG,需要安装 [机关尸潮修复插件](https://github.com/ZBzibing/Left4Dead/blob/main/SP%E6%8F%92%E4%BB%B6/%E6%9C%BA%E5%85%B3%E5%B0%B8%E6%BD%AE%E8%A7%A6%E5%8F%91%E4%BF%AE%E5%A4%8D.sp)

### 5. 船屋(结局) Boathouse Finale

- 安全室起点BUG点  
  ![alt](./img/C501.jpg)
- BUG礁石(左)  
  ![alt](./img/C502a.jpg)
- BUG礁石(右)  
  ![alt](./img/C502b.jpg)
- 大木棚屋顶  
  ![alt](./img/C502c.jpg)
- 木屋屋顶  
  ![alt](./img/C502d.jpg)

## 寂静时分 Dead Air

1. The Greenhouse
- 新增剧情衔接缺失地图

2. The Crane
3. The Construction Site
4. The Terminal
5. Runway Finale

## 血腥收获 Blood Harvest

1. The Woods

- 新增官方未正式发布的地图:大坝(Dam It)与本地图剧情开始的衔接部分

2. The Tunnel
3. The Bridge
4. The Train Station
5. Farmhouse Finale

## 牺牲 The Sacrifice

1. The Docks
2. The Barge
3. Port Finale

## 最后一站 The Last Stand (Survival)

1. 灯塔 The Lighthouse

<!--
1. 温室
2. 起重机
3. 施工现场
4. 终端
5. 跑道结局
血液中的收获
血液中的收获	牺牲
牺牲	最后一站(存活，不要混淆L4D2版本)
最后一站(存活)
1. 树林里
2. 隧道
3. 桥
4. 火车站
5. 农舍的结局	1. 码头
6. 驳船
7. 口结局	灯塔 -->
