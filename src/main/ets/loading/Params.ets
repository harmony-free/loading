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

export class LoadingParam implements LoadingParamFace {
  state: LoadingState = LoadingState.loading
  msg: string = "加载中..."
  progress: number = 0.0
  progressColor: number | string = '#FF8800'
  total: number = 100
  data: object = Object
}