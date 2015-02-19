import Nat;

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

    // componentwise
    @:op(A * B)
    public function mul( rhs : Vecf<N> ): Vecf<N> {
        var res = new Array<Float>();
        for ( i in 0...this.length ) res.push( this[i] * rhs[i] );
        return new Vecf<N>( res );
    }

    // scalar-vector
    @:op(A * B)
    public function smul( rhs : Float ): Vecf<N> {
        var res = new Array<Float>();
        for ( i in 0...this.length ) res.push( this[i] * rhs );
        return new Vecf<N>( res );
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
}

typedef Vec2f = Vecf<Two>;
typedef Vec3f = Vecf<Three>;
typedef Vec4f = Vecf<Four>;

// static extension class
class Vector2 {
    static public function x( v: Vec2f ) {
        return v[0];
    }

    static public function y( v: Vec2f ) {
        return v[1];
    }

    // safe constructors
    static public function create( x, y ): Vec2f {
        return new Vec2f( [ x, y ] );
    }

}

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
