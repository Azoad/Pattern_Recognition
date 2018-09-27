#include<stdio.h>
#include<math.h>

int main()
{
    int num_a,num_b;
    float p_a,p_b;
    ///taking the number of elements in class A
    printf("Enter the number of elements in Class A:");
    scanf("%d",&num_a);

    ///taking the number of elements in class B
    printf("\nEnter the number of elements in Class B:");
    scanf("%d",&num_b);

    ///probability of being in class a P(A)
    printf("Enter the value of P(A):");
    scanf("%f",&p_a);

    ///probability of being in class a P(B)
    printf("Enter the value of P(B):");
    scanf("%f",&p_b);

    float class_a[1000], class_b[1000];

    for(int i=0;i<1000;i++)
    {
        class_a[i] = 0.0;
        class_b[i] = 0.0;
    }

    ///taking class A input
    printf("\nEnter the elements of Class A:\n");
    for(int i=0;i<num_a;i++)
    {
        scanf("%f",&class_a[i]);
    }
    ///taking class B input
    printf("\nEnter the elements of Class B:\n");
    for(int i=0;i<num_b;i++)
    {
        scanf("%f",&class_b[i]);
    }

    ///taking sample input to classify
    float sample;
    printf("\nEnter the sample value:");
    scanf("%f",&sample);

    ///getting the ceiling and floor value of the sample input
    float ceil_sample, floor_sample;

    ceil_sample = ceil(sample);
    floor_sample = floor(sample);

    printf("\nThe class interval containing %0.2f is [ %0.2f , %0.2f ] ",sample,floor_sample,ceil_sample);

    /// total number of values between the ceiling and floor value of sample input in class a
    float count_a = 0.0;
    for(int i=0;i<num_a;i++)
    {
        if (class_a[i]>= floor_sample && class_a[i]<=ceil_sample)
            count_a++;
    }
    printf("%d",count_a);
    /// total number of values between the ceiling and floor value of sample input in class b
    float count_b = 0.0;
    for(int i=0;i<num_b;i++)
    {
        if (class_b[i]>= floor_sample && class_b[i]<=ceil_sample)
            count_b++;
    }

    float prob_a,prob_b,x,y;

    x = (count_a/num_a)*p_a;
    y = (count_b/num_b)*p_b;

    prob_a = (x/(x+y));

    printf("\n\nP(A|%0.2f) = %f",sample,prob_a);

    prob_b = 1 - prob_a;

    printf("\nP(B|%0.2f) = %f\n",sample,prob_b);

    if (prob_b>prob_a)
    {
        printf("\nP(A|%0.2f) < P(B|%0.2f), so the sample should be classified into class B",sample,sample);
    }
    else
    {
        printf("\nP(A|%0.2f) > P(B|%0.2f), so the sample should be classified into class A",sample,sample);
    }

}
