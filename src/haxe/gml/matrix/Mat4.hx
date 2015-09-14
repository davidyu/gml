package gml.matrix;

import gml.Nat;
import gml.matrix.Matrix;

abstract Mat4( Matrix<Float> ) from Matrix<Float> to Matrix<Float> {
    public function new( r00, r01, r02, tx, r10, r11, r12, ty, r20, r21, r22, tz, m30, m31, m32, m33 ) {
        this = new Matrix<Float>( [ r00, r01, r02, tx, r10, r11, r12, ty, r20, r21, r22, tz, m30, m31, m32, m33 ] );
    }

    public var r00(get, set): Float;
    public var r01(get, set): Float;
    public var r02(get, set): Float;
    public var r10(get, set): Float;
    public var r11(get, set): Float;
    public var r12(get, set): Float;
    public var r20(get, set): Float;
    public var r21(get, set): Float;
    public var r22(get, set): Float;

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

    public function get_r00() {
        return this.get_flat( 0 );
    }

    public function set_r00( r00: Float ) {
        return this.set_flat( 0, r00 );
    }

    public function get_r01() {
        return this.get_flat( 1 );
    }

    public function set_r01( r01: Float ) {
        return this.set_flat( 1, r01 );
    }

    public function get_r02() {
        return this.get_flat( 2 );
    }

    public function set_r02( r02: Float ) {
        return this.set_flat( 2, r02 );
    }

    public function get_r10() {
        return this.get_flat( 4 );
    }

    public function set_r10( r10: Float ) {
        return this.set_flat( 4, r10 );
    }

    public function get_r11() {
        return this.get_flat( 5 );
    }

    public function set_r11( r11: Float ) {
        return this.set_flat( 5, r11 );
    }

    public function get_r12() {
        return this.get_flat( 6 );
    }

    public function set_r12( r12: Float ) {
        return this.set_flat( 6, r12 );
    }

    public function get_r20() {
        return this.get_flat( 8 );
    }

    public function set_r20( r20: Float ) {
        return this.set_flat( 8, r20 );
    }

    public function get_r21() {
        return this.get_flat( 9 );
    }

    public function set_r21( r21: Float ) {
        return this.set_flat( 9, r21 );
    }

    public function get_r22() {
        return this.get_flat( 10 );
    }

    public function set_r22( r22: Float ) {
        return this.set_flat( 10, r22 );
    }
}
