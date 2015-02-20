package gml.vector;

import gml.vector.Vec;

// static extension class for Vec3f
class Vector3 {
    static public function x( v: Vec3f ) {
        return v[0];
    }

    static public function y( v: Vec3f ) {
        return v[1];
    }

    static public function z( v: Vec3f ) {
        return v[2];
    }

    static public function xy( v: Vec3f ) : Vec2f {
        return Vector2.create( v[0], v[1] );
    }

    static public function create( x, y, z ): Vec3f {
        return new Vec3f( [ x, y, z ] );
    }
}
