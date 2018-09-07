#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int main()
{
    float A[1000],B[1000],A_B[1000];
    int Anum,Bnum,Amin,Bmin,k=0;
    printf("Enter the total number of elements of class A:");
    scanf("%d",&Anum);
    for (int i=0;i<Anum;i++)
    {
        scanf("%f",&A[i]);
        ///Amin=A[i];
        A_B[k]=A[i];
        k++;
    }
    printf("Enter the total number of elements of class B:");
    scanf("%d",&Bnum);
    for (int i=0;i<Bnum;i++)
    {
        scanf("%f",&B[i]);
        ///Bmin=B[i];
        A_B[k]=B[i];
        k++;
    }
    int mismatch[1000],flag[1000];
    for (int i =0;i<k;i++)
    {
        int x1=0,x2=0,y1=0,y2=0;
        for (int j=0;j<Anum;j++)
        {
            if(A[j]>=A_B[i])
                x1++;
            if(A[j]<=A_B[i])
                x2++;
        }
        for (int j=0;j<Bnum;j++)
        {
            if(B[j]<A_B[i])
                y1++;
            if(B[j]>A_B[i])
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
        ///printf("%d--->%d\n\n",i,mismatch[i]);
    }

    int mismatches = 1000,t;
    float thres;
    for (int i = 0;i<k;i++)
    {
        if (mismatch[i]<mismatches)
        {
            mismatches = mismatch[i];
            thres = A_B[i];
            t=i;
           /// printf("%d ----- %f\n",i,thres);
        }
    }
    printf("threshold --> %f",thres);

    if (flag[t] == 1)
    {
        for(int i=0;i<Anum;i++)
        {
            if(A[i]>=A_B[t])
            {
                printf("\nmismatch: %f",A[i]);
            }
        }
        for(int i=0;i<Bnum;i++)
        {
            if(B[i]<A_B[t])
            {
                printf("\nmismatch: %f",B[i]);
            }
        }
    }
    else
    {
        for(int i=0;i<Anum;i++)
        {
            if(A[i]<=A_B[t])
            {
                printf("\nmismatch: %f",A[i]);
            }
        }
        for(int i=0;i<Bnum;i++)
        {
            if(B[i]>A_B[t])
            {
                printf("\nmismatch: %f",B[i]);
            }
        }
    }
}