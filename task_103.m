function retval = task_103 (input1, input2)

function y = f(x)
    y =x.^3-4*x-9;
end

a = 1;
b = 3;
t = 1e-6;

roots = [];
total_iterations = 0;

while (b - a) / 2 > t
    c = (a*f(b) - b*f(a)) / (f(b) - f(a));
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

x = linspace(1, 3, 100);
y = f(x);

figure;
plot(x, y);
hold on;
plot(roots, f(roots), 'ro');
xlabel('x');
ylabel('function value');
title('False-Position Method ');
legend('function falues', 'Roots');
grid on;


endfunction
