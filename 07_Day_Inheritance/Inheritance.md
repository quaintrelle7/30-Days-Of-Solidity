# Inheritance

- Supports Polymorphism
- Multiple Inhertance is Possible
- virtual keyword -- function can change its behaviour in derived class
- To override a function use override and virtual keyword
- Possible to call a specific overridden function.
- Specifying just 'override' and not 'virtual' doesn't change the behaviour of the function.

## Function Overriding

- override keyword: To override the function
- Overriding function may only change the visibility of the overridden function from external to public.
- nonpayable can be overridden by view and pure.
- view can be overridden by pure.
- payable cannot be changed to any other mutability

- More formally, it is not required to override a function (directly or indirectly) inherited from multiple bases if there is a base contract that is part of all override paths for the signature, and (1) that base implements the function and no paths from the current contract to the base mentions a function with that signature or (2) that base does not implement the function and there is at most one mention of the function in all paths from the current contract to that base.

- Functions with the private visibility cannot be virtual.
- Functions without implementation have to be marked virtual outside of interfaces. In interfaces, all functions are automatically considered virtual.
- While public state variables can override external functions, they themselves cannot be overridden.

# Modifier Overriding


