clear;
%z =  8i;
n = 2;

fun = @(z) z.^n;

xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;

r = 0:.025:1;
theta1 = -pi:2*pi/80:pi;

[R1, THETA1] = meshgrid(r, theta1);

x1 = R1.*cos(2*THETA1);
y1 = R1.*sin(2*THETA1);
z1 = R1.*sin(THETA1);

%z2 = R1.*(-THETA1/pi);

xscat = [];
yscat = [];
zscat = [];


figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,2)
%axis([xmin,xmax^2, xmin-1, xmax+1])
daspect([1 1 1])
hold on
surf(x1,y1,z1, 'FaceAlpha',0.5)
surf(x1,y1,zeros(size(x1)), 'FaceColor', [.7 .7 .7],'FaceAlpha', 0.5)
scat = scatter3(xscat,yscat,zscat,'filled','b');
proj = plot3([0 0.01], [0 0], [0 0],'k--');
view(3)
xlabel('Real Part')
ylabel('Imaginary Part')

subplot(1,2,1)
axis([xmin,xmax,ymin,ymax])
daspect([1 1 1])
set (gcf, 'WindowButtonMotionFcn', @mouseMove);
hold on
plot(cos(theta1), sin(theta1))
mousex = -10000;
mousey = -10000;
dx = (xmax-xmin)/10;
dy = (ymax-ymin)/10;
while(abs(mousex - xmax) >(dx/5) || abs(mousey- ymax) >(dy/5))
    [mousex,mousey]=mouseMove();
    pause(.02)
    z = mousex + 1i*mousey;
    
    modu = abs(z)^(1/n);
    Arg = angle(z)/n;
    arg = zeros(n,1);

    for k = 0:n-1
        arg(k+1) = (angle(z)+ 2*k*pi)/n;
    end

    prinroot = modu*(cos(Arg) + 1i*sin(Arg));
    allroots = modu*(cos(arg)+1i*sin(arg));
    
    mapz = fun(allroots);
    mapx = real(mapz);
    mapy = imag(mapz);
    mapz = modu.*sin(arg);
    
    subplot(1,2,2)
    axis([xmin,xmax, ymin, xmax])
    daspect([1 1 1])
    hold on
    if abs(z) < 1
        set(scat,'Xdata',mapx)
        set(scat,'Ydata',mapy)
        set(scat,'Zdata',mapz)
        set(proj,'XData',mapx);
        set(proj,'YData',mapy);
        set(proj,'ZData',mapz);
    end
    %scatter(mousex^2, mousex,'r')
    title(strcat('Riemann Surface and Image of Roots of z = ', num2str(mousex), '+', num2str(mousey),' i'),'color','b')
    
%     modu = abs(z)^(1/n);
%     Arg = angle(z)/n;
%     arg = zeros(n,1);
% 
%     for k = 0:n-1
%         arg(k+1) = (angle(z)+ 2*k*pi)/n;
%     end
% 
%     prinroot = modu*(cos(Arg) + 1i*sin(Arg));
%     allroots = modu*(cos(arg)+1i*sin(arg));
    
    subplot(1,2,1)
    axis([xmin,xmax,ymin,ymax])
    daspect([1 1 1])
    plot(0,0,'k.')
    hold on
    quiver(0,0,real(z),imag(z),0);
    %plot(cos(theta1), sin(theta1))
    scatter(real(allroots),imag(allroots),'filled','b');
    quiver(zeros(n,1),zeros(n,1), real(allroots),imag(allroots),0)
    daspect([1 1 1])
    axis([xmin, xmax, ymin, ymax])

    theta = 0:2*pi/100:2*pi;
    x = modu*cos(theta);
    y = modu*sin(theta);
    plot(x,y, 'k')
    xlabel('Real Part')
    ylabel('Imaginary Part')
    title(strcat('z = ', num2str(mousex),'+',num2str(mousey), ' i'),'color','b')
    hold off
    
    
    
end
