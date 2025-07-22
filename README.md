# loading

#### 介绍 [English](README.en.md)

这是轻量级一个加载框，可以在任意页面使用这个弹窗，可以通过调整传入的参数改变加载的状态。
dialog 版本 loading [@free/dialog](https://ohpm.openharmony.cn/#/cn/detail/@free%2Fdialog)

#### 软件架构

这是一个基于系统 Overlay 开发的一个弹窗 可以在class类中直接调用弹窗方法

#### 安装教程

```
ohpm install @free/loading
```

#### 使用说明

3.1引用头文件

```
/**
* Loading 加载框
* args: LoadingParam 弹窗展示参数 -- 非必填
* state：LoadingState (loading:加载、success:成功、failure:失败、info:信息、warn:警告、progress:下载进度)
  */
  
import { Loading, LoadingParam, LoadingState } from '@free/loading';
```

3.2 展示弹窗

```
Loading.show()
Loading.show({msg:"加载中",state:LoadingState.loading})
```

3.3 隐藏弹窗

```
Loading.hide()
```

#### 插件明细

hello 各位同学，大家好！ 今天我们来讲讲关于鸿蒙里常用的loading加载框功能，是基于Overlay覆盖物层面开发的。在开发的过程在，loading加载框基本随处可见，只要是涉及到异步有延迟的操作都需要展示，以免导致页面无反应，用户体验差的感觉。

一、了解Overlay，Overlay是在getUIContext上的一层覆盖物。

```arkts
let context = getContext() as common.UIAbilityContext
let overlay = context.windowStage.getMainWindowSync().getUIContext().getOverlayManager()
```

二、添加、删除、显示、隐藏覆盖组件


```arkts
// 添加覆盖组件
overlay.addComponentContent(content)
// 删除覆盖物组件
overlay.removeComponentContent(content)
// 显示覆盖物组件
overlay.showComponentContent(content)
// 隐藏覆盖物组件
overlay.hideComponentContent(content)
```

三、创建组件、更新数据

```arkts
// 创建组件
let content = new ComponentContent(this.getUIContext(), builder, args)
// 更新数据
content.update(args)

```

四、自定义builder组件，六种状态loading、success、failure、info、warn、progress。


```arkts

export enum LoadingState {
  loading = 'sys.symbol.loading',
  success = 'sys.symbol.checkmark',
  failure = 'sys.symbol.xmark',
  info = 'sys.symbol.info_circle',
  warn = 'sys.symbol.exclamationmark_circle',
  progress = 'sys.symbol.progress'
}

export interface LoadingParamFace {
  state?: LoadingState
  msg: string
  progress?: number
  progressColor?: number | string
  total?: number
  data?: object
}

@Builder
function loadingCustom(param: LoadingParamFace) {
  Column() {
    Column() {
      if (param.state ?? LoadingState.loading == LoadingState.loading) {
        LoadingProgress().width(50).height(50).color(0xFF444444)
      } else if (param.state == LoadingState.progress) {
        Progress({ value: param.progress, total: param.total, type: ProgressType.Ring })
          .width(50)
          .padding(5)
          .style({ strokeWidth: 3, enableScanEffect: true })
      } else {
        Text() {
          SymbolSpan($r(param.state))
        }.fontSize(40)
        .padding(5).fontColor(0xFF444444)
      }
      Text(param.msg ?? "加载中...").fontSize(14).fontColor(0xFF444444)
    }.backgroundColor(Color.White).padding(20).borderRadius(10)
  }.backgroundColor(0x30000000).justifyContent(FlexAlign.Center).height('100%').width('100%')
}
```

注意：完整代码我已提交到鸿蒙三方库中，使用一下命令安装


```
ohpm install @free/loading
```


调用方式

```arkts
// 显示loading加载框
Loading.show({state:LoadingState.loading})
// 隐藏loading加载框
Loading.hide()
```

喜欢本篇内容的话给个小爱心！




#### 参与贡献

1. Fork 本仓库
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request

#### 特技

1. 使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2. Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3. 你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4. [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5. Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6. Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
