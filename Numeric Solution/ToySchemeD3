function c = ToySchemeD3(Nx, Ny, Nt, T, c0, Ux, Uy, D, source_x, source_y, Q)
    dt = T/Nt;
    dx = 1/(Nx+1);
    dy = 1/(Ny+1);
    c = zeros(Nx+2, Ny+2);

    % Initial Conditions
    c = c0;

    % Calculating the field variable for each time step
    for it = 1:Nt
        cn = c;
        for i = 2:Nx+1
            for j = 2:Ny+1
                if Ux(i,j,it) >= 0
                    adv_x = Ux(i,j,it)*(cn(i,j)-cn(i-1,j))/dx;
                else
                    adv_x = Ux(i,j,it)*(cn(i+1,j)-cn(i,j))/dx;
                end

                if Uy(i,j,it) >= 0
                    adv_y = Uy(i,j,it)*(cn(i,j)-cn(i,j-1))/dy;
                else
                    adv_y = Uy(i,j,it)*(cn(i,j+1)-cn(i,j))/dy;
                end

                source = 0;
                if i == source_x && j == source_y
                    source = Q;
                end

                c(i,j) = cn(i,j) - dt*(adv_x + adv_y) + D*dt*((cn(i+1,j)-2*cn(i,j)+cn(i-1,j))/dx^2 + (cn(i,j+1)-2*cn(i,j)+cn(i,j-1))/dy^2) + source;
            end
        end

        % Boundary conditions
        c(1,:) = 0;
        c(Nx+2,:) = 0;
        c(:,1) = 0;
        c(:,Ny+2) = 0;
    end
    
end
