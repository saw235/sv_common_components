#ifndef NDEBUG
#define ASSERT(condition, message) \
    do { \
        if (! (condition)) { \
            std::cerr << "Assertion `" #condition "` failed in " << __FILE__ \
                      << " line " << __LINE__ << ": " << message << std::endl; \
            std::terminate(); \
        } \
        else { \
            std::cout << "Assertion `" #condition "` passed. " << std::endl; \
        } \
    } while (false)
#else
#define ASSERT(condition, message) do { } while (false)
#endif