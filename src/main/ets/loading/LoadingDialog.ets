import { ComponentContent, OverlayManager, UIContext, window } from '@kit.ArkUI'
import { LoadingParam, LoadingParamFace, LoadingState } from './Params'

/**
 * LoadingDialog 加载框
 * args: LoadingParam 弹窗展示参数
 * state：LoadingState (loading:加载、success:成功、failure:失败、info:信息、warn:警告、progress:下载进度)
 */


export class LoadingDialog {
  static overlayUtils: OverlayUtils

  static fullScreen(fullScreen: boolean, windowStage?: window.WindowStage) {
    if (windowStage != null) {
      windowStage.getMainWindowSync().setWindowLayoutFullScreen(fullScreen)
    } else {
      window.getLastWindow(getContext()).then((w) => {
        w.setWindowLayoutFullScreen(fullScreen)
      })
    }
  }

  static getOverlay() {
    if (LoadingDialog.overlayUtils == null) {
      // LoadingDialog.fullScreen(true)
      LoadingDialog.overlayUtils = new OverlayUtils()
    }
    return LoadingDialog.overlayUtils
  }


  static show(args?: LoadingParamFace) {
    LoadingDialog.getOverlay().update(args)
  }

  static hide() {
    LoadingDialog.getOverlay().hide()
  }

  static showTime(args?: LoadingParamFace, delay: number = 1000): Promise<boolean> {
    LoadingDialog.show(args)
    return new Promise<boolean>((res, rej) => {
      let num = setTimeout(() => {
        LoadingDialog.hide()
        clearTimeout(num)
        res(true)
      }, delay)
    })
  }
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
      Text(param.msg).fontSize(14).fontColor(0xFF444444)
    }.backgroundColor(Color.White).padding(20).borderRadius(10)
  }.backgroundColor(0x30000000).justifyContent(FlexAlign.Center).height('100%').width('100%')
}

export class OverlayUtils {
  uiContext: UIContext = new UIContext()
  overlay: OverlayManager = this.uiContext.getOverlayManager()
  component: ComponentContent<LoadingParamFace> =
    new ComponentContent(this.getUIContext(), wrapBuilder(loadingCustom), new LoadingParam())

  constructor() {
    this.init()
  }

  getUIContext(): UIContext {
    return this.uiContext
  }

  getOverlay(): OverlayManager {
    return this.overlay
  }

  init() {
    this.getOverlay().addComponentContent(this.component)
    this.hide()
  }

  remove() {
    this.getOverlay().removeComponentContent(this.component)
  }

  update(args: LoadingParamFace = new LoadingParam()) {
    this.component.update(args)
    this.show()
  }

  show() {
    this.getOverlay().showComponentContent(this.component)
  }

  showAll() {
    this.getOverlay().showAllComponentContents()
  }

  hide() {
    this.getOverlay().hideComponentContent(this.component)
  }

  hideAll() {
    this.getOverlay().hideAllComponentContents()
  }
}