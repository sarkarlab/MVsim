function effC_name_converter(app)


    EffC_names = ["EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to2_0"	"EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to2_0"	2	1	2
    "EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to3_0"	"EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to3_0"	2	1	3
    "EffC_inline_Receptor1_from1_to2_0_Ligand1_from2_to3_0"	"EffC_inline_Receptor1_from1_to2_0_Ligand1_from2_to3_0"	2	1	3
    "EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to2_0"	"EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to2_0"	2	2	2
    "EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to3_0"	"EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to3_0"	2	2	3
    "EffC_inline_Receptor1_from1_to2_0_Ligand2_from2_to3_0"	"EffC_inline_Receptor1_from1_to2_0_Ligand2_from2_to3_0"	2	2	3
    "EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0"	"EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0"	2	3	2
    "EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to3_0"	"EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to3_0"	2	3	3
    "EffC_inline_Receptor1_from1_to2_0_Ligand3_from2_to3_0"	"EffC_inline_Receptor1_from1_to2_0_Ligand3_from2_to3_0"	2	3	3
    "EffC_inline_Receptor1_from1_to3_0_Ligand1_from1_to2_0"	"EffC_inline_Receptor1_from1_to3_0_Ligand1_from1_to2_0"	3	1	2
    "EffC_inline_Receptor1_from1_to3_0_Ligand1_from1_to3_0"	"EffC_inline_Receptor1_from1_to3_0_Ligand1_from1_to3_0"	3	1	3
    "EffC_inline_Receptor1_from1_to3_0_Ligand1_from2_to3_0"	"EffC_inline_Receptor1_from1_to3_0_Ligand1_from2_to3_0"	3	1	3
    "EffC_inline_Receptor1_from1_to3_0_Ligand2_from1_to2_0"	"EffC_inline_Receptor1_from1_to3_0_Ligand2_from1_to2_0"	3	2	2
    "EffC_inline_Receptor1_from1_to3_0_Ligand2_from1_to3_0"	"EffC_inline_Receptor1_from1_to3_0_Ligand2_from1_to3_0"	3	2	3
    "EffC_inline_Receptor1_from1_to3_0_Ligand2_from2_to3_0"	"EffC_inline_Receptor1_from1_to3_0_Ligand2_from2_to3_0"	3	2	3
    "EffC_inline_Receptor1_from1_to3_0_Ligand3_from1_to2_0"	"EffC_inline_Receptor1_from1_to3_0_Ligand3_from1_to2_0"	3	3	2
    "EffC_inline_Receptor1_from1_to3_0_Ligand3_from1_to3_0"	"EffC_inline_Receptor1_from1_to3_0_Ligand3_from1_to3_0"	3	3	3
    "EffC_inline_Receptor1_from1_to3_0_Ligand3_from2_to3_0"	"EffC_inline_Receptor1_from1_to3_0_Ligand3_from2_to3_0"	3	3	3
    "EffC_inline_Receptor1_from1_to3_2_Ligand1_from1_to3_2"	"EffC_inline_Receptor1_from2_to3_0_Ligand1_from2_to3_0"	3	1	3
    "EffC_inline_Receptor1_from1_to3_2_Ligand2_from1_to3_2"	"EffC_inline_Receptor1_from2_to3_0_Ligand2_from2_to3_0"	3	2	3
    "EffC_inline_Receptor1_from1_to3_2_Ligand3_from1_to3_2"	"EffC_inline_Receptor1_from2_to3_0_Ligand3_from2_to3_0"	3	3	3
    "EffC_inline_Receptor1_from2_to1_3_Ligand1_from2_to1_3"	"EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to2_0"	3	1	3
    "EffC_inline_Receptor1_from2_to1_3_Ligand2_from2_to1_3"	"EffC_inline_Receptor1_from1_to2_0_Ligand2_from1_to2_0"	3	2	3
    "EffC_inline_Receptor1_from2_to1_3_Ligand3_from2_to1_3"	"EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0"	3	3	3
    "EffC_inline_Receptor1_from2_to3_0_Ligand1_from1_to2_0"	"EffC_inline_Receptor1_from2_to3_0_Ligand1_from1_to2_0"	3	1	2
    "EffC_inline_Receptor1_from2_to3_0_Ligand1_from1_to3_0"	"EffC_inline_Receptor1_from2_to3_0_Ligand1_from1_to3_0"	3	1	3
    "EffC_inline_Receptor1_from2_to3_0_Ligand1_from2_to3_0"	"EffC_inline_Receptor1_from2_to3_0_Ligand1_from2_to3_0"	3	1	3
    "EffC_inline_Receptor1_from2_to3_0_Ligand2_from1_to2_0"	"EffC_inline_Receptor1_from2_to3_0_Ligand2_from1_to2_0"	3	2	2
    "EffC_inline_Receptor1_from2_to3_0_Ligand2_from1_to3_0"	"EffC_inline_Receptor1_from2_to3_0_Ligand2_from1_to3_0"	3	2	3
    "EffC_inline_Receptor1_from2_to3_0_Ligand2_from2_to3_0"	"EffC_inline_Receptor1_from2_to3_0_Ligand2_from2_to3_0"	3	2	3
    "EffC_inline_Receptor1_from2_to3_0_Ligand3_from1_to2_0"	"EffC_inline_Receptor1_from2_to3_0_Ligand3_from1_to2_0"	3	3	2
    "EffC_inline_Receptor1_from2_to3_0_Ligand3_from1_to3_0"	"EffC_inline_Receptor1_from2_to3_0_Ligand3_from1_to3_0"	3	3	3
    "EffC_inline_Receptor1_from2_to3_0_Ligand3_from2_to3_0"	"EffC_inline_Receptor1_from2_to3_0_Ligand3_from2_to3_0"	3	3	3
    "EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to2_0"	"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to2_0"	2	1	2
    "EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to3_0"	"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to3_0"	2	1	3
    "EffC_reverse_Receptor1_from1_to2_0_Ligand1_from2_to3_0"	"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from2_to3_0"	2	1	3
    "EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to2_0"	"EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to2_0"	2	2	2
    "EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to3_0"	"EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to3_0"	2	2	3
    "EffC_reverse_Receptor1_from1_to2_0_Ligand2_from2_to3_0"	"EffC_reverse_Receptor1_from1_to2_0_Ligand2_from2_to3_0"	2	2	3
    "EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0"	"EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0"	2	3	2
    "EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to3_0"	"EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to3_0"	2	3	3
    "EffC_reverse_Receptor1_from1_to2_0_Ligand3_from2_to3_0"	"EffC_reverse_Receptor1_from1_to2_0_Ligand3_from2_to3_0"	2	3	3
    "EffC_reverse_Receptor1_from1_to2_3_Ligand1_from1_to2_3"	"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to2_0"	3	1	3
    "EffC_reverse_Receptor1_from1_to2_3_Ligand1_from1_to3_2"	"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to3_0"	3	1	3
    "EffC_reverse_Receptor1_from1_to2_3_Ligand1_from2_to1_3"	"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to2_0"	3	1	3
    "EffC_reverse_Receptor1_from1_to2_3_Ligand2_from1_to2_3"	"EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to2_0"	3	2	3
    "EffC_reverse_Receptor1_from1_to2_3_Ligand2_from1_to3_2"	"EffC_reverse_Receptor1_from1_to2_0_Ligand2_from2_to3_0"	3	2	3
    "EffC_reverse_Receptor1_from1_to2_3_Ligand2_from2_to1_3"	"EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to2_0"	3	2	3
    "EffC_reverse_Receptor1_from1_to2_3_Ligand3_from1_to2_3"	"EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0"	3	3	3
    "EffC_reverse_Receptor1_from1_to2_3_Ligand3_from1_to3_2"	"EffC_reverse_Receptor1_from1_to2_0_Ligand3_from2_to3_0"	3	3	3
    "EffC_reverse_Receptor1_from1_to2_3_Ligand3_from2_to1_3"	"EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0"	3	3	3
    "EffC_reverse_Receptor1_from1_to3_0_Ligand1_from1_to2_0"	"EffC_reverse_Receptor1_from1_to3_0_Ligand1_from1_to2_0"	3	1	2
    "EffC_reverse_Receptor1_from1_to3_0_Ligand1_from1_to3_0"	"EffC_reverse_Receptor1_from1_to3_0_Ligand1_from1_to3_0"	3	1	3
    "EffC_reverse_Receptor1_from1_to3_0_Ligand1_from2_to3_0"	"EffC_reverse_Receptor1_from1_to3_0_Ligand1_from2_to3_0"	3	1	3
    "EffC_reverse_Receptor1_from1_to3_0_Ligand2_from1_to2_0"	"EffC_reverse_Receptor1_from1_to3_0_Ligand2_from1_to2_0"	3	2	2
    "EffC_reverse_Receptor1_from1_to3_0_Ligand2_from1_to3_0"	"EffC_reverse_Receptor1_from1_to3_0_Ligand2_from1_to3_0"	3	2	3
    "EffC_reverse_Receptor1_from1_to3_0_Ligand2_from2_to3_0"	"EffC_reverse_Receptor1_from1_to3_0_Ligand2_from2_to3_0"	3	2	3
    "EffC_reverse_Receptor1_from1_to3_0_Ligand3_from1_to2_0"	"EffC_reverse_Receptor1_from1_to3_0_Ligand3_from1_to2_0"	3	3	2
    "EffC_reverse_Receptor1_from1_to3_0_Ligand3_from1_to3_0"	"EffC_reverse_Receptor1_from1_to3_0_Ligand3_from1_to3_0"	3	3	3
    "EffC_reverse_Receptor1_from1_to3_0_Ligand3_from2_to3_0"	"EffC_reverse_Receptor1_from1_to3_0_Ligand3_from2_to3_0"	3	3	3
    "EffC_reverse_Receptor1_from1_to3_2_Ligand1_from1_to2_3"	"EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to2_0"	3	1	3
    "EffC_reverse_Receptor1_from1_to3_2_Ligand1_from2_to1_3"	"EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to2_0"	3	1	3
    "EffC_reverse_Receptor1_from1_to3_2_Ligand2_from1_to2_3"	"EffC_reverse_Receptor1_from2_to3_0_Ligand2_from1_to2_0"	3	2	3
    "EffC_reverse_Receptor1_from1_to3_2_Ligand2_from2_to1_3"	"EffC_reverse_Receptor1_from2_to3_0_Ligand2_from1_to2_0"	3	2	3
    "EffC_reverse_Receptor1_from1_to3_2_Ligand3_from1_to2_3"	"EffC_reverse_Receptor1_from2_to3_0_Ligand3_from1_to2_0"	3	3	3
    "EffC_reverse_Receptor1_from1_to3_2_Ligand3_from2_to1_3"	"EffC_reverse_Receptor1_from2_to3_0_Ligand3_from1_to2_0"	3	3	3
    "EffC_reverse_Receptor1_from2_to1_3_Ligand1_from1_to2_3"	"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to2_0"	3	1	3
    "EffC_reverse_Receptor1_from2_to1_3_Ligand1_from1_to3_2"	"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from2_to3_0"	3	1	3
    "EffC_reverse_Receptor1_from2_to1_3_Ligand2_from1_to2_3"	"EffC_reverse_Receptor1_from1_to2_0_Ligand2_from1_to2_0"	3	2	3
    "EffC_reverse_Receptor1_from2_to1_3_Ligand2_from1_to3_2"	"EffC_reverse_Receptor1_from1_to2_0_Ligand2_from2_to3_0"	3	2	3
    "EffC_reverse_Receptor1_from2_to1_3_Ligand3_from1_to2_3"	"EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0"	3	3	3
    "EffC_reverse_Receptor1_from2_to1_3_Ligand3_from1_to3_2"	"EffC_reverse_Receptor1_from1_to2_0_Ligand3_from2_to3_0"	3	3	3
    "EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to2_0"	"EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to2_0"	3	1	2
    "EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to3_0"	"EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to3_0"	3	1	3
    "EffC_reverse_Receptor1_from2_to3_0_Ligand1_from2_to3_0"	"EffC_reverse_Receptor1_from2_to3_0_Ligand1_from2_to3_0"	3	1	3
    "EffC_reverse_Receptor1_from2_to3_0_Ligand2_from1_to2_0"	"EffC_reverse_Receptor1_from2_to3_0_Ligand2_from1_to2_0"	3	2	2
    "EffC_reverse_Receptor1_from2_to3_0_Ligand2_from1_to3_0"	"EffC_reverse_Receptor1_from2_to3_0_Ligand2_from1_to3_0"	3	2	3
    "EffC_reverse_Receptor1_from2_to3_0_Ligand2_from2_to3_0"	"EffC_reverse_Receptor1_from2_to3_0_Ligand2_from2_to3_0"	3	2	3
    "EffC_reverse_Receptor1_from2_to3_0_Ligand3_from1_to2_0"	"EffC_reverse_Receptor1_from2_to3_0_Ligand3_from1_to2_0"	3	3	2
    "EffC_reverse_Receptor1_from2_to3_0_Ligand3_from1_to3_0"	"EffC_reverse_Receptor1_from2_to3_0_Ligand3_from1_to3_0"	3	3	3
    "EffC_reverse_Receptor1_from2_to3_0_Ligand3_from2_to3_0"	"EffC_reverse_Receptor1_from2_to3_0_Ligand3_from2_to3_0"	3	3	3];



    if isfield(app.Parameters.Effective_concentrations, "EffC")
        for i = 1:length(EffC_names)
            if isempty(find(EffC_names(i,2) == [app.Parameters.Effective_concentrations.EffC.name]))
                continue
            elseif app.Parameters.Ligand(str2num(EffC_names(i,4))).Valency < str2num(EffC_names(i,5)) || app.Parameters.Receptor(1).Valency < str2num(EffC_names(i,3))
                continue
            else                
                app.Parameters.EffCs.(EffC_names(i,1)) = app.Parameters.Effective_concentrations.EffC(find(EffC_names(i,2) == [app.Parameters.Effective_concentrations.EffC.name])).Value;
            end
        end
    end
end