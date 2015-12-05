#pragma once

template <int n> struct Vec {
    float v[n];

    float& operator[]( const int i ) {
        return this->v[i];
    }

    Vec<n> operator+ ( Vec<n> rhs ) {
        Vec<n> sum;
        for ( int i = 0; i < n; i++ ) {
            sum[i] = this->v[i] + rhs[i];
        }
        return sum;
    }

    Vec<n> operator- ( Vec<n> rhs ) {
        Vec<n> difference;
        for ( int i = 0; i < n; i++ ) {
            difference[i] = this->v[i] - rhs[i];
        }
        return difference;
    }

    Vec<n> operator* ( Vec<n> rhs ) {
        Vec<n> product;
        for ( int i = 0; i < n; i++ ) {
            product[i] = this->v[i] * rhs[i];
        }
        return product;
    }

    Vec<n> operator/ ( Vec<n> rhs ) {
        Vec<n> quotient;
        for ( int i = 0; i < n; i++ ) {
            quotient[i] = this->v[i] / rhs[i];
        }
        return quotient;
    }
};

template<> struct Vec<3> {
    union {
        float v[3];
        struct { float x, y, z; };
        struct { float r, g, b; };
    };

    Vec( float x, float y, float z ) {
        x = x;
        y = y;
        z = z;
    }

    Vec() {
        x = 0;
        y = 0;
        z = 0;
    }
};

template<> struct Vec<4> {
    union {
        float v[4];
        struct { float x, y, z, w; };
        struct { float r, g, b, a; };
    };

    Vec( float x, float y, float z, float w ) {
        x = x;
        y = y;
        z = z;
        w = w;
    }

    Vec() {
        x = 0;
        y = 0;
        z = 0;
        w = 0;
    }
};

typedef Vec<4> Vec4;
typedef Vec<4> Color;
