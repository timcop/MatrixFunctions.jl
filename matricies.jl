## Packages needed
using LinearAlgebra
using Combinatorics

## Our function, n = dimension of square matricies (i.e n=4 for 4 x 4 matrix)
function josh_matrices(n, unique)
    # Initialise arrays
    C = Array{Float64, 1}[]; # Columns of matrix
    v = zeros(n)
    arrs = Array{Any, 2}[]
    A = zeros(n, n);
    B = [1 0 1; 0 1 1; 1 1 0]
    
    

    C = collect.(Iterators.product(ntuple(_ -> -1:1, n)...))[:]
    A_perms = collect(with_replacement_combinations(C, n));
    
    for i in 1:length(A_perms)
        perm = collect(permutations(A_perms[i], n));
        for j in 1:length(perm)
            push!(A_perms, perm[j])
        end
    end


    println(length(A_perms))
    for i in 1:length(A_perms)
        
        for j in 1:n
            A[:, j] = A_perms[i][j];
        end
        if A == B
            println("here")
        end
        d = det(A);
        if (d != 0 && d != 1 && d!= -1)
           
            sub_bool = false
            for j in 1:2
                sub = A[1:n-1, j:(n-2+j)];
                if (det(sub) != 0 && det(sub) != 1 && det(sub)!= -1)
                    sub_bool = true;
    
                    break;
                end
                sub = A[2:n, j:(n-2+j)];
                if (det(sub) != 0 && det(sub) != 1 && det(sub)!= -1)
                    sub_bool = true;
                    
                    break;
                end
            end
            sub = A[1:2, 1:2:3]
            if (det(sub) != 0 && det(sub) != 1 && det(sub)!= -1)
                
                sub_bool = true;
                break;
            end
            sub = A[1:2:3, 1:2:3]
            if (det(sub) != 0 && det(sub) != 1 && det(sub)!= -1)
                sub_bool = true;
                
                break;
            end
            sub = A[2:3, 1:2:3]
            if (det(sub) != 0 && det(sub) != 1 && det(sub)!= -1)
                sub_bool = true;
                
                break;
            end
            sub = A[1:2:3, 1:2]
            if (det(sub) != 0 && det(sub) != 1 && det(sub)!= -1)
                sub_bool = true;
               
                break;
            end
            sub = A[1:2:3, 2:3]
            if (det(sub) != 0 && det(sub) != 1 && det(sub)!= -1)
                sub_bool = true;
                if A == B
                    println("here")
                end
                break;
            end
            
            
            
            
            if sub_bool == false
                   
                if (unique == false)
                    push!(arrs, A)

                elseif length(arrs) == 0
                    push!(arrs, A); # Store the matrix
                else
                    x = 1;
                    similar = false;
                    while (x <= length(arrs) && similar == false)
                        
                        darrs = det(real(arrs[x]));
                        if (darrs == -d || darrs == d)
                            #check if matrix is scalar multiple
                            if (A == -arrs[x])
                                simialr = true;
                                break;
                            else 
                                count = 0;
                                for j in 1:n
                                    for k in 1:n
                                        if (A[k, :] == arrs[x][j, :] || A[k, :] == -arrs[x][j, :])
                                            count+= 1;
                                        end
                                    end
                                end
                                if count == n
                                    similar = true;
                                    break;
                                end
                            end
                        end
                        if (similar == false && x == length(arrs))
                            push!(arrs, A);
                        end
                        x += 1;
                    end
                end
            end
        end
    end 
    return arrs
end



    


  



a = josh_matrices(3, true) # Returns the distinct matricies
a_size = length(a) # The number of distict matricies

a1 = [1 0 0; 0 1 0; 0 0 1]
collect(permutations(a1))
a2 = -a1

a1 == -a2

C = collect.(Iterators.product(ntuple(_ -> 0:1, 2)...))[:]
A_perms = collect(with_replacement_combinations(C, 2))
collect(permutations(A_perms[2], 3))
A = [1 0 1; 0 1 1; 1 1 0]
A[1:2:3, 1:2:3]
for i in 1:length(a)
    show(stdout, "text/plain", a[i])
    println()
end


C = collect.(Iterators.product(ntuple(_ -> -1:1, 3)...))[:]
A_perms = collect(with_replacement_combinations(C, 3))
    
for i in 1:length(A_perms)
    perm = collect(permutations(A_perms[i], 3));
    for j in 1:length(perm)
        push!(A_perms, perm[j])
    end
end
A_perms
A = zeros(2, 2)
A[:, 1] = A_perms[9][1]
A