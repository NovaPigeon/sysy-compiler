int f(int a[][2])
{
    return a[1][0];
}



int main()
{
    int a[2][2][2]={3,2,3,4};
    int s=f(a[0]);
    putint(s);
    putch(10);
    return 0;
}
