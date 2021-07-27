function dydt = Diff_1R0LA_1LB_1LC(t,y, app) 

L1 = app.Parameters.SPR.LtempL1;
L2 = app.Parameters.SPR.LtempL2;
L3 = app.Parameters.SPR.LtempL3;
Kons = app.Parameters.Kons;
Koffs = app.Parameters.Koffs;
EffCs = app.Parameters.EffCs;

dydt = zeros(3,1);
dydt(1)=+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(2)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(3)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1);
dydt(2)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(1)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(2);
dydt(3)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(3);
end