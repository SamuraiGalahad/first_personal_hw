#include "stdio.h"

// изначальный массив
int a[65536];
// конечный массив
int b[65536];
// глобальные переменные int
int ind, n;
int ind_of_first_positive = -1;
int ind_of_last_negative = -1;
int c = 0;

int main(int argc, char** argv) {
    // ввод длины массива
    scanf("%d", &n);
    // если длина меньше 0, код завершает выполнение
    if (n < 0) {
        printf("Значение длины массива должно быть больше либо равно нуля!");
        return 0;
    }
    // считывание элементов первоначального массива
    for (ind = 0; ind < n; ++ind) {
        scanf("%d", &a[ind]);
    }
    // поиск индексов первого положительного и последнего отриц.
    for (ind = 0; ind < n; ++ind) {
        if (a[ind] > 0 && ind_of_first_positive == -1) {
            ind_of_first_positive = ind;
        }
        if (a[ind] < 0) {
            ind_of_last_negative = ind;
        }
    }
    // если элемент под индексом первого полож. или послед. отриц.
    // то он пропускается
    for (ind = 0; ind < n; ++ind) {
        if (ind == ind_of_first_positive || ind == ind_of_last_negative) {
            c++;
        } else {
            b[ind - c] = a[ind];
        }
    }
    // вывод результата из конечного массива
    for (ind = 0; ind < n - c; ++ind) {
        printf("%d ", b[ind]);
    }
    return 0;
}