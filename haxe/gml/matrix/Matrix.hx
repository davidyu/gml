package gml.matrix;

import gml.Nat;

// generic matrix
// TODO make this more matrix-like and less vector-like
abstract Matrix<T>( Array<T> ) {
    public function new( xs: Array<T> ) { this = xs; }

    @:arrayAccess
    public function get_flat( i: Int ): T {
        return this[i];
    }

    @:arrayAccess
    public function set_flat( i: Int, v: T ): T {
        this[i] = v;
        return this[i];
    }
}
