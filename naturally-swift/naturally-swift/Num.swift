import Foundation

/// Num typeclass
protocol Num {
  func + (lhs: Self, rhs: Self) -> Self
  func - (lhs: Self, rhs: Self) -> Self
  func * (lhs: Self, rhs: Self) -> Self
  func / (lhs: Self, rhs: Self) -> Self
  func % (lhs: Self, rhs: Self) -> Self
  init(_ v: Int)
}

/// Partial application of * and +
prefix operator * {}
prefix func * <A: Num> (x: A) -> A -> A {
  return { $0 * x }
}

postfix operator * {}
postfix func * <A: Num> (x: A) -> A -> A {
  return { x * $0 }
}

prefix operator + {}
prefix func + <A: Num> (x: A) -> A -> A {
  return { $0 + x }
}

postfix operator + {}
postfix func + <A: Num> (x: A) -> A -> A {
  return { x + $0 }
}

/// Extensions of core data types
extension Double : Num {}
extension Float  : Num {}
extension Int    : Num {}
extension Int8   : Num {}
extension Int16  : Num {}
extension Int32  : Num {}
extension Int64  : Num {}
extension UInt   : Num {}
extension UInt8  : Num {}
extension UInt16 : Num {}
extension UInt32 : Num {}
extension UInt64 : Num {}
