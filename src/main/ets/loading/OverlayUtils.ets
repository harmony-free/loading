import { ComponentContent, OverlayManager, UIContext, window } from '@kit.ArkUI'


export class OverlayUtils<T extends object> {
  static componentMap: Map<string, ComponentContent<object>> = new Map()
  protected key: string = "loading"
  protected win!: window.Window

  constructor() {
    if (this.win == undefined) {
      window.getLastWindow(getContext()).then((w) => {
        this.win = w
        this.init()
      })
    } else {
      this.init()
    }
  }

  protected init(): void {
    console.log("没有重置初始化方法！")
  }

  protected getUIContext(): UIContext {
    return this.win.getUIContext()
  }

  protected getOverlay(): OverlayManager {
    return this.getUIContext().getOverlayManager()
  }

  protected create<T extends object>(builder: WrappedBuilder<[T]>, args: T): ComponentContent<T> {
    return new ComponentContent(this.getUIContext(), builder, args)
  }

  protected remove<T extends object>(content: ComponentContent<T> | string = this.key) {
    if (typeof content == 'string') {
      if (OverlayUtils.componentMap.has(content)) {
        this.getOverlay().removeComponentContent(OverlayUtils.componentMap.get(content))
      }
    } else {
      this.getOverlay().removeComponentContent(content)
    }
  }

  protected push<T extends object>(key: string, content: ComponentContent<T>) {
    if (!OverlayUtils.componentMap.has(key)) {
      OverlayUtils.componentMap.set(key, content)
      this.getOverlay().addComponentContent(content)
    }
  }

  show(content: ComponentContent<T> | string | T = this.key) {
    if (typeof content == 'string') {
      if (OverlayUtils.componentMap.has(content)) {
        this.getOverlay().showComponentContent(OverlayUtils.componentMap.get(content))
      }
    } else if (content instanceof ComponentContent) {
      this.getOverlay().showComponentContent(content)
    } else {
      if (OverlayUtils.componentMap.has(this.key)) {
        let c = OverlayUtils.componentMap.get(this.key)!
        c.update(content)
        this.getOverlay().showComponentContent(c)
      }
    }
  }

  showAll() {
    this.getOverlay().showAllComponentContents()
  }

  hide<T extends object>(content: ComponentContent<T> | string = this.key) {
    if (typeof content == 'string') {
      if (OverlayUtils.componentMap.has(content)) {
        this.getOverlay().hideComponentContent(OverlayUtils.componentMap.get(content))
      }
    } else {
      this.getOverlay().hideComponentContent(content)
    }
  }

  hideAll() {
    this.getOverlay().hideAllComponentContents()
  }

  protected clear() {
    OverlayUtils.componentMap.forEach((c) => {
      this.getOverlay().removeComponentContent(c)
    })
    OverlayUtils.componentMap.clear()
  }
}

