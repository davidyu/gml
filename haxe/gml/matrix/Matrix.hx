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
        if ( r < this.rows && c < this.cols ) {
            return this.data[ r * this.cols + c ];
        } else {
            throw "given parameters to matrix accessor is out of bounds";
        }
    }

    public function set( r: Int, c: Int, v: T ) {
        if ( r < this.rows && c < this.cols ) {
            return this.data[ r * this.cols + c ] = v;
        } else {
            throw "given parameters to matrix accessor is out of bounds";
        }
    }
}

// generic matrix, with some useful accessors (array accessors, overloaded operations for Matrix<Floats>)
@:forward(get, set, rows, cols)
abstract Matrix<T>( BaseMatrix<T> ) from BaseMatrix<T> to BaseMatrix<T> {
    public function new( cols: Int, rows: Int, xs: Array<T> ) {
        this = new BaseMatrix( cols, rows, xs );
    }

    @:arrayAccess
    public function get_flat( i: Int ): T {
        if ( i < this.rows * this.cols ) {
            return this.data[i];
        } else {
            throw "given flat index to matrix accessor is out of bounds";
        }
    }

    @:arrayAccess
    public function set_flat( i: Int, v: T ) {
        if ( i < this.rows * this.cols ) {
            this.data[i] = v;
        }
    }

    @:op(A + B)
    public static inline function add( lhs: Matrix<Float>, rhs : Matrix<Float> ): Matrix<Float> {
        var c = new Array<Float>();
        if ( lhs.rows == rhs.rows && lhs.cols == rhs.cols ) {
            for ( i in 0...lhs.rows * lhs.cols ) {
                c.push( lhs.get_flat( i ) + rhs.get_flat( i ) );
            }
        }

        return new BaseMatrix<Float>( lhs.cols, rhs.rows, c );
    }

    @:op(A - B)
    public static inline function sub( lhs: Matrix<Float>, rhs : Matrix<Float> ): Matrix<Float> {
        var c = new Array<Float>();
        if ( lhs.rows == rhs.rows && lhs.cols == rhs.cols ) {
            for ( i in 0...lhs.rows * lhs.cols ) {
                c.push( lhs.get_flat( i ) - rhs.get_flat( i ) );
            }
        }

        return new BaseMatrix<Float>( lhs.cols, rhs.rows, c );
    }
}
