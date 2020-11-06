% FDM_2Dgraph_prey
for i=1:n-1
    gu(:,:)=u(:,:,i);
    mesh(x,y,gu);
    title(sprintf('Time step = %d',i));
    xlabel('x-axis')
    ylabel('y-axis')
    colormap jet
    %     colorbar
    %     view(2)
    zlim([0 1.2])
    drawnow
end