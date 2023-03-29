#include<iostream>
using namespace std;
int SumFunction(int *array, int idx, int n){
    if(idx == n-1){
        return array[idx];
    }
    return array[idx]+ SumFunction(array, idx+1, n);
}
int main(){
    int array[]={3,10,5,9,14};
    cout<<"The sum of the array is :"<<endl;
    int sum =SumFunction(array,0, 5);
    cout<<sum; 
    return 0;
}