/**
 * @author "Brian Kirkpatrick" <code@tythos.net>
 */

#include "basque.h"

int main(int nArgs, char** vArgs) {
    float x = 1.2;
    float x2 = getSquare(x);
    float x3 = getCube(x);
    printNumber(x);
    printNumber(x2);
    printNumber(x3);
    return 0;
}
