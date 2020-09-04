/*
Shana Slavin
CPSC 2311 Section 001
Due November 29, 2018
*/


#include <stdio.h>
  
int main()
{
  int sign, exp, fraction, significand;
  int i;
  float f;
  float prev = 0;

  
  int s = 0;
  int x = 0;
  int ff = 0;

  for (i = 0; i < 256; i++)
  {
    /* begin your code */

	fraction = (i & 7);
	exp = ((i >> 3) & 15);
	sign = ((i >> 7) & 1);

	if(exp == 0){
		exp -= 7;
		x = 0;
	} else{
		exp -= 8;
		x = 1;
	}

	if(sign == 0){
		s = 1;
	} else{
		s = -1;
	}

	ff = fraction;
	significand = (x << 3) + ff;
	exp -= 3;	
	f = significand;

	if(exp > 0){
		for(int a = 0; a < exp; a++){
			f*= 2;
		}
	} else{
		for(int b = 0; b > exp; b--){
			f *= 0.5;
		}
	}

	f *= s;

    /* end your code */

    printf ("%02x => %08x = %+11.6f (spacing = %+11.6f)\n",
            i, *(int*) &f, f, prev-f);
    prev = f;
  }

  return 0;
}
