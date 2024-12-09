clear;

function programa1a()
    disp("Ejecutando parte 1a");
    
    // Constantes
    g = 9.8; // Aceleración de la gravedad
    
    // Condiciones iniciales
    disp("Ingrese las condiciones iniciales:");
    v0 = input("Velocidad inicial (v0) en m/s: ");
    tita = input("Ángulo inicial (tita) en grados: ");
    
    // Inicialización de variables
    vx = v0 * cosd(tita); 
    vy = v0 * sind(tita); 
    
    // Cálculo del tiempo total de vuelo (válida solo para cuando yf = y0)
    T = (2 * vy) / g * 1.01; 
    
    // Paso de tiempo para el while
    dt = T / 100; // Incremento de tiempo (controla la precisión)
    t = 0; // Tiempo inicial
    
    // Inicialización de vectores para almacenar los valores
    xteo = [];
    yteo = [];
    
    // Cálculo iterativo usando un while
    while t <= T
        //Calcular las posiciones analíticas
        xt = vx * t; // Posición en x
        yt = vy * t - (0.5 * g * t^2); // Posición en y
        
        //Almacenar los valores en los vectores
        xteo = [xteo, xt];
        yteo = [yteo, yt];
        
        //Incrementar el tiempo
        t = t + dt;
    end
    
    // Graficar la trayectoria
    plot(xteo, yteo, "r");
    xtitle("Trayectoria analítica", "Posición en x (m)", "Posición en y (m)");
endfunction

function programa1b()
    disp("Ejecutando parte 1b");
    
    // Constantes
    g = 9.8; // Aceleración de la gravedad
    
    // Condiciones iniciales
    disp("Ingrese las condiciones iniciales:");
    v0 = input("Velocidad inicial (v0) en m/s: ");
    tita = input("Ángulo inicial (tita) en grados: ");
    
    // Inicialización de variables
    vx(1) = v0 * cosd(tita); 
    vy(1) = v0 * sind(tita);
    x(1) = 0; 
    y(1) = 0; 
    t(1) = 0;  
    i = 1;    
    
    // Paso de integración
    Dt = 0.001;
    
    // Euler
    while y>=0 then
        ax = 0
        ay = -g;
        
        // Actualización de velocidad y posición en x
        vx(i+1) =vx (i) + ax*Dt;
        x(i+1) =x(i) + vx(i)*Dt; 
        
        // Actualización de velocidad y posición en y
        vy(i+1) =vy (i) + ay*Dt;
        y(i+1) =y(i) + vy(i)*Dt; 
        
        // Actualización del tiempo
        t (i+1)=t (i) +Dt
        
        // Incremento del contador
        i=i+1;
    end
    
    // Cálculo de la trayectoria analítica
    xteo=vx(1)*t;
    yteo=vy(1)*t-g/2*t^2;
    
    //Gráficas
    plot (x,y,"b");
    plot (xteo, yteo, "r");
    xtitle ("Comparación de trayectorias: Método de Euler (azul) vs Analítica (rojo)", "Posición en x (m)", "Posición en y (m)");

endfunction

function programa1c()
    // Constantes
    g = 9.8;
    
    // Condiciones iniciales
    x0 = 0;
    y0 = 0;
    v0 = 40;
    tita = 30;
    
    // Inicialización de variables
    vxa(1) = v0 * cosd(tita);
    vya(1) = v0 * sind(tita);
    xa(1) = x0;
    ya(1) = y0;
    
    vxb(1) = v0 * cosd(tita);
    vyb(1) = v0 * sind(tita);
    xb(1) = x0;
    yb(1) = y0;
    
    // Dt
    Dta = 0.001;
    
    // Métodos de Euler
    i = 1; // Índice para Dta
    j = 1; // Índice para Dtb
    
    // Inicializar tiempos
    ta(1) = 0;
    tb(1) = 0;
    
    // Bucle
    while ya(i) >= 0 
        // Actualizaciones para Dta
        ya(i) >= 0 
            ax = 0;
            ay = -g;
    
            vxa(i+1) = vxa(i) + ax * Dta;
            vya(i+1) = vya(i) + ay * Dta;
            xa(i+1) = xa(i) + vxa(i) * Dta;
            ya(i+1) = ya(i) + vya(i) * Dta;
    
            ta(i+1) = ta(i) + Dta;
            i = i + 1;
        
    
        
    end
    
    Dta = 0.2;
    j=1
    
    while yb(j) >=0
            ax = 0;
            ay = -g;
    
            vxb(j+1) = vxb(j) + ax * Dta;
            vyb(j+1) = vyb(j) + ay * Dta;
            xb(j+1) = xb(j) + vxb(j) * Dta;
            yb(j+1) = yb(j) + vyb(j) * Dta;
    
            tb(j+1) = tb(j) + Dta;
            j = j + 1;
            if yb<=0
                break;
            end
    end
    
    // Graficar los resultados
    plot(xa, ya, "b");
    plot(xb, yb, "r");
    legend("Dt = 0.001", "Dt = 0.2");
    xlabel("Distancia X (m)");
    ylabel("Altura Y (m)");
    title("Movimiento de un proyectil para diferentes Dt");
endfunction

function programa2b()
    // Constantes
    g = 9.8; // Aceleración de la gravedad
    ro = 1.2; // Densidad del aire 
    Dt = 0.001; // Paso de integración 
    
    // Condiciones iniciales
    x0 = 0;
    y0 = 0;
    v0 = 40; 
    tita = 30; 
    
    // Propiedades de los proyectiles
    // Pelota típica
    m1 = 0.40; 
    r1 = 0.11; 
    c1 = ro * 0.5 * %pi * r1^2; // Coeficiente de arrastre
    
    // Piedra esférica
    m2 = 0.03; 
    r2 = 0.01; 
    c2 = ro * 0.5 * %pi * r2^2; // Coeficiente de arrastre
    
    // Inicialización para la pelota
    vx1(1) = v0 * cosd(tita);
    vy1(1) = v0 * sind(tita);
    x1(1) = x0;
    y1(1) = y0;
    
    // Inicialización para la piedra
    vx2(1) = v0 * cosd(tita);
    vy2(1) = v0 * sind(tita);
    x2(1) = x0;
    y2(1) = y0;
    
    t(1) = 0;
    i = 1;
    
    while y1>=0 then
        ax1 = -c1/m1 * vx1(i);
        ay1 = -g-(c1/m1)*vy1(i);
        
        vx1(i+1) =vx1 (i) + ax1*Dt;
        x1(i+1) =x1(i) + vx1(i)*Dt; //componente x
        
        vy1(i+1) =vy1 (i) + ay1*Dt;
        y1(i+1) =y1(i) + vy1(i)*Dt; //componente y
        
        
        t (i+1)=t (i) +Dt
        i=i+1;
    end
    
    i=1;
    
    while y2 >=0 then
        ax2 = -c2/m2 * vx2(i);
        ay2 = -g-(c2/m2)*vy2(i);
        
        vx2(i+1) =vx2 (i) + ax2*Dt;
        x2(i+1) =x2(i) + vx2(i)*Dt; //componente x
        
        vy2(i+1) =vy2 (i) + ay2*Dt;
        y2(i+1) =y2(i) + vy2(i)*Dt; //componente y
        
        t (i+1)=t (i) +Dt
        i=i+1;
    end
    
    
    // Graficar las trayectorias
    clf;
    plot(x1, y1, "b", x2, y2, "r");
    legend("Pelota", "Piedra esférica");
    xlabel("Distancia X (m)");
    ylabel("Altura Y (m)");
    title("Trayectorias de dos proyectiles con resistencia del aire");
endfunction

function programa2c()
    // Constantes
    g = 9.8; // Aceleración de la gravedad
    ro = 1.2; // Densidad del aire 
    Dt = 0.001; // Paso de integración
    
    // Condiciones iniciales
    x0 = 0;
    y0 = 0;
    v0 = 40; 
    tita = 30; 
    
    // Propiedades de los proyectiles
    // Pelota típica
    m1 = 0.40; 
    r1 = 0.11; 
    c1 = ro * 0.5 * %pi * r1^2; // Coeficiente de arrastre
    
    // Piedra esférica
    m2 = 0.03; 
    r2 = 0.01; 
    c2 = ro * 0.5 * %pi * r2^2; // Coeficiente de arrastre
    
    // Inicialización para la pelota
    vx1(1) = v0 * cosd(tita);
    vy1(1) = v0 * sind(tita);
    x1(1) = x0;
    y1(1) = y0;
    W1 = 0; // Trabajo inicial para la pelota
    
    // Inicialización para la piedra
    vx2(1) = v0 * cosd(tita);
    vy2(1) = v0 * sind(tita);
    x2(1) = x0;
    y2(1) = y0;
    W2 = 0; // Trabajo inicial para la piedra
    
    i = 1; // Índice inicial
    
    // Euler
    while (y1(i) >= 0 || y2(i) >= 0) && i <= 100000
        // Pelota
        if y1(i) >= 0 then
            v1 = sqrt(vx1(i)^2 + vy1(i)^2); // Velocidad resultante
            F1x = -c1 * vx1(i);
            F1y = -c1 * vy1(i);
            
            W1 = W1 + (F1x * vx1(i) * Dt) + (F1y * vy1(i) * Dt); // Incremento del trabajo
    
            ax1 = F1x / m1;
            ay1 = -g + F1y / m1;
    
            vx1(i+1) = vx1(i) + ax1 * Dt;
            vy1(i+1) = vy1(i) + ay1 * Dt;
            x1(i+1) = x1(i) + vx1(i) * Dt;
            y1(i+1) = y1(i) + vy1(i) * Dt;
        else
            // Mantener valores constantes después de que el proyectil caiga
            vx1(i+1) = vx1(i);
            vy1(i+1) = 0;
            x1(i+1) = x1(i);
            y1(i+1) = 0;
        end
    
        // Piedra
        if y2(i) >= 0 then
            v2 = sqrt(vx2(i)^2 + vy2(i)^2); // Velocidad resultante
            F2x = -c2 * vx2(i);
            F2y = -c2 * vy2(i);
            
            W2 = W2 + (F2x * vx2(i) * Dt) + (F2y * vy2(i) * Dt); // Incremento del trabajo
    
            ax2 = F2x / m2;
            ay2 = -g + F2y / m2;
    
            vx2(i+1) = vx2(i) + ax2 * Dt;
            vy2(i+1) = vy2(i) + ay2 * Dt;
            x2(i+1) = x2(i) + vx2(i) * Dt;
            y2(i+1) = y2(i) + vy2(i) * Dt;
        else
            // Mantener valores constantes después de que el proyectil caiga
            vx2(i+1) = vx2(i);
            vy2(i+1) = 0;
            x2(i+1) = x2(i);
            y2(i+1) = 0;
        end
    
        i = i + 1;
    end
    
    // Mostrar el trabajo calculado
    disp("Trabajo realizado por la fuerza del aire:");
    disp("Pelota típica (m=0.40 kg, r=11 cm): " + string(W1) + " J");
    disp("Piedra esférica (m=0.03 kg, r=1 cm): " + string(W2) + " J");

endfunction

while %t // Bucle infinito controlado por el usuario
    // Mostrar menú
    disp("Seleccione la parte del proyecto que desea ejecutar:");
    disp("1. Parte 1a: Trayectoria analítica");
    disp("2. Parte 1b: Método de Euler vs trayectoria analítica");
    disp("3. Parte 1c: Comparación de trayectorias con diferentes Dt");
    disp("4. Parte 2b: Trayectorias con resistencia del aire para dos proyectiles");
    disp("5. Parte 2c: Cálculo del trabajo realizado por la resistencia del aire");
    disp("6. Salir");
   
    // Solicitar opción al usuario
    choice = input("Ingrese el número de la opción deseada: ");
    
    // Ejecutar la opción seleccionada
    if choice == 1 then
        programa1a();
    elseif choice == 2 then
        programa1b();
    elseif choice == 3 then
        programa1c();
    elseif choice == 4 then
        programa2b();
    elseif choice == 5 then
        programa2c();
    elseif choice == 6 then
        break; // Salir del bucle y terminar el programa
    else
        disp("Opción inválida. Por favor, seleccione una opción válida.");
    end
end
