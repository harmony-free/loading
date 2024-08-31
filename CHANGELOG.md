### 1.0.1 修改参数默认配置

修改了默认配置

LoadingDialog.show({state:LoadingState.loading} as LoadingParam)

==> 讲不用转化传参类型

LoadingDialog.show({state:LoadingState.loading})

### 1.0.0 初始发布

六种功能

1、loading:加载。

2、success:成功。

3、failure:失败。

4、info:信息。

5、warn:警告。

6、progress:下载进度。