int main()
{
    return 1 + 2 - 3 * 4 / 5 % 6 + !7 --8; // 注意这里的--8应当被解释成-(-8)而不是--8（后者实际上也是不合法的）
}