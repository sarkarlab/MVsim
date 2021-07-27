function [Array_short_states] = State_Names(vR, vL1, vL2, vL3)
% multiplyer, classes,
%% State Generation
% I. List all the states

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
%% Elimination of states where same position present multiple times
state = state(~( (state_array(:,1) ~= 0 & state_array(:,1) == state_array(:,2)) | (state_array(:,2) ~= 0 & state_array(:,2) == state_array(:,3)) | (state_array(:,1) ~= 0 & state_array(:,1) == state_array(:,3))));
%% State name reduction
all_states = state;

for i = 1:length(all_states)
    all_states(i) = ST_state_flip(all_states(i));
end
Array_all_states = table2array(struct2table(all_states));
Array_short_states = unique(Array_all_states, 'rows');

end