**EXTENSION**

# `UIView`
```swift
public extension UIView
```

## Properties
### `cornerRadius`

```swift
@IBInspectable var cornerRadius: CGFloat
```

Corner radius of view

### `borderWidth`

```swift
@IBInspectable var borderWidth: CGFloat
```

Border width of view

### `borderColor`

```swift
@IBInspectable var borderColor: UIColor
```

Border color of view

## Methods
### `loadFromNib(bundle:)`

```swift
static func loadFromNib(bundle: Bundle) -> Self
```

Load the view from a nib file called with the name of the class.
- parameter bundle: Bundle for accessing nib file.
- Note: The first object of the nib file **must have identical** name with its class.

#### Parameters

| Name | Description |
| ---- | ----------- |
| bundle | Bundle for accessing nib file. |

### `roundCorners(_:radius:)`

```swift
func roundCorners(_ corners: UIRectCorner, radius: CGFloat)
```

Adds rounded corners to the view.
- Parameters:
  - corners: The corners of a rectangle.
  - radius: Radius to be applied.

#### Parameters

| Name | Description |
| ---- | ----------- |
| corners | The corners of a rectangle. |
| radius | Radius to be applied. |

### `addSubviews(_:)`

```swift
func addSubviews(_ views: UIView...)
```

Adds views to the end of the receiver’s list of subviews.
- Parameter views: Views to be added.

#### Parameters

| Name | Description |
| ---- | ----------- |
| views | Views to be added. |

### `applyGradient(locations:colors:start:end:)`

```swift
func applyGradient(
    locations: [NSNumber],
    colors: [CGColor],
    start: CGPoint = CGPoint(x: 0, y: 0),
    end: CGPoint = CGPoint(x: 1, y: 1)
)
```

Apply gradient to the view.
- Parameters:
  - locations: An optional array of NSNumber objects defining the location of each gradient stop.
  - colors: An array of CGColorRef objects defining the color of each gradient stop.
  - start: The start point of the gradient when drawn in the layer’s coordinate space.
  - end: The end point of the gradient when drawn in the layer’s coordinate space.

#### Parameters

| Name | Description |
| ---- | ----------- |
| locations | An optional array of NSNumber objects defining the location of each gradient stop. |
| colors | An array of CGColorRef objects defining the color of each gradient stop. |
| start | The start point of the gradient when drawn in the layer’s coordinate space. |
| end | The end point of the gradient when drawn in the layer’s coordinate space. |

### `addSubview(pinningView:)`

```swift
func addSubview(pinningView view: UIView)
```

Add subview to view and set constraints to fit all bounds.
- Parameter view: To be added as subview.

#### Parameters

| Name | Description |
| ---- | ----------- |
| view | To be added as subview. |

### `pinView(_:top:leading:trailing:bottom:)`

```swift
func pinView(_ view: UIView, top: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0, bottom: CGFloat = 0)
```

Sets constraints the specified view to fit all bounds.
- Parameter view: To set constraints on.

#### Parameters

| Name | Description |
| ---- | ----------- |
| view | To set constraints on. |