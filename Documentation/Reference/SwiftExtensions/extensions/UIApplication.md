**EXTENSION**

# `UIApplication`
```swift
public extension UIApplication
```

## Methods
### `topViewController(controller:)`

```swift
func topViewController(
    controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
) -> UIViewController?
```

Returns top view controller in the window.

### `routeToSettings(completionHandler:)`

```swift
func routeToSettings(completionHandler: ((Bool) -> Void)? = nil)
```

Opens device settings for the application.
- Parameter completionHandler: The block to execute with the results.
Provide a value for this parameter if you want to be informed of the success or failure of opening the URL.
This block is executed asynchronously on your app's main thread.
The block has no return value and takes the following parameter:
**success**: A Boolean indicating whether the URL was opened successfully.

#### Parameters

| Name | Description |
| ---- | ----------- |
| completionHandler | The block to execute with the results. Provide a value for this parameter if you want to be informed of the success or failure of opening the URL. This block is executed asynchronously on your app’s main thread. The block has no return value and takes the following parameter: : A Boolean indicating whether the URL was opened successfully. |

### `getViewController(inScene:isInitialViewController:)`

```swift
class func getViewController<T: UIViewController>(
    inScene named: String? = nil,
    isInitialViewController: Bool = true
) -> T
```

Returns UIViewController with the specified generic type.
 If `inScene` is not specified,  this function will look into UIViewController by
 removing ViewController suffix.
 eg. LoginViewController would be queried in Login.storyboard file.
 Otherwise, view controller will be looked up in the specified scene.
- Parameters:
  - named: Scene name of the view controller.
  - isInitialViewController: Bool indicating whether view controler with the
  specified type is initial view controller.
- Returns: Returns specifed controller in the specified storyboard.
Throws error if there controller could not be found.

#### Parameters

| Name | Description |
| ---- | ----------- |
| named | Scene name of the view controller. |
| isInitialViewController | Bool indicating whether view controler with the specified type is initial view controller. |

### `openIfPossible(url:completion:)`

```swift
func openIfPossible(url: URL, completion: ((Bool) -> Void)? = nil)
```

Attempts to asynchronously open the resource at the specified URL.
- Parameters:
  - url: A URL (Universal Resource Locator).
  - completion: The block to execute with the results.

#### Parameters

| Name | Description |
| ---- | ----------- |
| url | A URL (Universal Resource Locator). |
| completion | The block to execute with the results. |

### `openIfPossible(urlString:completion:)`

```swift
func openIfPossible(urlString: String, completion: ((Bool) -> Void)? = nil)
```

Attempts to asynchronously open the resource at the specified URL.
- Parameters:
  - url: String representation of the URL.
  - completion: The block to execute with the results.

#### Parameters

| Name | Description |
| ---- | ----------- |
| url | String representation of the URL. |
| completion | The block to execute with the results. |