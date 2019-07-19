#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void sort(char arr[][100], int n)
{
    int i, j, min_idx;
  
    // One by one move boundary of unsorted subarray
    char minStr[100];
    for (i = 0; i < n-1; i++)
    {
        // Find the minimum element in unsorted array
        int min_idx = i;
        strcpy(minStr, arr[i]);
        for (j = i+1; j < n; j++)
        {
            // If min is greater than arr[j]
            if (strcasecmp(minStr, arr[j]) > 0)
            {
                // Make arr[j] as minStr and update min_idx
                strcpy(minStr, arr[j]);
                min_idx = j;
            }
        }
        // Swap the found minimum element with the first element
        if (min_idx != i)
        {
            char temp[100];
            strcpy(temp, arr[i]); //swap item[pos] and item[i]
            strcpy(arr[i], arr[min_idx]);
            strcpy(arr[min_idx], temp);
        }
    }
}
  

int main(){
char words[100][100]; // to save words
int i=0;
int j=0;

printf("\nInput read from Input2.txt is:\n");
// Reads input file
FILE *fptr;
fptr = fopen("Input2.txt", "r");
while(!feof(fptr)){
	fscanf(fptr,"%s",&words[i]);// read from file
	printf("%s ",words[i]); // print to screen
	i++;
}
fclose(fptr);// close file 
printf("\n\n");

sort(words,i); // sort the array
printf("Check the file Output2.txt for result. \n\n");
printf("This is the output: \n");

//Writes output on screen and to file
FILE *output;
output = fopen("Output2.txt", "w");
for(j=0 ; j<i; j++){
	printf("%s ",words[j]);// print to screen
	fprintf(output,"%s ",&words[j]);// print into file
}
fclose(output);// close file
printf("\n");
return 0;
}