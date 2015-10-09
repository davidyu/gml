package gml.matrix;

// generic base matrix -- we need this to store rows and cols
class BaseMatrix<T> {
    public var rows: Int;
    public var cols: Int;
    public var data: Array<T>;

    public function new( cols: Int, rows: Int, xs: Array<T> ) {
        this.rows = rows;
        this.cols = cols;
        this.data = xs;
    }

    public function get( r: Int, c: Int ): T {
        return this.data[ r * this.cols + c ];
    }

    public function set( r: Int, c: Int, v: T ) {
        return this.data[ r * this.cols + c ] = v;
    }
}

// warning: all operators have no bounds checks; assumes lhs and rhs are the correct size
// generic matrix, with some useful accessors (array accessors, overloaded operations for Matrix<Floats>)
@:forward(get, set, rows, cols)
abstract Matrix<T>( BaseMatrix<T> ) from BaseMatrix<T> to BaseMatrix<T> {
    public function new( cols: Int, rows: Int, xs: Array<T> ) {
        this = new BaseMatrix( cols, rows, xs );
    }

    @:arrayAccess
    public function get_flat( i: Int ): T {
        return this.data[i];
    }

    @:arrayAccess
    public function set_flat( i: Int, v: T ) {
        this.data[i] = v;
    }

    @:op(A + B)
    public static inline function add( lhs: Matrix<Float>, rhs : Matrix<Float> ): Matrix<Float> {
        var c = new Array<Float>();
        for ( i in 0...lhs.rows * lhs.cols ) {
            c.push( lhs.get_flat( i ) + rhs.get_flat( i ) );
        }

        return new BaseMatrix<Float>( lhs.cols, rhs.rows, c );
    }

    @:op(A - B)
    public static inline function sub( lhs: Matrix<Float>, rhs : Matrix<Float> ): Matrix<Float> {
        var c = new Array<Float>();
        for ( i in 0...lhs.rows * lhs.cols ) {
            c.push( lhs.get_flat( i ) - rhs.get_flat( i ) );
        }

        return new BaseMatrix<Float>( lhs.cols, rhs.rows, c );
    }

    @:op(A * B)
    public static inline function matmul( lhs: Matrix<Float>, rhs: Matrix<Float> ): Matrix<Float> {
        var c = new Array<Float>();
        for ( i in 0...lhs.rows ) {
            for ( k in 0...rhs.cols ) {
                var sum = 0.0;
                for ( j in 0...rhs.rows ) {
                    sum += lhs.get( i, j ) * rhs.get( j, k );
                }
                c.push( sum );
            }
        }
        return new BaseMatrix<Float>( rhs.cols, lhs.rows, c );
    }
}
