function dydt = Diff_2R0LA_0LB_1LC(t,y, app) 

L1 = app.Parameters.SPR.LtempL1;
L2 = app.Parameters.SPR.LtempL2;
L3 = app.Parameters.SPR.LtempL3;
Kons = app.Parameters.Kons;
Koffs = app.Parameters.Koffs;
EffCs = app.Parameters.EffCs;

dydt = zeros(4,1);
dydt(1)=+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(2)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(3)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1);
dydt(2)=+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(4)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(2)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2);
dydt(3)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(4)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(3)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(3);
dydt(4)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(3)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(4)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(4);
end