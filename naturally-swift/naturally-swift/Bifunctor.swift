
public protocol Bifunctor {
  typealias _A
  typealias _B
  typealias _C
  typealias _D
  typealias _FAC = K2<_A, _C>
  typealias _FBD = K2<_B, _D>

  /// FMAPPP
  class func fmap (f: _A -> _B, g: _C -> _D) -> _FAC -> _FBD
  func <%> ((_A -> _B, _C -> _D), x: _FAC) -> _FBD
}
