
public protocol Monad : Functor {
  class func unit (x: _A) -> _FA
  class func bind (x: _FA, f: _A -> _FB) -> _FB
  func >>= (x: _FA, f: _A -> _FB) -> _FB
}

func flatM <
  M: Monad,
  MM: Monad
  where
  MM._A == M._FA,
  MM._A == MM._B,
  M._A == M._B> (xss: MM._FA) -> M._FA {

    func id (x: MM._A) -> MM._A {
      return x
    }

    let r = MM.bind(xss, id)
    return r
}
