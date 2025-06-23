# loading

#### Description [中文](README.md)

This is a lightweight loading box that can be used on any page. This pop-up window can be controlled by adjusting the input parameters to change the loading status.  "dialog" version loading [@free/dialog](https://ohpm.openharmony.cn/#/cn/detail/@free%2Fdialog)
#### Software Architecture

This is a pop-up window developed based on the system Overlay. It can be directly called by methods within the "class" class.

#### Installation

```
ohpm install @free/loading
```

#### Instructions

1Include header file

```
/**
* Loading Loading box
* args: LoadingParam Popup window display parameters -- Not mandatory
* state：LoadingState (loading、success、failure、info、warn、progress)
  */
  
import { Loading, LoadingParam, LoadingState } from '@free/loading';
```

2 Display pop-up window

```
Loading.show()
Loading.show({msg:"loading...",state:LoadingState.loading})
```

3 Hidden pop-up window

```
Loading.hide()
```

#### Contribution

1. Fork the repository
2. Create Feat_xxx branch
3. Commit your code
4. Create Pull Request

#### Gitee Feature

1. You can use Readme\_XXX.md to support different languages, such as Readme\_en.md, Readme\_zh.md
2. Gitee blog [blog.gitee.com](https://blog.gitee.com)
3. Explore open source project [https://gitee.com/explore](https://gitee.com/explore)
4. The most valuable open source project [GVP](https://gitee.com/gvp)
5. The manual of Gitee [https://gitee.com/help](https://gitee.com/help)
6. The most popular members  [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
