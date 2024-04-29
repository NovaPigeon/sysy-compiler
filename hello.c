int main()
{
    int a = 1, b = 3;
    {
        int a = 2;
        int c = 3;
    }
    a = a + 1;
    return a;
}