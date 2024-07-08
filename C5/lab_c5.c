#include<stdio.h>
#include<string.h>
int z=0,i=0,j=0,c=0; //c for length of string, i for stack, j for
//input and z for check function
char a[16],ac[20],stk[15],act[10]; //act[ ] for shift and ac[ ]for reduce
void check(); // to check top of stack
void main()
{
printf("GRAMMER is \nE->E+T|T \n T->T*F|F \n F->(E) \n F->id");
printf("\nEnter input string\n");
scanf("%s",a);
c=strlen(a);
strcpy(act,"SHIFT->"); //initial configuration
printf("stack \t input \t action");
//printf("\n---------------------------------------\nâ€ );
for(i=0; j<c; i++,j++)
{
if(a[j]=='i' && a[j+1]=='d') //checks the input for
{
stk[i]=a[j];
stk[i+1]=a[j+1]; //shift id to stack
stk[i+2]='\0';
a[j]=' '; //delete "id" from input array
a[j+1]=' ';
printf("\n$%s\t%s$\t%sid",stk,a,act);
//displays the first line SHIFT->id
check();
}
else
{
stk[i]=a[j];
stk[i+1]='\0';
a[j]=' ';
printf("\n$%s\t%s$\t%sSYMBOLS",stk,a,act);
//print SHIFT->symbols for inputs like +,*
check();
}
}
if((strcmp(stk,"E")==0)) 
printf("\n---------\n SUCCESS!!!!!!!!!!\n");
else
printf("\n-----------------\nERROR!!!!!!\n");
}
void check()
{
strcpy(ac,"REDUCE "); //dispaly REDUCE
for(z=0;z<c;z++)
if(stk[z]=='(' && stk[z+1]=='E' && stk[z+2]==')')
//if stack holds (E)
{
stk[z]='F'; //reduce to F
stk[z+1]='\0';
printf("\n$%s\t%s$\t%s",stk,a,ac);
i=i-2; //top of stack holds F
}
for(z=0;z<c;z++) // if stack holds id
if(stk[z]=='i' && stk[z+1]=='d')
{
stk[z]='F';
stk[z+1]='\0';
printf("\n$%s\t%s$\t%s",stk,a,ac);
j++; //move input pointer
}
for(z=0;z<c;z++) // if stack holds T*F
{
if(stk[z]=='T' && stk[z+1]=='*' && stk[z+2]=='F')
{
stk[z]='T';
stk[z+1]='\0';
printf("\n$%s\t%s$\t%s",stk,a,ac);
i=i-2;
}
else if(stk[z]=='F')
{
stk[z]='T';
printf("\n$%s\t%s$\t%s",stk,a,ac);
}
}
for(z=0;z<c;z++) //checks for stack E+T*
{
if(stk[z]=='E' && stk[z+1]=='+' && stk[z+2]=='T'&&
stk[z+3]=='*')
break;
if(stk[z]=='E' && stk[z+1]=='+' && stk[z+2]=='T'&&
a[j+1]=='*')
//stack is E+T and ip is *
break;
else if(stk[z]=='E' && stk[z+1]=='+' && stk[z+2]=='T')
//stack is E+T
{
stk[z]='E';
stk[z+1]='\0';
printf("\n$%s\t%s$\t%s",stk,a,ac);
i=i-2;
return;
}
}
for(z=0;z<c;z++)
{
if(stk[z]=='T')
if (a[j+1]=='*')
break;
else if(stk[z+1]=='*')
break;
else
{
stk[z]='E';
printf("\n$%s\t%s$\t%s",stk,a,ac);
}
}
}
