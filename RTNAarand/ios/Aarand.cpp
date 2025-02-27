#include "Aarand.hpp"
#include "aarand/aarand.hpp"
#include <random>
#include <iostream>

namespace aarand_example
{
    double Aarand::add(double a, double b)
    {
        return a + b;
    }

    std::string Aarand::performAarandLogic()
    {
        std::mt19937_64 rng(42);
        double val = aarand::standard_uniform(rng);
        auto paired = aarand::standard_normal(rng);

        std::string result = "Uniform value is: " + std::to_string(val) + 
                             ", Normal values are: " + std::to_string(paired.first) + 
                             ", " + std::to_string(paired.second);
        return result;
    }
}
