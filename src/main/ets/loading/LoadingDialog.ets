import { OverlayUtils } from './OverlayUtils'
import { LoadingParam, LoadingParamFace, LoadingState } from './Params'

/**
 * LoadingDialog 加载框
 * args: LoadingParam 弹窗展示参数
 * state：LoadingState (loading:加载、success:成功、failure:失败、info:信息、warn:警告、progress:下载进度)
 */


export class LoadingDialog extends OverlayUtils<LoadingParamFace> {
  protected init(): void {
    let component = this.create(wrapBuilder(loadingCustom), new LoadingParam())
    this.push("loading", component)
    this.hide()
  }

  builder<T extends object>(builder: WrappedBuilder<[T]>, args: T) {
    this.remove()
    let component = this.create(builder, args)
    this.push("loading", component)
  }


  showAsync(args?: LoadingParamFace, delay: number = 10000): Promise<boolean> {
    this.show(args)
    return new Promise<boolean>((res, rej) => {
      let num = setTimeout(() => {
        this.hide()
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
      Text(param.msg ?? "加载中...").fontSize(14).fontColor(0xFF444444)
    }.backgroundColor(Color.White).padding(20).borderRadius(10)
  }.backgroundColor(0x30000000).justifyContent(FlexAlign.Center).height('100%').width('100%')
}

export const Loading = new LoadingDialog()