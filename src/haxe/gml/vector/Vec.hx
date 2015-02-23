package gml.vector;

import gml.Nat;

// generic vector
abstract Vec<N:Nat, T>( Array<T> ) {
    public function new( xs: Array<T> ) { this = xs; }

    @:arrayAccess
    public function get( i: Int ): T {
        return this[i];
    }

    @:arrayAccess
    public function set( i: Int, v: T ): T {
        this[i] = v;
        return this[i];
    }

    // a push should also increment my type counter
    // a push affects my internal state
    public function push(x: T): Vec<S<N>, T> {
        this.push( x );
        return new Vec<S<N>, T>( this );
    }
}

// a more useful vector
@:forward( length )
abstract Vecf<N:Nat>( Array<Float> ) {
    public function new( xs: Array<Float> ) { this = xs; }

    @:arrayAccess
    public function get( i: Int ): Float {
        return this[i];
    }

    @:arrayAccess
    public function set( i: Int, v: Float ): Float {
        this[i] = v;
        return this[i];
    }

    @:op(A + B)
    public function add( rhs : Vecf<N> ): Vecf<N> {
        var res = new Array<Float>();
        for ( i in 0...this.length ) res.push( this[i] + rhs.get(i) );
        return new Vecf<N>( res );
    }

    @:op(A - B)
    public function sub( rhs : Vecf<N> ): Vecf<N> {
        var res = new Array<Float>();
        for ( i in 0...this.length ) res.push( this[i] - rhs[i] );
        return new Vecf<N>( res );
    }

    @:op(-B)
    public function negate(): Vecf<N> {
        var res = new Array<Float>();
        for ( i in 0...this.length ) res.push( -this[i] );
        return new Vecf<N>( res );
    }

    // componentwise
    @:op(A * B)
    public function mul( rhs : Vecf<N> ): Vecf<N> {
        var res = new Array<Float>();
        for ( i in 0...this.length ) res.push( this[i] * rhs[i] );
        return new Vecf<N>( res );
    }

    // scalar-vector
    @:op(A * B) @:commutative
    public static function smul<N>( lhs: Vecf<N>, rhs : Float ): Vecf<N> {
        var res = new Array<Float>();
        for ( i in 0...lhs.length ) res.push( lhs[i] * rhs );
        return new Vecf<N>( res );
    }

    @:op(A == B)
    public function eq( rhs: Vecf<N> ): Bool {
        if ( this.length != rhs.length ) return false;
        for ( i in 0...this.length ) {
            if ( this[i] != rhs[i] ) return false;
        }
        return true;
    }

    public function dot( rhs : Vecf<N> ): Float {
        var res = 0.0;
        for ( i in 0...this.length ) res += this[i] * rhs[i];
        return res;
    }

    // a push should also increment my type counter
    // a push affects my internal state
    public function push(x: Float): Vecf<S<N>> {
        this.push( x );
        return new Vecf<S<N>>( this );
    }

    public function lensq(): Float {
        var res = 0.0;
        for ( i in 0...this.length ) res += this[i] * this[i];
        return res;
    }

    public function len(): Float {
        return Math.sqrt( lensq() );
    }
}
