#include<stdio.h>
#include<stdlib.h>

int main()
{
    float Class_A[1000],Class_B[1000],Class_A_B[1000];
    int A_num,B_num,k=0;
    printf("Enter the total number of elements of class A:");
    scanf("%d",&A_num);
    for (int i=0;i<A_num;i++)
    {
        scanf("%f",&Class_A[i]);
        Class_A_B[k]=Class_A[i];
        k++;
    }
    printf("Enter the total number of elements of class B:");
    scanf("%d",&B_num);
    for (int i=0;i<B_num;i++)
    {
        scanf("%f",&Class_B[i]);
        Class_A_B[k]=Class_B[i];
        k++;
    }
    int mismatch[1000],flag[1000];
    for (int i =0;i<k;i++)
    {
        int x1=0,x2=0,y1=0,y2=0;
        for (int j=0;j<A_num;j++)
        {
            if(Class_A[j]>=Class_A_B[i])
                x1++;
            if(Class_A[j]<=Class_A_B[i])
                x2++;
        }
        for (int j=0;j<B_num;j++)
        {
            if(Class_B[j]<Class_A_B[i])
                y1++;
            if(Class_B[j]>Class_A_B[i])
                y2++;
        }
        if ((x1+y1)<(x2+y2))
        {
            mismatch[i] = x1+y1;
            flag[i] = 1;
        }
        else
        {
            mismatch[i] = x2+y2;
            flag[i] = 0;
        }
    }

    int mismatches = 1000,t;
    float thres;
    for (int i = 0;i<k;i++)
    {
        if (mismatch[i]<mismatches)
        {
            mismatches = mismatch[i];
            thres = Class_A_B[i];
            t=i;
        }
    }
    printf("threshold --> %0.1f",thres);
    int index=1;
    if (flag[t] == 1)
    {
        printf("\nValue less than %0.1f will be in Class A and value greater than %0.1f will be in Class B",thres,thres);
        for(int i=0;i<A_num;i++)
        {
            if(Class_A[i]>=Class_A_B[t])
            {
                printf("\nmismatch %d: %0.1f",index,Class_A[i]);
                index++;
            }
        }
        for(int i=0;i<B_num;i++)
        {
            if(Class_B[i]<Class_A_B[t])
            {
                printf("\nmismatch %d: %0.1f",index,Class_B[i]);
                index++;
            }
        }
    }
    else
    {
        printf("\nValue less than %f will be in Class B and value greater than %f will be in Class A",thres,thres);
        for(int i=0;i<A_num;i++)
        {
            if(Class_A[i]<=Class_A_B[t])
            {
                printf("\nmismatch %d: %0.1f",index,Class_A[i]);
                index++;
            }
        }
        for(int i=0;i<B_num;i++)
        {
            if(Class_B[i]>Class_A_B[t])
            {
                printf("\nmismatch %d: %0.1f",index,Class_B[i]);
                index++;
            }
        }
    }
}
