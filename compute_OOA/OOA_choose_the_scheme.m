%%  Ch.3 Order of accuracy : approximation using FDS formulas

disp('***1.FTFS, 2.FTBS, 3.FTCS, 4.Leapfrog, 5.Lax-Friedrichs, 6.Lax-Wendroff***')
disp('***You do not want to see the graph, enter any number except 1~6.***')
k=input('Enter one of the schemes : 1,2,3,4,5 and 6   ');
switch k
    case 1
        OOA_FTFS
%         figure(k)
         OOA_2ndgraph
    case 2
        OOA_FTBS
%         figure(k)
         OOA_2ndgraph
    case 3
        OOA_FTCS
%         figure(k)
         OOA_2ndgraph
    case 4
        OOA_Leapfrog
%         figure(k)
         OOA_2ndgraph
    case 5
        OOA_LaxFriedrichs
%         figure(k)
         OOA_2ndgraph
    case 6
        OOA_LaxWendroff
%         figure(k)
         OOA_2ndgraph
    otherwise
        disp('You must enter one of the number 1,2,3,4,5 and 6.')
end

