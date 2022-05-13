function [Y, T]= diff_time_series_calculation_3x3x3(app, line_number)

    options = odeset('RelTol',1e-10,'AbsTol',1e-11);
    timepoints = table2array(app.TimePoints);
    
for i =1:size(timepoints,1)
    app.ProgressLabel.Text = strcat("Calculateing curves, Timepoints ",num2str(i),"/",num2str(size(timepoints,1)));
    drawnow()
    
    if i == 1
        app.Parameters.SPR.LtempL1 = timepoints(i,2);
        app.Parameters.SPR.LtempL2 = timepoints(i,3);
        app.Parameters.SPR.LtempL3 = timepoints(i,4);
        range = [0 timepoints(i,1)];    
        y0 = [app.Parameters.SPR.baseR0, zeros(1, (line_number-1))]; %184)]; 
        %[Tpre,Ypre] = ode15s(@(t,y) test1(t, y0, Kons, Koffs, EffCs), range, y0, options);       %Useing the created DiffsAss,m function for dhe Assiciation phase
        [Tpre,Ypre] = ode15s(@(t,y) app.Parameters.base.diffs(t,y,app), range, y0, options); 
    else
        app.Parameters.SPR.LtempL1 = timepoints(i,2);
        app.Parameters.SPR.LtempL2 = timepoints(i,3);
        app.Parameters.SPR.LtempL3 = timepoints(i,4);
        range = [0 (timepoints(i,1)-timepoints(i-1,1))];    
        y0 = Ypre(size(Ypre,1),:);
        %[T,Y] = ode15s(@(t,y) test1(t, y, Kons, Koffs, EffCs), range, y0, options);       %Useing the created DiffsAss,m function for dhe Assiciation phase
        [T,Y] = ode15s(@(t,y)  app.Parameters.base.diffs(t,y,app), range, y0, options); 
        Tpost=T(2:end); 
        Ypost=Y(2:end,:);                                     %The output of the dissociation phase
        
        Tpre=[Tpre; Tpost+Tpre(end)];
        Ypre=[Ypre; Ypost];     
    end
    progress = ceil(i*((310-200)/size(timepoints,1)));
    app.ProgressButton.Position(3)=200+progress;
    drawnow()
    
end
T = Tpre;
Y = Ypre;

end