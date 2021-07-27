function dydt = Diff_2R1LA_1LB_1LC(t,y, app) 

L1 = app.Parameters.SPR.LtempL1;
L2 = app.Parameters.SPR.LtempL2;
L3 = app.Parameters.SPR.LtempL3;
Kons = app.Parameters.Kons;
Koffs = app.Parameters.Koffs;
EffCs = app.Parameters.EffCs;

dydt = zeros(16,1);
dydt(1)=+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(2)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(3)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(4)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(5)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(9)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(13)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(1)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(1)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1);
dydt(2)=+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(6)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(10)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(14)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(2)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(2)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(2)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2);
dydt(3)=+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(7)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(11)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(15)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(3)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(3)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(3)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(3);
dydt(4)=+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(8)+Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(12)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(16)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(4)-L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(4)-L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(4)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(4);
dydt(5)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(6)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(7)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(5)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(5)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(5)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(5);
dydt(6)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(5)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(6)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(6);
dydt(7)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(3)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(5)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(7)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(7);
dydt(8)=+L1*Kons.Kon_Receptor1_pos_1_Ligand1_pos_1*y(4)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(5)-Koffs.Koff_Receptor1_pos_1_Ligand1_pos_1*y(8)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(8);
dydt(9)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(10)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(11)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(12)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(9)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(9)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(9)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(9);
dydt(10)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(9)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(10)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(10);
dydt(11)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(3)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(9)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(11)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(11);
dydt(12)=+L2*Kons.Kon_Receptor1_pos_1_Ligand2_pos_1*y(4)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(9)-Koffs.Koff_Receptor1_pos_1_Ligand2_pos_1*y(12)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(12);
dydt(13)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(14)+Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(15)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(16)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(13)-L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(13)-L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(13)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(13);
dydt(14)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2)+L1*Kons.Kon_Receptor1_pos_2_Ligand1_pos_1*y(13)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(14)-Koffs.Koff_Receptor1_pos_2_Ligand1_pos_1*y(14);
dydt(15)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(3)+L2*Kons.Kon_Receptor1_pos_2_Ligand2_pos_1*y(13)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(15)-Koffs.Koff_Receptor1_pos_2_Ligand2_pos_1*y(15);
dydt(16)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(4)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(13)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(16)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(16);
end