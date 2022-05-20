function [Y, T]= diff_time_series_calculation_3x3x3(Parameters, line_number,TimePoints)

    options = odeset('RelTol',1e-10,'AbsTol',1e-11);
    timepoints = table2array(TimePoints);
    
for i =1:size(timepoints,1)
    %drawnow()
    
    if i == 1
        Parameters.SPR.LtempL1 = timepoints(i,2);
        Parameters.SPR.LtempL2 = timepoints(i,3);
        Parameters.SPR.LtempL3 = timepoints(i,4);
        range = [0 timepoints(i,1)];    
        y0 = [Parameters.SPR.baseR0, zeros(1, (line_number-1))]; %184)]; 
        %[Tpre,Ypre] = ode15s(@(t,y) test1(t, y0, Kons, Koffs, EffCs), range, y0, options);       %Useing the created DiffsAss,m function for dhe Assiciation phase
        [Tpre,Ypre] = ode15s(@(t,y) Parameters.base.diffs(t,y,Parameters), range, y0, options); 
    else
        Parameters.SPR.LtempL1 = timepoints(i,2);
        Parameters.SPR.LtempL2 = timepoints(i,3);
        Parameters.SPR.LtempL3 = timepoints(i,4);
        range = [0 (timepoints(i,1)-timepoints(i-1,1))];    
        y0 = Ypre(size(Ypre,1),:);
        %[T,Y] = ode15s(@(t,y) test1(t, y, Kons, Koffs, EffCs), range, y0, options);       %Useing the created DiffsAss,m function for dhe Assiciation phase
        [T,Y] = ode15s(@(t,y)  Parameters.base.diffs(t,y,Parameters), range, y0, options); 
        Tpost=T(2:end); 
        Ypost=Y(2:end,:);                                     %The output of the dissociation phase
        
        Tpre=[Tpre; Tpost+Tpre(end)];
        Ypre=[Ypre; Ypost];     
    end

    
end
T = Tpre;
Y = Ypre;

end