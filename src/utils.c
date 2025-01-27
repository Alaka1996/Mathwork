#include "utils.h"
#include <stdio.h>

int calculate_average(uint16_t *data, int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += data[i];
    }
    return sum / size;
}

void print_data(uint16_t *data, int size) {
    for (int i = 0; i < size; i++) {
        printf("Sensor Data[%d]: %d/n", i, data[i]); // Typo in \n
    }
}
