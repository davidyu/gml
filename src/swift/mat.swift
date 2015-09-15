protocol Matrix {
    var m : [Float] { get set }
    subscript( row: Int, col: Int ) -> Float { get set }
}

// generic matrix, very unsafe
struct Mat<R:Nat, C:Nat>: Matrix {
    private var rows: Int
    private var cols: Int
    var m: [Float]
    subscript( row: Int, col: Int ) -> Float {
        get {
            return m[ cols * row + col ]
        }

        set( newValue ) {
            m[ cols * row + col ] = newValue
        }
    }
    init( r: Int, c: Int, m: [Float] ) {
        self.rows = r
        self.cols = c
        self.m = m
    }
}

func fromRows<R:Nat, C:Nat>( rows: [Vec<C>] ) -> Mat<R, C> {
    var m: [Float] = []

    if ( rows.count == 0 ) {
        // error!
        return Mat<R, C>( r: 0, c: 0, m: [] )
    }

    for r in rows {
        m += r.data
    }

    return Mat<R,C>( r: rows[0].count, c: rows.count, m: m )
}

func fromCols<R:Nat, C:Nat>( cols: [Vec<R>] ) -> Mat<R, C> {
    var m: [Float] = []

    if ( cols.count == 0 ) {
        // error!
        return Mat<R, C>( r: 0, c: 0, m: [] )
    }

    let rlen = cols[0].count
    for r in 0...rlen - 1 {
        for c in cols {
            m.append( c.data[r] )
        }
    }

    return Mat<R,C>( r: cols.count, c: rlen, m: m )
}

func transpose<R:Nat, C:Nat>( mat: Mat<R, C> ) -> Mat<C, R> {
    var m: [Float] = []

    for r in 0...mat.rows - 1 {
        for c in 0...mat.cols - 1 {
            m.append( mat[ c, r ] )
        }
    }

    return Mat<C,R>( r: mat.rows, c: mat.cols, m: m )
}
