%clearvars
%close all
%clc

n = input("Enter number to check if prime: ");



if isPrime(n)
    fprintf("%d %s\n", n, "is a prime number")
else
    fprintf("%d %s\n", n, "is not a prime number")
end

function result = isPrime(x)
    result = false;
    if x == 2
        result = true;
        return
    elseif x > 2 && mod(x,2) ~= 0
        for i=2:(x-1)
            if rem(x,i) == 0
                return
            end
        end
        result = true;
        return
    end
end