[中文](CHANGELOG.md)

### 1.0.3 Newly added Dialog loading loading box

1、Import the @free/dialog plugin

2、Add pop-up loading version

3、Change the package name

### 1.0.2 Fix the crash bug of API 12 UIConte

Obtain the UIContext through asynchronous means or by passing it into the main window.

### 1.0.1 Modify default parameter configuration

Modified the default configuration

LoadingDialog.show({state:LoadingState.loading} as LoadingParam)

==> Do not convert the passed parameter types

LoadingDialog.show({state:LoadingState.loading})

### 1.0.0 Initial release

1、loading:Loading。

2、success:Success。

3、failure:Failure。

4、info:Information。

5、warn:Warning。

6、progress:Download progress。

