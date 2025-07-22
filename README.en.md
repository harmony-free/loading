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

#### Plugin Details

Hello everyone, welcome! Today, we are going to talk about the refresh loading function in HarmonyOS. Refresh is mainly divided into two parts: pull-down refresh and pull-up load. By pulling up or down, we distinguish the refresh or loading status, and execute the current state's animation after releasing.

一、First, obtain the sliding gesture, and then distinguish the sliding state by obtaining the position of the sliding movement.

1、Obtain the sliding gesture.

```arkts
// Define the 'refresh' extension attribute and pass in the RefreshUtils utility class to calculate the current status
// The 'List' can be used for any component
@Extend(List)
function refresh(refresh: RefreshUtils) {
  .offset({ x: 0, y: refresh.offsetY }) // The position of the sliding action
.onTouch((e) => refresh.onTouch(e)) // Touch gesture
.enabled(refresh.state < 4) // Disables further sliding during the refreshing or loading process
}
```

2、Calculate the current state based on the position obtained through.onTouch.

```arkts
export enum RefreshState {
  // Default state 
  normal,
// Currently in sliding state 
  runAll,
  // Currently in the process of loading more content by pulling up 
  runLoading,
  // Currently in the pull-to-refresh state 
  runRefresh,
  // Prepare for the pull-up loading state 
  readLoading,
  // Prepare for the pull-down refresh state 
  readRefresh,
  // Start loading 
  onLoading,
  // Start refreshing 
  onRefresh,
  // Success loading status 
  successLoading,
  // Loading failure state 
  failLoading,
  // Refresh successful status 
  successRefresh,
  // Failure in refreshing state 
  failRefresh,
}
```

二、Based on the RefreshState status, customize the pull-to-load attempt and the pull-to-refresh attempt in the refreshBuilder.

```arkts
@Builder
export function refreshBuilder(refresh: RefreshUtils) {
  if (refresh.isRefresh() && refresh.upData != undefined) {
    Row() {
      if (refresh.state == RefreshState.runRefresh) {
        Text("↓").fontSize(25)
      } else if (refresh.state == RefreshState.readRefresh) {
        Text("↑").fontSize(25)
      } else if (refresh.state == RefreshState.onRefresh) {
        Text() {
          SymbolSpan($r('sys.symbol.rays'))
        }.fontSize(25).rotate({ angle: refresh.animator.progress * 360 })
      } else {
        Text() {
          SymbolSpan(refresh.state == RefreshState.successRefresh ? $r('sys.symbol.checkmark') :
          $r('sys.symbol.xmark'))
        }.fontSize(25)
      }
      Column() {
        if (refresh.state == RefreshState.runRefresh) {
          Text("Pull down to refresh").fontSize(14)
        } else if (refresh.state == RefreshState.readRefresh) {
          Text("Release to refresh immediately").fontSize(14)
        } else if (refresh.state == RefreshState.onRefresh) {
          Text("Refreshing...").fontSize(14)
        } else {
          Text(refresh.state == RefreshState.successRefresh ? "Refresh successful!" : "Refresh failed!").fontSize(14)
        }
        Text(`Last update:${refresh.refreshTiming.toLocaleTimeString()}`)
          .fontSize(12)
          .fontColor(0x999999)
          .padding({ top: 3 })
      }.padding({ left: 5 })
    }
    .height(50)
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .position({ top: 0 })
  } else if (refresh.isLoading() && refresh.downData != undefined) {
    Row() {
      if (refresh.state == RefreshState.runLoading) {
        Text("↑").fontSize(25)
      } else if (refresh.state == RefreshState.readLoading) {
        Text("↓").fontSize(25)
      } else if (refresh.state == RefreshState.onLoading) {
        Text() {
          SymbolSpan($r('sys.symbol.rays'))
        }.fontSize(25).rotate({ angle: refresh.animator.progress * 360 })
      } else {
        Text() {
          SymbolSpan(refresh.state == RefreshState.successLoading ? $r('sys.symbol.checkmark') :
          $r('sys.symbol.xmark'))
        }.fontSize(25)
      }
      Column() {
        if (refresh.state == RefreshState.runLoading) {
          Text("Pull up to load").fontSize(14)
        } else if (refresh.state == RefreshState.readLoading) {
          Text("Release and immediately load").fontSize(14)
        } else if (refresh.state == RefreshState.onLoading) {
          Text("Loading...").fontSize(14)
        } else {
          Text(refresh.state == RefreshState.successLoading ? "Loading completed!" : "Failed to load!").fontSize(14)
        }
        Text(`Last time loading:${refresh.loadingTiming.toLocaleTimeString()}`)
          .fontSize(12)
          .fontColor(0x999999)
          .padding({ top: 3 })
      }.padding({ left: 5 })
    }
    .height(50)
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .position({ bottom: 0 })
  }
}
```

Note: The complete code has been submitted to the [HarmonyOS Third-Party Library](https://ohpm.openharmony.cn/). Please use the following command to install it.


```
ohpm install @free/refresh
```


Calling method


```arkts
@Component
export struct RefreshComponent{

  @Builder
  itemBuilder(model:object){
    Text("item")
  }

/**
   * Refresh
   */
  upData = (page?: PageFace):Promise<boolean | Array<object>> => {
    return new Promise<boolean | Array<object>>((res, rej) => {
      res([])
    })
  }
  /**
   * Loading...
   */
  downData = (page?: PageFace):Promise<boolean | Array<object>> => {
    return new Promise<boolean | Array<object>>((res, rej) => {
      res([])
    })
  }

  build() {
    Column(){
      RefreshList({
        cachedCount:5,
        refresh:new RefreshUtils({upData:this.upData,downData:this.downData}),
        itemBuilderParam:this.itemBuilder,
      }).height("100%")
    }
  }
}
```

If you like this content, please give a little heart!



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
