
/// MARK: Functor

extension Array : Functor {
  typealias _A = T
  typealias _B = Any
  typealias _FA = [_A]
  typealias _FB = [_B]

  public static func fmap <_A, _B> (f: _A -> _B) -> [_A] -> [_B] {
    return {xs in
      return xs.map(f)
    }
  }
}

public func <%> <_A, _B> (f: _A -> _B, xs: [_A]) -> [_B] {
  return xs.map(f)
}

/// MARK: Monad

extension Array : Monad {
  public static func unit (x: _A) -> [_A] {
    return [x]
  }

  public static func bind <_B> (xs: [_A], f: _A -> [_B]) -> [_B] {
    return xs.map(f).reduce([], +)
  }
}

public func >>= <_A, _B> (xs: [_A], f: _A -> [_B]) -> [_B] {
  return Array.bind(xs, f)
}
