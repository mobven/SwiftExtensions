**EXTENSION**

# `UIImage`
```swift
public extension UIImage
```

## Methods
### `init(named:in:)`

```swift
convenience init?(named: String, in bundle: Bundle)
```

Creates an image object using the named image asset that is compatible with the specified trait collection.
- Parameters:
  - named: The name of the image asset or file.
  - bundle: The bundle containing the image file or asset catalog.

#### Parameters

| Name | Description |
| ---- | ----------- |
| named | The name of the image asset or file. |
| bundle | The bundle containing the image file or asset catalog. |

### `scalePreservingAspectRatio(width:)`

```swift
func scalePreservingAspectRatio(width: CGFloat) -> UIImage
```

Returns image scaled to the specified witdh preserving ascpect ratio.
- Parameter width: New width.

#### Parameters

| Name | Description |
| ---- | ----------- |
| width | New width. |