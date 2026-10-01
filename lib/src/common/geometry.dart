// Copyright 2025 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// A position in a two-dimensional coordinate system.
///
/// The [x] coordinate increases to the right and
/// the [y] coordinate increases downward.
/// Coordinates can be negative relative to the origin.
final class Position {
  /// The x-coordinate of this position.
  final int x;

  /// The y-coordinate of this position.
  final int y;

  /// Create a location at the specified [x] and [y] coordinates.
  const Position({required this.x, required this.y});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Position && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Position(x: $x, y: $y)';
}

/// An axis-aligned rectangle with an integer position and size.
///
/// Coordinates increase to the right and downward.
/// The position might be negative,
/// but the width and height are always non-negative.
final class Rect {
  /// The x-coordinate of the left edge of this rectangle.
  final int left;

  /// The y-coordinate of the top edge of this rectangle.
  final int top;

  /// The non-negative width of this rectangle.
  final int width;

  /// The non-negative height of this rectangle.
  final int height;

  /// Create a rectangle with its upper-left corner at `(left, top)`
  /// and the given [width] and [height].
  ///
  /// Negative [width] and [height] values are clamped to zero.
  const Rect({
    required this.left,
    required this.top,
    required int width,
    required int height,
  })  : width = (width < 0) ? 0 : width,
        height = (height < 0) ? 0 : height;

  /// Create a rectangle with its upper-left corner at [topLeft] and
  /// with the given [size].
  factory Rect.from({required Position topLeft, required Size size}) => Rect(
        left: topLeft.x,
        top: topLeft.y,
        width: size.width,
        height: size.height,
      );

  /// The size of this rectangle.
  Size get size => Size(width: width, height: height);

  /// The x-coordinate of the right edge of this rectangle.
  int get right => left + width;

  /// The y-coordinate of the bottom edge of this rectangle.
  int get bottom => top + height;

  /// The location of the top-left corner of this rectangle.
  Position get topLeft => Position(x: left, y: top);

  /// The location of the top-right corner of this rectangle.
  Position get topRight => Position(x: right, y: top);

  /// The location of the bottom-right corner of this rectangle.
  Position get bottomRight => Position(x: right, y: bottom);

  /// The location of the bottom-left corner of this rectangle.
  Position get bottomLeft => Position(x: left, y: bottom);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Rect &&
          left == other.left &&
          top == other.top &&
          width == other.width &&
          height == other.height;

  @override
  int get hashCode => Object.hash(left, top, width, height);

  @override
  String toString() =>
      'Rect(left: $left, top: $top, width: $width, height: $height)';
}

/// The width and height dimensions of a 2D object.
final class Size {
  /// The non-negative width dimension.
  final int width;

  /// The non-negative height dimension.
  final int height;

  /// Create a size that represents the
  /// specified [width] and [height] dimensions.
  ///
  /// Negative [width] and [height] values are clamped to zero.
  const Size({required int width, required int height})
      : width = (width < 0) ? 0 : width,
        height = (height < 0) ? 0 : height;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Size && width == other.width && height == other.height;

  @override
  int get hashCode => Object.hash(width, height);

  @override
  String toString() => 'Size(width: $width, height: $height)';
}
