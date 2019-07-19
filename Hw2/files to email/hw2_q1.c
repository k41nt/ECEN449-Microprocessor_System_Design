#include <stdio.h>
#include <stdlib.h>

void add(float A[][10], float B[][10], float C[][10], int r, int c)
{// This function adds two matrixes
    int i, j;// i-index for row, j-index for columns
    for(i=0; i<r; i++)
    {
        for(j=0; j<c; j++)
        {
            C[i][j] = A[i][j] + B[i][j];
        }
    }
}

void transpose(float arr[][10], float temp[10][10], int r, int c)
{// This function transposes matrix
    int i, j;// i-index for row, j-index for columns
    for(i=0; i<c; i++)
    {
       for(j=0; j<r; j++)
        {
            temp[i][j] = arr[j][i];// rows will become columns and vice versa
        }
    }
}

void print(float arr[][10], int r, int c)
{//This function prints the array to the console, just for easy checking
    int i, j;// i-index for row, j-index for columns
    for(i=0; i<r; i++)
    {
        for(j=0; j<c; j++)
        {
            printf(" %.2f ", arr[i][j]);
        }
        printf("\n");
    }
}

void load(char fileName[], float arr[][10], int *r, int *c)
{//This function loads data from txt file
    int i, j; // i-index for row, j-index for columns
    FILE *fp;
    fp = fopen(fileName,"r");
    fscanf(fp, "%d %d", r, c); //read first line containing rows and columns
    for(i=0; i<*r; i++){ 
        for(j=0; j<*c; j++)
        {	//load numbers into an array from second line
            fscanf(fp, "%f", &(arr[i][j]));
        }
    }
    fclose(fp);// cloase file
}

void write(float arr[][10], int r, int c)
{// This function writes result to file
    int i, j;// i-index for row, j-index for columns
    FILE *fp;
    fp = fopen("outC.txt", "w");
    fprintf(fp, "%d %d\n", r, c); //write first line containing rows and columns
    for(i=0; i<r; i++)
    {
       for(j=0; j<c; j++)
        {	//write the result array to file second line
            fprintf(fp, "%.2f ", arr[i][j]);
        }
    }
    fclose(fp); // close file
}

int main()
{
    int rA, cA, rB, cB, rC, cC;

    float A[10][10], B[10][10], C[10][10];

    load("inA.txt", A, &rA, &cA);
    load("inB.txt", B, &rB, &cB);

    rC=rA;// set dimensions for matrix C
    cC=cA;

    float transposed_A[10][10];
    float transposed_B[10][10];

    printf("\n Array A: \n");
    print(A, rA, cA);

    printf("\n Array B: \n");
    print(B, rB, cB);

     if( (rA != rB) || (cA != cB))// check if dimensions matched
    {
        printf("\n Dimensions not matched!\n");
        return -1;
    }
	transpose(A ,transposed_A , rA, cA);
	transpose(B ,transposed_B , rB, cB);
    add(transposed_A, transposed_B, C, cC, rC);

    printf("\n Array C: \n");
    print(C, cC, rC);
    write(C, cC, rC);
    printf("\nCheck outC.txt for result\n");
    return 0;
}