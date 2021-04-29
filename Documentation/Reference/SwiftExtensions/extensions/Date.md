**EXTENSION**

# `Date`
```swift
public extension Date
```

## Methods
### `stringRFC3339DateFormatted()`

```swift
func stringRFC3339DateFormatted() -> String
```

Returns string with RFC3339 format.

### `getStart(of:calendar:)`

```swift
func getStart(of component: Calendar.Component, calendar: Calendar = Calendar.app) -> Date?
```

Returns start of a component. Eg, first day of month.

### `getEnd(of:calendar:)`

```swift
func getEnd(of component: Calendar.Component, calendar: Calendar = Calendar.app) -> Date?
```

Returns end of a component. Eg, last day of month.

### `daysOfMonth(calendar:_:)`

```swift
func daysOfMonth(calendar: Calendar = Calendar.app, _ body: (Date) throws -> Void) rethrows
```

Returns all days in a month for day.

### `daysBetween(startDate:endDate:calendar:_:)`

```swift
static func daysBetween(
    startDate: Date, endDate: Date, calendar: Calendar = Calendar.app, _ body: (Date) throws -> Void
) rethrows
```

Returns days between the range

### `getDate(nthWeek:weekday:calendar:)`

```swift
func getDate(nthWeek: Int, weekday: Weekday, calendar: Calendar = Calendar.app) -> Date?
```

Get date matching specified weekday on  the nth week of the month.

### `getDates(nthWeek:calendar:)`

```swift
func getDates(nthWeek: Int, calendar: Calendar = Calendar.app) -> [Date]?
```

Get dates on the nth week of the month.

### `numberOfWeeksInMonth(calendar:)`

```swift
func numberOfWeeksInMonth(calendar: Calendar = Calendar.app) -> Int?
```

Returns date's number of weeks.

### `weekIndexInMonth(calendar:)`

```swift
func weekIndexInMonth(calendar: Calendar = Calendar.app) -> Int
```

0 based week index of the date.
