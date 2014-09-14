
/// generic function composition
infix operator • {associativity left}

/// fmap infix operator
infix operator <%> {associativity left}

/// contrafmap infix operator
infix operator >%< {associativity left}

/// Applicative infix operator.
infix operator <*> {associativity left}

/// Monad bind operator
infix operator >>= {associativity left}

/// Pipe right
infix operator |> {associativity left}

/// Pipe left
infix operator <| {associativity right}