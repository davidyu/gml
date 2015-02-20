package gml.vector;

import gml.vector.Vec;

// static extension class for Vec2f
class Vector2 {
    static public function x( v: Vec2f ) {
        return v[0];
    }

    static public function y( v: Vec2f ) {
        return v[1];
    }

    // safe constructor
    static public function create( x, y ): Vec2f {
        return new Vec2f( [ x, y ] );
    }

}
