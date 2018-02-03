clear;
%z =  8i;
n = 2;
% hellllooooo

xmin = -4;
xmax = 4;
ymin = -4;
ymax = 4;

imagey = xmin:(xmax-xmin)/50:xmax;
imagex = imagey.^2;

xscat = [];
yscat = [];


figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,2)
axis([xmin,xmax^2, xmin-1, xmax+1])
daspect([1 1 1])
hold on
plot(imagex,imagey,'r')
scat = scatter(xscat,yscat,'filled','b');

subplot(1,2,1)
axis([xmin,xmax,ymin,ymax])
daspect([1 1 1])
set (gcf, 'WindowButtonMotionFcn', @mouseMove);
hold on
mousex = -10000;
mousey = -10000;
dx = (xmax-xmin)/10;
dy = (ymax-ymin)/10;
while(abs(mousex - xmax) >(dx/5) || abs(mousey- ymax) >(dy/5))
    [mousex,mousey]=mouseMove();
    pause(.02)
    %z = mousex + 1i*mousey;
    z = mousex;
    
    subplot(1,2,2)
    axis([xmin,xmax^2, xmin-1, xmax+1])
    daspect([1 1 1])
    hold on
    set(scat,'Xdata',mousex^2)
    set(scat,'Ydata',mousex)
    %scatter(mousex^2, mousex,'r')
    title(strcat('(x^2, x) = (', num2str(mousex^2), ',', num2str(mousex),')'),'color','b')
    
    modu = abs(z)^(1/n);
    Arg = angle(z)/n;
    arg = zeros(n,1);

    for k = 0:n-1
        arg(k+1) = (angle(z)+ 2*k*pi)/n;
    end

    prinroot = modu*(cos(Arg) + 1i*sin(Arg));
    allroots = modu*(cos(arg)+1i*sin(arg));
    
    subplot(1,2,1)
    axis([xmin,xmax,ymin,ymax])
    daspect([1 1 1])
    plot(0,0,'k.')
    hold on
    quiver(0,0,real(z),imag(z),0);
    scatter(real(z),imag(z),'filled','b');
    %quiver(zeros(n,1),zeros(n,1), real(allroots),imag(allroots),0)
    daspect([1 1 1])
    axis([xmin, xmax, ymin, ymax])

%     theta = 0:2*pi/100:2*pi;
%     x = modu*cos(theta);
%     y = modu*sin(theta);
%     plot(x,y, 'k')
    xlabel('Real Part')
    ylabel('Imaginary Part')
    title(strcat('x = ', num2str(real(z))),'color','b')
    hold off
    
    
    
end
