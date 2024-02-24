#include <stdio.h>
#include <iostream>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "Header.cuh"

int main(void) {
	GPU_class gpu(1, 1024);
	gpu.calldevice();
	cudaDeviceSynchronize();
	printf("All threads are finished!\n");
	system("Pause");
	return 0;
}
z