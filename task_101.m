
function retval = task_101 ()


A = input("Matrix A: ");


    B = input("Matrix B : ");


    maximum_value_A = max(max(A));
    fprintf("Maximum value of A is : %d\n", maximum_value_A);


    if size(A, 2) == size(B, 1)

        Multiplication = A * B;
        fprintf("Answer is :\n");
        disp(Multiplication);
    else
        fprintf("Matrix multiplication is not possible..\n");
    end


endfunction
