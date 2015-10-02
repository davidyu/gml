package gml.matrix;

// generic matrix
class Matrix<T> implements ArrayAccess<T> {
    var rows: Int;
    var cols: Int;
    var data: Array<T>;

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
            this.data[ r * this.cols + c ] = v;
        }
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
}
