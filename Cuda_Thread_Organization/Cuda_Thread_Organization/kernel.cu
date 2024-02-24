#include <stdio.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

__global__ void helloWorld()
{
	const int a = blockIdx.x;
	const int b = blockIdx.y;
	const int c = blockIdx.z;
	const int tx = threadIdx.x;
	const int ty = threadIdx.y;
	const int tz = threadIdx.z;
	int tid = threadIdx.z * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
	int bid = blockIdx.z * gridDim.x * gridDim.y + blockIdx.y * gridDim.x + blockIdx.x;
	int total_tid = bid * blockDim.x * blockDim.y * blockDim.z + tid;
	printf("Hello World from block-(%d, %d, %d)and thread-(%d, %d, %d)!--%d\n", a, b, c, tx, ty, tz, total_tid);
}
int main()
{
	const dim3 block_size(1, 2, 3);
	const dim3 grid_size(2, 4, 2);
	helloWorld << <grid_size, block_size >> > ();
	cudaDeviceSynchronize();
}