function retval = task_104 ()


function [y, dy] = f(x)
    y =x.^3-4*x-9;
    dy = 3*x.^2 - 4;
end


x0 = 2;
tolerance = 1e-6;

roots = [];
tangent_lines = [];
iterations = 0;

while true
    [y, dy] = f(x0);
    x1 = x0 - y / dy;
    roots = [roots; x1];
    tangent_lines = [tangent_lines; [x0, y, dy]];

    if abs(x1 - x0) < tolerance
        break;
    end

    x0 = x1;
    iterations = iterations + 1;
end

fprintf('Total iterations needed %d\n', iterations);
fprintf('%f is the approximated solution.\n',roots(end));

x = linspace(1, 3, 100);
[y, dy] = f(x);

figure;
plot(x, y);
hold on;
plot(roots, f(roots), 'ro');
for i = 1:length(roots)
    x_tangent = roots(i) - 1:0.01:roots(i) + 1;
    y_tangent = tangent_lines(i, 2) + tangent_lines(i, 3) * (x_tangent - roots(i));
    plot(x_tangent, y_tangent, 'g--');
end
xlabel('x');
ylabel('functions value');
title('Newton-Raphson Method');
legend('f(x)', 'Roots', 'Tangent Lines');
grid on;


endfunction
