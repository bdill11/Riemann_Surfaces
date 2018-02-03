function [x,y] = mouseMove (object, eventdata)


    C = get (gca, 'CurrentPoint');
    x = C(1,1);
    y = C(1,2);
    
    