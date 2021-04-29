**EXTENSION**

# `UITableView`
```swift
public extension UITableView
```

## Methods
### `registerNib(_:bundle:)`

```swift
func registerNib(_ type: UITableViewCell.Type, bundle: Bundle)
```

Registers a nib object containing a cell with the table view under a specified identifier.
- Parameters:
  - type: Type of the cell with same identifer as its class name.
  - bundle: The bundle in which to search for the nib file.

#### Parameters

| Name | Description |
| ---- | ----------- |
| type | Type of the cell with same identifer as its class name. |
| bundle | The bundle in which to search for the nib file. |

### `registerHeaderFooter(_:bundle:)`

```swift
func registerHeaderFooter(_ type: UITableViewHeaderFooterView.Type, bundle: Bundle)
```

Registers a nib object containing a header or footer with the table view under a specified identifier.
- Parameters:
  - type: Type of the supplementary view with same identifer as its class name.
  - bundle: The bundle in which to search for the nib file.

#### Parameters

| Name | Description |
| ---- | ----------- |
| type | Type of the supplementary view with same identifer as its class name. |
| bundle | The bundle in which to search for the nib file. |

### `updateHeaderViewHeight()`

```swift
func updateHeaderViewHeight()
```

Resize tableViewHeaderView to fit size.

### `dequeueCell()`

```swift
func dequeueCell<CellType: UITableViewCell>() -> CellType
```

Dequeue cells with reuse identifier same as the its class name.
Use with `registerNib(type:,bundle)`.
- Returns: Returns cell which is registered with the reuse identifer same as cell class.

### `dequeueCell(indexPath:)`

```swift
func dequeueCell<CellType: UITableViewCell>(indexPath: IndexPath) -> CellType
```

Dequeue cells with reuse identifier same as the its class name.
Use with `registerNib(type:,bundle)`.
- Parameter indexPath: Index path of the cell.
- Returns: Returns cell which is registered with the reuse identifer same as cell class.

#### Parameters

| Name | Description |
| ---- | ----------- |
| indexPath | Index path of the cell. |

### `dequeueHeaderFooterView()`

```swift
func dequeueHeaderFooterView<ViewType: UITableViewHeaderFooterView>() -> ViewType
```

Dequeue header footer view with reuse identifier same as the its class name.
Use with `registerHeaderFooter(type:,bundle)`.
- Parameter indexPath: Index path of the cell.
- Returns: Returns header footer view which is registered with the reuse identifer same as its class.

#### Parameters

| Name | Description |
| ---- | ----------- |
| indexPath | Index path of the cell. |