function retval = task_102 ()

function y = f(x)
    y =3*x.^3-4*x-9;
end

a = 1;
b = 2;
t = 0.000001;

roots = [];
total_iterations = 0;

while (b - a) / 2 > t
    c = (a + b) / 2;
    roots = [roots; c];

    if f(c) == 0
        break;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end

    total_iterations = total_iterations + 1;
end

fprintf('Total iterations needed %d\n', total_iterations);
fprintf('%f is the approximated solution.\n',roots(end));
 x = linspace(1,2,100);
 y = f(x);

 figure;
 plot(x, y);
hold on;
plot(roots, f(roots), 'ro');
xlabel('x');
ylabel('function values');
title('Bisection Method');
legend('function values ', 'Roots');
grid on;

endfunction
