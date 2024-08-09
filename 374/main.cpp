#include <iostream>

void static_array() {
    static int my_arr1[200000];
}
void stack_array() {
    int my_arr2[200000];
}
void heap_array() {
    int *my_arr3 = (int *) malloc(200000 * sizeof(int));
    if(my_arr3 != NULL) { // Always check if malloc succeeded.
        free(my_arr3); // Free the allocated memory.
    }
}
int main() {
    int i;
    clock_t start, end;
    double time_required_1, time_required_2, time_required_3;

    start = clock();
    for(i=0; i<150000; ++i) {
        static_array();
    }
    end = clock();
    time_required_1 = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("static array took %f seconds to execute \n", time_required_1);

    start = clock();
    for(i=0; i<150000; ++i) {
        stack_array();
    }
    end = clock();
    time_required_2 = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("stack array took %f seconds to execute \n", time_required_2);

    start = clock();
    for(i=0; i<150000; ++i) {
        heap_array();
    }
    end = clock();
    time_required_3 = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("heap array took %f seconds to execute \n", time_required_3);

    return 0;
}

