import Foundation

/// MARK: Functional accessors

func _0 <A, B> (x: (A, B)) -> A {
  return x.0
}

func _0 <A, B, C> (x: (A, B, C)) -> A {
  return x.0
}

func _0 <A, B, C, D> (x: (A, B, C, D)) -> A {
  return x.0
}

func _0 <A, B, C, D, E> (x: (A, B, C, D, E)) -> A {
  return x.0
}

func _0 <A, B, C, D, E, F> (x: (A, B, C, D, E, F)) -> A {
  return x.0
}

func _0 <A, B, C, D, E, F, G> (x: (A, B, C, D, E, F, G)) -> A {
  return x.0
}

func _1 <A, B> (x: (A, B)) -> B {
  return x.1
}

func _1 <A, B, C> (x: (A, B, C)) -> B {
  return x.1
}

func _1 <A, B, C, D> (x: (A, B, C, D)) -> B {
  return x.1
}

func _1 <A, B, C, D, E> (x: (A, B, C, D, E)) -> B {
  return x.1
}

func _1 <A, B, C, D, E, F> (x: (A, B, C, D, E, F)) -> B {
  return x.1
}

func _1 <A, B, C, D, E, F, G> (x: (A, B, C, D, E, F, G)) -> B {
  return x.1
}

func _2 <A, B, C> (x: (A, B, C)) -> C {
  return x.2
}

func _2 <A, B, C, D> (x: (A, B, C, D)) -> C {
  return x.2
}

func _2 <A, B, C, D, E> (x: (A, B, C, D, E)) -> C {
  return x.2
}

func _2 <A, B, C, D, E, F> (x: (A, B, C, D, E, F)) -> C {
  return x.2
}

func _2 <A, B, C, D, E, F, G> (x: (A, B, C, D, E, F, G)) -> C {
  return x.2
}

func _3 <A, B, C, D> (x: (A, B, C, D)) -> D {
  return x.3
}

func _3 <A, B, C, D, E> (x: (A, B, C, D, E)) -> D {
  return x.3
}

func _3 <A, B, C, D, E, F> (x: (A, B, C, D, E, F)) -> D {
  return x.3
}

func _3 <A, B, C, D, E, F, G> (x: (A, B, C, D, E, F, G)) -> D {
  return x.3
}

func _4 <A, B, C, D, E> (x: (A, B, C, D, E)) -> E {
  return x.4
}

func _4 <A, B, C, D, E, F> (x: (A, B, C, D, E, F)) -> E {
  return x.4
}

func _4 <A, B, C, D, E, F, G> (x: (A, B, C, D, E, F, G)) -> E {
  return x.4
}

func _5 <A, B, C, D, E, F> (x: (A, B, C, D, E, F)) -> F {
  return x.5
}

func _5 <A, B, C, D, E, F, G> (x: (A, B, C, D, E, F, G)) -> F {
  return x.5
}

func _6 <A, B, C, D, E, F, G> (x: (A, B, C, D, E, F, G)) -> G {
  return x.6
}

/// MARK: Functional setters

func _0 <A, B> (a: A, x: (A, B)) -> (A, B) {
  return (a, x.1)
}

func _1 <A, B> (b: B, x: (A, B)) -> (A, B) {
  return (x.0, b)
}

/// MARK: Equatable

func == <A: Equatable, B: Equatable> (lhs:(A, B), rhs:(A, B)) -> Bool {
  return lhs.0 == rhs.0
    && lhs.1 == rhs.1
}

func == <A: Equatable, B: Equatable, C: Equatable> (lhs:(A, B, C), rhs:(A, B, C)) -> Bool {
  return lhs.0 == rhs.0
    && lhs.1 == rhs.1
    && lhs.2 == rhs.2
}

func == <A: Equatable, B: Equatable, C: Equatable, D: Equatable> (lhs:(A, B, C, D), rhs:(A, B, C, D)) -> Bool {
  return lhs.0 == rhs.0
    && lhs.1 == rhs.1
    && lhs.2 == rhs.2
    && lhs.3 == rhs.3
}

func == <A: Equatable, B: Equatable, C: Equatable, D: Equatable, E: Equatable> (lhs:(A, B, C, D, E), rhs:(A, B, C, D, E)) -> Bool {
  return lhs.0 == rhs.0
    && lhs.1 == rhs.1
    && lhs.2 == rhs.2
    && lhs.3 == rhs.3
    && lhs.4 == rhs.4
}

/// MARK: Flip

func flip <A, B> (x: (A, B)) -> (B, A) {
  return (x.1, x.0)
}

func flip0 <A, B> (x: (A, B)) -> (B, A) {
  return flip(x)
}

func flip0 <A, B, C> (x: (A, B, C)) -> (B, A, C) {
  return (x.1, x.0, x.2)
}

func flip1 <A, B, C> (x: (A, B, C)) -> (A, C, B) {
  return (x.0, x.2, x.1)
}

func flip0 <A, B, C, D> (x: (A, B, C, D)) -> (B, A, C, D) {
  return (x.1, x.0, x.2, x.3)
}

func flip1 <A, B, C, D> (x: (A, B, C, D)) -> (A, C, B, D) {
  return (x.0, x.2, x.1, x.3)
}

func flip2 <A, B, C, D> (x: (A, B, C, D)) -> (A, B, D, C) {
  return (x.0, x.1, x.3, x.2)
}

/// MARK: Functor (pairs)

func fmap <A, B, C, D> (f: A -> B, g: C -> D) -> (A, C) -> (B, D) {
  return { a, c in
    return (f(a), g(c))
  }
}

/// MARK: Functor (triples)

func fmap <A, B, C, D, E, F> (f: A -> B, g: C -> D, h: E -> F) -> (A, C, E) -> (B, D, F) {
  return {a, c, e in
    return (f(a), g(c), h(e))
  }
}
