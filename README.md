# 孤单英雄

面向安卓手机的竖屏单机背包策略游戏。Godot 4.7.2 制作，使用 GDScript 和 Compatibility 渲染器，无第三方运行时插件。

## 打开与运行

1. 用 Godot 4.7 导入本目录的 `project.godot`。
2. 等待资源首次导入，按 F5 运行。
3. 也可在这台电脑上双击 `StartGame.cmd`，直接使用 Downloads 中已安装的 Godot 4.7.2。

如果在 Godot 调试窗口中所有按钮点击都无反应，检查窗口顶部的「输入 / 2D / 3D」工具栏：请选择「输入」（允许游戏输入）。「2D」和「3D」是调试选取模式，会拦截游戏点击，用于选中节点；点击时只有框线而不执行功能就是这种情况。直接双击 `StartGame.cmd` 运行独立游戏窗口不受该调试模式影响。

游戏流程：开启游历 → 分配12点根骨 → 领取法宝 → 背包布阵与融合 → 参悟神通 → 自动斗法与事件 → 30境结算。第25境后可在右上角菜单选择平安归返。

## 操作

| 操作 | 鼠标与手机触屏 |
| --- | --- |
| 选择法宝 | 点击胸挂或背包中的法宝 |
| 放置 | 按住法宝拖到目的位置，松手放置；点选不会移动 |
| 合成 | 拖到同名同品质法宝上，松手融合 |
| 旋转 | 拖拽时上方出现「旋转」；另一根手指每点一次向右转90°；电脑用 R / 鼠标右键；松手后按钮消失 |
| 收纳 | 将法宝拖到背包区域 |
| 扩格 | 点「扩格」，本次游历最多扩展三次 |
| 战斗 | 自动进行；支持暂停、1/2/4倍速与快进结算 |
| 查看剧情 | 场景下显示剧情卡片，上下滑动回顾；系统根据事件切换，不设手动切换按钮 |
| 继续游历 | 先显示文案，等待点击「进入事件」；遇敌、搜索和黑市显示胸挂，抽奖类保留剧情背景 |
| 收取物资 | 逐件选择收取或放弃；未收取物资不进入库存或仓库 |
| 商铺搜索 | 点击随机商铺中的编号搜索点，上方逐件识别，下方整理胸挂；点物品打开菜单，拖入胸挂或转移至背包；关闭保留进度 |
| 背包 | 右上角打开随机不规则16～20格背包；点击物品查看、转移、丢弃；事件中只读 |
| 退到后台 | 自动保存并暂停战斗，回来后点「继续」 |

背包可翻页，袋中法宝不参与战斗。法宝释放顺序为背包坐标从上到下、从左到右，同一位置不会同时放置两件法宝。品质依次为绿、蓝、紫、金、红；红色为最高品质，不再融合。

## 已实现的内容

- 30境完整游历与三次妖王战，25境后的提前归返、死亡结算和跨局灵石。
- 顶部三境事件进度条：每组完成后显示下一组三境，九类独立事件图标、境数、当前境高亮与妖王标记；资源替换见 `docs/事件进度条与图标.md`。
- 营地五个设施入口及幸存者名单；新人0–6条随机特质、通关入驻、老人连续死亡3次永久失去。开局可选新人或营地老人，详细规则与美术替换见 `docs/营地与幸存者配置.md`。
- 角色根骨分配、持久生命值、攻击、防御和先手属性。
- 7×6胸挂，初始开放中间5×4，异形占格、碰撞检查、旋转、融合和扩格；没有自动整理功能。
- 每局随机连通、不规则16～20格背包，容量检查、物品详情、选择收取、转移、丢弃与旧存档迁移。
- 搜索事件生成A1～A5随机室内地图（22～40个可行走格），固定步数、方向视野、手绘路线和地图内丧尸战斗，随机2～4处搜索点、每点1～5件物品；支持异形格子遮罩、中心原地旋转放大镜、逐件按品质识别（绿1秒、蓝1.8秒、紫2.2秒、金2.5秒、红3.1秒）、持久化进度与满包保留，见 `docs/商铺搜索.md`。
- 锤形、防御形、剑形、异形四大类共8件法宝，五阶品质。
- 会心诀、长生经、不灭金身、撼天之力四种神通。
- 赐宝、神通、普通战斗、妖王、求签、黑市、灵泉事件。
- 实时剧情卡片、事件前后叙事、下方操作台与历史保存；文案见 `data/story.json`，由玩家点击进入事件，不自动倒计时跳转。
- 战斗预备、神通触发、先手、法宝顺序、普攻、暴击、护盾、灼烧、回复和战报。
- 自动存档、确定性的战斗重播、防重复领取、音效开关、法宝图鉴和帮助。
- 主界面左下角「仓库」：五大物资分类、六种装备细分、品质边框、数量堆叠、详情与文字获取途径；结算入库、跨局保存。
- 「仓库」右侧「炼金」：三件同品质非装备物资融合为一件，支持随机产物预览、概率配置、扣料入库与存档恢复，见 `docs/炼金功能.md`。
- 使用提供的二郎神、灵鼬、赤鳞立绘，增加轻微待机、出手、受击、回复与退场表现。

当前是第一版可玩的完整核心流程。怪物和角色使用静态立绘；法宝图形按参考视频中的格子类型重新绘制。事件类型的推进次序目前固定，奖励与求签由局种子随机。数值为首版可调整配置，并非从视频推断出的原作精确数值。

## 手机适配

以540×960为设计空间，在可用安全区内等比缩放并居中；竖屏锁定，支持鼠标与触屏。额外的长屏区域使用暗色背景，不裁切游戏内容。已在自动测试中检查360×640、720×1600、1080×2400和1536×2048的布局边界；尚未完成安卓真机触摸、刘海屏和性能验证。

Android 导出预设包含 arm64-v8a 和 armeabi-v7a，离线运行，不申请网络权限。

## 安卓安装包

工程已带 `Android` 导出预设，默认输出 `builds/android/gudan_yingxiong.apk`。当前电脑未配置 Android SDK、JDK 和 Godot 导出模板，因此本次交付不含已验证的 APK。

1. 在 Godot 的「管理导出模板」中安装与编辑器完全一致的4.7.2模板。
2. 按 [Godot 官方安卓导出说明](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html) 安装 JDK17 和 Android SDK，并在编辑器设置填入 Java SDK Path 与 Android SDK Path。具体 SDK 组件版本以4.7.2编辑器要求和官方说明为准。
3. 项目 → 导出 → Android → 导出项目，勾选调试后导出测试 APK。
4. 连接安卓手机并开启 USB 调试，可用 Godot 的一键部署进行测试。正式分发需要在导出设置填写你自己的签名。

也可运行命令：

```powershell
godot --headless --path . --export-debug Android builds/android/gudan_yingxiong.apk
```

## 结构与修改入口

| 路径 | 用途 |
| --- | --- |
| `scenes/main.tscn` | 主场景，Godot 中的启动入口 |
| `scripts/main.gd` | 自适应界面、触摸交互、事件界面和战斗播放 |
| `scripts/game_state.gd` | 背包规则、事件、神通定义、存档和结算 |
| `scripts/combat.gd` | 与美术独立的战斗模拟及事件序列 |
| `scripts/actor_view.gd` | 静态立绘和未来 Spine 的接入层 |
| `data/artifacts.json` | 法宝名称、占格、基础效果、类别和说明 |
| `data/story.json` | 开场、事件前后剧情与玩家默认名称 |
| `data/inventory.json` | 背包16～20格随机形状参数与默认堆叠上限 |
| `scripts/journey_inventory.gd` / `scripts/journey_inventory_view.gd` | 两个背包的空间规则、物品详情与选择收取界面 |
| `scripts/scavenge.gd` / `scripts/scavenge_view.gd` | 随机商铺、搜索计时、收取存档及交互弹窗 |
| `scripts/shop_map_view.gd` / `scripts/search_grid_view.gd` | 卡通室内地图、点位命中与异形格子搜索动画 |
| `scripts/story_catalog.gd` / `scripts/story_view.gd` | 剧情模板替换与滚动卡片界面 |
| `data/items.json` | 药品、食品、建筑材料、物品与装备示例配置及事件掉落 |
| `scripts/item_catalog.gd` | 统一道具分类、装备部位与五档品质 |
| `scripts/warehouse_view.gd` | 局外仓库与道具详情界面 |
| `scripts/alchemy.gd` / `scripts/alchemy_view.gd` | 炼金规则、竖屏工坊、候选预览与结果 |
| `data/alchemy.json` / `data/alchemy_items.json` | 炼金概率、预览数量及临时产物定义 |
| `docs/仓库与道具配置.md` | 入库规则、后续道具表填写约定及验证说明 |
| `assets/characters/` | 原始透明立绘 |
| `assets/items/` | 可直接编辑的法宝 SVG 图形 |
| `assets/backgrounds/` | 仙宫背景 |
| `docs/Spine接入.md` | 更换 Spine 角色的具体步骤 |
| `docs/实现对照.md` | 视频与事件文档的实现对应关系 |
| `docs/验证记录.md` | 本次验证范围与限制 |
| `tests/` | 规则、完整游历和界面交互测试 |

存档路径为 `user://journey_v1.json`，可在 Godot 菜单「项目 → 打开用户数据文件夹」找到。战斗中退出后会重播当前战斗，已结算的奖励不会重复发放。

## 测试

```powershell
godot --headless --path . --editor --import --quit
godot --headless --path . --script res://tests/test_game.gd
godot --headless --path . --script res://tests/test_ui.gd
godot --headless --path . --script res://tests/test_warehouse.gd
godot --headless --path . --script res://tests/test_warehouse_ui.gd
godot --headless --path . --script res://tests/test_alchemy.gd
godot --headless --path . --script res://tests/test_alchemy_ui.gd
godot --headless --path . --script res://tests/test_scavenge.gd
godot --headless --path . --script res://tests/test_scavenge_ui.gd
```

测试使用独立的 `test_rules.json`、`test_ui.json` 和 `test_visual.json` 存档，不覆盖正常游历存档。界面截图测试可去掉 `--headless` 并在命令末尾加 `-- --screenshots`，截图写入 `docs/`。


室内探索新版：从角色格拖拽画路线，预览耗步后点击出发；到另一端出口撤离，具体规则及测试记录见 `docs/商铺搜索.md`。
