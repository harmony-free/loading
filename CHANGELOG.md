### 1.0.4 更新优化

1、修改包名

### 1.0.3 新增Dialog loading加载框

1、导入@free/dialog插件

2、添加弹窗 loading版本

### 1.0.2 修复 api 12 UIContext 闪退 相关bug

通过异步或者传入主 window 获取UIContext

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