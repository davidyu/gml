package gml.matrix;

import gml.Nat;
import gml.matrix.Matrix;

abstract Mat4( Matrix<Float> ) from Matrix<Float> to Matrix<Float> {
    public function new( r00, r01, r02, tx, r10, r11, r12, ty, r20, r21, r22, tz, m30, m31, m32, m33 ) {
        this = new Matrix<Float>( [ r00, r01, r02, tx, r10, r11, r12, ty, r20, r21, r22, tz, m30, m31, m32, m33 ] );
    }

    @:arrayAccess
    public inline function get_flat( i: Int ): Float {
        return this.get_flat( i );
    }

    @:arrayAccess
    public inline function set_flat( i: Int, v: Float ): Float {
        return this.set_flat( i, v );
    }

    public function get( r: Int, c: Int ): Float {
        return this[ r * 4 + c ];
    }

    public function set( r: Int, c: Int, v: Float ): Float {
        var index = r * 4 + c;
        this[ index ] = v;
        return this[ index ];
    }
}
