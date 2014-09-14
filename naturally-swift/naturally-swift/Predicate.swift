
public struct Predicate <A> {
  let test: A -> Bool
  init (_ test: A -> Bool) {
    self.test = test
  }
}

/// Mark: Contravariant functor
extension Predicate : Contravariant {
  typealias _A = A
  typealias _B = Any
  typealias _FA = Predicate<_A>
  typealias _FB = Predicate<_B>

  public static func contrafmap <_A, _B> (f: _A -> _B) -> Predicate<_B> -> Predicate<_A> {
    return {pred in
      return Predicate<_A> {a in
        return pred.test(f(a))
      }
    }
  }
}

// this crashes the compiler :(
//public func >%< <_A, _B> (f: _A -> _B, pred: Predicate<_B>) -> Predicate<_A> {
//  return Predicate.contrafmap(f)(pred)
//}

///// Semigroup
//extension Predicate : Semigroup {
//  func op (p: Predicate<A>) -> Predicate<A> {
//    return Predicate<A>{a in
//      return self.test(a) && p.test(a)
//    }
//  }
//}
