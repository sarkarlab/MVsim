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


end
