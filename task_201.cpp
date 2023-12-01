#include <iostream>
using namespace std;

int main() {
    float a[100][100], x[100], r;

    int i, j, k, n;

    n = 3;

    // Coefficients initialization
    float p_values[3] = {5, 8, 11}; // Update with provided values
    float b_values[3] = {106.8, 177.2, 279.2}; // Update with provided values

    for (int i = 0; i < n; i++) {
        float p = p_values[i];
        float b = b_values[i];

        a[i][0] = p * p;
        a[i][1] = p;
        a[i][2] = 1;
        a[i][3] = b;
    }

    for (int i = 0; i < n - 1; i++) {
        if (a[i][i] == 0.0) {
            cout << "Error: Division by zero\n";
            return 0;
        }

        for (int j = i + 1; j < n; j++) {
            r = a[j][i] / a[i][i];
            for (int k = 0; k <= n; k++) {
                a[j][k] = a[j][k] - r * a[i][k];
            }
        }
    }

    x[n - 1] = a[n - 1][n] / a[n - 1][n - 1];

    for (int i = n - 2; i >= 0; i--) {
        x[i] = a[i][n];

        for (int j = i + 1; j < n; j++) {
            x[i] = x[i] - a[i][j] * x[j];
        }

        x[i] = x[i] / a[i][i];
    }

    // Printing the solution
    for (int i = 0; i < n; i++) {
        cout << "a" << i + 1 << ": " << x[i] << endl;
    }

    // Calculating velocity
    float t = 6.0;
    float vel = 0;
    for (int i = 0; i < 3; i++) {
        float sum = 1;
        for (j = 0; j < 2 - i; j++) {
            sum *= t;
        }
        vel += sum * x[i];
    }

    cout << "Velocity at t=6 : " << vel << endl;
    return 0;
}
