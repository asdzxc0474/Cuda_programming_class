#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
__global__ void myfirstkernel(void)
{
	printf("Hello!!!I'm thread: %d in block: %d\n", threadIdx.x, blockIdx.x);
}
class GPU_class
{
private:
	int block, thread;
public:
	GPU_class(int block, int thread) :block(block), thread(thread)
	{
		printf("establish gpu class object with %d thread, %d block\n", this->thread, this->block);
	}
	void calldevice(void)
	{
		myfirstkernel << <this->block, this->thread >> > ();
	}
};