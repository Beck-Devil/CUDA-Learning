/*  This program explores the order in which
    the threads operates in the CUDA. The print pattern
    suggests that there is no order.
*/
#include "stdio.h"
#include "cuPrintf.cu"
#include "cuPrintf.cuh"

#define NUM_BLOCKS 16
#define BLOCK_WIDTH 1

__global__ void helloCUDA()
{
    cuPrintf("Hello World!! This is thread %d.\n", blockIdx.x);
}

int main()
{
	cudaPrintfInit();
    helloCUDA<<<NUM_BLOCKS, BLOCK_WIDTH>>>();
	cudaPrintfDisplay(stdout, true);
	cudaPrintfEnd();
    cudaDeviceSynchronize();
	printf("Thats all!!!\n");
    return 0;
}
