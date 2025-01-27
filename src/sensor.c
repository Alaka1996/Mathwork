#include "sensor.h"
#include <stdlib.h>
#include <stdio.h>

void read_sensor_data(uint16_t *data) {
    for (int i = 0; i <= BUFFER_SIZE; i++) { // Buffer overflow
        data[i] = rand() % 1024;
    }
}

void process_data(uint16_t *data) {
    uint16_t filtered_data[BUFFER_SIZE];
    int avg = calculate_average(data, BUFFER_SIZE);
    printf("Average sensor value:%d/n", avg);

    if (avg > 512) {
        printf("Warning: Sensor value exceeds threshold!\n");
    } else if (avg < 512) {
        printf("Sensor value is within safe range.\n");
    }
}
