// Usage:
// > g++ -Wno-c++11-extensions mem_fact.cpp
// > ./a.out
/*
 *
Which of these C++ functions are pure?
Try to memoize them and observe what happens when you call them multiple times: memoized and not.
1. The factorial function from the example in the text.
2. std::getchar()
3. bool f1_withSideEffects() {
    std::cout << "Hello!" << std::endl;
    return true;
   }
4. int f2_withSideEffects(int x)
   {
    static int y = 0;
    y += x;
    return y;
   }

ANS:
1. is pure, no difference between memoized and non-memoized
2. returns whatever was entered in the input stream - not pure, memoized version returns the first value that was entered not the current one.
3. seems pure - return value is constant, however not pure because of side effects of writing to a stream.
4. not pure because if use of static variable, memoized version != regular call after 1st call

 */

#include <map>
#include <iostream>
#include <chrono>

using namespace std;
using namespace std::chrono;

template<typename T1, typename T2>
class Memoized {
	public:

		Memoized (T2 (*g)(T1)) {
			f = g;
			_memo.clear();
		}

		T2 call(T1 x) {
			try {
				return _memo.at(x);

			} catch(...) {
				T2 res = f(x);
				_memo[x] = res;
				return res;
			}
		}

	private:
		map<T1, T2> _memo;
		T2 (*f)(T1);
};

double fact(int n) {
    double result = 1;
    for (int i = 2; i <= n; ++i)
        result *= i;
    return result;
}

bool f1_withSideEffects() {
	std::cout << "Hello!" << std:endl;
	return true;
}

int f2_withSideEffects(int x)
{
    static int y = 0;
    y += x;
    return y;
}

int main(int argc, char *argv[]) {
    int x = 1000;

    cout << "1. Factorial\n";
    Memoized<int, double> fact_m(fact);
    for(auto i=0; i < 2; ++i) {
        cout << "\tTrial " << i << "\n";
        high_resolution_clock::time_point t1 = high_resolution_clock::now();
        double res = fact(x);
        high_resolution_clock::time_point t2 = high_resolution_clock::now();
        auto duration = duration_cast<microseconds>( t2 - t1 ).count();
        t1 = high_resolution_clock::now();
        double res_m = fact_m.call(x);
        t2 = high_resolution_clock::now();
        auto duration_m = duration_cast<microseconds>( t2 - t1 ).count();
        printf("\t\tFunction argument: %d; Function result: %e; Memoized function result: %e.\n", x, res, res_m);
        printf("\t\tFunction time: %lld us; Memoized function time: %lld us.\n", duration, duration_m);
    }

    cout << "4. f(int x)\n";
    Memoized<int, int> f_m(f);
    for(auto i=0; i < 2; ++i) {
        cout << "\tTrial " << i << "\n";
        high_resolution_clock::time_point t1 = high_resolution_clock::now();
        int res = f(x);
        high_resolution_clock::time_point t2 = high_resolution_clock::now();
        auto duration = duration_cast<microseconds>( t2 - t1 ).count();
        t1 = high_resolution_clock::now();
        int res_m = f_m.call(x);
        t2 = high_resolution_clock::now();
        auto duration_m = duration_cast<microseconds>( t2 - t1 ).count();
        printf("\t\tFunction argument: %d; Function result: %d; Memoized function result: %d.\n", x, res, res_m);
        printf("\t\tFunction time: %lld us; Memoized function time: %lld us.\n", duration, duration_m);
    }
}
