#include "gtest/gtest.h"
#include "utils.h"

TEST(UtilsTest, CalculateAverage) {
    uint16_t data[BUFFER_SIZE] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    EXPECT_EQ(calculate_average(data, 10), 55);
}

TEST(UtilsTest, PrintData) {
    uint16_t data[3] = {1, 2, 3};
    testing::internal::CaptureStdout();
    print_data(data, 3);
    std::string output = testing::internal::GetCapturedStdout();
    EXPECT_NE(output.find("Sensor Data[0]: 1"), std::string::npos);
}
