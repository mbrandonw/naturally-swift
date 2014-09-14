
public protocol Functor {
  typealias _A
  typealias _B
  typealias _FA = K1<_A>
  typealias _FB = K1<_B>

  class func fmap (f: _A -> _B) -> _FA -> _FB
  func <%> (f: _A -> _B, x: _FA) -> _FB
}

func test <F: Functor where F._A == F._B, F._FA == F._FB> (x: F._FA) -> F._FB {
  return F.fmap(identity)(x)
}
