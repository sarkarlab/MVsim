function dydt = Diff_1R3LA_0LB_0LC(t,y, app) 

L1 = app.Parameters.SPR.LtempL1;
L2 = app.Parameters.SPR.LtempL2;
L3 = app.Parameters.SPR.LtempL3;
Kons = app.Parameters.Kons;
Koffs = app.Parameters.Koffs;
EffCs = app.Parameters.EffCs;

dydt = zeros(4,1);
dydt(1)=+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(2)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_2*y(3)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_3*y(4)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(1)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_2*y(1)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_3*y(1);
dydt(2)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(1)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(2);
dydt(3)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_2*y(1)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_2*y(3);
dydt(4)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_3*y(1)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_3*y(4);
end