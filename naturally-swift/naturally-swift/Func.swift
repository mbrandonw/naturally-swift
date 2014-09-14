import Foundation

/// Identity function
func identity <A> (x: A) -> A {
  return x
}

/// Constant function
func const <A, B> (x: A) -> B -> A {
  return {y in
    return x
  }
}

/// Function composition
func • <A,B,C> (g: B -> C, f: A -> B) -> (A -> C) {
  return { g(f($0)) }
}

/// Function exponentiation
infix operator ^ {associativity left}
func ^ <A> (f: A -> A, n: Int) -> A -> A {
  if n <= 0 {
    return identity
  }
  return f • (f^(n-1))
}

/// Pipe argument to the right
func |> <A, B> (x: A, f: A -> B) -> B {
  return f(x)
}

/// Pipe function to the right
func |> <A, B, C> (f: A -> B, g: B -> C) -> A -> C {
  return { g(f($0)) }
}

/// Pipe argument to the left
func <| <A, B> (f: A -> B, x: A) -> B {
  return f(x)
}

/// Pipe function to the left
func <| <A, B, C> (f: B -> C, g: A -> B) -> A -> C {
  return { f(g($0)) }
}

/// Currying two-argument function
func curry <A, B, C> (f: (A, B) -> C) -> A -> B -> C {
  return {a in
    return {b in
      return f(a, b)
    }
  }
}

/// Currying three-argument function
func curry <A, B, C, D> (f: (A, B, C) -> D) -> A -> B -> C -> D {
  return {a in
    return {b in
      return {c in
        return f(a, b, c)
      }
    }
  }
}

/// Uncurrying two-argument function
func uncurry <A, B, C> (f: A -> B -> C) -> (A, B) -> C {
  return {a, b in
    return f(a)(b)
  }
}

/// Uncurrying three-argument function
func uncurry <A, B, C, D> (f: A -> B -> C -> D) -> (A, B, C) -> D {
  return {a, b, c in
    return f(a)(b)(c)
  }
}

/// Flip arguments
func flip <A, B, C> (f: (A, B) -> C) -> (B, A) -> C {
  return {b, a in
    return f(a, b)
  }
}
