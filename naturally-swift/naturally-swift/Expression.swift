
public enum Expression <A> {
  case Const(@autoclosure () -> A)
  case Add(
    @autoclosure () -> Expression<A>,
    @autoclosure () -> Expression<A>
  )
  case Multiply(
    @autoclosure () -> Expression<A>,
    @autoclosure () -> Expression<A>
  )
}

/// Evaluation on Num types
func eval <A: Num> (expr: Expression<A>) -> A {
  switch expr {
  case let .Const(value):
    return value()
  case let .Add(left, right):
    return eval(left()) + eval(right())
  case let .Multiply(left, right):
    return eval(left()) * eval(right())
  }
}

/// MARK: Functor
extension Expression : Functor {
  typealias _A = A
  typealias _B = Any
  typealias _FA = Expression<_A>
  typealias _FB = Expression<_B>

  public static func fmap <_B> (f: _A -> _B) -> Expression<_A> -> Expression<_B> {
    return {expr in
      switch expr {
      case let .Const(value):
        return .Const(f(value()))

      case let .Add(left, right):
        return .Add(
          Expression.fmap(f)(left()),
          Expression.fmap(f)(right())
        )

      case let .Multiply(left, right):
        return .Multiply(
          Expression.fmap(f)(left()),
          Expression.fmap(f)(right())
        )
      }
    }
  }
}

public func <%> <_A, _B> (f: _A -> _B, expr: Expression<_A>) -> Expression<_B> {
  return Expression.fmap(f)(expr)
}

/// MARK: Monad

extension Expression : Monad {
  public static func unit (x: _A) -> Expression<_A> {
    return .Const(x)
  }

  public static func bind <_B> (expr: Expression<_A>, f: _A -> Expression<_B>) -> Expression<_B> {
    switch expr {
    case let .Const(value):
      return f(value())

    case let .Add(left, right):
      let l = Expression.bind(left(), f)
      let r = Expression.bind(right(), f)
      return .Add(l, r)

    case let .Multiply(left, right):
      let l = Expression.bind(left(), f)
      let r = Expression.bind(right(), f)
      return .Multiply(l, r)
    }
  }
}

public func >>= <_A, _B> (expr: Expression<_A>, f: _A -> Expression<_B>) -> Expression<_B> {
  return Expression.bind(expr, f)
}


