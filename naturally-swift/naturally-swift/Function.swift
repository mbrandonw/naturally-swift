
/// A struct wrap of a generic func.
public struct Function <A, B> {
  let f: A -> B

  init (_ f: A -> B) {
    self.f = f
  }

  func apply (x: A) -> B {
    return f(x)
  }
}

/// MARK: Profunctor

extension Function : Profunctor {
  typealias _A = Any
  typealias _B = Any
  typealias _C = Any
  typealias _D = Any
  typealias _FAC = Function<_A, _C>
  typealias _FBD = Function<_B, _D>

  public static func dimap <_A, _B, _C, _D> (f: _A -> _B, g: _C -> _D) -> Function<_B, _C> -> Function<_A, _D> {
    return {function in

      return Function<_A, _D>({a in
        return (g • function.f • f)(a)
      })
    }
  }
  public static func lmap <_A, _B, _C> (f: _A -> _B) -> Function<_B, _C> -> Function<_A, _C> {
    return Function.dimap(f, identity)
  }

  public static func rmap <_A, _C, _D> (g: _C -> _D) -> Function<_A, _C> -> Function<_A, _D> {
    return Function.dimap(identity, g)
  }
}
