
public protocol Applicative : Functor {
  typealias _FAB = K1<_A -> _B>

  class func pure (_A) -> _FA
  class func ap (_FAB) -> _FB
  func <*> (_FAB , Self) -> _FB
}
