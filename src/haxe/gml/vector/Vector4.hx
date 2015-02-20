package gml.vector;

import gml.vector.Vec;

// static extension class for Vec4f
class Vector4 {
    static public function x( v: Vec4f ) {
        return v[0];
    }

    static public function y( v: Vec4f ) {
        return v[1];
    }

    static public function z( v: Vec4f ) {
        return v[2];
    }

    static public function w( v: Vec4f ) {
        return v[3];
    }

    static public function xy( v: Vec4f ) : Vec2f {
        return Vector2.create( v[0], v[1] );
    }

    static public function xyz( v: Vec4f ) : Vec3f {
        return Vector3.create( v[0], v[1], v[2] );
    }

    // safe constructors
    static public function create( x, y, z, w ): Vec4f {
        return new Vec4f( [ x, y, z, w ] );
    }
}
