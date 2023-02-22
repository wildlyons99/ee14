// EE14 Homework 2 - Problem 12
// Tom Lyons
#include <stdio.h>
#include <string.h>

// renamed because strstr already exists in the string library
char *my_strstr(char *strnl, char *str2);

int main() {
    char *string1 = "Hello, world";
    char *string2 = "Hell";
    
    my_strstr(string1, string2);

    char *string1 = "Hello, world";
    char *string2 = "world";
    
    my_strstr(string1, string2);

    // confirming no seg fault
    char *string1 = "Hello, worl";
    char *string2 = "world";
    
    my_strstr(string1, string2);
}

/* strstr
 * Purpose:    To find the memory location of first instance of str2 in str1
 * Parameters: "Strings" str1 and str2
 * Returns:    The mempory address of the first insatnce of the substring 
 */
char *my_strstr(char *str1, char *str2) {
    int length1 = strlen(str1);
    int length2 = strlen(str2);

    // loop through strings within range and check characters
    for (int i = 0; i < length1; i++) {
        for (int j = 0; j < length2 && i + j < length1; j++) {
            if (str1[i + j] != str2[j]) {
                break;
            }

            // checks if substring was found
            if (j + 1 == length2) {
                printf("Found! returning address of %c\n", str1[i]);
                return &str1[i];
            }
        }
    }
    
    printf("Note Found! Try again!\n");
    return NULL;
}
