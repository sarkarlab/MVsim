function A_support_function_DiffEquations()

for vR = 1:2
    for vL1 = 0:3
            for vL2 = 0:3
            	for vL3 = 0:3


if vL1+vL2+vL3 ==0
    continue
end
KonTable = ST_StateAndTable_mlig(vR, vL1, vL2, vL3);

name = strcat("Diff_",num2str(vR),"R",num2str(vL1),"LA_",num2str(vL2),"LB_",num2str(vL3),"LC");

diff = fopen(strcat("Diffs/V2/",name,'.m'),'w');    %Creates function for Diffs
fprintf(diff, 'function dydt = %s(t,y, app) \n\n', name);    %Initiate the function
fprintf(diff, 'L1 = app.Parameters.SPR.LtempL1;\n');    
fprintf(diff, 'L2 = app.Parameters.SPR.LtempL2;\n'); 
fprintf(diff, 'L3 = app.Parameters.SPR.LtempL3;\n'); 
fprintf(diff, 'Kons = app.Parameters.Kons;\n'); 
fprintf(diff, 'Koffs = app.Parameters.Koffs;\n'); 
fprintf(diff, 'EffCs = app.Parameters.EffCs;\n'); 


fprintf(diff, '\ndydt = zeros(%d,1);\n',length(KonTable)); %Initiate the dydt vector for the equations

%The for loops to create the differentiol equations
  for i=1:length(KonTable)                                 %Trough the cols Kon+Koff-table
      fprintf(diff, 'dydt(%d)=', i);              %Writes out the dydt(i)
      for j=1:length(KonTable)                             %Trough the rows Kon+Koff-table
          if ~isempty(KonTable{j,i})                       %If jrow icol is not empty
          	fprintf(diff,'+%s*y(%d)',KonTable{j,i},j);   %writes out +KonX*y(row-1)
          end
      end
      
      for j=1:length(KonTable)                             %Trough the rows Kon+Koff-table
          if ~isempty(KonTable{i,j})                       %If irow jcol is not empty
            fprintf(diff,'-%s*y(%d)',KonTable{i,j},i);   %writes out +KonX*y(row-1)
          end
      end
      fprintf(diff,';\n');                          % ; and starts a new row
      
  end
  
  %fprintf(diff, 'dydt(%d)=', i); 
  fprintf(diff,'end'); %Colose the function with end  
  fclose(diff);        %Close the .m function to be usable
  
            	end
            end
    end
end

end