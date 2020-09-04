/*  Shana Slavin
    CPSC 2310 Section 02
    Due October 22, 2018
*/

#include <iostream>
#include <cstdio>
#include <cmath>
#include <string>

using namespace std;


struct variables{

	int multiplicand;
	int multiplier;
	int carry;
	int acc;
	int mq;
	int mdr;
	int solution;
};

// converts user input to binary number
string prt_bin(int val, int len){
	
	string binary;

	for(int i = (len - 1); i >= 0; i--){
		if((val >> i) & 1){
			binary.push_back('1');
		}
		else{
			binary.push_back('0');
		}
	}
	return binary;
}

// prints - to seperate steps
void print_ln(){
	
	for(int i = 0; i < 50; i++){
		putchar('-');
	}
	putchar('\n');

	return;
}

// prompts user for multiplicand and multiplier

bool input(variables *var){
	
	cout << "Enter an integer between 0-255 for multiplicand: \n";
	cin >> var->multiplicand;
	
	if(var->multiplicand < 0 || var->multiplicand > 255){
		cout << "Error: values must be between 0-255\n";
		return false;
	}

	cout << "Enter an integer between 0-255 for multiplier\n";
	cin >> var->multiplier;

	if(var->multiplier < 0 || var->multiplier > 255){
		cout << "Error: values must be between 0-255\n";
		return false;
	}

	return true;
}

// prints initial values
void initializer(variables *var){

	print_ln();
	
	cout << "multiplicand: " << var->multiplicand << endl;
	cout << "multiplier: " << var->multiplier << endl;

	var->carry = 0;
	var->acc = 0;

	cout << "c and acc set to 0\n";

	var->mq = var->multiplier;

	cout << "mq set to multiplier    = " << var->multiplier << "decimal ";
	cout << "and " << prt_bin(var->multiplicand, 8) << " binary\n";

	print_ln();

	return;
}

// prints the first line of each step of multiplicand
void print_first_line(int step, variables *var){
	
	cout << "step " << step + 1 << ": " << var->carry;
	cout << " " << prt_bin(var->acc, 8) << " ";
	cout << prt_bin(var->mq, 8) << endl;

	return;
}

// add values in accumulator and mdr
void add(variables *var){

	cout << "       +  " << prt_bin(var->mdr, 8) << "        ^ ";
	cout << "add based on lsb = 1\n";
	cout << "           -----------\n";
	
	var->acc = var->acc + var->multiplicand;
	
	if(var->acc > 255){
		var->carry = 1;
	}
	
	return;
}

// prints visual of process without changing acc
void no_add(){
	
	cout << "       +  " << prt_bin(0, 8) << "        ^ ";
	cout << "no add based on lsb = 0\n";
	cout << "           -----------\n";

	return;
}

// moves value of carry & acc & mq by 1 bit right
void shift(variables *var){

	var->mq = var->mq>>1;

	if(prt_bin(var->acc, 8)[7] == '1'){
		var->mq += 128;
	}

	var->acc = var->acc>>1;
	var->carry = 0;

	return;
}

// prints the rest of each step
void steps(variables *var){

	cout << "         " << var->carry << " ";
	cout << prt_bin(var->acc, 8) << " ";
	cout << prt_bin(var->mq, 8) << endl;
	cout << "      >>                   shift right\n";

	shift(var);

	cout << "         " << var->carry << " " << prt_bin(var->acc, 8) << " ";
	cout << prt_bin(var->mq, 8) << endl;

	print_ln();
	
	return;
}

// convers string to integer
int decimal(string binary){
	
	int sum = 0;

	for(int i = binary.length(); i >= 0; i--){
		if(binary[i-1] == '1'){
			sum += pow(2.0, binary.length() - i);
		}
	}

	return sum;
}

// multiplication process
void eval_print(int step, variables *var){
	
	print_first_line(step, var);
	if(prt_bin(var->mq, 8)[7] == '1'){
		add(var);
	}
	else{
		no_add();
	}

	steps(var);

	return;
}

// checks final result
void check(variables *var) {

	string bin_sol = prt_bin(var->acc, 8) + prt_bin(var->mq, 8);
	var->solution = decimal(bin_sol);
	cout << "check:             binary   decimal" << endl;
	cout << "                     " << prt_bin(var->multiplicand, 8);
	printf("%10i\n", var->multiplicand);
	cout << "           x        " << prt_bin(var->multiplier, 8);
	printf(" x%7i\n", var->multiplier);
	cout << "                 ----------------  -------\n";
	cout << "               " << bin_sol;
	printf("%10i\n", var->solution);

	return;
}

// main
int main(){

	struct variables var;

	if(!input(&var)){
		return 0;
	}

	initializer(&var);

	for(int i = 0; i < 8; i++){
		eval_print(i, &var);
	}
	
	check(&var);

	return 0;
}		
