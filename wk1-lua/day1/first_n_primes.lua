-- Day 1: Easy Exercise
--
-- Create a program to print the first n prime numbers that end in 3.

function ends_in_3(num)
    local final_digit = math.abs(num) % 10
    return final_digit == 3
end

function is_prime(num)
    if num < 1 then
        return false
    elseif num == 1 or num == 2 then
        return true
    else
        half_point = math.floor(num / 2)
        for i = 2, half_point do
            if num % i == 0 then
                return false
            end
        end
        return true
    end
end

function print_first_n_primes(n)
    local primes_found = 0
    local current_number = 1
    while primes_found < n do
        if is_prime(current_number) then
            primes_found = primes_found + 1
            print('(prime #' ..  primes_found .. '): ' ..  current_number .. ' ')
        end
        current_number = current_number + 1
    end
end

print_first_n_primes(25)
