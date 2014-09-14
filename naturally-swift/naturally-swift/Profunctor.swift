
public protocol Profunctor {
  typealias _A
  typealias _B
  typealias _C
  typealias _D
  typealias _FAC = K2<_A, _C>
  typealias _FBC = K2<_B, _C>
  typealias _FAD = K2<_A, _D>

  /// (A,B) --> (C,D)  ~~~>  Hom(B, C) --> Hom(A, D)
  class func dimap (f: _A -> _B, g: _C -> _D) -> _FBC -> _FAD
  
  /// A --> B  ~~~>  Hom(B, C) --> Hom(A, C)
  class func lmap (f: _A -> _B) -> _FBC -> _FAC

  /// C --> D  ~~~>  Hom(A, C) --> Hom(A, D)
  class func rmap (g: _C -> _D) -> _FAC -> _FAD
}

//func _lmap <P: Profunctor> (f: P._A -> P._B) -> P._FBC -> P._FAC {
//  let id: P._C -> P._C = identity
//  return P.dimap
//}
