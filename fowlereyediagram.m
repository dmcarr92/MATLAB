function fowlereyediagram(y,fb,dt)

    tindcs = [0:dt:2/fb];
    hold off
    for k = 4:length(y)*dt*fb-4-1,
        indcs = [ceil((k-1)/fb/dt):ceil((k+1)/fb/dt)] + 1;
        plot(tindcs,y(indcs));
        hold on
    end
    hold off
end

