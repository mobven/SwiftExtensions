**EXTENSION**

# `UICollectionView`
```swift
public extension UICollectionView
```

## Methods
### `registerNib(_:bundle:)`

```swift
func registerNib(_ type: UICollectionViewCell.Type, bundle: Bundle)
```

Registers a nib file for use in creating new collection view cells.
- Parameters:
  - type: Type of the cell with same identifer as its class name.
  - bundle: The bundle in which to search for the nib file.

#### Parameters

| Name | Description |
| ---- | ----------- |
| type | Type of the cell with same identifer as its class name. |
| bundle | The bundle in which to search for the nib file. |

### `registerHeader(_:bundle:)`

```swift
func registerHeader(_ type: UICollectionReusableView.Type, bundle: Bundle)
```

Registers a nib file for use in creating supplementary views for the collection view.
- Parameters:
  - type: Type of the supplementary view with same identifer as its class name.
  - bundle: The bundle in which to search for the nib file.

#### Parameters

| Name | Description |
| ---- | ----------- |
| type | Type of the supplementary view with same identifer as its class name. |
| bundle | The bundle in which to search for the nib file. |

### `dequeueCell(indexPath:)`

```swift
func dequeueCell<CellType: UICollectionViewCell>(indexPath: IndexPath) -> CellType
```

Dequeue cells with reuse identifier same as the its class name.
Use with `registerNib(type:,bundle)`.
- Parameter indexPath: Index path of the cell.
- Returns: Returns cell which is registered with the reuse identifer same as cell class.

#### Parameters

| Name | Description |
| ---- | ----------- |
| indexPath | Index path of the cell. |

### `dequeueHeaderView(indexPath:)`

```swift
func dequeueHeaderView<ViewType: UICollectionReusableView>(indexPath: IndexPath) -> ViewType
```

Dequeue supplementary with reuse identifier same as the its class name.
Use with `registerHeader(type:,bundle)`.
- Parameter indexPath: Index path of the cell.
- Returns: Returns supplementary view which is registered with the reuse identifer same as its class.

#### Parameters

| Name | Description |
| ---- | ----------- |
| indexPath | Index path of the cell. |