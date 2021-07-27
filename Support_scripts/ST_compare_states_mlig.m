function [link] = ST_compare_states_mlig(FROM, TO, vR)
link = "";
%global gparams
    FROM = struct2array(FROM);
    TO = struct2array(TO);
switch vR
    case 3   
    %%
    if sum(FROM == TO)==2 
        if sum(FROM==0) < sum(TO==0)
            new_ligand_receptor_position = find(FROM ~= TO);
            new_ligand_position =  mod(FROM(new_ligand_receptor_position),10);
            new_ligand_rank = floor(FROM(new_ligand_receptor_position)/100);
            
            
            Koff = strcat("Koffs.Koff_Receptor1_pos_", num2str(new_ligand_receptor_position), "_Ligand", num2str(new_ligand_rank), "_pos_",num2str(new_ligand_position));
            link = Koff;
        elseif (sum(FROM==0) > sum(TO==0))
            new_ligand_receptor_position = find(FROM ~= TO);
            new_ligand_number =  floor(TO(new_ligand_receptor_position)/10);
            new_ligand_position =  mod(TO(new_ligand_receptor_position),10);
            new_ligand_rank = floor(TO(new_ligand_receptor_position)/100);

            Bounding_receptors = floor(FROM/10)==new_ligand_number;


            Kon = strcat("Kons.Kon_Receptor1_pos_", num2str(new_ligand_receptor_position), "_Ligand", num2str(new_ligand_rank), "_pos_",num2str(new_ligand_position));
            %link = Kon;
        
            if sum(Bounding_receptors)>0
                rec_from = find(Bounding_receptors);
                Lig = floor(FROM(Bounding_receptors)/100);
                Lig=unique(Lig);
                lig_from = sort(mod(FROM(Bounding_receptors),10));         

                if (new_ligand_receptor_position < min(rec_from) && new_ligand_position < min(lig_from)) || ...
                        (new_ligand_receptor_position > max(rec_from) && new_ligand_position > max(lig_from))
                    conformation = "inline";
                else
                    conformation = "reverse";
                end


                if sum(Bounding_receptors)==2
                   

                     EffC =  strjoin(["EffCs.EffC_", conformation, "_Receptor1_from" , string(min(rec_from)), "_to", string(new_ligand_receptor_position),"_", string(max(rec_from)) ...
                        "_Ligand", string(Lig),"_from", string(min(lig_from)), "_to", string(new_ligand_position), "_", string(max(lig_from))],"");           
                    
                    
                    link =  strjoin([Kon, "*", EffC]);
                else

                     EffC =  strjoin(["EffCs.EffC_", conformation, "_Receptor1_from" , string(min([new_ligand_receptor_position rec_from])), "_to", string(max([new_ligand_receptor_position rec_from])), ...
                        "_0_Ligand", string(Lig),"_from", string(min([new_ligand_position lig_from])), "_to", string(max([new_ligand_position lig_from])), "_0"],"");
              
                    link =  strjoin([Kon, "*", EffC],"");
                end
            else
                % Check for correct run
                if new_ligand_rank == 1
                    link = strjoin(["L1*", Kon],"");
                elseif new_ligand_rank == 2
                    link = strjoin(["L2*", Kon],"");
                elseif new_ligand_rank == 3
                    link = strjoin(["L3*", Kon],"");
                end
                
            end        
        end
    end
    case 2
    %%
    if sum(FROM == TO)==1 
        if sum(FROM==0) < sum(TO==0)
            new_ligand_receptor_position = find(FROM ~= TO);
            new_ligand_position =  mod(FROM(new_ligand_receptor_position),10);
            new_ligand_rank = floor(FROM(new_ligand_receptor_position)/100);
            
            
            Koff = strcat("Koffs.Koff_Receptor1_pos_", num2str(new_ligand_receptor_position), "_Ligand", num2str(new_ligand_rank), "_pos_",num2str(new_ligand_position));
            link = Koff;
        elseif (sum(FROM==0) > sum(TO==0))
            new_ligand_receptor_position = find(FROM ~= TO);
            new_ligand_number =  floor(TO(new_ligand_receptor_position)/10);
            new_ligand_position =  mod(TO(new_ligand_receptor_position),10);
            new_ligand_rank = floor(TO(new_ligand_receptor_position)/100);

            Bounding_receptors = floor(FROM/10)==new_ligand_number;


            Kon = strcat("Kons.Kon_Receptor1_pos_", num2str(new_ligand_receptor_position), "_Ligand", num2str(new_ligand_rank), "_pos_",num2str(new_ligand_position));
            %link = Kon;
        
            if sum(Bounding_receptors)>0
                rec_from = find(Bounding_receptors);
                Lig = floor(FROM(Bounding_receptors)/100);
                Lig=unique(Lig);
                lig_from = mod(FROM(Bounding_receptors),10);         

                if (new_ligand_receptor_position < rec_from && new_ligand_position < lig_from) || ...
                        (new_ligand_receptor_position > rec_from && new_ligand_position > lig_from)
                    conformation = "inline";
                else
                    conformation = "reverse";
                end

                EffC =  strjoin(["EffCs.EffC_", conformation, "_Receptor1_from" , string(min([new_ligand_receptor_position rec_from])), "_to", string(max([new_ligand_receptor_position rec_from])), ...
                    "_0_Ligand", string(Lig),"_from", string(min([new_ligand_position lig_from])), "_to", string(max([new_ligand_position lig_from])), "_0"],"");

                link =  strjoin([Kon, "*", EffC],"");

            else
                % Check for correct run
                if new_ligand_rank == 1
                    link = strjoin(["L1*", Kon],"");
                elseif new_ligand_rank == 2
                    link = strjoin(["L2*", Kon],"");
                elseif new_ligand_rank == 3
                    link = strjoin(["L3*", Kon],"");
                end
                
            end        
        end
    end
    
    case 1
        if sum(FROM==0) < sum(TO==0)
            new_ligand_receptor_position = 1;
            new_ligand_position =  mod(FROM,10);
            new_ligand_rank = floor(FROM/100);
            
            
            Koff = strcat("Koffs.Koff_Receptor1_pos_", num2str(new_ligand_receptor_position), "_Ligand", num2str(new_ligand_rank), "_pos_",num2str(new_ligand_position));
            link = Koff;
        elseif (sum(FROM==0) > sum(TO==0))
            new_ligand_receptor_position = 1;
            new_ligand_position =  mod(TO,10);
            new_ligand_rank = floor(TO/100);
            
            Kon = strcat("Kons.Kon_Receptor1_pos_", num2str(new_ligand_receptor_position), "_Ligand", num2str(new_ligand_rank), "_pos_",num2str(new_ligand_position));

            % Check for correct run
            if new_ligand_rank == 1
                link = strjoin(["L1*", Kon],"");
            elseif new_ligand_rank == 2
                link = strjoin(["L2*", Kon],"");
            elseif new_ligand_rank == 3
                link = strjoin(["L3*", Kon],"");
            end
        end

    %%
end
end
