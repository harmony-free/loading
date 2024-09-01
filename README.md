# loading

#### 介绍

这是轻量级一个加载框，可以在任意页面使用这个弹窗，可以通过调整传入的参数改变加载的状态。

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
* LoadingDialog 加载框
* args: LoadingParam 弹窗展示参数 -- 非必填
* state：LoadingState (loading:加载、success:成功、failure:失败、info:信息、warn:警告、progress:下载进度)
  */
  
import { LoadingDialog, LoadingParam, LoadingState } from '@free/loading';
```

3.2 展示弹窗

```
LoadingDialog.show()
LoadingDialog.show({state:LoadingState.loading})
```

3.3 隐藏弹窗

```
LoadingDialog.hide()
```

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
