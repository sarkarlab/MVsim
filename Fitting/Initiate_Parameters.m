function [Parameters,TimePoints]  = Initiate_Parameters(option)
if nargin == 0
    option = 3;
end
Parameters = struct();
p = set_parameters();

        switch option
            case 1
                p.diff = @Diff_3R3LA_0LB_0LC;
                p.L1_diam = [20 20 20];
                p.L1_lp = [200 200];
                p.L1_lc = [67 67];
                p.R_diam = [25 25 25];
                p.R_lp = [67 67];
                p.R_lc = [600 600];
                p.Kon_L1 = 910000;
                p.Kon_L2 = 0;
                p.Kon_L3 = 0;
                p.Koff_L1 = 1.3;
                p.Koff_L2 = 0;
                p.Koff_L3 = 0;
                p.R_MW = 50000;
                p.L_MW = 50000;
                
                p.Eff_1_1 = 6.5469e-04;
                p.Eff_1_2 = 2.7606e-04;
                p.Eff_2_1 =  2.4608e-04;
                p.Eff_2_2 =  2.0644e-04;
                p.Eff_r1_1 = 3.2165e-04;
                p.Eff_r1_2 = 2.0509e-04;
                p.Eff_r2_1 = 1.6610e-04;
                p.Eff_r2_2 = 1.8170e-04;
            case 2
                p.diff = @Diff_3R3LA_0LB_0LC;
                p.L1_diam = [20 20 30];
                p.L1_lp = [5 5];
                p.L1_lc = [140 140];
                p.R_diam = [50 25 25];
                p.R_lp = [200 200];
                p.R_lc = [67 67];                
                p.L2_diam = [];
                p.L2_lp = [];
                p.L2_lc = [];

                p.Kon_L1 = 910000;
                p.Kon_L2 = 0;
                p.Kon_L3 = 0;
                p.Koff_L1 = 1.3;
                p.Koff_L2 = 0;
                p.Koff_L3 = 0;
                
                p.Eff_1_1 = 6.5469e-04;
                p.Eff_1_2 = 2.7606e-04;
                p.Eff_2_1 =  2.4608e-04;
                p.Eff_2_2 =  2.0644e-04;
                p.Eff_r1_1 = 3.2165e-04;
                p.Eff_r1_2 = 2.0509e-04;
                p.Eff_r2_1 = 1.6610e-04;
                p.Eff_r2_2 = 1.8170e-04;
            case 3
                p.diff = @Diff_3R2LA_1LB_0LC;
                p.L1_diam = [30 20];
                p.L1_lp = 5;
                p.L1_lc = 140;
                p.R_diam = [50 25 25];
                p.R_lp = [200 200];
                p.R_lc = [67 67];
                p.Kon_L1 = 9.1e5;
                p.Kon_L2 = 9.1e5;
                p.Kon_L3 = 0;
                p.Koff_L1 = 1.3;
                p.Koff_L2 = 1.3;
                p.Koff_L3 = 0;
                
                p.Eff_1_1 =  1e-04;
                p.Eff_1_2 =  1e-04;
                p.Eff_2_1 =  1e-04;
                p.Eff_2_2 =  1e-04;
                p.Eff_r1_1 = 1e-04;
                p.Eff_r1_2 = 1e-04;
                p.Eff_r2_1 = 1e-04;
                p.Eff_r2_2 = 1e-04;
                
                p.L2_val = 1;
                p.L1_val = 2;
                
        end
        
        Parameters.base = struct("diffs", p.diff, "Kon",100000, "Koff", 1);
        Parameters.constants = struct("Area", 1.6e-6, "Volume", 1.6e-6*1e-7 );
            Parameters.constants.RU2g = 1e-12*(Parameters.constants.Area * 1e6);
        Parameters.SPR = struct("AssociationTime",150,"DissociationTime",150,"FlowRate",50,"MTL_modifyer",0.1,"baseRU",24,"L0",1e-6);
        Parameters.SPR.flowMTL = (Parameters.SPR.FlowRate/10)/100;
        Parameters.SPR.MTL = 0.98*((10^(-0.434*log10(p.L_MW)-4.059)*10^-4)/(100*10^-9))^(2/3)*(Parameters.SPR.flowMTL/(0.2963*1.6*10^-6))^(1/3);
        Parameters.SPR.netMTL = Parameters.SPR.MTL / Parameters.SPR.MTL_modifyer;
        Parameters.SPR.baseR0 = ((Parameters.SPR.baseRU * Parameters.constants.RU2g )/ p.R_MW )/(Parameters.constants.Volume * 1000);
        Parameters.PDF_input = struct("Cumulative", false, "Ligand_rank", 1, "Ligand_from", 1, "Ligand_to", 2, "Receptor_from", 1, "Receptor_to" ,2, "Receptor_x", [], "Receptor_y", [], "Ligand_x", [], "Ligand_y", []);
     

        
        Parameters.Ligand(1) = struct("Valency",p.L1_val,"MolecularWeight",50000,"LinkerLength",p.L1_lc,"LinkerLP",p.L1_lp,"Diameter",p.L1_diam); 
        Parameters.Ligand(2) = struct("Valency",p.L2_val,"MolecularWeight",50000,"LinkerLength",p.L2_lc,"LinkerLP",p.L2_lp,"Diameter",p.L2_diam); 
        Parameters.Ligand(3) = struct("Valency",p.L3_val,"MolecularWeight",50000,"LinkerLength",p.L3_lc,"LinkerLP",p.L3_lp,"Diameter",p.L3_diam); 
            Parameters.Ligand(1).binding_state(1)=struct("name", "Ligand1_from1_to2_0","position_from", 1,"position_to", 2,"position_limiting", 0,"LinkerLength", p.L1_lc,"LinkerLP", p.L1_lp,"Diameter", p.L1_diam,"user_input", 0,"PDF_x", [], "PDF_y", [], "PDF_length", []);
            Parameters.Ligand(1).binding_state(2)=struct("name", "Ligand1_from1_to3_0","position_from", 1,"position_to", 3,"position_limiting", 0,"LinkerLength", p.L1_lc,"LinkerLP", p.L1_lp,"Diameter", p.L1_diam,"user_input", 0,"PDF_x", [], "PDF_y", [], "PDF_length", []);
            Parameters.Ligand(1).binding_state(3)=struct("name", "Ligand1_from2_to3_0","position_from", 2,"position_to", 3,"position_limiting", 0,"LinkerLength", p.L1_lc,"LinkerLP", p.L1_lp,"Diameter", p.L1_diam,"user_input", 0,"PDF_x", [], "PDF_y", [], "PDF_length", []);
        Parameters.Receptor = struct("Valency",3,"MolecularWeight",50000,"LinkerLength",p.R_lc,"LinkerLP",p.R_lp,"Diameter",p.R_diam);
            Parameters.Receptor.binding_state(1)=struct("name", "Receptor1_from1_to2_0","position_from", 1,"position_to", 2,"position_limiting", 0,"LinkerLength", p.R_lc,"LinkerLP", p.R_lp,"Diameter", p.R_diam,"user_input", 0,"PDF_x", [], "PDF_y", [], "PDF_length", []);
            Parameters.Receptor.binding_state(1)=struct("name", "Receptor1_from1_to3_0","position_from", 1,"position_to", 3,"position_limiting", 0,"LinkerLength", p.R_lc,"LinkerLP", p.R_lp,"Diameter", p.R_diam,"user_input", 0,"PDF_x", [], "PDF_y", [], "PDF_length", []);
            Parameters.Receptor.binding_state(1)=struct("name", "Receptor1_from2_to3_0","position_from", 2,"position_to", 3,"position_limiting", 0,"LinkerLength", p.R_lc,"LinkerLP", p.R_lp,"Diameter", p.R_diam,"user_input", 0,"PDF_x", [], "PDF_y", [], "PDF_length", []);

            
           
           
              
        Parameters.Kons=struct(...
            "Kon_Receptor1_pos_1_Ligand1_pos_1", p.Kon_L1,  "Kon_Receptor1_pos_2_Ligand1_pos_1", p.Kon_L1,  "Kon_Receptor1_pos_3_Ligand1_pos_1", p.Kon_L1,...
            "Kon_Receptor1_pos_1_Ligand1_pos_2", p.Kon_L1,  "Kon_Receptor1_pos_2_Ligand1_pos_2", p.Kon_L1,  "Kon_Receptor1_pos_3_Ligand1_pos_2", p.Kon_L1,...
            "Kon_Receptor1_pos_1_Ligand1_pos_3", p.Kon_L1,  "Kon_Receptor1_pos_2_Ligand1_pos_3", p.Kon_L1,  "Kon_Receptor1_pos_3_Ligand1_pos_3", p.Kon_L1,...
            "Kon_Receptor1_pos_1_Ligand2_pos_1", p.Kon_L2, "Kon_Receptor1_pos_2_Ligand2_pos_1", p.Kon_L2, "Kon_Receptor1_pos_3_Ligand2_pos_1", p.Kon_L2,...
            "Kon_Receptor1_pos_1_Ligand2_pos_2", p.Kon_L2, "Kon_Receptor1_pos_2_Ligand2_pos_2", p.Kon_L2, "Kon_Receptor1_pos_3_Ligand2_pos_2", p.Kon_L2,...
            "Kon_Receptor1_pos_1_Ligand2_pos_3", p.Kon_L2, "Kon_Receptor1_pos_2_Ligand2_pos_3", p.Kon_L2, "Kon_Receptor1_pos_3_Ligand2_pos_3", p.Kon_L2,...
            "Kon_Receptor1_pos_1_Ligand3_pos_1", p.Kon_L3, "Kon_Receptor1_pos_2_Ligand3_pos_1", p.Kon_L3, "Kon_Receptor1_pos_3_Ligand3_pos_1", p.Kon_L3,...
            "Kon_Receptor1_pos_1_Ligand3_pos_2", p.Kon_L3, "Kon_Receptor1_pos_2_Ligand3_pos_2", p.Kon_L3, "Kon_Receptor1_pos_3_Ligand3_pos_2", p.Kon_L3,...
            "Kon_Receptor1_pos_1_Ligand3_pos_3", p.Kon_L3, "Kon_Receptor1_pos_2_Ligand3_pos_3", p.Kon_L3, "Kon_Receptor1_pos_3_Ligand3_pos_3", p.Kon_L3);
        
        Parameters.Koffs=struct(...
            "Koff_Receptor1_pos_1_Ligand1_pos_1", p.Koff_L1,    "Koff_Receptor1_pos_2_Ligand1_pos_1", p.Koff_L1,    "Koff_Receptor1_pos_3_Ligand1_pos_1", p.Koff_L1,...
            "Koff_Receptor1_pos_1_Ligand1_pos_2", p.Koff_L1,    "Koff_Receptor1_pos_2_Ligand1_pos_2", p.Koff_L1,    "Koff_Receptor1_pos_3_Ligand1_pos_2", p.Koff_L1,...
            "Koff_Receptor1_pos_1_Ligand1_pos_3", p.Koff_L1,    "Koff_Receptor1_pos_2_Ligand1_pos_3", p.Koff_L1,    "Koff_Receptor1_pos_3_Ligand1_pos_3", p.Koff_L1,...
            "Koff_Receptor1_pos_1_Ligand2_pos_1", p.Koff_L2,      "Koff_Receptor1_pos_2_Ligand2_pos_1", p.Koff_L2,      "Koff_Receptor1_pos_3_Ligand2_pos_1", p.Koff_L2,...
            "Koff_Receptor1_pos_1_Ligand2_pos_2", p.Koff_L2,      "Koff_Receptor1_pos_2_Ligand2_pos_2", p.Koff_L2,      "Koff_Receptor1_pos_3_Ligand2_pos_2", p.Koff_L2,...
            "Koff_Receptor1_pos_1_Ligand2_pos_3", p.Koff_L2,      "Koff_Receptor1_pos_2_Ligand2_pos_3", p.Koff_L2,      "Koff_Receptor1_pos_3_Ligand2_pos_3", p.Koff_L2,...
            "Koff_Receptor1_pos_1_Ligand3_pos_1", p.Koff_L3,      "Koff_Receptor1_pos_2_Ligand3_pos_1", p.Koff_L3,      "Koff_Receptor1_pos_3_Ligand3_pos_1", p.Koff_L3,...
            "Koff_Receptor1_pos_1_Ligand3_pos_2", p.Koff_L3,      "Koff_Receptor1_pos_2_Ligand3_pos_2", p.Koff_L3,      "Koff_Receptor1_pos_3_Ligand3_pos_2", p.Koff_L3,...
            "Koff_Receptor1_pos_1_Ligand3_pos_3", p.Koff_L3,      "Koff_Receptor1_pos_2_Ligand3_pos_3", p.Koff_L3,      "Koff_Receptor1_pos_3_Ligand3_pos_3", p.Koff_L3);
        


        Parameters.EffCs = struct(...
            "EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to2_0", p.Eff_1_1,...
            "EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to3_0", p.Eff_1_2,...
            "EffC_inline_Receptor1_from1_to2_0_Ligand1_from2_to3_0", p.Eff_1_1,...
            "EffC_inline_Receptor1_from1_to3_0_Ligand1_from1_to2_0",p.Eff_2_1,...
            "EffC_inline_Receptor1_from1_to3_0_Ligand1_from1_to3_0", p.Eff_2_2,...
            "EffC_inline_Receptor1_from1_to3_0_Ligand1_from2_to3_0",p.Eff_2_1,...
            "EffC_inline_Receptor1_from1_to3_2_Ligand1_from1_to3_2", p.Eff_1_1,...
            "EffC_inline_Receptor1_from2_to1_3_Ligand1_from2_to1_3", p.Eff_1_1,...
            "EffC_inline_Receptor1_from2_to3_0_Ligand1_from1_to2_0", p.Eff_1_1,...
            "EffC_inline_Receptor1_from2_to3_0_Ligand1_from1_to3_0", p.Eff_1_2,...
            "EffC_inline_Receptor1_from2_to3_0_Ligand1_from2_to3_0", p.Eff_1_1,...
            "EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to2_0", p.Eff_r1_1,...
            "EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to3_0", p.Eff_r1_2,...
            "EffC_reverse_Receptor1_from1_to2_0_Ligand1_from2_to3_0", p.Eff_r1_1,...
            "EffC_reverse_Receptor1_from1_to2_3_Ligand1_from1_to2_3", p.Eff_r1_1,...
            "EffC_reverse_Receptor1_from1_to2_3_Ligand1_from1_to3_2", p.Eff_r1_2,...
            "EffC_reverse_Receptor1_from1_to2_3_Ligand1_from2_to1_3", p.Eff_r1_1,...
            "EffC_reverse_Receptor1_from1_to3_0_Ligand1_from1_to2_0", p.Eff_r2_1,...
            "EffC_reverse_Receptor1_from1_to3_0_Ligand1_from1_to3_0", p.Eff_r2_2,...
            "EffC_reverse_Receptor1_from1_to3_0_Ligand1_from2_to3_0", p.Eff_r2_1,...
            "EffC_reverse_Receptor1_from1_to3_2_Ligand1_from1_to2_3", p.Eff_r1_1,...
            "EffC_reverse_Receptor1_from1_to3_2_Ligand1_from2_to1_3", p.Eff_r1_1,...
            "EffC_reverse_Receptor1_from2_to1_3_Ligand1_from1_to2_3", p.Eff_r1_1,...
            "EffC_reverse_Receptor1_from2_to1_3_Ligand1_from1_to3_2", p.Eff_r1_1,...
            "EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to2_0", p.Eff_r1_1,...
            "EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to3_0", p.Eff_r1_2,...
            "EffC_reverse_Receptor1_from2_to3_0_Ligand1_from2_to3_0", p.Eff_r1_1);
        
        switch option
            case 1
                TimePoints = table([150;300],[5e-8;0],[0;0],[0;0]);
            case 2
                Parameters.Kons.Kon_Receptor1_pos_1_Ligand1_pos_1 = 0;
                Parameters.Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1 = 0;
                Parameters.Kons.Kon_Receptor1_pos_1_Ligand1_pos_2 = 0;
                Parameters.Koffs.Koff_Receptor1_pos_1_Ligand1_pos_2 = 0;
                Parameters.Kons.Kon_Receptor1_pos_1_Ligand1_pos_3 = 4.1e7;
                Parameters.Koffs.Koff_Receptor1_pos_1_Ligand1_pos_3 = 0.33;
                
                Parameters.Kons.Kon_Receptor1_pos_2_Ligand1_pos_3 = 0;
                Parameters.Koffs.Koff_Receptor1_pos_2_Ligand1_pos_3 = 0;
                Parameters.Kons.Kon_Receptor1_pos_3_Ligand1_pos_3 = 0;
                Parameters.Koffs.Koff_Receptor1_pos_3_Ligand1_pos_3 = 0;
                
                TimePoints = table([250;600],[1e-6;0],[0;0],[0;0]);
            case 3
%                 Parameters.Kons.Kon_Receptor1_pos_1_Ligand1_pos_1 = 4.1e7;
%                 Parameters.Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1 = 0.33;                
%                 Parameters.Kons.Kon_Receptor1_pos_2_Ligand1_pos_2 = 9.1e5;
%                 Parameters.Koffs.Koff_Receptor1_pos_2_Ligand1_pos_2 = 1.3;                
%                 Parameters.Kons.Kon_Receptor1_pos_3_Ligand1_pos_2 = 9.1e7;
%                 Parameters.Koffs.Koff_Receptor1_pos_3_Ligand1_pos_2 = 1.3;
%                 
%                 Parameters.Kons.Kon_Receptor1_pos_2_Ligand2_pos_1 = 9.1e7;
%                 Parameters.Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1 = 1.3;
%                 Parameters.Kons.Kon_Receptor1_pos_3_Ligand2_pos_1 = 9.1e7;
%                 Parameters.Koffs.Koff_Receptor1_pos_3_Ligand2_pos_1 = 1.3;
%                 TimePoints = table([250;500],[1e-6;0],[1e-6;0],[0;0]);
                 
                Parameters.Kons.Kon_Receptor1_pos_1_Ligand1_pos_1 = 4.1e7;
                Parameters.Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1 = 0.33;                
                Parameters.Kons.Kon_Receptor1_pos_2_Ligand1_pos_1 = 0;
                Parameters.Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1 = 0;                
                Parameters.Kons.Kon_Receptor1_pos_3_Ligand1_pos_1 = 0;
                Parameters.Koffs.Koff_Receptor1_pos_3_Ligand1_pos_1 = 0;
                
                Parameters.Kons.Kon_Receptor1_pos_1_Ligand1_pos_2 = 0;
                Parameters.Koffs.Koff_Receptor1_pos_1_Ligand1_pos_2 = 0;
                
                Parameters.Kons.Kon_Receptor1_pos_1_Ligand2_pos_1 = 0;
                Parameters.Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1 = 0;              
                
                TimePoints = table([125;250],[1e-6;0],[1e-9;0],[0;0]);
                
                Parameters.EffCs = struct(...
                "EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to2_0", 1e-04 ,...
                "EffC_inline_Receptor1_from2_to3_0_Ligand1_from1_to2_0",  1e-04 ,...
                "EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to2_0", 1e-04 ,...
                "EffC_inline_Receptor1_from1_to3_0_Ligand1_from1_to2_0",  1e-04 ,...
                "EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to2_0",  1e-04 ,...
                "EffC_reverse_Receptor1_from1_to3_0_Ligand1_from1_to2_0", 1e-04);
                
                Parameters.Ligand(1).binding_state(3) = []; 
                Parameters.Ligand(1).binding_state(2) = [];
        end
        
        
        %Table_Timepoints.Data = TimePoints;        
        % name=["EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to2_0";"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to2_0";"EffC_inline_Receptor1_from1_to2_0_Ligand1_from1_to3_0";"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from1_to3_0";"EffC_inline_Receptor1_from1_to2_0_Ligand1_from2_to3_0";"EffC_reverse_Receptor1_from1_to2_0_Ligand1_from2_to3_0";"EffC_inline_Receptor1_from1_to3_0_Ligand1_from1_to2_0";"EffC_reverse_Receptor1_from1_to3_0_Ligand1_from1_to2_0";"EffC_inline_Receptor1_from1_to3_0_Ligand1_from1_to3_0";"EffC_reverse_Receptor1_from1_to3_0_Ligand1_from1_to3_0";"EffC_inline_Receptor1_from1_to3_0_Ligand1_from2_to3_0";"EffC_reverse_Receptor1_from1_to3_0_Ligand1_from2_to3_0";"EffC_inline_Receptor1_from2_to3_0_Ligand1_from1_to2_0";"EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to2_0";"EffC_inline_Receptor1_from2_to3_0_Ligand1_from1_to3_0";"EffC_reverse_Receptor1_from2_to3_0_Ligand1_from1_to3_0";"EffC_inline_Receptor1_from2_to3_0_Ligand1_from2_to3_0";"EffC_reverse_Receptor1_from2_to3_0_Ligand1_from2_to3_0"];
% shortname=["";"";"";"";"";"";"";"";"";"";"";"";"";"";"";"";"";""];
% ligand_state=["Ligand1_from1_to2_0";"Ligand1_from1_to2_0";"Ligand1_from1_to3_0";"Ligand1_from1_to3_0";"Ligand1_from2_to3_0";"Ligand1_from2_to3_0";"Ligand1_from1_to2_0";"Ligand1_from1_to2_0";"Ligand1_from1_to3_0";"Ligand1_from1_to3_0";"Ligand1_from2_to3_0";"Ligand1_from2_to3_0";"Ligand1_from1_to2_0";"Ligand1_from1_to2_0";"Ligand1_from1_to3_0";"Ligand1_from1_to3_0";"Ligand1_from2_to3_0";"Ligand1_from2_to3_0"];
% ligand_position_from=[1;1;1;1;2;2;1;1;1;1;2;2;1;1;1;1;2;2];
% ligand_position_to=[2;2;3;3;3;3;2;2;3;3;3;3;2;2;3;3;3;3];
% receptor_state=["Receptor1_from1_to2_0";"Receptor1_from1_to2_0";"Receptor1_from1_to2_0";"Receptor1_from1_to2_0";"Receptor1_from1_to2_0";"Receptor1_from1_to2_0";"Receptor1_from1_to3_0";"Receptor1_from1_to3_0";"Receptor1_from1_to3_0";"Receptor1_from1_to3_0";"Receptor1_from1_to3_0";"Receptor1_from1_to3_0";"Receptor1_from2_to3_0";"Receptor1_from2_to3_0";"Receptor1_from2_to3_0";"Receptor1_from2_to3_0";"Receptor1_from2_to3_0";"Receptor1_from2_to3_0"];
% receptor_position_from=[1;1;1;1;1;1;1;1;1;1;1;1;2;2;2;2;2;2];
% receptor_position_to=[2;2;2;2;2;2;3;3;3;3;3;3;3;3;3;3;3;3];
% Value=[8.28E-06;9.42E-06;5.13E-05;6.42E-05;8.28E-06;9.42E-06;0.000659997;0.00062789;0.000472694;0.000459937;0.000659997;0.00062789;8.28E-06;9.42E-06;5.13E-05;6.42E-05;8.28E-06;9.42E-06];
% restriction=["straight";"reverse";"straight";"reverse";"straight";"reverse";"straight";"reverse";"straight";"reverse";"straight";"reverse";"straight";"reverse";"straight";"reverse";"straight";"reverse"];
% Kon=["Kon_Ligand1_pos_2_Receptor1_pos_2";"Kon_Ligand1_pos_2_Receptor1_pos_2";"Kon_Ligand1_pos_3_Receptor1_pos_2";"Kon_Ligand1_pos_3_Receptor1_pos_2";"Kon_Ligand1_pos_3_Receptor1_pos_2";"Kon_Ligand1_pos_3_Receptor1_pos_2";"Kon_Ligand1_pos_2_Receptor1_pos_3";"Kon_Ligand1_pos_2_Receptor1_pos_3";"Kon_Ligand1_pos_3_Receptor1_pos_3";"Kon_Ligand1_pos_3_Receptor1_pos_3";"Kon_Ligand1_pos_3_Receptor1_pos_3";"Kon_Ligand1_pos_3_Receptor1_pos_3";"Kon_Ligand1_pos_2_Receptor1_pos_3";"Kon_Ligand1_pos_2_Receptor1_pos_3";"Kon_Ligand1_pos_3_Receptor1_pos_3";"Kon_Ligand1_pos_3_Receptor1_pos_3";"Kon_Ligand1_pos_3_Receptor1_pos_3";"Kon_Ligand1_pos_3_Receptor1_pos_3"];
% Koff=["Kooff_Ligand1_pos_2_Receptor1_pos_2";"Koff_Ligand1_pos_2_Receptor1_pos_2";"Kooff_Ligand1_pos_3_Receptor1_pos_2";"Koff_Ligand1_pos_3_Receptor1_pos_2";"Kooff_Ligand1_pos_3_Receptor1_pos_2";"Koff_Ligand1_pos_3_Receptor1_pos_2";"Kooff_Ligand1_pos_2_Receptor1_pos_3";"Koff_Ligand1_pos_2_Receptor1_pos_3";"Kooff_Ligand1_pos_3_Receptor1_pos_3";"Koff_Ligand1_pos_3_Receptor1_pos_3";"Kooff_Ligand1_pos_3_Receptor1_pos_3";"Koff_Ligand1_pos_3_Receptor1_pos_3";"Kooff_Ligand1_pos_2_Receptor1_pos_3";"Koff_Ligand1_pos_2_Receptor1_pos_3";"Kooff_Ligand1_pos_3_Receptor1_pos_3";"Koff_Ligand1_pos_3_Receptor1_pos_3";"Kooff_Ligand1_pos_3_Receptor1_pos_3";"Koff_Ligand1_pos_3_Receptor1_pos_3"];
% ligand_rank=[1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1];
% eff = table(name,shortname,ligand_state,ligand_position_from,ligand_position_to,receptor_state,receptor_position_from,receptor_position_to,Value,restriction,Kon,Koff,ligand_rank);
%         Parameters.Effective_concentrations.EffC = table2struct(eff);

end

function p = set_parameters()

    p = struct();
    p.diff = @Diff_3R3LA_0LB_0LC;
    p.L1_diam = [20 20 20];
    p.L1_lp = [600 600];
    p.L1_lc = [67 67];
    p.L2_diam = 0;
    p.L2_lp = 0;
    p.L2_lc = 0;
    p.L3_diam = 0;
    p.L3_lp = 0;
    p.L3_lc = 0;
    p.R_diam = [25 25 25];
    p.R_lp = [67 67];
    p.R_lc = [600 600];
    p.Kon_L1 = 910000;
    p.Kon_L2 = 0;
    p.Kon_L3 = 0;
    p.Koff_L1 = 1.3;
    p.Koff_L2 = 0;
    p.Koff_L3 = 0;
    p.R_MW = 50000;
    p.L_MW = 50000;

    p.Eff_1_1 =  1e-04;
    p.Eff_1_2 =  1e-04;
    p.Eff_2_1 =  1e-04;
    p.Eff_2_2 =  1e-04;
    p.Eff_r1_1 = 1e-04;
    p.Eff_r1_2 = 1e-04;
    p.Eff_r2_1 = 1e-04;
    p.Eff_r2_2 = 1e-04;
    
    
    p.L1_val = 3;
    p.L2_val = 0;
    p.L3_val = 0;

end


