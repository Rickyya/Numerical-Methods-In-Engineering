clearvars
close all
clc

%[1]
function [sgn,exponent, mantissa] = convert_to_binary_float(number, precision)
    if nargin == 1 % Single precision
        precision = 1;
    end

    if abs(number) > (2^100) || abs(number) < (2^-100)
        error("Absolute value of number is not within range [2^-100, 2^100]")
    elseif precision == 1 % Single precision
        sgn = number < 0;
        mantissa = find_binary_mantissa(abs(number));
        exponent = find_binary_exponent(abs(number));
    elseif precision == 2 % Double precision
        sgn = number < 0;
        mantissa = find_binary_mantissa(abs(number), 2);
        exponent = find_binary_exponent(abs(number), 2);
    end
end

%  algorithm to find largest power of 2 that
%  is smaller than the number itself
%  i.e number = 50 -> 2^5 = 32 (2^6 = 64 > 50).
function result = find_exponent(number)
    if number < 1
        result = -1;
        while 2^(result-1) > number
            result = result - 1;
        end
        %disp(result)
    else
        result = 0;
        while 2^(result+1) < abs(number)
            result = result + 1;
        end
        disp(result)
    end
end

%[2]
function result = find_binary_exponent(number, ~)
    if nargin == 1 % Single precision
        result = zeros(1,8); % pre allocated array of size 8
        bias = 127; % Bias for single precision
        i = 8; % number of bits
    elseif nargin == 2 % Double precision
        result = zeros(1,11); % pre allocated array of size 11
        bias = 1023; % Bias for double precision
        i = 11; % number of bits
    end

    number = find_exponent(number) + bias; 
    while  number >= 0 && i > 0
        result(i) = rem(number,2);
        number = (number/2 - rem(number,2)/2);
        i = i - 1;
    end
end

%[3]
function result = find_binary_mantissa(number, ~)
    if nargin == 1 % Single precision
        bits = 23; % number of bits for single precision
        result = zeros(1,bits); % pre allocated array of size 23
    elseif nargin == 2 % Double precision
        bits = 52; % number of bits for double precision
        result = zeros(1,bits); % pre allocated array of size 52
    end
    
    number = mod(number / 2^(find_exponent(number)),1);
    i = 1;
    while  number ~= 1 && i <= bits
        number = number*2;
        result(i) = number >= 1;
        if number > 1; number = number - 1; end % only decimal part
        i = i + 1;
    end
end
