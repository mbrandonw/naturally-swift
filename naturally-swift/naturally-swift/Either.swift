//
//  Either.swift
//  swift-fp
//
//  Created by Brandon Williams on 8/30/14.
//  Copyright (c) 2014 Kickstarter. All rights reserved.
//

import Foundation

public enum Either <A, B> {
  case Left(@autoclosure () -> A)
  case Right(@autoclosure () -> B)
}

/// Printable, DebugPrintable
extension Either : Printable, DebugPrintable {
  public var description: String {
    get {
      switch self {
      case let .Left(left): return "{Left: \(left())}"
      case let .Right(right): return "{Right: \(right())}"
      }
    }
  }

  public var debugDescription: String {
    get {
      return self.description
    }
  }
}

/// Bifunctor
extension Either : Bifunctor {
  typealias _A = A
  typealias _B = Any
  typealias _C = B
  typealias _D = Any
  typealias _FAC = Either<_A, _C>
  typealias _FBD = Either<_B, _D>

  public static func fmap <_B, _D> (f: _A -> _B, g: _C -> _D) -> Either<_A, _C> -> Either<_B, _D> {

    return {either in
      switch either {
      case let .Left(value):
        return .Left(f(value()))
      case let .Right(value):
        return .Right(g(value()))
      }
    }
  }
}

public func <%> <_A, _C, _B, _D> (fg: (_A -> _B, _C -> _D), either: Either<_A, _C>) -> Either<_B, _D> {
  return Either.fmap(fg.0, fg.1)(either)
}
