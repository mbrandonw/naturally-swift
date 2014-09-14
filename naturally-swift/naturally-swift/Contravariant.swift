
public protocol Contravariant {
  typealias _A
  typealias _B
  typealias _FA = K1<_A>
  typealias _FB = K1<_B>

  class func contrafmap (f: _A -> _B) -> _FB -> _FA
//  func >%< (f: _A -> _B, x: _FB) -> _FA
}
