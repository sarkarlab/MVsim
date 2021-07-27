function Output_values = GUI_Manual_input3x3x3(app)
%This funciton handles the class rules and the ODE function based on the GUI parameters.
% It also allowes manula inputs for debugging and specific options

%------------------------------------------------------------------------------------------------
% RU multiplyer calculation
State_Names_Table = State_Names(app);
%multiplyer = [];
RU_multiplyer = [];
for i = 1:length(State_Names_Table)
    %multiplyer(i) =  sum(unique(floor(State_Names_Table(i,:)/10))~=0);
    lnumber_lig1 = sum(floor(unique(floor(State_Names_Table(i,:)/10))/10)==1);
    lnumber_lig2 = sum(floor(unique(floor(State_Names_Table(i,:)/10))/10)==2);
    lnumber_lig3 = sum(floor(unique(floor(State_Names_Table(i,:)/10))/10)==3);
    
    RU_multiplyer(i) =  0+lnumber_lig1*(app.Parameters.Ligand(1).MolecularWeight * app.Parameters.constants.Volume * 1000) / app.Parameters.constants.RU2g + ...
                        lnumber_lig2*(app.Parameters.Ligand(2).MolecularWeight * app.Parameters.constants.Volume * 1000) / app.Parameters.constants.RU2g + ...
                        lnumber_lig3*(app.Parameters.Ligand(3).MolecularWeight * app.Parameters.constants.Volume * 1000) / app.Parameters.constants.RU2g;
end
 %-----------------------------------------------------------------------------------------------

% Ligand classs generated based on ligand rules 
MLigand_classes = zeros(size(State_Names_Table,1),1);

MLigand_classes(...
    sum(floor(State_Names_Table/100)==0,2)>=0 &...
    sum(floor(State_Names_Table/100)==1,2)>0 &...
    sum(floor(State_Names_Table/100)==2,2)==0 &...
    sum(floor(State_Names_Table/100)==3,2)==0 ) = 1;
MLigand_classes(...
    sum(floor(State_Names_Table/100)==0,2)>=0 &...
    sum(floor(State_Names_Table/100)==1,2)==0 &...
    sum(floor(State_Names_Table/100)==2,2)>0 &...
    sum(floor(State_Names_Table/100)==3,2)==0 ) = 2;
MLigand_classes(...
    sum(floor(State_Names_Table/100)==0,2)>=0 &...
    sum(floor(State_Names_Table/100)==1,2)==0 &...
    sum(floor(State_Names_Table/100)==2,2)==0 &...
    sum(floor(State_Names_Table/100)==3,2)>0 ) = 3;
MLigand_classes(...
    sum(floor(State_Names_Table/100)==0,2)>=0 &...
    sum(floor(State_Names_Table/100)==1,2)>0 &...
    sum(floor(State_Names_Table/100)==2,2)>0 &...
    sum(floor(State_Names_Table/100)==3,2)==0 ) = 12;
MLigand_classes(...
    sum(floor(State_Names_Table/100)==0,2)>=0 &...
    sum(floor(State_Names_Table/100)==1,2)>0 &...
    sum(floor(State_Names_Table/100)==2,2)==0 &...
    sum(floor(State_Names_Table/100)==3,2)>0 ) = 13;
MLigand_classes(...
    sum(floor(State_Names_Table/100)==0,2)>=0 &...
    sum(floor(State_Names_Table/100)==1,2)==0 &...
    sum(floor(State_Names_Table/100)==2,2)>0 &...
    sum(floor(State_Names_Table/100)==3,2)>0 ) = 23;
MLigand_classes(...
    sum(floor(State_Names_Table/100)==0,2)==0 &...
    sum(floor(State_Names_Table/100)==1,2)>0 &...
    sum(floor(State_Names_Table/100)==2,2)>0 &...
    sum(floor(State_Names_Table/100)==3,2)>0 ) = 123;


MLigand_classes = MLigand_classes';

% Valency classs generated based on valency rules 
MValency_classes = zeros(size(State_Names_Table,1),1);
    for i = 1:length(State_Names_Table)
        switch sum(State_Names_Table(i,:)~=0)
            case 3
                switch length(unique(floor(State_Names_Table(i,:)/10)))
                    case 1
                        MValency_classes(i) = 3;
                    case 2
                        MValency_classes(i) = 21;
                    case 3
                        MValency_classes(i) = 111;
                end
            case 2
                switch length(unique(floor(State_Names_Table(i,:)/10)))
                    case 3 %one is 0
                        MValency_classes(i) = 11;
                    case 2
                        if sum(State_Names_Table(i,:)==0) == 1
                            MValency_classes(i) = 2;
                        else
                            MValency_classes(i) = 11;
                        end
                    case 1 % no trivalent case, only the "2" bivalent case 
                        MValency_classes(i) = 2;
                end
                
            case 1
                MValency_classes(i) = 1;
            case 0
                MValency_classes(i) = 0;
        end
    end
    MValency_classes = MValency_classes';
    
% Mixed classs generated based on mixed class rules     
    Mixed_classes = zeros(size(State_Names_Table,1),1);
    for i = 1:length(State_Names_Table)
        if sum(floor(State_Names_Table(i,:)/100)==1)==3
            switch length(unique(floor(State_Names_Table(i,:)/10)))
                case 3
                    Mixed_classes(i) = 11;
                case 2
                    Mixed_classes(i) = 2111;
                case 1
                    Mixed_classes(i) = 31;
            end
        
        elseif sum(floor(State_Names_Table(i,:)/100)==2)==3
            switch length(unique(floor(State_Names_Table(i,:)/10)))
                case 3
                    Mixed_classes(i) = 12;
                case 2
                    Mixed_classes(i) = 2212;
                case 1
                    Mixed_classes(i) = 32;
            end
        
        elseif sum(floor(State_Names_Table(i,:)/100)==3)==3
            switch length(unique(floor(State_Names_Table(i,:)/10)))
                case 3
                    Mixed_classes(i) = 13;
                case 2
                    Mixed_classes(i) = 2313;
                case 1
                    Mixed_classes(i) = 33;
            end
        
        elseif     sum(floor(State_Names_Table(i,:)/100)==1)==2 && sum(floor(State_Names_Table(i,:)/100)==2)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
            Mixed_classes(i) = 2112;
        elseif sum(floor(State_Names_Table(i,:)/100)==1)==2 && sum(floor(State_Names_Table(i,:)/100)==3)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
            Mixed_classes(i) = 2113;
        elseif sum(floor(State_Names_Table(i,:)/100)==2)==2 && sum(floor(State_Names_Table(i,:)/100)==1)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
            Mixed_classes(i) = 2211;
        elseif sum(floor(State_Names_Table(i,:)/100)==2)==2 && sum(floor(State_Names_Table(i,:)/100)==3)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
            Mixed_classes(i) = 2213;            
        elseif sum(floor(State_Names_Table(i,:)/100)==3)==2 && sum(floor(State_Names_Table(i,:)/100)==1)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
            Mixed_classes(i) = 2311;
        elseif sum(floor(State_Names_Table(i,:)/100)==3)==2 && sum(floor(State_Names_Table(i,:)/100)==2)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
            Mixed_classes(i) = 2312;
            
        elseif sum(floor(State_Names_Table(i,:)/100)==1)==2 && sum(floor(State_Names_Table(i,:)/100)==2)==0 && sum(floor(State_Names_Table(i,:)/100)==3)==0
            if sum(floor(State_Names_Table(i,:)/100)==0)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
                Mixed_classes(i) = 21;
            elseif sum(floor(State_Names_Table(i,:)/100)==0)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 3
                Mixed_classes(i) = 11;
            elseif sum(floor(State_Names_Table(i,:)/100)==0)==0 && length(unique(floor(State_Names_Table(i,:)/10))) == 1
                Mixed_classes(i) = 21;
            elseif sum(floor(State_Names_Table(i,:)/100)==0)==0 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
                Mixed_classes(i) = 11;
            end
        elseif sum(floor(State_Names_Table(i,:)/100)==1)==0 && sum(floor(State_Names_Table(i,:)/100)==2)==2 && sum(floor(State_Names_Table(i,:)/100)==3)==0
            if sum(floor(State_Names_Table(i,:)/100)==0)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
                Mixed_classes(i) = 22;
            elseif sum(floor(State_Names_Table(i,:)/100)==0)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 3
                Mixed_classes(i) = 12;
            elseif sum(floor(State_Names_Table(i,:)/100)==0)==0 && length(unique(floor(State_Names_Table(i,:)/10))) == 1
                Mixed_classes(i) = 22;
            elseif sum(floor(State_Names_Table(i,:)/100)==0)==0 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
                Mixed_classes(i) = 12;
            end
        elseif sum(floor(State_Names_Table(i,:)/100)==1)==0 && sum(floor(State_Names_Table(i,:)/100)==2)==0 && sum(floor(State_Names_Table(i,:)/100)==3)==2
            if sum(floor(State_Names_Table(i,:)/100)==0)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
                Mixed_classes(i) = 23;
            elseif sum(floor(State_Names_Table(i,:)/100)==0)==1 && length(unique(floor(State_Names_Table(i,:)/10))) == 3
                Mixed_classes(i) = 13;
            elseif sum(floor(State_Names_Table(i,:)/100)==0)==0 && length(unique(floor(State_Names_Table(i,:)/10))) == 1
                Mixed_classes(i) = 23;
            elseif sum(floor(State_Names_Table(i,:)/100)==0)==0 && length(unique(floor(State_Names_Table(i,:)/10))) == 2
                Mixed_classes(i) = 13;
            end
            
        elseif sum(floor(State_Names_Table(i,:)/100)==1)==1 && sum(floor(State_Names_Table(i,:)/100)==2)==1 && sum(floor(State_Names_Table(i,:)/100)==3)==1
            Mixed_classes(i) = 111213;
            
        elseif sum(floor(State_Names_Table(i,:)/100)==1)>0  && sum(floor(State_Names_Table(i,:)/100)==2)>0  && sum(floor(State_Names_Table(i,:)/100)==3)==0
            Mixed_classes(i) = 1112;
        elseif sum(floor(State_Names_Table(i,:)/100)==1)>0  && sum(floor(State_Names_Table(i,:)/100)==2)==0 && sum(floor(State_Names_Table(i,:)/100)==3)>0
            Mixed_classes(i) = 1113;
        elseif sum(floor(State_Names_Table(i,:)/100)==1)==0 && sum(floor(State_Names_Table(i,:)/100)==2)>0  && sum(floor(State_Names_Table(i,:)/100)==3)>0
            Mixed_classes(i) = 1213;
        elseif sum(floor(State_Names_Table(i,:)/100)==1)>0  && sum(floor(State_Names_Table(i,:)/100)==2)==0 && sum(floor(State_Names_Table(i,:)/100)==3)==0
            Mixed_classes(i) = 11;
        elseif sum(floor(State_Names_Table(i,:)/100)==1)==0 && sum(floor(State_Names_Table(i,:)/100)==2)>0  && sum(floor(State_Names_Table(i,:)/100)==3)==0
            Mixed_classes(i) = 12;
        elseif sum(floor(State_Names_Table(i,:)/100)==1)==0 && sum(floor(State_Names_Table(i,:)/100)==2)==0 && sum(floor(State_Names_Table(i,:)/100)==3)>0
            Mixed_classes(i) = 13;
        elseif sum(floor(State_Names_Table(i,:)/100)==1)==0 && sum(floor(State_Names_Table(i,:)/100)==2)==0 && sum(floor(State_Names_Table(i,:)/100)==3)==0
            Mixed_classes(i) = 0;
        end
    end
    Mixed_classes = Mixed_classes';

    
% Funciton call for the ODE solver 

[Output_values.States.conc, Output_values.States.time]  = diff_time_series_calculation_3x3x3(app, size(State_Names_Table,1));%, Kons, Koffs, EffCs);
    Output_values.States.conc = (Output_values.States.conc(:,1:(end)));
    Output_values.States.conc(:,1) = 0;
    Output_values.States.RU = Output_values.States.conc.*RU_multiplyer;
    Output_values.States.names = transpose(string(strcat(num2str(State_Names_Table()))));
    string(strcat(num2str(State_Names_Table())))
    
[Output_values.Ligand_Classes.conc, Output_values.Ligand_Classes.RU, Output_values.Ligand_Classes.class_names] = Convert_to_state_classes(Output_values.States, MLigand_classes, RU_multiplyer);
[Output_values.Valency_Classes.conc, Output_values.Valency_Classes.RU, Output_values.Valency_Classes.class_names] = Convert_to_state_classes(Output_values.States, MValency_classes, RU_multiplyer);
[Output_values.Mixed_Classes.conc, Output_values.Mixed_Classes.RU, Output_values.Mixed_Classes.class_names] = Convert_to_state_classes(Output_values.States, Mixed_classes, RU_multiplyer);


try
    set(0, 'DefaultFigureRenderer', 'painters');
catch
    %No legend colour
end
    
end

function [Class_concentration, Class_RU, class_names]= Convert_to_state_classes(States, class_name_list, RU_multiplyer)   
% This function merges state to state classes based on the class rules 
    class_names = unique(class_name_list);
    Class_concentration=zeros(length(States.time), length(class_names));
    Class_RU=zeros(length(States.time), length(class_names));
    
    for state_class=1:length(class_names) 
        Class_concentration(:,state_class)= sum((class_name_list == class_names(state_class)).*States.conc,2);
        Class_RU(:,state_class)= sum((class_name_list == class_names(state_class)).*States.conc,2)*RU_multiplyer(state_class);
    end

end

function [Array_short_states] = State_Names(app)
% Function that creates all the state names 

vR = app.Parameters.Receptor.Valency;
vL1 = app.Parameters.Ligand(1).Valency;
vL2 = app.Parameters.Ligand(2).Valency;
vL3 = app.Parameters.Ligand(3).Valency;

ligands = [[111 112 113];
            [121 122 123];
            [131 132 133];
            [211 212 213];
            [221 222 223];
            [231 232 233];
            [311 312 313];
            [321 322 323];
            [331 332 333];];
   ligand0 = 0; 
   ligand13 = [];
   ligand23 = [];
   ligand33 = [];
   ligand12 = [];
   ligand22 = [];
   ligand32 = [];
if vR >= 3
   ligand13 = ligands(3,1:vL1);
   ligand23 = ligands(6,1:vL2);
   ligand33 = ligands(9,1:vL3);
end
if vR >= 2
    ligand12 = ligands(2,1:vL1);
    ligand22 = ligands(5,1:vL2);
    ligand32 = ligands(8,1:vL3);
end
    ligand11 = ligands(1,1:vL1);
    ligand21 = ligands(4,1:vL2);
    ligand31 = ligands(7,1:vL3);


ligands = [ligand0, ligand11, ligand12, ligand13, ligand21, ligand22, ligand23, ligand31, ligand32, ligand33];

%% Create all posssible state
state = struct();
i=1;
switch vR
    case 3
        for rec1 = ligands
            for rec2 = ligands
                for rec3 = ligands
                    state(i).rec_pos_1 = rec1;
                    state(i).rec_pos_2 = rec2;
                    state(i).rec_pos_3 = rec3;
                    i = i+1;
                end
            end
        end
        state_array = table2array(struct2table(state));
        % Elimination of states where same position present multiple times
        state = state(~(...
              (state_array(:,1) ~= 0 & state_array(:,1) == state_array(:,2)) ...
            | (state_array(:,2) ~= 0 & state_array(:,2) == state_array(:,3)) ...
            | (state_array(:,1) ~= 0 & state_array(:,1) == state_array(:,3))));
    case 2
    	for rec1 = ligands
            for rec2 = ligands
            	state(i).rec_pos_1 = rec1;
            	state(i).rec_pos_2 = rec2;
                i = i+1;
            end
    	end
        state_array = table2array(struct2table(state));
        % Elimination of states where same position present multiple times
        state = state(~(state_array(:,1) ~= 0 & state_array(:,1) == state_array(:,2)));
    case 1
        for rec1 = ligands
            state(i).rec_pos_1 = rec1;
            i = i+1;
        end
end


%% State name reduction
all_states = state;
if vR>1
for i = 1:length(all_states)
    all_states(i) = ST_state_flip(all_states(i));
end
end
Array_all_states = table2array(struct2table(all_states));
Array_short_states = unique(Array_all_states, 'rows');

end
