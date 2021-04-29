**EXTENSION**

# `Bundle`
```swift
public extension Bundle
```

## Methods
### `infoForKey(_:)`

```swift
func infoForKey(_ key: String) -> String?
```

Returns String value for the specified key from bundle dictionary.
- Parameter key: String representing item key.
- Returns: String value if exists.

#### Parameters

| Name | Description |
| ---- | ----------- |
| key | String representing item key. |

### `boolForKey(_:)`

```swift
func boolForKey(_ key: String) -> Bool
```

Returns boolean value with specified key from bundle dictionary.
- Parameter key: String representing item key.
- Returns: Boolean value. If key does not exist, `false` will be returned.

#### Parameters

| Name | Description |
| ---- | ----------- |
| key | String representing item key. |