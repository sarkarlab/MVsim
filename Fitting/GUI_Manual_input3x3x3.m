function Output_values = GUI_Manual_input3x3x3(Parameters,TimePoints)
%load('GUI_Manual.mat')
State_Names_Table = State_Names(Parameters);
RU_multiplyer = [];
for i = 1:length(State_Names_Table)
    %multiplyer(i) =  sum(unique(floor(State_Names_Table(i,:)/10))~=0);
    lnumber_lig1 = sum(floor(unique(floor(State_Names_Table(i,:)/10))/10)==1);
    lnumber_lig2 = sum(floor(unique(floor(State_Names_Table(i,:)/10))/10)==2);
    lnumber_lig3 = sum(floor(unique(floor(State_Names_Table(i,:)/10))/10)==3);
    
    RU_multiplyer(i) =  0+lnumber_lig1*(Parameters.Ligand(1).MolecularWeight * Parameters.constants.Volume * 1000) / Parameters.constants.RU2g + ...
                        lnumber_lig2*(Parameters.Ligand(2).MolecularWeight * Parameters.constants.Volume * 1000) / Parameters.constants.RU2g + ...
                        lnumber_lig3*(Parameters.Ligand(3).MolecularWeight * Parameters.constants.Volume * 1000) / Parameters.constants.RU2g;
end



[Output_values.States.conc, Output_values.States.time]  = diff_time_series_calculation_3x3x3(Parameters, size(State_Names_Table,1),TimePoints);%, Kons, Koffs, EffCs);
    Output_values.States.conc = (Output_values.States.conc(:,1:(end)));
    Output_values.States.conc(:,1) = 0;
    Output_values.States.RU = Output_values.States.conc.*RU_multiplyer;
    
%[Output_values.Ligand_Classes.conc, Output_values.Ligand_Classes.RU, Output_values.Ligand_Classes.class_names] = Convert_to_state_classes(Output_values.States, MLigand_classes, RU_multiplyer);
%[Output_values.Valency_Classes.conc, Output_values.Valency_Classes.RU, Output_values.Valency_Classes.class_names] = Convert_to_state_classes(Output_values.States, MValency_classes, RU_multiplyer);
%[Output_values.Mixed_Classes.conc, Output_values.Mixed_Classes.RU, Output_values.Mixed_Classes.class_names] = Convert_to_state_classes(Output_values.States, Mixed_classes, RU_multiplyer);

try
    set(0, 'DefaultFigureRenderer', 'painters');
catch
    %No legend colour
end
    
end

function [Class_concentration, Class_RU, class_names]= Convert_to_state_classes(States, class_name_list, RU_multiplyer)    
    class_names = unique(class_name_list);
    Class_concentration=zeros(length(States.time), length(class_names));
    Class_RU=zeros(length(States.time), length(class_names));
    
    for state_class=1:length(class_names) 
        Class_concentration(:,state_class)= sum((class_name_list == class_names(state_class)).*States.conc,2);
        Class_RU(:,state_class)= sum((class_name_list == class_names(state_class)).*States.conc,2)*RU_multiplyer(state_class);
    end

end

function [Array_short_states] = State_Names(Parameters)
vR = Parameters.Receptor.Valency;
vL1 = Parameters.Ligand(1).Valency;
vL2 = Parameters.Ligand(2).Valency;
vL3 = Parameters.Ligand(3).Valency;

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


%state_array = table2array(struct2table(state));
%% Elimination of states where same position present multiple times
%state = state(~( (state_array(:,1) ~= 0 & state_array(:,1) == state_array(:,2)) | (state_array(:,2) ~= 0 & state_array(:,2) == state_array(:,3)) | (state_array(:,1) ~= 0 & state_array(:,1) == state_array(:,3))));
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

function new_order = ST_state_flip(state)
    % creates a two digit long state struct ligand by ligand
    state = struct2array(state);
    state_lig1 = monoligand_state_flip(mod(state.*(floor(state/100)==1),100));
    state_lig2 = monoligand_state_flip(mod(state.*(floor(state/100)==2),100));
    state_lig3 = monoligand_state_flip(mod(state.*(floor(state/100)==3),100));
    
    % from the two logng results creates a three digit long one
    state = state_lig1 + state_lig2 + state_lig3 + (state_lig1>0)*100 + (state_lig2>0)*200 + (state_lig3>0)*300;
 
    switch length(state)
        case 3
            new_order = struct("rec_pos_1", state(1), "rec_pos_2", state(2), "rec_pos_3", state(3));
        case 2
            new_order = struct("rec_pos_1", state(1), "rec_pos_2", state(2));
    end
end

function state = monoligand_state_flip(state)
%% Create unique state names 
% 
%state = struct2array(state);

%% Get the repeated ligands to a list 
%lig_0 = floor(state/10)==0;
lig_1 = floor(state/10)==1;
lig_2 = floor(state/10)==2;
lig_3 = floor(state/10)==3;
ligs = [lig_1;lig_2;lig_3];

%% For multiple ligands change the order of ligands to 
[~, order] = sort([sum(lig_1),sum(lig_2),sum(lig_3)], 'descend');
state = mod(state,10) + 10*ligs(order(1),:) + 20*ligs(order(2),:) +30*ligs(order(3),:);



if sum(floor(state/10)==1)~=2
    state(mod(state,10)==1) = sort(state(mod(state,10)==1));
    state(mod(state,10)==2) = sort(state(mod(state,10)==2));
    state(mod(state,10)==3) = sort(state(mod(state,10)==3));
end

switch length(state)
    case 3
        if prod(sort(floor(state/10)) == [1 2 3])
            state = mod(state,10) + [10 20 30];
        elseif prod(sort(floor(state/10)) == [0 1 2])
            if find(floor(state/10)==2) < find(floor(state/10)==1)
                state =  mod(state,10) + (floor(state/10) == 2)*10 + (floor(state/10) == 1)*20;
            end
        end
    case 2
        if prod(sort(floor(state/10)) == [1 2])
            state = mod(state,10) + [10 20];
        end    
end


%new_order = struct("rec_pos_1", state(1), "rec_pos_2", state(2), "rec_pos_3", state(3));

end

function a = struct2array(s)
%STRUCT2ARRAY Convert structure with doubles to an array.

%   Author(s): R. Losada
%   Copyright 1988-2013 The MathWorks, Inc.

narginchk(1,1);

% Convert structure to cell
c = struct2cell(s);

% Construct an array
a = [c{:}];
end
