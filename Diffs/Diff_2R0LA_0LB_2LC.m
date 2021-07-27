function dydt = Diff_2R0LA_0LB_2LC(t,y, app) 

L1 = app.Parameters.SPR.LtempL1;
L2 = app.Parameters.SPR.LtempL2;
L3 = app.Parameters.SPR.LtempL3;
Kons = app.Parameters.Kons;
Koffs = app.Parameters.Koffs;
EffCs = app.Parameters.EffCs;

dydt = zeros(11,1);
dydt(1)=+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(2)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(3)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(4)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(8)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(1);
dydt(2)=+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(6)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(9)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(10)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(2)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(2)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(2);
dydt(3)=+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(1)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(5)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(7)+Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(11)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(3)-Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(3)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(3)-L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(3);
dydt(4)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(5)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(6)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(7)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(4)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(4)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(4)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(4);
dydt(5)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(3)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*EffCs.EffC_inline_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(4)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(5)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(5);
dydt(6)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(2)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(4)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(6)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(6);
dydt(7)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_1*y(3)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(4)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_1*y(7)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(7);
dydt(8)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(1)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(9)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(10)+Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(11)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(8)-Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(8)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(8)-L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(8);
dydt(9)=+Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(2)+Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*EffCs.EffC_reverse_Receptor1_from1_to2_0_Ligand3_from1_to2_0*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(9)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(9);
dydt(10)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(2)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_1*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(10)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_1*y(10);
dydt(11)=+L3*Kons.Kon_Receptor1_pos_1_Ligand3_pos_2*y(3)+L3*Kons.Kon_Receptor1_pos_2_Ligand3_pos_2*y(8)-Koffs.Koff_Receptor1_pos_1_Ligand3_pos_2*y(11)-Koffs.Koff_Receptor1_pos_2_Ligand3_pos_2*y(11);
end