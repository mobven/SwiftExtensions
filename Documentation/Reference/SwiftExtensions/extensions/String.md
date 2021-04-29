**EXTENSION**

# `String`
```swift
public extension String
```

## Properties
### `isAlphaNumeric`

```swift
var isAlphaNumeric: Bool
```

Returns true if string is in  the characters in Unicode General Categories L*, M*, and N*.

### `isNumeric`

```swift
var isNumeric: Bool
```

### `withoutSpecialCharacters`

```swift
var withoutSpecialCharacters: String
```

### `withoutSpecialCharactersAndSpace`

```swift
var withoutSpecialCharactersAndSpace: String
```

### `withoutWhitespacesAndNewlines`

```swift
var withoutWhitespacesAndNewlines: String
```

## Methods
### `dateRFC3339DateFormatted()`

```swift
func dateRFC3339DateFormatted() -> Date?
```

Returns date with RFC3339 format.
Explained in https://developer.apple.com/documentation/foundation/dateformatter

### `htmlAttributedString(font:color:)`

```swift
func htmlAttributedString(font: UIFont, color: UIColor) -> NSAttributedString?
```
