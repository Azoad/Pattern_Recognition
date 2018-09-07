#include<stdio.h>
#include <stdlib.h>
#include<math.h>
int main()
{
    int classA[50],classB[50],classA_B[50];
    for(int i =0; i<50; i++)
    {
        classA[i] = 0;
        classB[i] = 0;
        classA_B[i] = 0;
    }
    int num_a,num_b,k=0;
    printf("Enter the total number of elements of class A:");
    scanf("%d",&num_a);
    int min_a = 100000, max_a=0;
    for (int i=0; i<num_a; i++)
    {
        scanf("%d",&classA[i]);
        if(classA[i]<min_a)
        {
            min_a = classA[i];
        }
        classA_B[k] = classA[i];
        k++;
    }

    printf("Enter the total number of elements of class B:");
    scanf("%d",&num_b);
    int min_b = 100000, max_b=0;
    for (int i=0; i<num_b; i++)
    {
        scanf("%d",&classB[i]);
        if(classB[i]<min_b)
        {
            min_b = classB[i];
        }
        classA_B[k] = classB[i];
        k++;
    }

    int max,min,dif[k],th;
    for (int i=0; i<k; i++)
    {
        max=0,min=0;
        for(int j=0; j<k; j++)
        {
            if(classA_B[i]>classA_B[j])
            {
                max++;
            }
            else
            {
                min++;
            }
        }
        dif[i] = abs(max-min);
    }

    int minimum = dif[0];
    for(int i =1; i<k; i++)
    {
        if(dif[i]<minimum)
        {
            minimum = dif[i];
            th = classA_B[i];
        }
    }
    printf("%d \ndif->%d",th,minimum);

    float difference_a=abs(min_a-th),difference_b=abs(min_b-th);
    printf("\n difference from a->%f\n difference from b->%f",difference_a,difference_b);

    float difference = 0.0;
    if (difference_b<difference_a)
    {
        for(int i = 0; i<num_a; i++)
        {
            if(classA[i]>th)
            {
                difference++;
                printf("\nmismatch:%d",classA[i]);
            }
        }
        for(int i = 0; i<num_b; i++)
        {
            if(classB[i]<th)
            {
                difference++;
                printf("\nmismatch:%d",classB[i]);
            }
        }
        /// printf("\n%f",difference);
    }
    else
    {
        for(int i = 0; i<num_a; i++)
        {
            if(classA[i]<th)
            {
                difference++;
                printf("\nmismatch:%d",classA[i]);
            }
        }
        for(int i = 0; i<num_b; i++)
        {
            if(classB[i]>th)
            {
                difference++;
                printf("\nmismatch:%d",classB[i]);
            }
        }
    }
    float total = float(num_a) + float(num_b);
    ///printf("\n%f\n",total);
    float accuracy = ((total-difference)/total) * 100;
    printf("\naccuracy = %f",accuracy);
}
